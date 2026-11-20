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
import { categoryAfterTap } from '../model/SearchComponentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SearchComponent]';
const BUNDLE: string = 'SearchComponent_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for categoryAfterTap (96 cases). */
export default function categoryAfterTapTest(): void {
  describe('CategoryAfterTapTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0001
     * @tc.name      SearchComponent_CategoryAfterTap_0001
     * @tc.desc      categoryAfterTap(current=0, index=0) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_CategoryAfterTap_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0001 begin`);
      const actual: string = categoryAfterTap(0, 0);
      logInfo(`categoryAfterTap(current=0, index=0): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0001 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0002
     * @tc.name      SearchComponent_CategoryAfterTap_0002
     * @tc.desc      categoryAfterTap(current=0, index=1) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SearchComponent_CategoryAfterTap_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0002 begin`);
      const actual: string = categoryAfterTap(0, 1);
      logInfo(`categoryAfterTap(current=0, index=1): actual=${actual}`);
      expect(actual).assertEqual('\u52a8\u6548');
      logInfo(`${BUNDLE}CategoryAfterTap_0002 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0003
     * @tc.name      SearchComponent_CategoryAfterTap_0003
     * @tc.desc      categoryAfterTap(current=0, index=2) returns "???"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0003 begin`);
      const actual: string = categoryAfterTap(0, 2);
      logInfo(`categoryAfterTap(current=0, index=2): actual=${actual}`);
      expect(actual).assertEqual('\u4e09\u65b9\u5e93');
      logInfo(`${BUNDLE}CategoryAfterTap_0003 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0004
     * @tc.name      SearchComponent_CategoryAfterTap_0004
     * @tc.desc      categoryAfterTap(current=0, index=5) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0004 begin`);
      const actual: string = categoryAfterTap(0, 5);
      logInfo(`categoryAfterTap(current=0, index=5): actual=${actual}`);
      expect(actual).assertEqual('\u5176\u4ed6');
      logInfo(`${BUNDLE}CategoryAfterTap_0004 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0005
     * @tc.name      SearchComponent_CategoryAfterTap_0005
     * @tc.desc      categoryAfterTap(current=0, index=3) returns "Native"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0005 begin`);
      const actual: string = categoryAfterTap(0, 3);
      logInfo(`categoryAfterTap(current=0, index=3): actual=${actual}`);
      expect(actual).assertEqual('Native');
      logInfo(`${BUNDLE}CategoryAfterTap_0005 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0006
     * @tc.name      SearchComponent_CategoryAfterTap_0006
     * @tc.desc      categoryAfterTap(current=500, index=0) returns "UI??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0006 begin`);
      const actual: string = categoryAfterTap(500, 0);
      logInfo(`categoryAfterTap(current=500, index=0): actual=${actual}`);
      expect(actual).assertEqual('UI\u5e03\u5c40');
      logInfo(`${BUNDLE}CategoryAfterTap_0006 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0007
     * @tc.name      SearchComponent_CategoryAfterTap_0007
     * @tc.desc      categoryAfterTap(current=0, index=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0007 begin`);
      const actual: string = categoryAfterTap(0, -1);
      logInfo(`categoryAfterTap(current=0, index=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0007 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0008
     * @tc.name      SearchComponent_CategoryAfterTap_0008
     * @tc.desc      categoryAfterTap(current=0, index=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0008 begin`);
      const actual: string = categoryAfterTap(0, 10);
      logInfo(`categoryAfterTap(current=0, index=10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0008 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0009
     * @tc.name      SearchComponent_CategoryAfterTap_0009
     * @tc.desc      categoryAfterTap(current=0, index=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0009 begin`);
      const actual: string = categoryAfterTap(0, 100);
      logInfo(`categoryAfterTap(current=0, index=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0009 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0010
     * @tc.name      SearchComponent_CategoryAfterTap_0010
     * @tc.desc      categoryAfterTap(current=0, index=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0010 begin`);
      const actual: string = categoryAfterTap(0, 15);
      logInfo(`categoryAfterTap(current=0, index=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0010 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0011
     * @tc.name      SearchComponent_CategoryAfterTap_0011
     * @tc.desc      categoryAfterTap(current=0, index=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0011 begin`);
      const actual: string = categoryAfterTap(0, 20);
      logInfo(`categoryAfterTap(current=0, index=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0011 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0012
     * @tc.name      SearchComponent_CategoryAfterTap_0012
     * @tc.desc      categoryAfterTap(current=0, index=25) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0012 begin`);
      const actual: string = categoryAfterTap(0, 25);
      logInfo(`categoryAfterTap(current=0, index=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0012 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0013
     * @tc.name      SearchComponent_CategoryAfterTap_0013
     * @tc.desc      categoryAfterTap(current=0, index=30) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0013 begin`);
      const actual: string = categoryAfterTap(0, 30);
      logInfo(`categoryAfterTap(current=0, index=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0013 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0014
     * @tc.name      SearchComponent_CategoryAfterTap_0014
     * @tc.desc      categoryAfterTap(current=0, index=35) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0014 begin`);
      const actual: string = categoryAfterTap(0, 35);
      logInfo(`categoryAfterTap(current=0, index=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0014 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0015
     * @tc.name      SearchComponent_CategoryAfterTap_0015
     * @tc.desc      categoryAfterTap(current=0, index=40) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0015 begin`);
      const actual: string = categoryAfterTap(0, 40);
      logInfo(`categoryAfterTap(current=0, index=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0015 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0016
     * @tc.name      SearchComponent_CategoryAfterTap_0016
     * @tc.desc      categoryAfterTap(current=0, index=45) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0016 begin`);
      const actual: string = categoryAfterTap(0, 45);
      logInfo(`categoryAfterTap(current=0, index=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0016 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0017
     * @tc.name      SearchComponent_CategoryAfterTap_0017
     * @tc.desc      categoryAfterTap(current=0, index=50) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0017 begin`);
      const actual: string = categoryAfterTap(0, 50);
      logInfo(`categoryAfterTap(current=0, index=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0017 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0018
     * @tc.name      SearchComponent_CategoryAfterTap_0018
     * @tc.desc      categoryAfterTap(current=0, index=55) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0018 begin`);
      const actual: string = categoryAfterTap(0, 55);
      logInfo(`categoryAfterTap(current=0, index=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0018 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0019
     * @tc.name      SearchComponent_CategoryAfterTap_0019
     * @tc.desc      categoryAfterTap(current=0, index=60) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0019 begin`);
      const actual: string = categoryAfterTap(0, 60);
      logInfo(`categoryAfterTap(current=0, index=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0019 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0020
     * @tc.name      SearchComponent_CategoryAfterTap_0020
     * @tc.desc      categoryAfterTap(current=0, index=65) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0020 begin`);
      const actual: string = categoryAfterTap(0, 65);
      logInfo(`categoryAfterTap(current=0, index=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0020 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0021
     * @tc.name      SearchComponent_CategoryAfterTap_0021
     * @tc.desc      categoryAfterTap(current=0, index=70) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0021 begin`);
      const actual: string = categoryAfterTap(0, 70);
      logInfo(`categoryAfterTap(current=0, index=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0021 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0022
     * @tc.name      SearchComponent_CategoryAfterTap_0022
     * @tc.desc      categoryAfterTap(current=0, index=75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0022 begin`);
      const actual: string = categoryAfterTap(0, 75);
      logInfo(`categoryAfterTap(current=0, index=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0022 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0023
     * @tc.name      SearchComponent_CategoryAfterTap_0023
     * @tc.desc      categoryAfterTap(current=0, index=80) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0023 begin`);
      const actual: string = categoryAfterTap(0, 80);
      logInfo(`categoryAfterTap(current=0, index=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0023 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0024
     * @tc.name      SearchComponent_CategoryAfterTap_0024
     * @tc.desc      categoryAfterTap(current=0, index=85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0024 begin`);
      const actual: string = categoryAfterTap(0, 85);
      logInfo(`categoryAfterTap(current=0, index=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0024 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0025
     * @tc.name      SearchComponent_CategoryAfterTap_0025
     * @tc.desc      categoryAfterTap(current=0, index=90) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0025 begin`);
      const actual: string = categoryAfterTap(0, 90);
      logInfo(`categoryAfterTap(current=0, index=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0025 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0026
     * @tc.name      SearchComponent_CategoryAfterTap_0026
     * @tc.desc      categoryAfterTap(current=0, index=95) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0026 begin`);
      const actual: string = categoryAfterTap(0, 95);
      logInfo(`categoryAfterTap(current=0, index=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0026 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0027
     * @tc.name      SearchComponent_CategoryAfterTap_0027
     * @tc.desc      categoryAfterTap(current=0, index=105) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0027 begin`);
      const actual: string = categoryAfterTap(0, 105);
      logInfo(`categoryAfterTap(current=0, index=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0027 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0028
     * @tc.name      SearchComponent_CategoryAfterTap_0028
     * @tc.desc      categoryAfterTap(current=0, index=110) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0028 begin`);
      const actual: string = categoryAfterTap(0, 110);
      logInfo(`categoryAfterTap(current=0, index=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0028 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0029
     * @tc.name      SearchComponent_CategoryAfterTap_0029
     * @tc.desc      categoryAfterTap(current=0, index=-62) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_CategoryAfterTap_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0029 begin`);
      const actual: string = categoryAfterTap(0, -62);
      logInfo(`categoryAfterTap(current=0, index=-62): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0029 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0030
     * @tc.name      SearchComponent_CategoryAfterTap_0030
     * @tc.desc      categoryAfterTap(current=0, index=-34) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_CategoryAfterTap_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0030 begin`);
      const actual: string = categoryAfterTap(0, -34);
      logInfo(`categoryAfterTap(current=0, index=-34): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0030 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0031
     * @tc.name      SearchComponent_CategoryAfterTap_0031
     * @tc.desc      categoryAfterTap(current=0, index=150) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0031 begin`);
      const actual: string = categoryAfterTap(0, 150);
      logInfo(`categoryAfterTap(current=0, index=150): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0031 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0032
     * @tc.name      SearchComponent_CategoryAfterTap_0032
     * @tc.desc      categoryAfterTap(current=500, index=1) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0032 begin`);
      const actual: string = categoryAfterTap(500, 1);
      logInfo(`categoryAfterTap(current=500, index=1): actual=${actual}`);
      expect(actual).assertEqual('\u52a8\u6548');
      logInfo(`${BUNDLE}CategoryAfterTap_0032 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0033
     * @tc.name      SearchComponent_CategoryAfterTap_0033
     * @tc.desc      categoryAfterTap(current=500, index=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0033 begin`);
      const actual: string = categoryAfterTap(500, -1);
      logInfo(`categoryAfterTap(current=500, index=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0033 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0034
     * @tc.name      SearchComponent_CategoryAfterTap_0034
     * @tc.desc      categoryAfterTap(current=500, index=2) returns "???"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0034 begin`);
      const actual: string = categoryAfterTap(500, 2);
      logInfo(`categoryAfterTap(current=500, index=2): actual=${actual}`);
      expect(actual).assertEqual('\u4e09\u65b9\u5e93');
      logInfo(`${BUNDLE}CategoryAfterTap_0034 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0035
     * @tc.name      SearchComponent_CategoryAfterTap_0035
     * @tc.desc      categoryAfterTap(current=500, index=5) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0035 begin`);
      const actual: string = categoryAfterTap(500, 5);
      logInfo(`categoryAfterTap(current=500, index=5): actual=${actual}`);
      expect(actual).assertEqual('\u5176\u4ed6');
      logInfo(`${BUNDLE}CategoryAfterTap_0035 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0036
     * @tc.name      SearchComponent_CategoryAfterTap_0036
     * @tc.desc      categoryAfterTap(current=500, index=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0036 begin`);
      const actual: string = categoryAfterTap(500, 10);
      logInfo(`categoryAfterTap(current=500, index=10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0036 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0037
     * @tc.name      SearchComponent_CategoryAfterTap_0037
     * @tc.desc      categoryAfterTap(current=500, index=3) returns "Native"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0037 begin`);
      const actual: string = categoryAfterTap(500, 3);
      logInfo(`categoryAfterTap(current=500, index=3): actual=${actual}`);
      expect(actual).assertEqual('Native');
      logInfo(`${BUNDLE}CategoryAfterTap_0037 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0038
     * @tc.name      SearchComponent_CategoryAfterTap_0038
     * @tc.desc      categoryAfterTap(current=500, index=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0038 begin`);
      const actual: string = categoryAfterTap(500, 100);
      logInfo(`categoryAfterTap(current=500, index=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0038 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0039
     * @tc.name      SearchComponent_CategoryAfterTap_0039
     * @tc.desc      categoryAfterTap(current=500, index=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0039 begin`);
      const actual: string = categoryAfterTap(500, 15);
      logInfo(`categoryAfterTap(current=500, index=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0039 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0040
     * @tc.name      SearchComponent_CategoryAfterTap_0040
     * @tc.desc      categoryAfterTap(current=500, index=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0040 begin`);
      const actual: string = categoryAfterTap(500, 20);
      logInfo(`categoryAfterTap(current=500, index=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0040 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0041
     * @tc.name      SearchComponent_CategoryAfterTap_0041
     * @tc.desc      categoryAfterTap(current=500, index=25) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0041 begin`);
      const actual: string = categoryAfterTap(500, 25);
      logInfo(`categoryAfterTap(current=500, index=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0041 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0042
     * @tc.name      SearchComponent_CategoryAfterTap_0042
     * @tc.desc      categoryAfterTap(current=500, index=30) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0042 begin`);
      const actual: string = categoryAfterTap(500, 30);
      logInfo(`categoryAfterTap(current=500, index=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0042 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0043
     * @tc.name      SearchComponent_CategoryAfterTap_0043
     * @tc.desc      categoryAfterTap(current=500, index=35) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0043 begin`);
      const actual: string = categoryAfterTap(500, 35);
      logInfo(`categoryAfterTap(current=500, index=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0043 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0044
     * @tc.name      SearchComponent_CategoryAfterTap_0044
     * @tc.desc      categoryAfterTap(current=500, index=40) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0044 begin`);
      const actual: string = categoryAfterTap(500, 40);
      logInfo(`categoryAfterTap(current=500, index=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0044 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0045
     * @tc.name      SearchComponent_CategoryAfterTap_0045
     * @tc.desc      categoryAfterTap(current=500, index=45) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0045 begin`);
      const actual: string = categoryAfterTap(500, 45);
      logInfo(`categoryAfterTap(current=500, index=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0045 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0046
     * @tc.name      SearchComponent_CategoryAfterTap_0046
     * @tc.desc      categoryAfterTap(current=500, index=50) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0046 begin`);
      const actual: string = categoryAfterTap(500, 50);
      logInfo(`categoryAfterTap(current=500, index=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0046 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0047
     * @tc.name      SearchComponent_CategoryAfterTap_0047
     * @tc.desc      categoryAfterTap(current=500, index=55) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0047 begin`);
      const actual: string = categoryAfterTap(500, 55);
      logInfo(`categoryAfterTap(current=500, index=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0047 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0048
     * @tc.name      SearchComponent_CategoryAfterTap_0048
     * @tc.desc      categoryAfterTap(current=500, index=60) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0048 begin`);
      const actual: string = categoryAfterTap(500, 60);
      logInfo(`categoryAfterTap(current=500, index=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0048 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0049
     * @tc.name      SearchComponent_CategoryAfterTap_0049
     * @tc.desc      categoryAfterTap(current=500, index=65) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0049 begin`);
      const actual: string = categoryAfterTap(500, 65);
      logInfo(`categoryAfterTap(current=500, index=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0049 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0050
     * @tc.name      SearchComponent_CategoryAfterTap_0050
     * @tc.desc      categoryAfterTap(current=500, index=70) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0050 begin`);
      const actual: string = categoryAfterTap(500, 70);
      logInfo(`categoryAfterTap(current=500, index=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0050 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0051
     * @tc.name      SearchComponent_CategoryAfterTap_0051
     * @tc.desc      categoryAfterTap(current=500, index=75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0051 begin`);
      const actual: string = categoryAfterTap(500, 75);
      logInfo(`categoryAfterTap(current=500, index=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0051 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0052
     * @tc.name      SearchComponent_CategoryAfterTap_0052
     * @tc.desc      categoryAfterTap(current=500, index=80) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0052 begin`);
      const actual: string = categoryAfterTap(500, 80);
      logInfo(`categoryAfterTap(current=500, index=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0052 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0053
     * @tc.name      SearchComponent_CategoryAfterTap_0053
     * @tc.desc      categoryAfterTap(current=500, index=85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0053 begin`);
      const actual: string = categoryAfterTap(500, 85);
      logInfo(`categoryAfterTap(current=500, index=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0053 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0054
     * @tc.name      SearchComponent_CategoryAfterTap_0054
     * @tc.desc      categoryAfterTap(current=500, index=90) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0054 begin`);
      const actual: string = categoryAfterTap(500, 90);
      logInfo(`categoryAfterTap(current=500, index=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0054 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0055
     * @tc.name      SearchComponent_CategoryAfterTap_0055
     * @tc.desc      categoryAfterTap(current=500, index=95) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0055 begin`);
      const actual: string = categoryAfterTap(500, 95);
      logInfo(`categoryAfterTap(current=500, index=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0055 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0056
     * @tc.name      SearchComponent_CategoryAfterTap_0056
     * @tc.desc      categoryAfterTap(current=500, index=105) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0056 begin`);
      const actual: string = categoryAfterTap(500, 105);
      logInfo(`categoryAfterTap(current=500, index=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0056 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0057
     * @tc.name      SearchComponent_CategoryAfterTap_0057
     * @tc.desc      categoryAfterTap(current=500, index=110) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0057 begin`);
      const actual: string = categoryAfterTap(500, 110);
      logInfo(`categoryAfterTap(current=500, index=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0057 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0058
     * @tc.name      SearchComponent_CategoryAfterTap_0058
     * @tc.desc      categoryAfterTap(current=500, index=-62) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_CategoryAfterTap_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0058 begin`);
      const actual: string = categoryAfterTap(500, -62);
      logInfo(`categoryAfterTap(current=500, index=-62): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0058 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0059
     * @tc.name      SearchComponent_CategoryAfterTap_0059
     * @tc.desc      categoryAfterTap(current=500, index=-34) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_CategoryAfterTap_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0059 begin`);
      const actual: string = categoryAfterTap(500, -34);
      logInfo(`categoryAfterTap(current=500, index=-34): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0059 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0060
     * @tc.name      SearchComponent_CategoryAfterTap_0060
     * @tc.desc      categoryAfterTap(current=500, index=150) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0060 begin`);
      const actual: string = categoryAfterTap(500, 150);
      logInfo(`categoryAfterTap(current=500, index=150): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0060 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0061
     * @tc.name      SearchComponent_CategoryAfterTap_0061
     * @tc.desc      categoryAfterTap(current=-1, index=0) returns "UI??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0061 begin`);
      const actual: string = categoryAfterTap(-1, 0);
      logInfo(`categoryAfterTap(current=-1, index=0): actual=${actual}`);
      expect(actual).assertEqual('UI\u5e03\u5c40');
      logInfo(`${BUNDLE}CategoryAfterTap_0061 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0062
     * @tc.name      SearchComponent_CategoryAfterTap_0062
     * @tc.desc      categoryAfterTap(current=-1, index=1) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0062 begin`);
      const actual: string = categoryAfterTap(-1, 1);
      logInfo(`categoryAfterTap(current=-1, index=1): actual=${actual}`);
      expect(actual).assertEqual('\u52a8\u6548');
      logInfo(`${BUNDLE}CategoryAfterTap_0062 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0063
     * @tc.name      SearchComponent_CategoryAfterTap_0063
     * @tc.desc      categoryAfterTap(current=-1, index=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0063 begin`);
      const actual: string = categoryAfterTap(-1, -1);
      logInfo(`categoryAfterTap(current=-1, index=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0063 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0064
     * @tc.name      SearchComponent_CategoryAfterTap_0064
     * @tc.desc      categoryAfterTap(current=-1, index=2) returns "???"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0064 begin`);
      const actual: string = categoryAfterTap(-1, 2);
      logInfo(`categoryAfterTap(current=-1, index=2): actual=${actual}`);
      expect(actual).assertEqual('\u4e09\u65b9\u5e93');
      logInfo(`${BUNDLE}CategoryAfterTap_0064 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0065
     * @tc.name      SearchComponent_CategoryAfterTap_0065
     * @tc.desc      categoryAfterTap(current=-1, index=5) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0065 begin`);
      const actual: string = categoryAfterTap(-1, 5);
      logInfo(`categoryAfterTap(current=-1, index=5): actual=${actual}`);
      expect(actual).assertEqual('\u5176\u4ed6');
      logInfo(`${BUNDLE}CategoryAfterTap_0065 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0066
     * @tc.name      SearchComponent_CategoryAfterTap_0066
     * @tc.desc      categoryAfterTap(current=-1, index=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0066 begin`);
      const actual: string = categoryAfterTap(-1, 10);
      logInfo(`categoryAfterTap(current=-1, index=10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0066 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0067
     * @tc.name      SearchComponent_CategoryAfterTap_0067
     * @tc.desc      categoryAfterTap(current=-1, index=3) returns "Native"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0067 begin`);
      const actual: string = categoryAfterTap(-1, 3);
      logInfo(`categoryAfterTap(current=-1, index=3): actual=${actual}`);
      expect(actual).assertEqual('Native');
      logInfo(`${BUNDLE}CategoryAfterTap_0067 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0068
     * @tc.name      SearchComponent_CategoryAfterTap_0068
     * @tc.desc      categoryAfterTap(current=-1, index=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0068 begin`);
      const actual: string = categoryAfterTap(-1, 100);
      logInfo(`categoryAfterTap(current=-1, index=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0068 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0069
     * @tc.name      SearchComponent_CategoryAfterTap_0069
     * @tc.desc      categoryAfterTap(current=-1, index=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0069 begin`);
      const actual: string = categoryAfterTap(-1, 15);
      logInfo(`categoryAfterTap(current=-1, index=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0069 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0070
     * @tc.name      SearchComponent_CategoryAfterTap_0070
     * @tc.desc      categoryAfterTap(current=-1, index=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0070 begin`);
      const actual: string = categoryAfterTap(-1, 20);
      logInfo(`categoryAfterTap(current=-1, index=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0070 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0071
     * @tc.name      SearchComponent_CategoryAfterTap_0071
     * @tc.desc      categoryAfterTap(current=-1, index=25) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0071 begin`);
      const actual: string = categoryAfterTap(-1, 25);
      logInfo(`categoryAfterTap(current=-1, index=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0071 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0072
     * @tc.name      SearchComponent_CategoryAfterTap_0072
     * @tc.desc      categoryAfterTap(current=-1, index=30) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0072 begin`);
      const actual: string = categoryAfterTap(-1, 30);
      logInfo(`categoryAfterTap(current=-1, index=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0072 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0073
     * @tc.name      SearchComponent_CategoryAfterTap_0073
     * @tc.desc      categoryAfterTap(current=-1, index=35) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0073 begin`);
      const actual: string = categoryAfterTap(-1, 35);
      logInfo(`categoryAfterTap(current=-1, index=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0073 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0074
     * @tc.name      SearchComponent_CategoryAfterTap_0074
     * @tc.desc      categoryAfterTap(current=-1, index=40) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0074 begin`);
      const actual: string = categoryAfterTap(-1, 40);
      logInfo(`categoryAfterTap(current=-1, index=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0074 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0075
     * @tc.name      SearchComponent_CategoryAfterTap_0075
     * @tc.desc      categoryAfterTap(current=-1, index=45) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0075 begin`);
      const actual: string = categoryAfterTap(-1, 45);
      logInfo(`categoryAfterTap(current=-1, index=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0075 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0076
     * @tc.name      SearchComponent_CategoryAfterTap_0076
     * @tc.desc      categoryAfterTap(current=-1, index=50) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0076 begin`);
      const actual: string = categoryAfterTap(-1, 50);
      logInfo(`categoryAfterTap(current=-1, index=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0076 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0077
     * @tc.name      SearchComponent_CategoryAfterTap_0077
     * @tc.desc      categoryAfterTap(current=-1, index=55) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0077 begin`);
      const actual: string = categoryAfterTap(-1, 55);
      logInfo(`categoryAfterTap(current=-1, index=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0077 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0078
     * @tc.name      SearchComponent_CategoryAfterTap_0078
     * @tc.desc      categoryAfterTap(current=-1, index=60) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0078 begin`);
      const actual: string = categoryAfterTap(-1, 60);
      logInfo(`categoryAfterTap(current=-1, index=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0078 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0079
     * @tc.name      SearchComponent_CategoryAfterTap_0079
     * @tc.desc      categoryAfterTap(current=-1, index=65) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0079 begin`);
      const actual: string = categoryAfterTap(-1, 65);
      logInfo(`categoryAfterTap(current=-1, index=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0079 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0080
     * @tc.name      SearchComponent_CategoryAfterTap_0080
     * @tc.desc      categoryAfterTap(current=-1, index=70) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0080 begin`);
      const actual: string = categoryAfterTap(-1, 70);
      logInfo(`categoryAfterTap(current=-1, index=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0080 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0081
     * @tc.name      SearchComponent_CategoryAfterTap_0081
     * @tc.desc      categoryAfterTap(current=-1, index=75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0081 begin`);
      const actual: string = categoryAfterTap(-1, 75);
      logInfo(`categoryAfterTap(current=-1, index=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0081 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0082
     * @tc.name      SearchComponent_CategoryAfterTap_0082
     * @tc.desc      categoryAfterTap(current=-1, index=80) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0082 begin`);
      const actual: string = categoryAfterTap(-1, 80);
      logInfo(`categoryAfterTap(current=-1, index=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0082 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0083
     * @tc.name      SearchComponent_CategoryAfterTap_0083
     * @tc.desc      categoryAfterTap(current=-1, index=85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0083 begin`);
      const actual: string = categoryAfterTap(-1, 85);
      logInfo(`categoryAfterTap(current=-1, index=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0083 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0084
     * @tc.name      SearchComponent_CategoryAfterTap_0084
     * @tc.desc      categoryAfterTap(current=-1, index=90) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0084 begin`);
      const actual: string = categoryAfterTap(-1, 90);
      logInfo(`categoryAfterTap(current=-1, index=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0084 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0085
     * @tc.name      SearchComponent_CategoryAfterTap_0085
     * @tc.desc      categoryAfterTap(current=-1, index=95) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0085 begin`);
      const actual: string = categoryAfterTap(-1, 95);
      logInfo(`categoryAfterTap(current=-1, index=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0085 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0086
     * @tc.name      SearchComponent_CategoryAfterTap_0086
     * @tc.desc      categoryAfterTap(current=-1, index=105) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0086 begin`);
      const actual: string = categoryAfterTap(-1, 105);
      logInfo(`categoryAfterTap(current=-1, index=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0086 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0087
     * @tc.name      SearchComponent_CategoryAfterTap_0087
     * @tc.desc      categoryAfterTap(current=-1, index=110) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0087 begin`);
      const actual: string = categoryAfterTap(-1, 110);
      logInfo(`categoryAfterTap(current=-1, index=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0087 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0088
     * @tc.name      SearchComponent_CategoryAfterTap_0088
     * @tc.desc      categoryAfterTap(current=-1, index=-62) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_CategoryAfterTap_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0088 begin`);
      const actual: string = categoryAfterTap(-1, -62);
      logInfo(`categoryAfterTap(current=-1, index=-62): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0088 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0089
     * @tc.name      SearchComponent_CategoryAfterTap_0089
     * @tc.desc      categoryAfterTap(current=-1, index=-34) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_CategoryAfterTap_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0089 begin`);
      const actual: string = categoryAfterTap(-1, -34);
      logInfo(`categoryAfterTap(current=-1, index=-34): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0089 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0090
     * @tc.name      SearchComponent_CategoryAfterTap_0090
     * @tc.desc      categoryAfterTap(current=-1, index=150) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0090 begin`);
      const actual: string = categoryAfterTap(-1, 150);
      logInfo(`categoryAfterTap(current=-1, index=150): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0090 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0091
     * @tc.name      SearchComponent_CategoryAfterTap_0091
     * @tc.desc      categoryAfterTap(current=1, index=0) returns "UI??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0091 begin`);
      const actual: string = categoryAfterTap(1, 0);
      logInfo(`categoryAfterTap(current=1, index=0): actual=${actual}`);
      expect(actual).assertEqual('UI\u5e03\u5c40');
      logInfo(`${BUNDLE}CategoryAfterTap_0091 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0092
     * @tc.name      SearchComponent_CategoryAfterTap_0092
     * @tc.desc      categoryAfterTap(current=1, index=1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0092 begin`);
      const actual: string = categoryAfterTap(1, 1);
      logInfo(`categoryAfterTap(current=1, index=1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0092 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0093
     * @tc.name      SearchComponent_CategoryAfterTap_0093
     * @tc.desc      categoryAfterTap(current=1, index=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0093 begin`);
      const actual: string = categoryAfterTap(1, -1);
      logInfo(`categoryAfterTap(current=1, index=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0093 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0094
     * @tc.name      SearchComponent_CategoryAfterTap_0094
     * @tc.desc      categoryAfterTap(current=1, index=2) returns "???"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0094 begin`);
      const actual: string = categoryAfterTap(1, 2);
      logInfo(`categoryAfterTap(current=1, index=2): actual=${actual}`);
      expect(actual).assertEqual('\u4e09\u65b9\u5e93');
      logInfo(`${BUNDLE}CategoryAfterTap_0094 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0095
     * @tc.name      SearchComponent_CategoryAfterTap_0095
     * @tc.desc      categoryAfterTap(current=1, index=5) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0095 begin`);
      const actual: string = categoryAfterTap(1, 5);
      logInfo(`categoryAfterTap(current=1, index=5): actual=${actual}`);
      expect(actual).assertEqual('\u5176\u4ed6');
      logInfo(`${BUNDLE}CategoryAfterTap_0095 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0096
     * @tc.name      SearchComponent_CategoryAfterTap_0096
     * @tc.desc      categoryAfterTap(current=1, index=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0096 begin`);
      const actual: string = categoryAfterTap(1, 10);
      logInfo(`categoryAfterTap(current=1, index=10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0096 end`);
    });
  });
}
