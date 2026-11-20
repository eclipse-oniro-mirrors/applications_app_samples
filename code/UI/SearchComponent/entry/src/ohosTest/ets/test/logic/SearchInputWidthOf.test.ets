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
export default function searchInputWidthOfTest(): void {
  describe('SearchInputWidthOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0001
     * @tc.name      SearchComponent_SearchInputWidthOf_0001
     * @tc.desc      searchInputWidthOf(windowWidthPx=0, density=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_SearchInputWidthOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0001 begin`);
      const actual: number = searchInputWidthOf(0, 0);
      logInfo(`searchInputWidthOf(windowWidthPx=0, densi...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SearchInputWidthOf_0001 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0002
     * @tc.name      SearchComponent_SearchInputWidthOf_0002
     * @tc.desc      searchInputWidthOf(windowWidthPx=0, density=1) returns -64
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_SearchInputWidthOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0002 begin`);
      const actual: number = searchInputWidthOf(0, 1);
      logInfo(`searchInputWidthOf(windowWidthPx=0, densi...: actual=${actual}`);
      expect(actual).assertEqual(-64);
      logInfo(`${BUNDLE}SearchInputWidthOf_0002 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0003
     * @tc.name      SearchComponent_SearchInputWidthOf_0003
     * @tc.desc      searchInputWidthOf(windowWidthPx=1, density=1) returns -63
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0003 begin`);
      const actual: number = searchInputWidthOf(1, 1);
      logInfo(`searchInputWidthOf(windowWidthPx=1, densi...: actual=${actual}`);
      expect(actual).assertEqual(-63);
      logInfo(`${BUNDLE}SearchInputWidthOf_0003 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0004
     * @tc.name      SearchComponent_SearchInputWidthOf_0004
     * @tc.desc      searchInputWidthOf(windowWidthPx=1, density=2) returns -63.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0004 begin`);
      const actual: number = searchInputWidthOf(1, 2);
      logInfo(`searchInputWidthOf(windowWidthPx=1, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.5, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0004 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0005
     * @tc.name      SearchComponent_SearchInputWidthOf_0005
     * @tc.desc      searchInputWidthOf(windowWidthPx=1, density=3) returns -63.666666666666664
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0005 begin`);
      const actual: number = searchInputWidthOf(1, 3);
      logInfo(`searchInputWidthOf(windowWidthPx=1, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.666666666666664, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0005 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0006
     * @tc.name      SearchComponent_SearchInputWidthOf_0006
     * @tc.desc      searchInputWidthOf(windowWidthPx=1, density=10) returns -63.9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0006 begin`);
      const actual: number = searchInputWidthOf(1, 10);
      logInfo(`searchInputWidthOf(windowWidthPx=1, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.9, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0006 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0007
     * @tc.name      SearchComponent_SearchInputWidthOf_0007
     * @tc.desc      searchInputWidthOf(windowWidthPx=1, density=100) returns -63.99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0007 begin`);
      const actual: number = searchInputWidthOf(1, 100);
      logInfo(`searchInputWidthOf(windowWidthPx=1, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.99, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0007 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0008
     * @tc.name      SearchComponent_SearchInputWidthOf_0008
     * @tc.desc      searchInputWidthOf(windowWidthPx=1, density=5) returns -63.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0008 begin`);
      const actual: number = searchInputWidthOf(1, 5);
      logInfo(`searchInputWidthOf(windowWidthPx=1, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.8, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0008 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0009
     * @tc.name      SearchComponent_SearchInputWidthOf_0009
     * @tc.desc      searchInputWidthOf(windowWidthPx=1, density=15) returns -63.93333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0009 begin`);
      const actual: number = searchInputWidthOf(1, 15);
      logInfo(`searchInputWidthOf(windowWidthPx=1, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.93333333333333, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0009 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0010
     * @tc.name      SearchComponent_SearchInputWidthOf_0010
     * @tc.desc      searchInputWidthOf(windowWidthPx=1, density=20) returns -63.95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0010 begin`);
      const actual: number = searchInputWidthOf(1, 20);
      logInfo(`searchInputWidthOf(windowWidthPx=1, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.95, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0010 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0011
     * @tc.name      SearchComponent_SearchInputWidthOf_0011
     * @tc.desc      searchInputWidthOf(windowWidthPx=1, density=25) returns -63.96
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0011 begin`);
      const actual: number = searchInputWidthOf(1, 25);
      logInfo(`searchInputWidthOf(windowWidthPx=1, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.96, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0011 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0012
     * @tc.name      SearchComponent_SearchInputWidthOf_0012
     * @tc.desc      searchInputWidthOf(windowWidthPx=1, density=30) returns -63.96666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0012 begin`);
      const actual: number = searchInputWidthOf(1, 30);
      logInfo(`searchInputWidthOf(windowWidthPx=1, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.96666666666667, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0012 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0013
     * @tc.name      SearchComponent_SearchInputWidthOf_0013
     * @tc.desc      searchInputWidthOf(windowWidthPx=1, density=35) returns -63.97142857142857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0013 begin`);
      const actual: number = searchInputWidthOf(1, 35);
      logInfo(`searchInputWidthOf(windowWidthPx=1, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.97142857142857, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0013 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0014
     * @tc.name      SearchComponent_SearchInputWidthOf_0014
     * @tc.desc      searchInputWidthOf(windowWidthPx=1, density=40) returns -63.975
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0014 begin`);
      const actual: number = searchInputWidthOf(1, 40);
      logInfo(`searchInputWidthOf(windowWidthPx=1, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.975, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0014 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0015
     * @tc.name      SearchComponent_SearchInputWidthOf_0015
     * @tc.desc      searchInputWidthOf(windowWidthPx=1, density=45) returns -63.977777777777774
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0015 begin`);
      const actual: number = searchInputWidthOf(1, 45);
      logInfo(`searchInputWidthOf(windowWidthPx=1, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.977777777777774, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0015 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0016
     * @tc.name      SearchComponent_SearchInputWidthOf_0016
     * @tc.desc      searchInputWidthOf(windowWidthPx=1, density=50) returns -63.98
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0016 begin`);
      const actual: number = searchInputWidthOf(1, 50);
      logInfo(`searchInputWidthOf(windowWidthPx=1, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.98, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0016 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0017
     * @tc.name      SearchComponent_SearchInputWidthOf_0017
     * @tc.desc      searchInputWidthOf(windowWidthPx=1, density=55) returns -63.981818181818184
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0017 begin`);
      const actual: number = searchInputWidthOf(1, 55);
      logInfo(`searchInputWidthOf(windowWidthPx=1, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.981818181818184, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0017 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0018
     * @tc.name      SearchComponent_SearchInputWidthOf_0018
     * @tc.desc      searchInputWidthOf(windowWidthPx=1, density=60) returns -63.983333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0018 begin`);
      const actual: number = searchInputWidthOf(1, 60);
      logInfo(`searchInputWidthOf(windowWidthPx=1, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.983333333333334, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0018 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0019
     * @tc.name      SearchComponent_SearchInputWidthOf_0019
     * @tc.desc      searchInputWidthOf(windowWidthPx=1, density=65) returns -63.98461538461538
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0019 begin`);
      const actual: number = searchInputWidthOf(1, 65);
      logInfo(`searchInputWidthOf(windowWidthPx=1, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.98461538461538, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0019 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0020
     * @tc.name      SearchComponent_SearchInputWidthOf_0020
     * @tc.desc      searchInputWidthOf(windowWidthPx=1, density=70) returns -63.98571428571429
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0020 begin`);
      const actual: number = searchInputWidthOf(1, 70);
      logInfo(`searchInputWidthOf(windowWidthPx=1, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.98571428571429, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0020 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0021
     * @tc.name      SearchComponent_SearchInputWidthOf_0021
     * @tc.desc      searchInputWidthOf(windowWidthPx=1, density=75) returns -63.986666666666665
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0021 begin`);
      const actual: number = searchInputWidthOf(1, 75);
      logInfo(`searchInputWidthOf(windowWidthPx=1, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.986666666666665, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0021 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0022
     * @tc.name      SearchComponent_SearchInputWidthOf_0022
     * @tc.desc      searchInputWidthOf(windowWidthPx=1, density=80) returns -63.9875
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0022 begin`);
      const actual: number = searchInputWidthOf(1, 80);
      logInfo(`searchInputWidthOf(windowWidthPx=1, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.9875, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0022 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0023
     * @tc.name      SearchComponent_SearchInputWidthOf_0023
     * @tc.desc      searchInputWidthOf(windowWidthPx=1, density=85) returns -63.98823529411764
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0023 begin`);
      const actual: number = searchInputWidthOf(1, 85);
      logInfo(`searchInputWidthOf(windowWidthPx=1, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.98823529411764, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0023 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0024
     * @tc.name      SearchComponent_SearchInputWidthOf_0024
     * @tc.desc      searchInputWidthOf(windowWidthPx=1, density=90) returns -63.98888888888889
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0024 begin`);
      const actual: number = searchInputWidthOf(1, 90);
      logInfo(`searchInputWidthOf(windowWidthPx=1, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.98888888888889, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0024 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0025
     * @tc.name      SearchComponent_SearchInputWidthOf_0025
     * @tc.desc      searchInputWidthOf(windowWidthPx=1, density=95) returns -63.98947368421052
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0025 begin`);
      const actual: number = searchInputWidthOf(1, 95);
      logInfo(`searchInputWidthOf(windowWidthPx=1, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.98947368421052, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0025 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0026
     * @tc.name      SearchComponent_SearchInputWidthOf_0026
     * @tc.desc      searchInputWidthOf(windowWidthPx=1, density=105) returns -63.99047619047619
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0026 begin`);
      const actual: number = searchInputWidthOf(1, 105);
      logInfo(`searchInputWidthOf(windowWidthPx=1, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.99047619047619, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0026 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0027
     * @tc.name      SearchComponent_SearchInputWidthOf_0027
     * @tc.desc      searchInputWidthOf(windowWidthPx=1, density=110) returns -63.99090909090909
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0027 begin`);
      const actual: number = searchInputWidthOf(1, 110);
      logInfo(`searchInputWidthOf(windowWidthPx=1, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.99090909090909, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0027 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0028
     * @tc.name      SearchComponent_SearchInputWidthOf_0028
     * @tc.desc      searchInputWidthOf(windowWidthPx=1, density=115) returns -63.99130434782609
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0028 begin`);
      const actual: number = searchInputWidthOf(1, 115);
      logInfo(`searchInputWidthOf(windowWidthPx=1, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.99130434782609, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0028 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0029
     * @tc.name      SearchComponent_SearchInputWidthOf_0029
     * @tc.desc      searchInputWidthOf(windowWidthPx=1, density=187) returns -63.99465240641711
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0029 begin`);
      const actual: number = searchInputWidthOf(1, 187);
      logInfo(`searchInputWidthOf(windowWidthPx=1, densi...: actual=${actual}`);
      expect(actual).assertClose(-63.99465240641711, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0029 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0030
     * @tc.name      SearchComponent_SearchInputWidthOf_0030
     * @tc.desc      searchInputWidthOf(windowWidthPx=-1, density=1) returns -65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0030 begin`);
      const actual: number = searchInputWidthOf(-1, 1);
      logInfo(`searchInputWidthOf(windowWidthPx=-1, dens...: actual=${actual}`);
      expect(actual).assertEqual(-65);
      logInfo(`${BUNDLE}SearchInputWidthOf_0030 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0031
     * @tc.name      SearchComponent_SearchInputWidthOf_0031
     * @tc.desc      searchInputWidthOf(windowWidthPx=-1, density=2) returns -64.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0031 begin`);
      const actual: number = searchInputWidthOf(-1, 2);
      logInfo(`searchInputWidthOf(windowWidthPx=-1, dens...: actual=${actual}`);
      expect(actual).assertClose(-64.5, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0031 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0032
     * @tc.name      SearchComponent_SearchInputWidthOf_0032
     * @tc.desc      searchInputWidthOf(windowWidthPx=-1, density=3) returns -64.33333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0032 begin`);
      const actual: number = searchInputWidthOf(-1, 3);
      logInfo(`searchInputWidthOf(windowWidthPx=-1, dens...: actual=${actual}`);
      expect(actual).assertClose(-64.33333333333333, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0032 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0033
     * @tc.name      SearchComponent_SearchInputWidthOf_0033
     * @tc.desc      searchInputWidthOf(windowWidthPx=-1, density=10) returns -64.1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0033 begin`);
      const actual: number = searchInputWidthOf(-1, 10);
      logInfo(`searchInputWidthOf(windowWidthPx=-1, dens...: actual=${actual}`);
      expect(actual).assertClose(-64.1, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0033 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0034
     * @tc.name      SearchComponent_SearchInputWidthOf_0034
     * @tc.desc      searchInputWidthOf(windowWidthPx=-1, density=100) returns -64.01
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0034 begin`);
      const actual: number = searchInputWidthOf(-1, 100);
      logInfo(`searchInputWidthOf(windowWidthPx=-1, dens...: actual=${actual}`);
      expect(actual).assertClose(-64.01, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0034 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0035
     * @tc.name      SearchComponent_SearchInputWidthOf_0035
     * @tc.desc      searchInputWidthOf(windowWidthPx=-1, density=5) returns -64.2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0035 begin`);
      const actual: number = searchInputWidthOf(-1, 5);
      logInfo(`searchInputWidthOf(windowWidthPx=-1, dens...: actual=${actual}`);
      expect(actual).assertClose(-64.2, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0035 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0036
     * @tc.name      SearchComponent_SearchInputWidthOf_0036
     * @tc.desc      searchInputWidthOf(windowWidthPx=-1, density=15) returns -64.06666666666666
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0036 begin`);
      const actual: number = searchInputWidthOf(-1, 15);
      logInfo(`searchInputWidthOf(windowWidthPx=-1, dens...: actual=${actual}`);
      expect(actual).assertClose(-64.06666666666666, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0036 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0037
     * @tc.name      SearchComponent_SearchInputWidthOf_0037
     * @tc.desc      searchInputWidthOf(windowWidthPx=-1, density=20) returns -64.05
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0037 begin`);
      const actual: number = searchInputWidthOf(-1, 20);
      logInfo(`searchInputWidthOf(windowWidthPx=-1, dens...: actual=${actual}`);
      expect(actual).assertClose(-64.05, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0037 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0038
     * @tc.name      SearchComponent_SearchInputWidthOf_0038
     * @tc.desc      searchInputWidthOf(windowWidthPx=-1, density=25) returns -64.04
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0038 begin`);
      const actual: number = searchInputWidthOf(-1, 25);
      logInfo(`searchInputWidthOf(windowWidthPx=-1, dens...: actual=${actual}`);
      expect(actual).assertClose(-64.04, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0038 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0039
     * @tc.name      SearchComponent_SearchInputWidthOf_0039
     * @tc.desc      searchInputWidthOf(windowWidthPx=-1, density=30) returns -64.03333333333333
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0039 begin`);
      const actual: number = searchInputWidthOf(-1, 30);
      logInfo(`searchInputWidthOf(windowWidthPx=-1, dens...: actual=${actual}`);
      expect(actual).assertClose(-64.03333333333333, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0039 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0040
     * @tc.name      SearchComponent_SearchInputWidthOf_0040
     * @tc.desc      searchInputWidthOf(windowWidthPx=-1, density=35) returns -64.02857142857142
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0040 begin`);
      const actual: number = searchInputWidthOf(-1, 35);
      logInfo(`searchInputWidthOf(windowWidthPx=-1, dens...: actual=${actual}`);
      expect(actual).assertClose(-64.02857142857142, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0040 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0041
     * @tc.name      SearchComponent_SearchInputWidthOf_0041
     * @tc.desc      searchInputWidthOf(windowWidthPx=-1, density=40) returns -64.025
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0041 begin`);
      const actual: number = searchInputWidthOf(-1, 40);
      logInfo(`searchInputWidthOf(windowWidthPx=-1, dens...: actual=${actual}`);
      expect(actual).assertClose(-64.025, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0041 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0042
     * @tc.name      SearchComponent_SearchInputWidthOf_0042
     * @tc.desc      searchInputWidthOf(windowWidthPx=-1, density=45) returns -64.02222222222223
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0042 begin`);
      const actual: number = searchInputWidthOf(-1, 45);
      logInfo(`searchInputWidthOf(windowWidthPx=-1, dens...: actual=${actual}`);
      expect(actual).assertClose(-64.02222222222223, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0042 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0043
     * @tc.name      SearchComponent_SearchInputWidthOf_0043
     * @tc.desc      searchInputWidthOf(windowWidthPx=-1, density=50) returns -64.02
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0043 begin`);
      const actual: number = searchInputWidthOf(-1, 50);
      logInfo(`searchInputWidthOf(windowWidthPx=-1, dens...: actual=${actual}`);
      expect(actual).assertClose(-64.02, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0043 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0044
     * @tc.name      SearchComponent_SearchInputWidthOf_0044
     * @tc.desc      searchInputWidthOf(windowWidthPx=-1, density=55) returns -64.01818181818182
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0044 begin`);
      const actual: number = searchInputWidthOf(-1, 55);
      logInfo(`searchInputWidthOf(windowWidthPx=-1, dens...: actual=${actual}`);
      expect(actual).assertClose(-64.01818181818182, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0044 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0045
     * @tc.name      SearchComponent_SearchInputWidthOf_0045
     * @tc.desc      searchInputWidthOf(windowWidthPx=-1, density=60) returns -64.01666666666667
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0045 begin`);
      const actual: number = searchInputWidthOf(-1, 60);
      logInfo(`searchInputWidthOf(windowWidthPx=-1, dens...: actual=${actual}`);
      expect(actual).assertClose(-64.01666666666667, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0045 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0046
     * @tc.name      SearchComponent_SearchInputWidthOf_0046
     * @tc.desc      searchInputWidthOf(windowWidthPx=-1, density=65) returns -64.01538461538462
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0046 begin`);
      const actual: number = searchInputWidthOf(-1, 65);
      logInfo(`searchInputWidthOf(windowWidthPx=-1, dens...: actual=${actual}`);
      expect(actual).assertClose(-64.01538461538462, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0046 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0047
     * @tc.name      SearchComponent_SearchInputWidthOf_0047
     * @tc.desc      searchInputWidthOf(windowWidthPx=-1, density=70) returns -64.01428571428572
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0047 begin`);
      const actual: number = searchInputWidthOf(-1, 70);
      logInfo(`searchInputWidthOf(windowWidthPx=-1, dens...: actual=${actual}`);
      expect(actual).assertClose(-64.01428571428572, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0047 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0048
     * @tc.name      SearchComponent_SearchInputWidthOf_0048
     * @tc.desc      searchInputWidthOf(windowWidthPx=-1, density=75) returns -64.01333333333334
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0048 begin`);
      const actual: number = searchInputWidthOf(-1, 75);
      logInfo(`searchInputWidthOf(windowWidthPx=-1, dens...: actual=${actual}`);
      expect(actual).assertClose(-64.01333333333334, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0048 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0049
     * @tc.name      SearchComponent_SearchInputWidthOf_0049
     * @tc.desc      searchInputWidthOf(windowWidthPx=-1, density=80) returns -64.0125
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0049 begin`);
      const actual: number = searchInputWidthOf(-1, 80);
      logInfo(`searchInputWidthOf(windowWidthPx=-1, dens...: actual=${actual}`);
      expect(actual).assertClose(-64.0125, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0049 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0050
     * @tc.name      SearchComponent_SearchInputWidthOf_0050
     * @tc.desc      searchInputWidthOf(windowWidthPx=-1, density=85) returns -64.01176470588236
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0050 begin`);
      const actual: number = searchInputWidthOf(-1, 85);
      logInfo(`searchInputWidthOf(windowWidthPx=-1, dens...: actual=${actual}`);
      expect(actual).assertClose(-64.01176470588236, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0050 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0051
     * @tc.name      SearchComponent_SearchInputWidthOf_0051
     * @tc.desc      searchInputWidthOf(windowWidthPx=-1, density=90) returns -64.0111111111111
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0051 begin`);
      const actual: number = searchInputWidthOf(-1, 90);
      logInfo(`searchInputWidthOf(windowWidthPx=-1, dens...: actual=${actual}`);
      expect(actual).assertClose(-64.0111111111111, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0051 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0052
     * @tc.name      SearchComponent_SearchInputWidthOf_0052
     * @tc.desc      searchInputWidthOf(windowWidthPx=-1, density=95) returns -64.01052631578948
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0052 begin`);
      const actual: number = searchInputWidthOf(-1, 95);
      logInfo(`searchInputWidthOf(windowWidthPx=-1, dens...: actual=${actual}`);
      expect(actual).assertClose(-64.01052631578948, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0052 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0053
     * @tc.name      SearchComponent_SearchInputWidthOf_0053
     * @tc.desc      searchInputWidthOf(windowWidthPx=-1, density=105) returns -64.00952380952381
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0053 begin`);
      const actual: number = searchInputWidthOf(-1, 105);
      logInfo(`searchInputWidthOf(windowWidthPx=-1, dens...: actual=${actual}`);
      expect(actual).assertClose(-64.00952380952381, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0053 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0054
     * @tc.name      SearchComponent_SearchInputWidthOf_0054
     * @tc.desc      searchInputWidthOf(windowWidthPx=-1, density=110) returns -64.00909090909092
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0054 begin`);
      const actual: number = searchInputWidthOf(-1, 110);
      logInfo(`searchInputWidthOf(windowWidthPx=-1, dens...: actual=${actual}`);
      expect(actual).assertClose(-64.00909090909092, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0054 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0055
     * @tc.name      SearchComponent_SearchInputWidthOf_0055
     * @tc.desc      searchInputWidthOf(windowWidthPx=-1, density=115) returns -64.00869565217391
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0055 begin`);
      const actual: number = searchInputWidthOf(-1, 115);
      logInfo(`searchInputWidthOf(windowWidthPx=-1, dens...: actual=${actual}`);
      expect(actual).assertClose(-64.00869565217391, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0055 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0056
     * @tc.name      SearchComponent_SearchInputWidthOf_0056
     * @tc.desc      searchInputWidthOf(windowWidthPx=-1, density=187) returns -64.00534759358288
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0056 begin`);
      const actual: number = searchInputWidthOf(-1, 187);
      logInfo(`searchInputWidthOf(windowWidthPx=-1, dens...: actual=${actual}`);
      expect(actual).assertClose(-64.00534759358288, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0056 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0057
     * @tc.name      SearchComponent_SearchInputWidthOf_0057
     * @tc.desc      searchInputWidthOf(windowWidthPx=100, density=1) returns 36
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0057 begin`);
      const actual: number = searchInputWidthOf(100, 1);
      logInfo(`searchInputWidthOf(windowWidthPx=100, den...: actual=${actual}`);
      expect(actual).assertEqual(36);
      logInfo(`${BUNDLE}SearchInputWidthOf_0057 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0058
     * @tc.name      SearchComponent_SearchInputWidthOf_0058
     * @tc.desc      searchInputWidthOf(windowWidthPx=100, density=2) returns -14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0058 begin`);
      const actual: number = searchInputWidthOf(100, 2);
      logInfo(`searchInputWidthOf(windowWidthPx=100, den...: actual=${actual}`);
      expect(actual).assertEqual(-14);
      logInfo(`${BUNDLE}SearchInputWidthOf_0058 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0059
     * @tc.name      SearchComponent_SearchInputWidthOf_0059
     * @tc.desc      searchInputWidthOf(windowWidthPx=100, density=3) returns -30.666666666666664
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0059 begin`);
      const actual: number = searchInputWidthOf(100, 3);
      logInfo(`searchInputWidthOf(windowWidthPx=100, den...: actual=${actual}`);
      expect(actual).assertClose(-30.666666666666664, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0059 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0060
     * @tc.name      SearchComponent_SearchInputWidthOf_0060
     * @tc.desc      searchInputWidthOf(windowWidthPx=100, density=10) returns -54
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0060 begin`);
      const actual: number = searchInputWidthOf(100, 10);
      logInfo(`searchInputWidthOf(windowWidthPx=100, den...: actual=${actual}`);
      expect(actual).assertEqual(-54);
      logInfo(`${BUNDLE}SearchInputWidthOf_0060 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0061
     * @tc.name      SearchComponent_SearchInputWidthOf_0061
     * @tc.desc      searchInputWidthOf(windowWidthPx=100, density=5) returns -44
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0061 begin`);
      const actual: number = searchInputWidthOf(100, 5);
      logInfo(`searchInputWidthOf(windowWidthPx=100, den...: actual=${actual}`);
      expect(actual).assertEqual(-44);
      logInfo(`${BUNDLE}SearchInputWidthOf_0061 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0062
     * @tc.name      SearchComponent_SearchInputWidthOf_0062
     * @tc.desc      searchInputWidthOf(windowWidthPx=100, density=15) returns -57.333333333333336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0062 begin`);
      const actual: number = searchInputWidthOf(100, 15);
      logInfo(`searchInputWidthOf(windowWidthPx=100, den...: actual=${actual}`);
      expect(actual).assertClose(-57.333333333333336, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0062 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0063
     * @tc.name      SearchComponent_SearchInputWidthOf_0063
     * @tc.desc      searchInputWidthOf(windowWidthPx=100, density=20) returns -59
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0063 begin`);
      const actual: number = searchInputWidthOf(100, 20);
      logInfo(`searchInputWidthOf(windowWidthPx=100, den...: actual=${actual}`);
      expect(actual).assertEqual(-59);
      logInfo(`${BUNDLE}SearchInputWidthOf_0063 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0064
     * @tc.name      SearchComponent_SearchInputWidthOf_0064
     * @tc.desc      searchInputWidthOf(windowWidthPx=100, density=25) returns -60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0064 begin`);
      const actual: number = searchInputWidthOf(100, 25);
      logInfo(`searchInputWidthOf(windowWidthPx=100, den...: actual=${actual}`);
      expect(actual).assertEqual(-60);
      logInfo(`${BUNDLE}SearchInputWidthOf_0064 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0065
     * @tc.name      SearchComponent_SearchInputWidthOf_0065
     * @tc.desc      searchInputWidthOf(windowWidthPx=100, density=30) returns -60.666666666666664
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0065 begin`);
      const actual: number = searchInputWidthOf(100, 30);
      logInfo(`searchInputWidthOf(windowWidthPx=100, den...: actual=${actual}`);
      expect(actual).assertClose(-60.666666666666664, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0065 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0066
     * @tc.name      SearchComponent_SearchInputWidthOf_0066
     * @tc.desc      searchInputWidthOf(windowWidthPx=100, density=35) returns -61.142857142857146
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0066 begin`);
      const actual: number = searchInputWidthOf(100, 35);
      logInfo(`searchInputWidthOf(windowWidthPx=100, den...: actual=${actual}`);
      expect(actual).assertClose(-61.142857142857146, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0066 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0067
     * @tc.name      SearchComponent_SearchInputWidthOf_0067
     * @tc.desc      searchInputWidthOf(windowWidthPx=100, density=40) returns -61.5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0067 begin`);
      const actual: number = searchInputWidthOf(100, 40);
      logInfo(`searchInputWidthOf(windowWidthPx=100, den...: actual=${actual}`);
      expect(actual).assertClose(-61.5, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0067 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0068
     * @tc.name      SearchComponent_SearchInputWidthOf_0068
     * @tc.desc      searchInputWidthOf(windowWidthPx=100, density=45) returns -61.77777777777778
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0068 begin`);
      const actual: number = searchInputWidthOf(100, 45);
      logInfo(`searchInputWidthOf(windowWidthPx=100, den...: actual=${actual}`);
      expect(actual).assertClose(-61.77777777777778, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0068 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0069
     * @tc.name      SearchComponent_SearchInputWidthOf_0069
     * @tc.desc      searchInputWidthOf(windowWidthPx=100, density=50) returns -62
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0069 begin`);
      const actual: number = searchInputWidthOf(100, 50);
      logInfo(`searchInputWidthOf(windowWidthPx=100, den...: actual=${actual}`);
      expect(actual).assertEqual(-62);
      logInfo(`${BUNDLE}SearchInputWidthOf_0069 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0070
     * @tc.name      SearchComponent_SearchInputWidthOf_0070
     * @tc.desc      searchInputWidthOf(windowWidthPx=100, density=55) returns -62.18181818181818
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0070 begin`);
      const actual: number = searchInputWidthOf(100, 55);
      logInfo(`searchInputWidthOf(windowWidthPx=100, den...: actual=${actual}`);
      expect(actual).assertClose(-62.18181818181818, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0070 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0071
     * @tc.name      SearchComponent_SearchInputWidthOf_0071
     * @tc.desc      searchInputWidthOf(windowWidthPx=100, density=60) returns -62.333333333333336
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0071 begin`);
      const actual: number = searchInputWidthOf(100, 60);
      logInfo(`searchInputWidthOf(windowWidthPx=100, den...: actual=${actual}`);
      expect(actual).assertClose(-62.333333333333336, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0071 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0072
     * @tc.name      SearchComponent_SearchInputWidthOf_0072
     * @tc.desc      searchInputWidthOf(windowWidthPx=100, density=65) returns -62.46153846153846
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0072 begin`);
      const actual: number = searchInputWidthOf(100, 65);
      logInfo(`searchInputWidthOf(windowWidthPx=100, den...: actual=${actual}`);
      expect(actual).assertClose(-62.46153846153846, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0072 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0073
     * @tc.name      SearchComponent_SearchInputWidthOf_0073
     * @tc.desc      searchInputWidthOf(windowWidthPx=100, density=70) returns -62.57142857142857
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0073 begin`);
      const actual: number = searchInputWidthOf(100, 70);
      logInfo(`searchInputWidthOf(windowWidthPx=100, den...: actual=${actual}`);
      expect(actual).assertClose(-62.57142857142857, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0073 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0074
     * @tc.name      SearchComponent_SearchInputWidthOf_0074
     * @tc.desc      searchInputWidthOf(windowWidthPx=100, density=75) returns -62.666666666666664
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0074 begin`);
      const actual: number = searchInputWidthOf(100, 75);
      logInfo(`searchInputWidthOf(windowWidthPx=100, den...: actual=${actual}`);
      expect(actual).assertClose(-62.666666666666664, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0074 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0075
     * @tc.name      SearchComponent_SearchInputWidthOf_0075
     * @tc.desc      searchInputWidthOf(windowWidthPx=100, density=80) returns -62.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0075 begin`);
      const actual: number = searchInputWidthOf(100, 80);
      logInfo(`searchInputWidthOf(windowWidthPx=100, den...: actual=${actual}`);
      expect(actual).assertClose(-62.75, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0075 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0076
     * @tc.name      SearchComponent_SearchInputWidthOf_0076
     * @tc.desc      searchInputWidthOf(windowWidthPx=100, density=85) returns -62.8235294117647
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0076 begin`);
      const actual: number = searchInputWidthOf(100, 85);
      logInfo(`searchInputWidthOf(windowWidthPx=100, den...: actual=${actual}`);
      expect(actual).assertClose(-62.8235294117647, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0076 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0077
     * @tc.name      SearchComponent_SearchInputWidthOf_0077
     * @tc.desc      searchInputWidthOf(windowWidthPx=100, density=90) returns -62.888888888888886
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0077 begin`);
      const actual: number = searchInputWidthOf(100, 90);
      logInfo(`searchInputWidthOf(windowWidthPx=100, den...: actual=${actual}`);
      expect(actual).assertClose(-62.888888888888886, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0077 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0078
     * @tc.name      SearchComponent_SearchInputWidthOf_0078
     * @tc.desc      searchInputWidthOf(windowWidthPx=100, density=95) returns -62.94736842105263
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0078 begin`);
      const actual: number = searchInputWidthOf(100, 95);
      logInfo(`searchInputWidthOf(windowWidthPx=100, den...: actual=${actual}`);
      expect(actual).assertClose(-62.94736842105263, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0078 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0079
     * @tc.name      SearchComponent_SearchInputWidthOf_0079
     * @tc.desc      searchInputWidthOf(windowWidthPx=100, density=105) returns -63.04761904761905
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0079 begin`);
      const actual: number = searchInputWidthOf(100, 105);
      logInfo(`searchInputWidthOf(windowWidthPx=100, den...: actual=${actual}`);
      expect(actual).assertClose(-63.04761904761905, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0079 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0080
     * @tc.name      SearchComponent_SearchInputWidthOf_0080
     * @tc.desc      searchInputWidthOf(windowWidthPx=100, density=110) returns -63.09090909090909
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0080 begin`);
      const actual: number = searchInputWidthOf(100, 110);
      logInfo(`searchInputWidthOf(windowWidthPx=100, den...: actual=${actual}`);
      expect(actual).assertClose(-63.09090909090909, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0080 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0081
     * @tc.name      SearchComponent_SearchInputWidthOf_0081
     * @tc.desc      searchInputWidthOf(windowWidthPx=100, density=115) returns -63.130434782608695
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0081 begin`);
      const actual: number = searchInputWidthOf(100, 115);
      logInfo(`searchInputWidthOf(windowWidthPx=100, den...: actual=${actual}`);
      expect(actual).assertClose(-63.130434782608695, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0081 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0082
     * @tc.name      SearchComponent_SearchInputWidthOf_0082
     * @tc.desc      searchInputWidthOf(windowWidthPx=100, density=187) returns -63.46524064171123
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0082 begin`);
      const actual: number = searchInputWidthOf(100, 187);
      logInfo(`searchInputWidthOf(windowWidthPx=100, den...: actual=${actual}`);
      expect(actual).assertClose(-63.46524064171123, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0082 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0083
     * @tc.name      SearchComponent_SearchInputWidthOf_0083
     * @tc.desc      searchInputWidthOf(windowWidthPx=360, density=1) returns 296
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_SearchInputWidthOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0083 begin`);
      const actual: number = searchInputWidthOf(360, 1);
      logInfo(`searchInputWidthOf(windowWidthPx=360, den...: actual=${actual}`);
      expect(actual).assertEqual(296);
      logInfo(`${BUNDLE}SearchInputWidthOf_0083 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0084
     * @tc.name      SearchComponent_SearchInputWidthOf_0084
     * @tc.desc      searchInputWidthOf(windowWidthPx=360, density=2) returns 116
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0084 begin`);
      const actual: number = searchInputWidthOf(360, 2);
      logInfo(`searchInputWidthOf(windowWidthPx=360, den...: actual=${actual}`);
      expect(actual).assertEqual(116);
      logInfo(`${BUNDLE}SearchInputWidthOf_0084 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0085
     * @tc.name      SearchComponent_SearchInputWidthOf_0085
     * @tc.desc      searchInputWidthOf(windowWidthPx=360, density=3) returns 56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0085 begin`);
      const actual: number = searchInputWidthOf(360, 3);
      logInfo(`searchInputWidthOf(windowWidthPx=360, den...: actual=${actual}`);
      expect(actual).assertEqual(56);
      logInfo(`${BUNDLE}SearchInputWidthOf_0085 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0086
     * @tc.name      SearchComponent_SearchInputWidthOf_0086
     * @tc.desc      searchInputWidthOf(windowWidthPx=360, density=10) returns -28
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0086 begin`);
      const actual: number = searchInputWidthOf(360, 10);
      logInfo(`searchInputWidthOf(windowWidthPx=360, den...: actual=${actual}`);
      expect(actual).assertEqual(-28);
      logInfo(`${BUNDLE}SearchInputWidthOf_0086 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0087
     * @tc.name      SearchComponent_SearchInputWidthOf_0087
     * @tc.desc      searchInputWidthOf(windowWidthPx=360, density=100) returns -60.4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0087 begin`);
      const actual: number = searchInputWidthOf(360, 100);
      logInfo(`searchInputWidthOf(windowWidthPx=360, den...: actual=${actual}`);
      expect(actual).assertClose(-60.4, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0087 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0088
     * @tc.name      SearchComponent_SearchInputWidthOf_0088
     * @tc.desc      searchInputWidthOf(windowWidthPx=360, density=5) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0088 begin`);
      const actual: number = searchInputWidthOf(360, 5);
      logInfo(`searchInputWidthOf(windowWidthPx=360, den...: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}SearchInputWidthOf_0088 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0089
     * @tc.name      SearchComponent_SearchInputWidthOf_0089
     * @tc.desc      searchInputWidthOf(windowWidthPx=360, density=15) returns -40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0089 begin`);
      const actual: number = searchInputWidthOf(360, 15);
      logInfo(`searchInputWidthOf(windowWidthPx=360, den...: actual=${actual}`);
      expect(actual).assertEqual(-40);
      logInfo(`${BUNDLE}SearchInputWidthOf_0089 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0090
     * @tc.name      SearchComponent_SearchInputWidthOf_0090
     * @tc.desc      searchInputWidthOf(windowWidthPx=360, density=20) returns -46
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0090 begin`);
      const actual: number = searchInputWidthOf(360, 20);
      logInfo(`searchInputWidthOf(windowWidthPx=360, den...: actual=${actual}`);
      expect(actual).assertEqual(-46);
      logInfo(`${BUNDLE}SearchInputWidthOf_0090 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0091
     * @tc.name      SearchComponent_SearchInputWidthOf_0091
     * @tc.desc      searchInputWidthOf(windowWidthPx=360, density=25) returns -49.6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0091 begin`);
      const actual: number = searchInputWidthOf(360, 25);
      logInfo(`searchInputWidthOf(windowWidthPx=360, den...: actual=${actual}`);
      expect(actual).assertClose(-49.6, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0091 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0092
     * @tc.name      SearchComponent_SearchInputWidthOf_0092
     * @tc.desc      searchInputWidthOf(windowWidthPx=360, density=30) returns -52
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0092 begin`);
      const actual: number = searchInputWidthOf(360, 30);
      logInfo(`searchInputWidthOf(windowWidthPx=360, den...: actual=${actual}`);
      expect(actual).assertEqual(-52);
      logInfo(`${BUNDLE}SearchInputWidthOf_0092 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0093
     * @tc.name      SearchComponent_SearchInputWidthOf_0093
     * @tc.desc      searchInputWidthOf(windowWidthPx=360, density=35) returns -53.714285714285715
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0093 begin`);
      const actual: number = searchInputWidthOf(360, 35);
      logInfo(`searchInputWidthOf(windowWidthPx=360, den...: actual=${actual}`);
      expect(actual).assertClose(-53.714285714285715, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0093 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0094
     * @tc.name      SearchComponent_SearchInputWidthOf_0094
     * @tc.desc      searchInputWidthOf(windowWidthPx=360, density=40) returns -55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0094 begin`);
      const actual: number = searchInputWidthOf(360, 40);
      logInfo(`searchInputWidthOf(windowWidthPx=360, den...: actual=${actual}`);
      expect(actual).assertEqual(-55);
      logInfo(`${BUNDLE}SearchInputWidthOf_0094 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0095
     * @tc.name      SearchComponent_SearchInputWidthOf_0095
     * @tc.desc      searchInputWidthOf(windowWidthPx=360, density=45) returns -56
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0095 begin`);
      const actual: number = searchInputWidthOf(360, 45);
      logInfo(`searchInputWidthOf(windowWidthPx=360, den...: actual=${actual}`);
      expect(actual).assertEqual(-56);
      logInfo(`${BUNDLE}SearchInputWidthOf_0095 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_SEARCH_INPUT_WIDTH_OF_0096
     * @tc.name      SearchComponent_SearchInputWidthOf_0096
     * @tc.desc      searchInputWidthOf(windowWidthPx=360, density=50) returns -56.8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_SearchInputWidthOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchInputWidthOf_0096 begin`);
      const actual: number = searchInputWidthOf(360, 50);
      logInfo(`searchInputWidthOf(windowWidthPx=360, den...: actual=${actual}`);
      expect(actual).assertClose(-56.8, PRECISION);
      logInfo(`${BUNDLE}SearchInputWidthOf_0096 end`);
    });
  });
}
