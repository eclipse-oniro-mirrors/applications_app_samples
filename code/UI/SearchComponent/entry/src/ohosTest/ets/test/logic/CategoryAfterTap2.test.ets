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

/** Logic checks for categoryAfterTap (54 cases). */
export default function categoryAfterTap2Test(): void {
  describe('CategoryAfterTap2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0097
     * @tc.name      SearchComponent_CategoryAfterTap_0097
     * @tc.desc      categoryAfterTap(current=1, index=3) returns "Native"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0097 begin`);
      const actual: string = categoryAfterTap(1, 3);
      logInfo(`categoryAfterTap(current=1, index=3): actual=${actual}`);
      expect(actual).assertEqual('Native');
      logInfo(`${BUNDLE}CategoryAfterTap_0097 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0098
     * @tc.name      SearchComponent_CategoryAfterTap_0098
     * @tc.desc      categoryAfterTap(current=1, index=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0098 begin`);
      const actual: string = categoryAfterTap(1, 100);
      logInfo(`categoryAfterTap(current=1, index=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0098 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0099
     * @tc.name      SearchComponent_CategoryAfterTap_0099
     * @tc.desc      categoryAfterTap(current=1, index=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0099 begin`);
      const actual: string = categoryAfterTap(1, 15);
      logInfo(`categoryAfterTap(current=1, index=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0099 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0100
     * @tc.name      SearchComponent_CategoryAfterTap_0100
     * @tc.desc      categoryAfterTap(current=1, index=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0100 begin`);
      const actual: string = categoryAfterTap(1, 20);
      logInfo(`categoryAfterTap(current=1, index=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0100 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0101
     * @tc.name      SearchComponent_CategoryAfterTap_0101
     * @tc.desc      categoryAfterTap(current=1, index=25) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0101 begin`);
      const actual: string = categoryAfterTap(1, 25);
      logInfo(`categoryAfterTap(current=1, index=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0101 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0102
     * @tc.name      SearchComponent_CategoryAfterTap_0102
     * @tc.desc      categoryAfterTap(current=1, index=30) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0102 begin`);
      const actual: string = categoryAfterTap(1, 30);
      logInfo(`categoryAfterTap(current=1, index=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0102 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0103
     * @tc.name      SearchComponent_CategoryAfterTap_0103
     * @tc.desc      categoryAfterTap(current=1, index=35) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0103 begin`);
      const actual: string = categoryAfterTap(1, 35);
      logInfo(`categoryAfterTap(current=1, index=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0103 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0104
     * @tc.name      SearchComponent_CategoryAfterTap_0104
     * @tc.desc      categoryAfterTap(current=1, index=40) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0104 begin`);
      const actual: string = categoryAfterTap(1, 40);
      logInfo(`categoryAfterTap(current=1, index=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0104 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0105
     * @tc.name      SearchComponent_CategoryAfterTap_0105
     * @tc.desc      categoryAfterTap(current=1, index=45) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0105 begin`);
      const actual: string = categoryAfterTap(1, 45);
      logInfo(`categoryAfterTap(current=1, index=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0105 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0106
     * @tc.name      SearchComponent_CategoryAfterTap_0106
     * @tc.desc      categoryAfterTap(current=1, index=50) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0106 begin`);
      const actual: string = categoryAfterTap(1, 50);
      logInfo(`categoryAfterTap(current=1, index=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0106 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0107
     * @tc.name      SearchComponent_CategoryAfterTap_0107
     * @tc.desc      categoryAfterTap(current=1, index=55) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0107 begin`);
      const actual: string = categoryAfterTap(1, 55);
      logInfo(`categoryAfterTap(current=1, index=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0107 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0108
     * @tc.name      SearchComponent_CategoryAfterTap_0108
     * @tc.desc      categoryAfterTap(current=1, index=60) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0108 begin`);
      const actual: string = categoryAfterTap(1, 60);
      logInfo(`categoryAfterTap(current=1, index=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0108 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0109
     * @tc.name      SearchComponent_CategoryAfterTap_0109
     * @tc.desc      categoryAfterTap(current=1, index=65) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0109 begin`);
      const actual: string = categoryAfterTap(1, 65);
      logInfo(`categoryAfterTap(current=1, index=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0109 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0110
     * @tc.name      SearchComponent_CategoryAfterTap_0110
     * @tc.desc      categoryAfterTap(current=1, index=70) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0110 begin`);
      const actual: string = categoryAfterTap(1, 70);
      logInfo(`categoryAfterTap(current=1, index=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0110 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0111
     * @tc.name      SearchComponent_CategoryAfterTap_0111
     * @tc.desc      categoryAfterTap(current=1, index=75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0111 begin`);
      const actual: string = categoryAfterTap(1, 75);
      logInfo(`categoryAfterTap(current=1, index=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0111 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0112
     * @tc.name      SearchComponent_CategoryAfterTap_0112
     * @tc.desc      categoryAfterTap(current=1, index=80) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0112 begin`);
      const actual: string = categoryAfterTap(1, 80);
      logInfo(`categoryAfterTap(current=1, index=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0112 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0113
     * @tc.name      SearchComponent_CategoryAfterTap_0113
     * @tc.desc      categoryAfterTap(current=1, index=85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0113 begin`);
      const actual: string = categoryAfterTap(1, 85);
      logInfo(`categoryAfterTap(current=1, index=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0113 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0114
     * @tc.name      SearchComponent_CategoryAfterTap_0114
     * @tc.desc      categoryAfterTap(current=1, index=90) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0114 begin`);
      const actual: string = categoryAfterTap(1, 90);
      logInfo(`categoryAfterTap(current=1, index=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0114 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0115
     * @tc.name      SearchComponent_CategoryAfterTap_0115
     * @tc.desc      categoryAfterTap(current=1, index=95) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0115 begin`);
      const actual: string = categoryAfterTap(1, 95);
      logInfo(`categoryAfterTap(current=1, index=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0115 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0116
     * @tc.name      SearchComponent_CategoryAfterTap_0116
     * @tc.desc      categoryAfterTap(current=1, index=105) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0116 begin`);
      const actual: string = categoryAfterTap(1, 105);
      logInfo(`categoryAfterTap(current=1, index=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0116 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0117
     * @tc.name      SearchComponent_CategoryAfterTap_0117
     * @tc.desc      categoryAfterTap(current=1, index=110) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0117 begin`);
      const actual: string = categoryAfterTap(1, 110);
      logInfo(`categoryAfterTap(current=1, index=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0117 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0118
     * @tc.name      SearchComponent_CategoryAfterTap_0118
     * @tc.desc      categoryAfterTap(current=1, index=-62) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_CategoryAfterTap_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0118 begin`);
      const actual: string = categoryAfterTap(1, -62);
      logInfo(`categoryAfterTap(current=1, index=-62): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0118 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0119
     * @tc.name      SearchComponent_CategoryAfterTap_0119
     * @tc.desc      categoryAfterTap(current=1, index=-34) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_CategoryAfterTap_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0119 begin`);
      const actual: string = categoryAfterTap(1, -34);
      logInfo(`categoryAfterTap(current=1, index=-34): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0119 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0120
     * @tc.name      SearchComponent_CategoryAfterTap_0120
     * @tc.desc      categoryAfterTap(current=1, index=150) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0120 begin`);
      const actual: string = categoryAfterTap(1, 150);
      logInfo(`categoryAfterTap(current=1, index=150): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0120 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0121
     * @tc.name      SearchComponent_CategoryAfterTap_0121
     * @tc.desc      categoryAfterTap(current=999, index=0) returns "UI??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0121 begin`);
      const actual: string = categoryAfterTap(999, 0);
      logInfo(`categoryAfterTap(current=999, index=0): actual=${actual}`);
      expect(actual).assertEqual('UI\u5e03\u5c40');
      logInfo(`${BUNDLE}CategoryAfterTap_0121 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0122
     * @tc.name      SearchComponent_CategoryAfterTap_0122
     * @tc.desc      categoryAfterTap(current=999, index=1) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0122 begin`);
      const actual: string = categoryAfterTap(999, 1);
      logInfo(`categoryAfterTap(current=999, index=1): actual=${actual}`);
      expect(actual).assertEqual('\u52a8\u6548');
      logInfo(`${BUNDLE}CategoryAfterTap_0122 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0123
     * @tc.name      SearchComponent_CategoryAfterTap_0123
     * @tc.desc      categoryAfterTap(current=999, index=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_CategoryAfterTap_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0123 begin`);
      const actual: string = categoryAfterTap(999, -1);
      logInfo(`categoryAfterTap(current=999, index=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0123 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0124
     * @tc.name      SearchComponent_CategoryAfterTap_0124
     * @tc.desc      categoryAfterTap(current=999, index=2) returns "???"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0124 begin`);
      const actual: string = categoryAfterTap(999, 2);
      logInfo(`categoryAfterTap(current=999, index=2): actual=${actual}`);
      expect(actual).assertEqual('\u4e09\u65b9\u5e93');
      logInfo(`${BUNDLE}CategoryAfterTap_0124 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0125
     * @tc.name      SearchComponent_CategoryAfterTap_0125
     * @tc.desc      categoryAfterTap(current=999, index=5) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0125 begin`);
      const actual: string = categoryAfterTap(999, 5);
      logInfo(`categoryAfterTap(current=999, index=5): actual=${actual}`);
      expect(actual).assertEqual('\u5176\u4ed6');
      logInfo(`${BUNDLE}CategoryAfterTap_0125 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0126
     * @tc.name      SearchComponent_CategoryAfterTap_0126
     * @tc.desc      categoryAfterTap(current=999, index=10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0126 begin`);
      const actual: string = categoryAfterTap(999, 10);
      logInfo(`categoryAfterTap(current=999, index=10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0126 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0127
     * @tc.name      SearchComponent_CategoryAfterTap_0127
     * @tc.desc      categoryAfterTap(current=999, index=3) returns "Native"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0127 begin`);
      const actual: string = categoryAfterTap(999, 3);
      logInfo(`categoryAfterTap(current=999, index=3): actual=${actual}`);
      expect(actual).assertEqual('Native');
      logInfo(`${BUNDLE}CategoryAfterTap_0127 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0128
     * @tc.name      SearchComponent_CategoryAfterTap_0128
     * @tc.desc      categoryAfterTap(current=999, index=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0128 begin`);
      const actual: string = categoryAfterTap(999, 100);
      logInfo(`categoryAfterTap(current=999, index=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0128 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0129
     * @tc.name      SearchComponent_CategoryAfterTap_0129
     * @tc.desc      categoryAfterTap(current=999, index=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0129 begin`);
      const actual: string = categoryAfterTap(999, 15);
      logInfo(`categoryAfterTap(current=999, index=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0129 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0130
     * @tc.name      SearchComponent_CategoryAfterTap_0130
     * @tc.desc      categoryAfterTap(current=999, index=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0130 begin`);
      const actual: string = categoryAfterTap(999, 20);
      logInfo(`categoryAfterTap(current=999, index=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0130 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0131
     * @tc.name      SearchComponent_CategoryAfterTap_0131
     * @tc.desc      categoryAfterTap(current=999, index=25) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0131 begin`);
      const actual: string = categoryAfterTap(999, 25);
      logInfo(`categoryAfterTap(current=999, index=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0131 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0132
     * @tc.name      SearchComponent_CategoryAfterTap_0132
     * @tc.desc      categoryAfterTap(current=999, index=30) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0132 begin`);
      const actual: string = categoryAfterTap(999, 30);
      logInfo(`categoryAfterTap(current=999, index=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0132 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0133
     * @tc.name      SearchComponent_CategoryAfterTap_0133
     * @tc.desc      categoryAfterTap(current=999, index=35) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0133 begin`);
      const actual: string = categoryAfterTap(999, 35);
      logInfo(`categoryAfterTap(current=999, index=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0133 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0134
     * @tc.name      SearchComponent_CategoryAfterTap_0134
     * @tc.desc      categoryAfterTap(current=999, index=40) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0134 begin`);
      const actual: string = categoryAfterTap(999, 40);
      logInfo(`categoryAfterTap(current=999, index=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0134 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0135
     * @tc.name      SearchComponent_CategoryAfterTap_0135
     * @tc.desc      categoryAfterTap(current=999, index=45) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0135 begin`);
      const actual: string = categoryAfterTap(999, 45);
      logInfo(`categoryAfterTap(current=999, index=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0135 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0136
     * @tc.name      SearchComponent_CategoryAfterTap_0136
     * @tc.desc      categoryAfterTap(current=999, index=50) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0136 begin`);
      const actual: string = categoryAfterTap(999, 50);
      logInfo(`categoryAfterTap(current=999, index=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0136 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0137
     * @tc.name      SearchComponent_CategoryAfterTap_0137
     * @tc.desc      categoryAfterTap(current=999, index=55) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0137 begin`);
      const actual: string = categoryAfterTap(999, 55);
      logInfo(`categoryAfterTap(current=999, index=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0137 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0138
     * @tc.name      SearchComponent_CategoryAfterTap_0138
     * @tc.desc      categoryAfterTap(current=999, index=60) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0138 begin`);
      const actual: string = categoryAfterTap(999, 60);
      logInfo(`categoryAfterTap(current=999, index=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0138 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0139
     * @tc.name      SearchComponent_CategoryAfterTap_0139
     * @tc.desc      categoryAfterTap(current=999, index=65) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0139 begin`);
      const actual: string = categoryAfterTap(999, 65);
      logInfo(`categoryAfterTap(current=999, index=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0139 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0140
     * @tc.name      SearchComponent_CategoryAfterTap_0140
     * @tc.desc      categoryAfterTap(current=999, index=70) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0140 begin`);
      const actual: string = categoryAfterTap(999, 70);
      logInfo(`categoryAfterTap(current=999, index=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0140 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0141
     * @tc.name      SearchComponent_CategoryAfterTap_0141
     * @tc.desc      categoryAfterTap(current=999, index=75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0141 begin`);
      const actual: string = categoryAfterTap(999, 75);
      logInfo(`categoryAfterTap(current=999, index=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0141 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0142
     * @tc.name      SearchComponent_CategoryAfterTap_0142
     * @tc.desc      categoryAfterTap(current=999, index=80) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0142 begin`);
      const actual: string = categoryAfterTap(999, 80);
      logInfo(`categoryAfterTap(current=999, index=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0142 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0143
     * @tc.name      SearchComponent_CategoryAfterTap_0143
     * @tc.desc      categoryAfterTap(current=999, index=85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0143 begin`);
      const actual: string = categoryAfterTap(999, 85);
      logInfo(`categoryAfterTap(current=999, index=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0143 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0144
     * @tc.name      SearchComponent_CategoryAfterTap_0144
     * @tc.desc      categoryAfterTap(current=999, index=90) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0144 begin`);
      const actual: string = categoryAfterTap(999, 90);
      logInfo(`categoryAfterTap(current=999, index=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0144 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0145
     * @tc.name      SearchComponent_CategoryAfterTap_0145
     * @tc.desc      categoryAfterTap(current=999, index=95) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0145 begin`);
      const actual: string = categoryAfterTap(999, 95);
      logInfo(`categoryAfterTap(current=999, index=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0145 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0146
     * @tc.name      SearchComponent_CategoryAfterTap_0146
     * @tc.desc      categoryAfterTap(current=999, index=105) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0146 begin`);
      const actual: string = categoryAfterTap(999, 105);
      logInfo(`categoryAfterTap(current=999, index=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0146 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0147
     * @tc.name      SearchComponent_CategoryAfterTap_0147
     * @tc.desc      categoryAfterTap(current=999, index=110) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0147 begin`);
      const actual: string = categoryAfterTap(999, 110);
      logInfo(`categoryAfterTap(current=999, index=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0147 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0148
     * @tc.name      SearchComponent_CategoryAfterTap_0148
     * @tc.desc      categoryAfterTap(current=999, index=-62) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_CategoryAfterTap_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0148 begin`);
      const actual: string = categoryAfterTap(999, -62);
      logInfo(`categoryAfterTap(current=999, index=-62): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0148 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0149
     * @tc.name      SearchComponent_CategoryAfterTap_0149
     * @tc.desc      categoryAfterTap(current=999, index=-34) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_CategoryAfterTap_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0149 begin`);
      const actual: string = categoryAfterTap(999, -34);
      logInfo(`categoryAfterTap(current=999, index=-34): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0149 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_CATEGORY_AFTER_TAP_0150
     * @tc.name      SearchComponent_CategoryAfterTap_0150
     * @tc.desc      categoryAfterTap(current=999, index=150) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_CategoryAfterTap_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CategoryAfterTap_0150 begin`);
      const actual: string = categoryAfterTap(999, 150);
      logInfo(`categoryAfterTap(current=999, index=150): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}CategoryAfterTap_0150 end`);
    });
  });
}
