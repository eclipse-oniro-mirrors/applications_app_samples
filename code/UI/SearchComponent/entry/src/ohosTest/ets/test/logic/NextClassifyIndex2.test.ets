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
import { nextClassifyIndex } from '../model/SearchComponentLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SearchComponent]';
const BUNDLE: string = 'SearchComponent_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for nextClassifyIndex (96 cases). */
export default function nextClassifyIndex2Test(): void {
  describe('NextClassifyIndex2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0097
     * @tc.name      SearchComponent_NextClassifyIndex_0097
     * @tc.desc      nextClassifyIndex(current=-2, index=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0097 begin`);
      const actual: number = nextClassifyIndex(-2, 10);
      logInfo(`nextClassifyIndex(current=-2, index=10): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}NextClassifyIndex_0097 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0098
     * @tc.name      SearchComponent_NextClassifyIndex_0098
     * @tc.desc      nextClassifyIndex(current=-2, index=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0098 begin`);
      const actual: number = nextClassifyIndex(-2, 3);
      logInfo(`nextClassifyIndex(current=-2, index=3): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NextClassifyIndex_0098 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0099
     * @tc.name      SearchComponent_NextClassifyIndex_0099
     * @tc.desc      nextClassifyIndex(current=-2, index=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0099 begin`);
      const actual: number = nextClassifyIndex(-2, 100);
      logInfo(`nextClassifyIndex(current=-2, index=100): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}NextClassifyIndex_0099 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0100
     * @tc.name      SearchComponent_NextClassifyIndex_0100
     * @tc.desc      nextClassifyIndex(current=-2, index=15) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0100 begin`);
      const actual: number = nextClassifyIndex(-2, 15);
      logInfo(`nextClassifyIndex(current=-2, index=15): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}NextClassifyIndex_0100 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0101
     * @tc.name      SearchComponent_NextClassifyIndex_0101
     * @tc.desc      nextClassifyIndex(current=-2, index=20) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0101 begin`);
      const actual: number = nextClassifyIndex(-2, 20);
      logInfo(`nextClassifyIndex(current=-2, index=20): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}NextClassifyIndex_0101 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0102
     * @tc.name      SearchComponent_NextClassifyIndex_0102
     * @tc.desc      nextClassifyIndex(current=-2, index=25) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0102 begin`);
      const actual: number = nextClassifyIndex(-2, 25);
      logInfo(`nextClassifyIndex(current=-2, index=25): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}NextClassifyIndex_0102 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0103
     * @tc.name      SearchComponent_NextClassifyIndex_0103
     * @tc.desc      nextClassifyIndex(current=-2, index=30) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0103 begin`);
      const actual: number = nextClassifyIndex(-2, 30);
      logInfo(`nextClassifyIndex(current=-2, index=30): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}NextClassifyIndex_0103 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0104
     * @tc.name      SearchComponent_NextClassifyIndex_0104
     * @tc.desc      nextClassifyIndex(current=-2, index=35) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0104 begin`);
      const actual: number = nextClassifyIndex(-2, 35);
      logInfo(`nextClassifyIndex(current=-2, index=35): actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}NextClassifyIndex_0104 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0105
     * @tc.name      SearchComponent_NextClassifyIndex_0105
     * @tc.desc      nextClassifyIndex(current=-2, index=40) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0105 begin`);
      const actual: number = nextClassifyIndex(-2, 40);
      logInfo(`nextClassifyIndex(current=-2, index=40): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}NextClassifyIndex_0105 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0106
     * @tc.name      SearchComponent_NextClassifyIndex_0106
     * @tc.desc      nextClassifyIndex(current=-2, index=45) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0106 begin`);
      const actual: number = nextClassifyIndex(-2, 45);
      logInfo(`nextClassifyIndex(current=-2, index=45): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}NextClassifyIndex_0106 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0107
     * @tc.name      SearchComponent_NextClassifyIndex_0107
     * @tc.desc      nextClassifyIndex(current=-2, index=50) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0107 begin`);
      const actual: number = nextClassifyIndex(-2, 50);
      logInfo(`nextClassifyIndex(current=-2, index=50): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}NextClassifyIndex_0107 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0108
     * @tc.name      SearchComponent_NextClassifyIndex_0108
     * @tc.desc      nextClassifyIndex(current=-2, index=55) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0108 begin`);
      const actual: number = nextClassifyIndex(-2, 55);
      logInfo(`nextClassifyIndex(current=-2, index=55): actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}NextClassifyIndex_0108 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0109
     * @tc.name      SearchComponent_NextClassifyIndex_0109
     * @tc.desc      nextClassifyIndex(current=-2, index=60) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0109 begin`);
      const actual: number = nextClassifyIndex(-2, 60);
      logInfo(`nextClassifyIndex(current=-2, index=60): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}NextClassifyIndex_0109 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0110
     * @tc.name      SearchComponent_NextClassifyIndex_0110
     * @tc.desc      nextClassifyIndex(current=-2, index=65) returns 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0110 begin`);
      const actual: number = nextClassifyIndex(-2, 65);
      logInfo(`nextClassifyIndex(current=-2, index=65): actual=${actual}`);
      expect(actual).assertEqual(65);
      logInfo(`${BUNDLE}NextClassifyIndex_0110 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0111
     * @tc.name      SearchComponent_NextClassifyIndex_0111
     * @tc.desc      nextClassifyIndex(current=-2, index=70) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0111 begin`);
      const actual: number = nextClassifyIndex(-2, 70);
      logInfo(`nextClassifyIndex(current=-2, index=70): actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}NextClassifyIndex_0111 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0112
     * @tc.name      SearchComponent_NextClassifyIndex_0112
     * @tc.desc      nextClassifyIndex(current=-2, index=75) returns 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0112 begin`);
      const actual: number = nextClassifyIndex(-2, 75);
      logInfo(`nextClassifyIndex(current=-2, index=75): actual=${actual}`);
      expect(actual).assertEqual(75);
      logInfo(`${BUNDLE}NextClassifyIndex_0112 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0113
     * @tc.name      SearchComponent_NextClassifyIndex_0113
     * @tc.desc      nextClassifyIndex(current=-2, index=80) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0113 begin`);
      const actual: number = nextClassifyIndex(-2, 80);
      logInfo(`nextClassifyIndex(current=-2, index=80): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}NextClassifyIndex_0113 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0114
     * @tc.name      SearchComponent_NextClassifyIndex_0114
     * @tc.desc      nextClassifyIndex(current=-2, index=85) returns 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0114 begin`);
      const actual: number = nextClassifyIndex(-2, 85);
      logInfo(`nextClassifyIndex(current=-2, index=85): actual=${actual}`);
      expect(actual).assertEqual(85);
      logInfo(`${BUNDLE}NextClassifyIndex_0114 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0115
     * @tc.name      SearchComponent_NextClassifyIndex_0115
     * @tc.desc      nextClassifyIndex(current=-2, index=90) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0115 begin`);
      const actual: number = nextClassifyIndex(-2, 90);
      logInfo(`nextClassifyIndex(current=-2, index=90): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}NextClassifyIndex_0115 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0116
     * @tc.name      SearchComponent_NextClassifyIndex_0116
     * @tc.desc      nextClassifyIndex(current=-2, index=95) returns 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0116 begin`);
      const actual: number = nextClassifyIndex(-2, 95);
      logInfo(`nextClassifyIndex(current=-2, index=95): actual=${actual}`);
      expect(actual).assertEqual(95);
      logInfo(`${BUNDLE}NextClassifyIndex_0116 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0117
     * @tc.name      SearchComponent_NextClassifyIndex_0117
     * @tc.desc      nextClassifyIndex(current=-2, index=105) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0117 begin`);
      const actual: number = nextClassifyIndex(-2, 105);
      logInfo(`nextClassifyIndex(current=-2, index=105): actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}NextClassifyIndex_0117 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0118
     * @tc.name      SearchComponent_NextClassifyIndex_0118
     * @tc.desc      nextClassifyIndex(current=-2, index=-45) returns -45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_NextClassifyIndex_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0118 begin`);
      const actual: number = nextClassifyIndex(-2, -45);
      logInfo(`nextClassifyIndex(current=-2, index=-45): actual=${actual}`);
      expect(actual).assertEqual(-45);
      logInfo(`${BUNDLE}NextClassifyIndex_0118 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0119
     * @tc.name      SearchComponent_NextClassifyIndex_0119
     * @tc.desc      nextClassifyIndex(current=-2, index=-77) returns -77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_NextClassifyIndex_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0119 begin`);
      const actual: number = nextClassifyIndex(-2, -77);
      logInfo(`nextClassifyIndex(current=-2, index=-77): actual=${actual}`);
      expect(actual).assertEqual(-77);
      logInfo(`${BUNDLE}NextClassifyIndex_0119 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0120
     * @tc.name      SearchComponent_NextClassifyIndex_0120
     * @tc.desc      nextClassifyIndex(current=-2, index=109) returns 109
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0120 begin`);
      const actual: number = nextClassifyIndex(-2, 109);
      logInfo(`nextClassifyIndex(current=-2, index=109): actual=${actual}`);
      expect(actual).assertEqual(109);
      logInfo(`${BUNDLE}NextClassifyIndex_0120 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0121
     * @tc.name      SearchComponent_NextClassifyIndex_0121
     * @tc.desc      nextClassifyIndex(current=999, index=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0121 begin`);
      const actual: number = nextClassifyIndex(999, 0);
      logInfo(`nextClassifyIndex(current=999, index=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NextClassifyIndex_0121 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0122
     * @tc.name      SearchComponent_NextClassifyIndex_0122
     * @tc.desc      nextClassifyIndex(current=999, index=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0122 begin`);
      const actual: number = nextClassifyIndex(999, 1);
      logInfo(`nextClassifyIndex(current=999, index=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextClassifyIndex_0122 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0123
     * @tc.name      SearchComponent_NextClassifyIndex_0123
     * @tc.desc      nextClassifyIndex(current=999, index=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0123 begin`);
      const actual: number = nextClassifyIndex(999, -1);
      logInfo(`nextClassifyIndex(current=999, index=-1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NextClassifyIndex_0123 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0124
     * @tc.name      SearchComponent_NextClassifyIndex_0124
     * @tc.desc      nextClassifyIndex(current=999, index=-2) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0124 begin`);
      const actual: number = nextClassifyIndex(999, -2);
      logInfo(`nextClassifyIndex(current=999, index=-2): actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}NextClassifyIndex_0124 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0125
     * @tc.name      SearchComponent_NextClassifyIndex_0125
     * @tc.desc      nextClassifyIndex(current=999, index=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0125 begin`);
      const actual: number = nextClassifyIndex(999, 2);
      logInfo(`nextClassifyIndex(current=999, index=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NextClassifyIndex_0125 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0126
     * @tc.name      SearchComponent_NextClassifyIndex_0126
     * @tc.desc      nextClassifyIndex(current=999, index=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0126 begin`);
      const actual: number = nextClassifyIndex(999, 5);
      logInfo(`nextClassifyIndex(current=999, index=5): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}NextClassifyIndex_0126 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0127
     * @tc.name      SearchComponent_NextClassifyIndex_0127
     * @tc.desc      nextClassifyIndex(current=999, index=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0127 begin`);
      const actual: number = nextClassifyIndex(999, 10);
      logInfo(`nextClassifyIndex(current=999, index=10): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}NextClassifyIndex_0127 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0128
     * @tc.name      SearchComponent_NextClassifyIndex_0128
     * @tc.desc      nextClassifyIndex(current=999, index=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0128 begin`);
      const actual: number = nextClassifyIndex(999, 3);
      logInfo(`nextClassifyIndex(current=999, index=3): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NextClassifyIndex_0128 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0129
     * @tc.name      SearchComponent_NextClassifyIndex_0129
     * @tc.desc      nextClassifyIndex(current=999, index=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0129 begin`);
      const actual: number = nextClassifyIndex(999, 100);
      logInfo(`nextClassifyIndex(current=999, index=100): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}NextClassifyIndex_0129 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0130
     * @tc.name      SearchComponent_NextClassifyIndex_0130
     * @tc.desc      nextClassifyIndex(current=999, index=15) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0130 begin`);
      const actual: number = nextClassifyIndex(999, 15);
      logInfo(`nextClassifyIndex(current=999, index=15): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}NextClassifyIndex_0130 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0131
     * @tc.name      SearchComponent_NextClassifyIndex_0131
     * @tc.desc      nextClassifyIndex(current=999, index=20) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0131 begin`);
      const actual: number = nextClassifyIndex(999, 20);
      logInfo(`nextClassifyIndex(current=999, index=20): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}NextClassifyIndex_0131 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0132
     * @tc.name      SearchComponent_NextClassifyIndex_0132
     * @tc.desc      nextClassifyIndex(current=999, index=25) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0132 begin`);
      const actual: number = nextClassifyIndex(999, 25);
      logInfo(`nextClassifyIndex(current=999, index=25): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}NextClassifyIndex_0132 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0133
     * @tc.name      SearchComponent_NextClassifyIndex_0133
     * @tc.desc      nextClassifyIndex(current=999, index=30) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0133 begin`);
      const actual: number = nextClassifyIndex(999, 30);
      logInfo(`nextClassifyIndex(current=999, index=30): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}NextClassifyIndex_0133 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0134
     * @tc.name      SearchComponent_NextClassifyIndex_0134
     * @tc.desc      nextClassifyIndex(current=999, index=35) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0134 begin`);
      const actual: number = nextClassifyIndex(999, 35);
      logInfo(`nextClassifyIndex(current=999, index=35): actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}NextClassifyIndex_0134 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0135
     * @tc.name      SearchComponent_NextClassifyIndex_0135
     * @tc.desc      nextClassifyIndex(current=999, index=40) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0135 begin`);
      const actual: number = nextClassifyIndex(999, 40);
      logInfo(`nextClassifyIndex(current=999, index=40): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}NextClassifyIndex_0135 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0136
     * @tc.name      SearchComponent_NextClassifyIndex_0136
     * @tc.desc      nextClassifyIndex(current=999, index=45) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0136 begin`);
      const actual: number = nextClassifyIndex(999, 45);
      logInfo(`nextClassifyIndex(current=999, index=45): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}NextClassifyIndex_0136 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0137
     * @tc.name      SearchComponent_NextClassifyIndex_0137
     * @tc.desc      nextClassifyIndex(current=999, index=50) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0137 begin`);
      const actual: number = nextClassifyIndex(999, 50);
      logInfo(`nextClassifyIndex(current=999, index=50): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}NextClassifyIndex_0137 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0138
     * @tc.name      SearchComponent_NextClassifyIndex_0138
     * @tc.desc      nextClassifyIndex(current=999, index=55) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0138 begin`);
      const actual: number = nextClassifyIndex(999, 55);
      logInfo(`nextClassifyIndex(current=999, index=55): actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}NextClassifyIndex_0138 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0139
     * @tc.name      SearchComponent_NextClassifyIndex_0139
     * @tc.desc      nextClassifyIndex(current=999, index=60) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0139 begin`);
      const actual: number = nextClassifyIndex(999, 60);
      logInfo(`nextClassifyIndex(current=999, index=60): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}NextClassifyIndex_0139 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0140
     * @tc.name      SearchComponent_NextClassifyIndex_0140
     * @tc.desc      nextClassifyIndex(current=999, index=65) returns 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0140 begin`);
      const actual: number = nextClassifyIndex(999, 65);
      logInfo(`nextClassifyIndex(current=999, index=65): actual=${actual}`);
      expect(actual).assertEqual(65);
      logInfo(`${BUNDLE}NextClassifyIndex_0140 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0141
     * @tc.name      SearchComponent_NextClassifyIndex_0141
     * @tc.desc      nextClassifyIndex(current=999, index=70) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0141 begin`);
      const actual: number = nextClassifyIndex(999, 70);
      logInfo(`nextClassifyIndex(current=999, index=70): actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}NextClassifyIndex_0141 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0142
     * @tc.name      SearchComponent_NextClassifyIndex_0142
     * @tc.desc      nextClassifyIndex(current=999, index=75) returns 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0142 begin`);
      const actual: number = nextClassifyIndex(999, 75);
      logInfo(`nextClassifyIndex(current=999, index=75): actual=${actual}`);
      expect(actual).assertEqual(75);
      logInfo(`${BUNDLE}NextClassifyIndex_0142 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0143
     * @tc.name      SearchComponent_NextClassifyIndex_0143
     * @tc.desc      nextClassifyIndex(current=999, index=80) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0143 begin`);
      const actual: number = nextClassifyIndex(999, 80);
      logInfo(`nextClassifyIndex(current=999, index=80): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}NextClassifyIndex_0143 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0144
     * @tc.name      SearchComponent_NextClassifyIndex_0144
     * @tc.desc      nextClassifyIndex(current=999, index=85) returns 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0144 begin`);
      const actual: number = nextClassifyIndex(999, 85);
      logInfo(`nextClassifyIndex(current=999, index=85): actual=${actual}`);
      expect(actual).assertEqual(85);
      logInfo(`${BUNDLE}NextClassifyIndex_0144 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0145
     * @tc.name      SearchComponent_NextClassifyIndex_0145
     * @tc.desc      nextClassifyIndex(current=999, index=90) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0145 begin`);
      const actual: number = nextClassifyIndex(999, 90);
      logInfo(`nextClassifyIndex(current=999, index=90): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}NextClassifyIndex_0145 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0146
     * @tc.name      SearchComponent_NextClassifyIndex_0146
     * @tc.desc      nextClassifyIndex(current=999, index=95) returns 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0146 begin`);
      const actual: number = nextClassifyIndex(999, 95);
      logInfo(`nextClassifyIndex(current=999, index=95): actual=${actual}`);
      expect(actual).assertEqual(95);
      logInfo(`${BUNDLE}NextClassifyIndex_0146 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0147
     * @tc.name      SearchComponent_NextClassifyIndex_0147
     * @tc.desc      nextClassifyIndex(current=999, index=105) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0147 begin`);
      const actual: number = nextClassifyIndex(999, 105);
      logInfo(`nextClassifyIndex(current=999, index=105): actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}NextClassifyIndex_0147 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0148
     * @tc.name      SearchComponent_NextClassifyIndex_0148
     * @tc.desc      nextClassifyIndex(current=999, index=-45) returns -45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_NextClassifyIndex_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0148 begin`);
      const actual: number = nextClassifyIndex(999, -45);
      logInfo(`nextClassifyIndex(current=999, index=-45): actual=${actual}`);
      expect(actual).assertEqual(-45);
      logInfo(`${BUNDLE}NextClassifyIndex_0148 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0149
     * @tc.name      SearchComponent_NextClassifyIndex_0149
     * @tc.desc      nextClassifyIndex(current=999, index=-77) returns -77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_NextClassifyIndex_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0149 begin`);
      const actual: number = nextClassifyIndex(999, -77);
      logInfo(`nextClassifyIndex(current=999, index=-77): actual=${actual}`);
      expect(actual).assertEqual(-77);
      logInfo(`${BUNDLE}NextClassifyIndex_0149 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0150
     * @tc.name      SearchComponent_NextClassifyIndex_0150
     * @tc.desc      nextClassifyIndex(current=999, index=109) returns 109
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0150 begin`);
      const actual: number = nextClassifyIndex(999, 109);
      logInfo(`nextClassifyIndex(current=999, index=109): actual=${actual}`);
      expect(actual).assertEqual(109);
      logInfo(`${BUNDLE}NextClassifyIndex_0150 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0151
     * @tc.name      SearchComponent_NextClassifyIndex_0151
     * @tc.desc      nextClassifyIndex(current=1000, index=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0151 begin`);
      const actual: number = nextClassifyIndex(1000, 0);
      logInfo(`nextClassifyIndex(current=1000, index=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NextClassifyIndex_0151 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0152
     * @tc.name      SearchComponent_NextClassifyIndex_0152
     * @tc.desc      nextClassifyIndex(current=1000, index=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0152 begin`);
      const actual: number = nextClassifyIndex(1000, 1);
      logInfo(`nextClassifyIndex(current=1000, index=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextClassifyIndex_0152 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0153
     * @tc.name      SearchComponent_NextClassifyIndex_0153
     * @tc.desc      nextClassifyIndex(current=1000, index=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0153 begin`);
      const actual: number = nextClassifyIndex(1000, -1);
      logInfo(`nextClassifyIndex(current=1000, index=-1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NextClassifyIndex_0153 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0154
     * @tc.name      SearchComponent_NextClassifyIndex_0154
     * @tc.desc      nextClassifyIndex(current=1000, index=-2) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0154 begin`);
      const actual: number = nextClassifyIndex(1000, -2);
      logInfo(`nextClassifyIndex(current=1000, index=-2): actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}NextClassifyIndex_0154 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0155
     * @tc.name      SearchComponent_NextClassifyIndex_0155
     * @tc.desc      nextClassifyIndex(current=1000, index=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0155 begin`);
      const actual: number = nextClassifyIndex(1000, 2);
      logInfo(`nextClassifyIndex(current=1000, index=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NextClassifyIndex_0155 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0156
     * @tc.name      SearchComponent_NextClassifyIndex_0156
     * @tc.desc      nextClassifyIndex(current=1000, index=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0156 begin`);
      const actual: number = nextClassifyIndex(1000, 5);
      logInfo(`nextClassifyIndex(current=1000, index=5): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}NextClassifyIndex_0156 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0157
     * @tc.name      SearchComponent_NextClassifyIndex_0157
     * @tc.desc      nextClassifyIndex(current=1000, index=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0157 begin`);
      const actual: number = nextClassifyIndex(1000, 10);
      logInfo(`nextClassifyIndex(current=1000, index=10): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}NextClassifyIndex_0157 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0158
     * @tc.name      SearchComponent_NextClassifyIndex_0158
     * @tc.desc      nextClassifyIndex(current=1000, index=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0158 begin`);
      const actual: number = nextClassifyIndex(1000, 3);
      logInfo(`nextClassifyIndex(current=1000, index=3): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NextClassifyIndex_0158 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0159
     * @tc.name      SearchComponent_NextClassifyIndex_0159
     * @tc.desc      nextClassifyIndex(current=1000, index=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0159 begin`);
      const actual: number = nextClassifyIndex(1000, 100);
      logInfo(`nextClassifyIndex(current=1000, index=100): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}NextClassifyIndex_0159 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0160
     * @tc.name      SearchComponent_NextClassifyIndex_0160
     * @tc.desc      nextClassifyIndex(current=1000, index=15) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0160 begin`);
      const actual: number = nextClassifyIndex(1000, 15);
      logInfo(`nextClassifyIndex(current=1000, index=15): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}NextClassifyIndex_0160 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0161
     * @tc.name      SearchComponent_NextClassifyIndex_0161
     * @tc.desc      nextClassifyIndex(current=1000, index=20) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0161 begin`);
      const actual: number = nextClassifyIndex(1000, 20);
      logInfo(`nextClassifyIndex(current=1000, index=20): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}NextClassifyIndex_0161 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0162
     * @tc.name      SearchComponent_NextClassifyIndex_0162
     * @tc.desc      nextClassifyIndex(current=1000, index=25) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0162 begin`);
      const actual: number = nextClassifyIndex(1000, 25);
      logInfo(`nextClassifyIndex(current=1000, index=25): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}NextClassifyIndex_0162 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0163
     * @tc.name      SearchComponent_NextClassifyIndex_0163
     * @tc.desc      nextClassifyIndex(current=1000, index=30) returns 30
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0163 begin`);
      const actual: number = nextClassifyIndex(1000, 30);
      logInfo(`nextClassifyIndex(current=1000, index=30): actual=${actual}`);
      expect(actual).assertEqual(30);
      logInfo(`${BUNDLE}NextClassifyIndex_0163 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0164
     * @tc.name      SearchComponent_NextClassifyIndex_0164
     * @tc.desc      nextClassifyIndex(current=1000, index=35) returns 35
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0164 begin`);
      const actual: number = nextClassifyIndex(1000, 35);
      logInfo(`nextClassifyIndex(current=1000, index=35): actual=${actual}`);
      expect(actual).assertEqual(35);
      logInfo(`${BUNDLE}NextClassifyIndex_0164 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0165
     * @tc.name      SearchComponent_NextClassifyIndex_0165
     * @tc.desc      nextClassifyIndex(current=1000, index=40) returns 40
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0165 begin`);
      const actual: number = nextClassifyIndex(1000, 40);
      logInfo(`nextClassifyIndex(current=1000, index=40): actual=${actual}`);
      expect(actual).assertEqual(40);
      logInfo(`${BUNDLE}NextClassifyIndex_0165 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0166
     * @tc.name      SearchComponent_NextClassifyIndex_0166
     * @tc.desc      nextClassifyIndex(current=1000, index=45) returns 45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0166 begin`);
      const actual: number = nextClassifyIndex(1000, 45);
      logInfo(`nextClassifyIndex(current=1000, index=45): actual=${actual}`);
      expect(actual).assertEqual(45);
      logInfo(`${BUNDLE}NextClassifyIndex_0166 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0167
     * @tc.name      SearchComponent_NextClassifyIndex_0167
     * @tc.desc      nextClassifyIndex(current=1000, index=50) returns 50
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0167 begin`);
      const actual: number = nextClassifyIndex(1000, 50);
      logInfo(`nextClassifyIndex(current=1000, index=50): actual=${actual}`);
      expect(actual).assertEqual(50);
      logInfo(`${BUNDLE}NextClassifyIndex_0167 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0168
     * @tc.name      SearchComponent_NextClassifyIndex_0168
     * @tc.desc      nextClassifyIndex(current=1000, index=55) returns 55
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0168 begin`);
      const actual: number = nextClassifyIndex(1000, 55);
      logInfo(`nextClassifyIndex(current=1000, index=55): actual=${actual}`);
      expect(actual).assertEqual(55);
      logInfo(`${BUNDLE}NextClassifyIndex_0168 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0169
     * @tc.name      SearchComponent_NextClassifyIndex_0169
     * @tc.desc      nextClassifyIndex(current=1000, index=60) returns 60
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0169 begin`);
      const actual: number = nextClassifyIndex(1000, 60);
      logInfo(`nextClassifyIndex(current=1000, index=60): actual=${actual}`);
      expect(actual).assertEqual(60);
      logInfo(`${BUNDLE}NextClassifyIndex_0169 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0170
     * @tc.name      SearchComponent_NextClassifyIndex_0170
     * @tc.desc      nextClassifyIndex(current=1000, index=65) returns 65
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0170 begin`);
      const actual: number = nextClassifyIndex(1000, 65);
      logInfo(`nextClassifyIndex(current=1000, index=65): actual=${actual}`);
      expect(actual).assertEqual(65);
      logInfo(`${BUNDLE}NextClassifyIndex_0170 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0171
     * @tc.name      SearchComponent_NextClassifyIndex_0171
     * @tc.desc      nextClassifyIndex(current=1000, index=70) returns 70
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0171 begin`);
      const actual: number = nextClassifyIndex(1000, 70);
      logInfo(`nextClassifyIndex(current=1000, index=70): actual=${actual}`);
      expect(actual).assertEqual(70);
      logInfo(`${BUNDLE}NextClassifyIndex_0171 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0172
     * @tc.name      SearchComponent_NextClassifyIndex_0172
     * @tc.desc      nextClassifyIndex(current=1000, index=75) returns 75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0172 begin`);
      const actual: number = nextClassifyIndex(1000, 75);
      logInfo(`nextClassifyIndex(current=1000, index=75): actual=${actual}`);
      expect(actual).assertEqual(75);
      logInfo(`${BUNDLE}NextClassifyIndex_0172 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0173
     * @tc.name      SearchComponent_NextClassifyIndex_0173
     * @tc.desc      nextClassifyIndex(current=1000, index=80) returns 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0173 begin`);
      const actual: number = nextClassifyIndex(1000, 80);
      logInfo(`nextClassifyIndex(current=1000, index=80): actual=${actual}`);
      expect(actual).assertEqual(80);
      logInfo(`${BUNDLE}NextClassifyIndex_0173 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0174
     * @tc.name      SearchComponent_NextClassifyIndex_0174
     * @tc.desc      nextClassifyIndex(current=1000, index=85) returns 85
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0174 begin`);
      const actual: number = nextClassifyIndex(1000, 85);
      logInfo(`nextClassifyIndex(current=1000, index=85): actual=${actual}`);
      expect(actual).assertEqual(85);
      logInfo(`${BUNDLE}NextClassifyIndex_0174 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0175
     * @tc.name      SearchComponent_NextClassifyIndex_0175
     * @tc.desc      nextClassifyIndex(current=1000, index=90) returns 90
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0175 begin`);
      const actual: number = nextClassifyIndex(1000, 90);
      logInfo(`nextClassifyIndex(current=1000, index=90): actual=${actual}`);
      expect(actual).assertEqual(90);
      logInfo(`${BUNDLE}NextClassifyIndex_0175 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0176
     * @tc.name      SearchComponent_NextClassifyIndex_0176
     * @tc.desc      nextClassifyIndex(current=1000, index=95) returns 95
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0176 begin`);
      const actual: number = nextClassifyIndex(1000, 95);
      logInfo(`nextClassifyIndex(current=1000, index=95): actual=${actual}`);
      expect(actual).assertEqual(95);
      logInfo(`${BUNDLE}NextClassifyIndex_0176 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0177
     * @tc.name      SearchComponent_NextClassifyIndex_0177
     * @tc.desc      nextClassifyIndex(current=1000, index=105) returns 105
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0177 begin`);
      const actual: number = nextClassifyIndex(1000, 105);
      logInfo(`nextClassifyIndex(current=1000, index=105): actual=${actual}`);
      expect(actual).assertEqual(105);
      logInfo(`${BUNDLE}NextClassifyIndex_0177 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0178
     * @tc.name      SearchComponent_NextClassifyIndex_0178
     * @tc.desc      nextClassifyIndex(current=1000, index=-45) returns -45
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_NextClassifyIndex_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0178 begin`);
      const actual: number = nextClassifyIndex(1000, -45);
      logInfo(`nextClassifyIndex(current=1000, index=-45): actual=${actual}`);
      expect(actual).assertEqual(-45);
      logInfo(`${BUNDLE}NextClassifyIndex_0178 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0179
     * @tc.name      SearchComponent_NextClassifyIndex_0179
     * @tc.desc      nextClassifyIndex(current=1000, index=-77) returns -77
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SearchComponent_NextClassifyIndex_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0179 begin`);
      const actual: number = nextClassifyIndex(1000, -77);
      logInfo(`nextClassifyIndex(current=1000, index=-77): actual=${actual}`);
      expect(actual).assertEqual(-77);
      logInfo(`${BUNDLE}NextClassifyIndex_0179 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0180
     * @tc.name      SearchComponent_NextClassifyIndex_0180
     * @tc.desc      nextClassifyIndex(current=1000, index=109) returns 109
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0180 begin`);
      const actual: number = nextClassifyIndex(1000, 109);
      logInfo(`nextClassifyIndex(current=1000, index=109): actual=${actual}`);
      expect(actual).assertEqual(109);
      logInfo(`${BUNDLE}NextClassifyIndex_0180 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0181
     * @tc.name      SearchComponent_NextClassifyIndex_0181
     * @tc.desc      nextClassifyIndex(current=59999, index=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0181 begin`);
      const actual: number = nextClassifyIndex(59999, 0);
      logInfo(`nextClassifyIndex(current=59999, index=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NextClassifyIndex_0181 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0182
     * @tc.name      SearchComponent_NextClassifyIndex_0182
     * @tc.desc      nextClassifyIndex(current=59999, index=1) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0182 begin`);
      const actual: number = nextClassifyIndex(59999, 1);
      logInfo(`nextClassifyIndex(current=59999, index=1): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}NextClassifyIndex_0182 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0183
     * @tc.name      SearchComponent_NextClassifyIndex_0183
     * @tc.desc      nextClassifyIndex(current=59999, index=-1) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0183 begin`);
      const actual: number = nextClassifyIndex(59999, -1);
      logInfo(`nextClassifyIndex(current=59999, index=-1): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}NextClassifyIndex_0183 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0184
     * @tc.name      SearchComponent_NextClassifyIndex_0184
     * @tc.desc      nextClassifyIndex(current=59999, index=-2) returns -2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SearchComponent_NextClassifyIndex_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0184 begin`);
      const actual: number = nextClassifyIndex(59999, -2);
      logInfo(`nextClassifyIndex(current=59999, index=-2): actual=${actual}`);
      expect(actual).assertEqual(-2);
      logInfo(`${BUNDLE}NextClassifyIndex_0184 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0185
     * @tc.name      SearchComponent_NextClassifyIndex_0185
     * @tc.desc      nextClassifyIndex(current=59999, index=2) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0185 begin`);
      const actual: number = nextClassifyIndex(59999, 2);
      logInfo(`nextClassifyIndex(current=59999, index=2): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}NextClassifyIndex_0185 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0186
     * @tc.name      SearchComponent_NextClassifyIndex_0186
     * @tc.desc      nextClassifyIndex(current=59999, index=5) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0186 begin`);
      const actual: number = nextClassifyIndex(59999, 5);
      logInfo(`nextClassifyIndex(current=59999, index=5): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}NextClassifyIndex_0186 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0187
     * @tc.name      SearchComponent_NextClassifyIndex_0187
     * @tc.desc      nextClassifyIndex(current=59999, index=10) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0187 begin`);
      const actual: number = nextClassifyIndex(59999, 10);
      logInfo(`nextClassifyIndex(current=59999, index=10): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}NextClassifyIndex_0187 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0188
     * @tc.name      SearchComponent_NextClassifyIndex_0188
     * @tc.desc      nextClassifyIndex(current=59999, index=3) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0188 begin`);
      const actual: number = nextClassifyIndex(59999, 3);
      logInfo(`nextClassifyIndex(current=59999, index=3): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}NextClassifyIndex_0188 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0189
     * @tc.name      SearchComponent_NextClassifyIndex_0189
     * @tc.desc      nextClassifyIndex(current=59999, index=100) returns 100
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0189 begin`);
      const actual: number = nextClassifyIndex(59999, 100);
      logInfo(`nextClassifyIndex(current=59999, index=100): actual=${actual}`);
      expect(actual).assertEqual(100);
      logInfo(`${BUNDLE}NextClassifyIndex_0189 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0190
     * @tc.name      SearchComponent_NextClassifyIndex_0190
     * @tc.desc      nextClassifyIndex(current=59999, index=15) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0190 begin`);
      const actual: number = nextClassifyIndex(59999, 15);
      logInfo(`nextClassifyIndex(current=59999, index=15): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}NextClassifyIndex_0190 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0191
     * @tc.name      SearchComponent_NextClassifyIndex_0191
     * @tc.desc      nextClassifyIndex(current=59999, index=20) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0191 begin`);
      const actual: number = nextClassifyIndex(59999, 20);
      logInfo(`nextClassifyIndex(current=59999, index=20): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}NextClassifyIndex_0191 end`);
    });

    /**
     * @tc.number    SUB_SEARCHCOMPONENT_NEXT_CLASSIFY_INDEX_0192
     * @tc.name      SearchComponent_NextClassifyIndex_0192
     * @tc.desc      nextClassifyIndex(current=59999, index=25) returns 25
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SearchComponent_NextClassifyIndex_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NextClassifyIndex_0192 begin`);
      const actual: number = nextClassifyIndex(59999, 25);
      logInfo(`nextClassifyIndex(current=59999, index=25): actual=${actual}`);
      expect(actual).assertEqual(25);
      logInfo(`${BUNDLE}NextClassifyIndex_0192 end`);
    });
  });
}
