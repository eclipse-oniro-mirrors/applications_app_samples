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
import { listOffsetOf } from '../model/TitleExpansionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ExpandTitle]';
const BUNDLE: string = 'ExpandTitle_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for listOffsetOf (96 cases). */
export default function listOffsetOf2Test(): void {
  describe('ListOffsetOf2Test', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0097
     * @tc.name      ExpandTitle_ListOffsetOf_0097
     * @tc.desc      listOffsetOf(offset=1, yOffset=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0097 begin`);
      const actual: number = listOffsetOf(1, 2);
      logInfo(`listOffsetOf(offset=1, yOffset=2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0097 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0098
     * @tc.name      ExpandTitle_ListOffsetOf_0098
     * @tc.desc      listOffsetOf(offset=1, yOffset=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0098 begin`);
      const actual: number = listOffsetOf(1, 3);
      logInfo(`listOffsetOf(offset=1, yOffset=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0098 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0099
     * @tc.name      ExpandTitle_ListOffsetOf_0099
     * @tc.desc      listOffsetOf(offset=1, yOffset=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0099 begin`);
      const actual: number = listOffsetOf(1, 10);
      logInfo(`listOffsetOf(offset=1, yOffset=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0099 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0100
     * @tc.name      ExpandTitle_ListOffsetOf_0100
     * @tc.desc      listOffsetOf(offset=1, yOffset=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0100 begin`);
      const actual: number = listOffsetOf(1, 5);
      logInfo(`listOffsetOf(offset=1, yOffset=5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0100 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0101
     * @tc.name      ExpandTitle_ListOffsetOf_0101
     * @tc.desc      listOffsetOf(offset=1, yOffset=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0101 begin`);
      const actual: number = listOffsetOf(1, 15);
      logInfo(`listOffsetOf(offset=1, yOffset=15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0101 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0102
     * @tc.name      ExpandTitle_ListOffsetOf_0102
     * @tc.desc      listOffsetOf(offset=1, yOffset=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0102 begin`);
      const actual: number = listOffsetOf(1, 20);
      logInfo(`listOffsetOf(offset=1, yOffset=20): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0102 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0103
     * @tc.name      ExpandTitle_ListOffsetOf_0103
     * @tc.desc      listOffsetOf(offset=1, yOffset=25) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0103 begin`);
      const actual: number = listOffsetOf(1, 25);
      logInfo(`listOffsetOf(offset=1, yOffset=25): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0103 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0104
     * @tc.name      ExpandTitle_ListOffsetOf_0104
     * @tc.desc      listOffsetOf(offset=1, yOffset=30) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0104 begin`);
      const actual: number = listOffsetOf(1, 30);
      logInfo(`listOffsetOf(offset=1, yOffset=30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0104 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0105
     * @tc.name      ExpandTitle_ListOffsetOf_0105
     * @tc.desc      listOffsetOf(offset=1, yOffset=35) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0105 begin`);
      const actual: number = listOffsetOf(1, 35);
      logInfo(`listOffsetOf(offset=1, yOffset=35): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0105 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0106
     * @tc.name      ExpandTitle_ListOffsetOf_0106
     * @tc.desc      listOffsetOf(offset=1, yOffset=40) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0106 begin`);
      const actual: number = listOffsetOf(1, 40);
      logInfo(`listOffsetOf(offset=1, yOffset=40): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0106 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0107
     * @tc.name      ExpandTitle_ListOffsetOf_0107
     * @tc.desc      listOffsetOf(offset=1, yOffset=45) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0107 begin`);
      const actual: number = listOffsetOf(1, 45);
      logInfo(`listOffsetOf(offset=1, yOffset=45): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0107 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0108
     * @tc.name      ExpandTitle_ListOffsetOf_0108
     * @tc.desc      listOffsetOf(offset=1, yOffset=55) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0108 begin`);
      const actual: number = listOffsetOf(1, 55);
      logInfo(`listOffsetOf(offset=1, yOffset=55): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0108 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0109
     * @tc.name      ExpandTitle_ListOffsetOf_0109
     * @tc.desc      listOffsetOf(offset=1, yOffset=60) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0109 begin`);
      const actual: number = listOffsetOf(1, 60);
      logInfo(`listOffsetOf(offset=1, yOffset=60): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0109 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0110
     * @tc.name      ExpandTitle_ListOffsetOf_0110
     * @tc.desc      listOffsetOf(offset=1, yOffset=65) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0110 begin`);
      const actual: number = listOffsetOf(1, 65);
      logInfo(`listOffsetOf(offset=1, yOffset=65): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0110 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0111
     * @tc.name      ExpandTitle_ListOffsetOf_0111
     * @tc.desc      listOffsetOf(offset=1, yOffset=70) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0111 begin`);
      const actual: number = listOffsetOf(1, 70);
      logInfo(`listOffsetOf(offset=1, yOffset=70): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0111 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0112
     * @tc.name      ExpandTitle_ListOffsetOf_0112
     * @tc.desc      listOffsetOf(offset=1, yOffset=75) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0112 begin`);
      const actual: number = listOffsetOf(1, 75);
      logInfo(`listOffsetOf(offset=1, yOffset=75): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0112 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0113
     * @tc.name      ExpandTitle_ListOffsetOf_0113
     * @tc.desc      listOffsetOf(offset=1, yOffset=80) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0113 begin`);
      const actual: number = listOffsetOf(1, 80);
      logInfo(`listOffsetOf(offset=1, yOffset=80): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0113 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0114
     * @tc.name      ExpandTitle_ListOffsetOf_0114
     * @tc.desc      listOffsetOf(offset=1, yOffset=85) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0114 begin`);
      const actual: number = listOffsetOf(1, 85);
      logInfo(`listOffsetOf(offset=1, yOffset=85): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0114 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0115
     * @tc.name      ExpandTitle_ListOffsetOf_0115
     * @tc.desc      listOffsetOf(offset=1, yOffset=90) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0115 begin`);
      const actual: number = listOffsetOf(1, 90);
      logInfo(`listOffsetOf(offset=1, yOffset=90): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0115 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0116
     * @tc.name      ExpandTitle_ListOffsetOf_0116
     * @tc.desc      listOffsetOf(offset=1, yOffset=95) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0116 begin`);
      const actual: number = listOffsetOf(1, 95);
      logInfo(`listOffsetOf(offset=1, yOffset=95): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0116 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0117
     * @tc.name      ExpandTitle_ListOffsetOf_0117
     * @tc.desc      listOffsetOf(offset=1, yOffset=105) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0117 begin`);
      const actual: number = listOffsetOf(1, 105);
      logInfo(`listOffsetOf(offset=1, yOffset=105): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0117 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0118
     * @tc.name      ExpandTitle_ListOffsetOf_0118
     * @tc.desc      listOffsetOf(offset=1, yOffset=179) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0118 begin`);
      const actual: number = listOffsetOf(1, 179);
      logInfo(`listOffsetOf(offset=1, yOffset=179): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0118 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0119
     * @tc.name      ExpandTitle_ListOffsetOf_0119
     * @tc.desc      listOffsetOf(offset=1, yOffset=-3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0119 begin`);
      const actual: number = listOffsetOf(1, -3);
      logInfo(`listOffsetOf(offset=1, yOffset=-3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0119 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0120
     * @tc.name      ExpandTitle_ListOffsetOf_0120
     * @tc.desc      listOffsetOf(offset=1, yOffset=52.83) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0120 begin`);
      const actual: number = listOffsetOf(1, 52.83);
      logInfo(`listOffsetOf(offset=1, yOffset=52.83): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0120 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0121
     * @tc.name      ExpandTitle_ListOffsetOf_0121
     * @tc.desc      listOffsetOf(offset=50, yOffset=-100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0121 begin`);
      const actual: number = listOffsetOf(50, -100);
      logInfo(`listOffsetOf(offset=50, yOffset=-100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0121 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0122
     * @tc.name      ExpandTitle_ListOffsetOf_0122
     * @tc.desc      listOffsetOf(offset=50, yOffset=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0122 begin`);
      const actual: number = listOffsetOf(50, -1);
      logInfo(`listOffsetOf(offset=50, yOffset=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0122 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0123
     * @tc.name      ExpandTitle_ListOffsetOf_0123
     * @tc.desc      listOffsetOf(offset=50, yOffset=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0123 begin`);
      const actual: number = listOffsetOf(50, 0);
      logInfo(`listOffsetOf(offset=50, yOffset=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0123 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0124
     * @tc.name      ExpandTitle_ListOffsetOf_0124
     * @tc.desc      listOffsetOf(offset=50, yOffset=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0124 begin`);
      const actual: number = listOffsetOf(50, 1);
      logInfo(`listOffsetOf(offset=50, yOffset=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0124 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0125
     * @tc.name      ExpandTitle_ListOffsetOf_0125
     * @tc.desc      listOffsetOf(offset=50, yOffset=50) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0125 begin`);
      const actual: number = listOffsetOf(50, 50);
      logInfo(`listOffsetOf(offset=50, yOffset=50): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0125 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0126
     * @tc.name      ExpandTitle_ListOffsetOf_0126
     * @tc.desc      listOffsetOf(offset=50, yOffset=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0126 begin`);
      const actual: number = listOffsetOf(50, 100);
      logInfo(`listOffsetOf(offset=50, yOffset=100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0126 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0127
     * @tc.name      ExpandTitle_ListOffsetOf_0127
     * @tc.desc      listOffsetOf(offset=50, yOffset=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0127 begin`);
      const actual: number = listOffsetOf(50, 2);
      logInfo(`listOffsetOf(offset=50, yOffset=2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0127 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0128
     * @tc.name      ExpandTitle_ListOffsetOf_0128
     * @tc.desc      listOffsetOf(offset=50, yOffset=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0128 begin`);
      const actual: number = listOffsetOf(50, 3);
      logInfo(`listOffsetOf(offset=50, yOffset=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0128 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0129
     * @tc.name      ExpandTitle_ListOffsetOf_0129
     * @tc.desc      listOffsetOf(offset=50, yOffset=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0129 begin`);
      const actual: number = listOffsetOf(50, 10);
      logInfo(`listOffsetOf(offset=50, yOffset=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0129 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0130
     * @tc.name      ExpandTitle_ListOffsetOf_0130
     * @tc.desc      listOffsetOf(offset=50, yOffset=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0130 begin`);
      const actual: number = listOffsetOf(50, 5);
      logInfo(`listOffsetOf(offset=50, yOffset=5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0130 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0131
     * @tc.name      ExpandTitle_ListOffsetOf_0131
     * @tc.desc      listOffsetOf(offset=50, yOffset=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0131 begin`);
      const actual: number = listOffsetOf(50, 15);
      logInfo(`listOffsetOf(offset=50, yOffset=15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0131 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0132
     * @tc.name      ExpandTitle_ListOffsetOf_0132
     * @tc.desc      listOffsetOf(offset=50, yOffset=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0132 begin`);
      const actual: number = listOffsetOf(50, 20);
      logInfo(`listOffsetOf(offset=50, yOffset=20): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0132 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0133
     * @tc.name      ExpandTitle_ListOffsetOf_0133
     * @tc.desc      listOffsetOf(offset=50, yOffset=25) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0133 begin`);
      const actual: number = listOffsetOf(50, 25);
      logInfo(`listOffsetOf(offset=50, yOffset=25): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0133 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0134
     * @tc.name      ExpandTitle_ListOffsetOf_0134
     * @tc.desc      listOffsetOf(offset=50, yOffset=30) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0134 begin`);
      const actual: number = listOffsetOf(50, 30);
      logInfo(`listOffsetOf(offset=50, yOffset=30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0134 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0135
     * @tc.name      ExpandTitle_ListOffsetOf_0135
     * @tc.desc      listOffsetOf(offset=50, yOffset=35) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0135 begin`);
      const actual: number = listOffsetOf(50, 35);
      logInfo(`listOffsetOf(offset=50, yOffset=35): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0135 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0136
     * @tc.name      ExpandTitle_ListOffsetOf_0136
     * @tc.desc      listOffsetOf(offset=50, yOffset=40) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0136 begin`);
      const actual: number = listOffsetOf(50, 40);
      logInfo(`listOffsetOf(offset=50, yOffset=40): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0136 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0137
     * @tc.name      ExpandTitle_ListOffsetOf_0137
     * @tc.desc      listOffsetOf(offset=50, yOffset=45) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0137 begin`);
      const actual: number = listOffsetOf(50, 45);
      logInfo(`listOffsetOf(offset=50, yOffset=45): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0137 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0138
     * @tc.name      ExpandTitle_ListOffsetOf_0138
     * @tc.desc      listOffsetOf(offset=50, yOffset=55) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0138 begin`);
      const actual: number = listOffsetOf(50, 55);
      logInfo(`listOffsetOf(offset=50, yOffset=55): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0138 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0139
     * @tc.name      ExpandTitle_ListOffsetOf_0139
     * @tc.desc      listOffsetOf(offset=50, yOffset=60) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0139 begin`);
      const actual: number = listOffsetOf(50, 60);
      logInfo(`listOffsetOf(offset=50, yOffset=60): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0139 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0140
     * @tc.name      ExpandTitle_ListOffsetOf_0140
     * @tc.desc      listOffsetOf(offset=50, yOffset=65) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0140 begin`);
      const actual: number = listOffsetOf(50, 65);
      logInfo(`listOffsetOf(offset=50, yOffset=65): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0140 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0141
     * @tc.name      ExpandTitle_ListOffsetOf_0141
     * @tc.desc      listOffsetOf(offset=50, yOffset=70) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0141 begin`);
      const actual: number = listOffsetOf(50, 70);
      logInfo(`listOffsetOf(offset=50, yOffset=70): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0141 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0142
     * @tc.name      ExpandTitle_ListOffsetOf_0142
     * @tc.desc      listOffsetOf(offset=50, yOffset=75) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0142 begin`);
      const actual: number = listOffsetOf(50, 75);
      logInfo(`listOffsetOf(offset=50, yOffset=75): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0142 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0143
     * @tc.name      ExpandTitle_ListOffsetOf_0143
     * @tc.desc      listOffsetOf(offset=50, yOffset=80) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0143 begin`);
      const actual: number = listOffsetOf(50, 80);
      logInfo(`listOffsetOf(offset=50, yOffset=80): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0143 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0144
     * @tc.name      ExpandTitle_ListOffsetOf_0144
     * @tc.desc      listOffsetOf(offset=50, yOffset=85) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0144 begin`);
      const actual: number = listOffsetOf(50, 85);
      logInfo(`listOffsetOf(offset=50, yOffset=85): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0144 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0145
     * @tc.name      ExpandTitle_ListOffsetOf_0145
     * @tc.desc      listOffsetOf(offset=50, yOffset=90) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0145 begin`);
      const actual: number = listOffsetOf(50, 90);
      logInfo(`listOffsetOf(offset=50, yOffset=90): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0145 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0146
     * @tc.name      ExpandTitle_ListOffsetOf_0146
     * @tc.desc      listOffsetOf(offset=50, yOffset=95) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0146 begin`);
      const actual: number = listOffsetOf(50, 95);
      logInfo(`listOffsetOf(offset=50, yOffset=95): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0146 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0147
     * @tc.name      ExpandTitle_ListOffsetOf_0147
     * @tc.desc      listOffsetOf(offset=50, yOffset=105) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0147 begin`);
      const actual: number = listOffsetOf(50, 105);
      logInfo(`listOffsetOf(offset=50, yOffset=105): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0147 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0148
     * @tc.name      ExpandTitle_ListOffsetOf_0148
     * @tc.desc      listOffsetOf(offset=50, yOffset=179) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0148 begin`);
      const actual: number = listOffsetOf(50, 179);
      logInfo(`listOffsetOf(offset=50, yOffset=179): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0148 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0149
     * @tc.name      ExpandTitle_ListOffsetOf_0149
     * @tc.desc      listOffsetOf(offset=50, yOffset=-3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0149 begin`);
      const actual: number = listOffsetOf(50, -3);
      logInfo(`listOffsetOf(offset=50, yOffset=-3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0149 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0150
     * @tc.name      ExpandTitle_ListOffsetOf_0150
     * @tc.desc      listOffsetOf(offset=50, yOffset=52.83) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0150 begin`);
      const actual: number = listOffsetOf(50, 52.83);
      logInfo(`listOffsetOf(offset=50, yOffset=52.83): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0150 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0151
     * @tc.name      ExpandTitle_ListOffsetOf_0151
     * @tc.desc      listOffsetOf(offset=100, yOffset=-100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0151 begin`);
      const actual: number = listOffsetOf(100, -100);
      logInfo(`listOffsetOf(offset=100, yOffset=-100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0151 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0152
     * @tc.name      ExpandTitle_ListOffsetOf_0152
     * @tc.desc      listOffsetOf(offset=100, yOffset=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0152 begin`);
      const actual: number = listOffsetOf(100, -1);
      logInfo(`listOffsetOf(offset=100, yOffset=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0152 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0153
     * @tc.name      ExpandTitle_ListOffsetOf_0153
     * @tc.desc      listOffsetOf(offset=100, yOffset=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0153 begin`);
      const actual: number = listOffsetOf(100, 0);
      logInfo(`listOffsetOf(offset=100, yOffset=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0153 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0154
     * @tc.name      ExpandTitle_ListOffsetOf_0154
     * @tc.desc      listOffsetOf(offset=100, yOffset=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0154 begin`);
      const actual: number = listOffsetOf(100, 1);
      logInfo(`listOffsetOf(offset=100, yOffset=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0154 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0155
     * @tc.name      ExpandTitle_ListOffsetOf_0155
     * @tc.desc      listOffsetOf(offset=100, yOffset=50) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0155 begin`);
      const actual: number = listOffsetOf(100, 50);
      logInfo(`listOffsetOf(offset=100, yOffset=50): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0155 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0156
     * @tc.name      ExpandTitle_ListOffsetOf_0156
     * @tc.desc      listOffsetOf(offset=100, yOffset=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0156 begin`);
      const actual: number = listOffsetOf(100, 100);
      logInfo(`listOffsetOf(offset=100, yOffset=100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0156 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0157
     * @tc.name      ExpandTitle_ListOffsetOf_0157
     * @tc.desc      listOffsetOf(offset=100, yOffset=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0157 begin`);
      const actual: number = listOffsetOf(100, 2);
      logInfo(`listOffsetOf(offset=100, yOffset=2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0157 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0158
     * @tc.name      ExpandTitle_ListOffsetOf_0158
     * @tc.desc      listOffsetOf(offset=100, yOffset=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0158 begin`);
      const actual: number = listOffsetOf(100, 3);
      logInfo(`listOffsetOf(offset=100, yOffset=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0158 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0159
     * @tc.name      ExpandTitle_ListOffsetOf_0159
     * @tc.desc      listOffsetOf(offset=100, yOffset=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0159 begin`);
      const actual: number = listOffsetOf(100, 10);
      logInfo(`listOffsetOf(offset=100, yOffset=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0159 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0160
     * @tc.name      ExpandTitle_ListOffsetOf_0160
     * @tc.desc      listOffsetOf(offset=100, yOffset=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0160 begin`);
      const actual: number = listOffsetOf(100, 5);
      logInfo(`listOffsetOf(offset=100, yOffset=5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0160 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0161
     * @tc.name      ExpandTitle_ListOffsetOf_0161
     * @tc.desc      listOffsetOf(offset=100, yOffset=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0161 begin`);
      const actual: number = listOffsetOf(100, 15);
      logInfo(`listOffsetOf(offset=100, yOffset=15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0161 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0162
     * @tc.name      ExpandTitle_ListOffsetOf_0162
     * @tc.desc      listOffsetOf(offset=100, yOffset=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0162 begin`);
      const actual: number = listOffsetOf(100, 20);
      logInfo(`listOffsetOf(offset=100, yOffset=20): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0162 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0163
     * @tc.name      ExpandTitle_ListOffsetOf_0163
     * @tc.desc      listOffsetOf(offset=100, yOffset=25) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0163 begin`);
      const actual: number = listOffsetOf(100, 25);
      logInfo(`listOffsetOf(offset=100, yOffset=25): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0163 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0164
     * @tc.name      ExpandTitle_ListOffsetOf_0164
     * @tc.desc      listOffsetOf(offset=100, yOffset=30) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0164 begin`);
      const actual: number = listOffsetOf(100, 30);
      logInfo(`listOffsetOf(offset=100, yOffset=30): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0164 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0165
     * @tc.name      ExpandTitle_ListOffsetOf_0165
     * @tc.desc      listOffsetOf(offset=100, yOffset=35) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0165 begin`);
      const actual: number = listOffsetOf(100, 35);
      logInfo(`listOffsetOf(offset=100, yOffset=35): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0165 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0166
     * @tc.name      ExpandTitle_ListOffsetOf_0166
     * @tc.desc      listOffsetOf(offset=100, yOffset=40) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0166 begin`);
      const actual: number = listOffsetOf(100, 40);
      logInfo(`listOffsetOf(offset=100, yOffset=40): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0166 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0167
     * @tc.name      ExpandTitle_ListOffsetOf_0167
     * @tc.desc      listOffsetOf(offset=100, yOffset=45) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0167 begin`);
      const actual: number = listOffsetOf(100, 45);
      logInfo(`listOffsetOf(offset=100, yOffset=45): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0167 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0168
     * @tc.name      ExpandTitle_ListOffsetOf_0168
     * @tc.desc      listOffsetOf(offset=100, yOffset=55) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0168 begin`);
      const actual: number = listOffsetOf(100, 55);
      logInfo(`listOffsetOf(offset=100, yOffset=55): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0168 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0169
     * @tc.name      ExpandTitle_ListOffsetOf_0169
     * @tc.desc      listOffsetOf(offset=100, yOffset=60) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0169 begin`);
      const actual: number = listOffsetOf(100, 60);
      logInfo(`listOffsetOf(offset=100, yOffset=60): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0169 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0170
     * @tc.name      ExpandTitle_ListOffsetOf_0170
     * @tc.desc      listOffsetOf(offset=100, yOffset=65) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0170 begin`);
      const actual: number = listOffsetOf(100, 65);
      logInfo(`listOffsetOf(offset=100, yOffset=65): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0170 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0171
     * @tc.name      ExpandTitle_ListOffsetOf_0171
     * @tc.desc      listOffsetOf(offset=100, yOffset=70) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0171 begin`);
      const actual: number = listOffsetOf(100, 70);
      logInfo(`listOffsetOf(offset=100, yOffset=70): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0171 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0172
     * @tc.name      ExpandTitle_ListOffsetOf_0172
     * @tc.desc      listOffsetOf(offset=100, yOffset=75) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0172 begin`);
      const actual: number = listOffsetOf(100, 75);
      logInfo(`listOffsetOf(offset=100, yOffset=75): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0172 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0173
     * @tc.name      ExpandTitle_ListOffsetOf_0173
     * @tc.desc      listOffsetOf(offset=100, yOffset=80) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0173 begin`);
      const actual: number = listOffsetOf(100, 80);
      logInfo(`listOffsetOf(offset=100, yOffset=80): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0173 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0174
     * @tc.name      ExpandTitle_ListOffsetOf_0174
     * @tc.desc      listOffsetOf(offset=100, yOffset=85) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0174 begin`);
      const actual: number = listOffsetOf(100, 85);
      logInfo(`listOffsetOf(offset=100, yOffset=85): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0174 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0175
     * @tc.name      ExpandTitle_ListOffsetOf_0175
     * @tc.desc      listOffsetOf(offset=100, yOffset=90) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0175 begin`);
      const actual: number = listOffsetOf(100, 90);
      logInfo(`listOffsetOf(offset=100, yOffset=90): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0175 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0176
     * @tc.name      ExpandTitle_ListOffsetOf_0176
     * @tc.desc      listOffsetOf(offset=100, yOffset=95) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0176 begin`);
      const actual: number = listOffsetOf(100, 95);
      logInfo(`listOffsetOf(offset=100, yOffset=95): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0176 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0177
     * @tc.name      ExpandTitle_ListOffsetOf_0177
     * @tc.desc      listOffsetOf(offset=100, yOffset=105) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0177 begin`);
      const actual: number = listOffsetOf(100, 105);
      logInfo(`listOffsetOf(offset=100, yOffset=105): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0177 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0178
     * @tc.name      ExpandTitle_ListOffsetOf_0178
     * @tc.desc      listOffsetOf(offset=100, yOffset=179) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0178 begin`);
      const actual: number = listOffsetOf(100, 179);
      logInfo(`listOffsetOf(offset=100, yOffset=179): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0178 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0179
     * @tc.name      ExpandTitle_ListOffsetOf_0179
     * @tc.desc      listOffsetOf(offset=100, yOffset=-3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0179 begin`);
      const actual: number = listOffsetOf(100, -3);
      logInfo(`listOffsetOf(offset=100, yOffset=-3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0179 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0180
     * @tc.name      ExpandTitle_ListOffsetOf_0180
     * @tc.desc      listOffsetOf(offset=100, yOffset=52.83) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0180 begin`);
      const actual: number = listOffsetOf(100, 52.83);
      logInfo(`listOffsetOf(offset=100, yOffset=52.83): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0180 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0181
     * @tc.name      ExpandTitle_ListOffsetOf_0181
     * @tc.desc      listOffsetOf(offset=2, yOffset=-100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0181 begin`);
      const actual: number = listOffsetOf(2, -100);
      logInfo(`listOffsetOf(offset=2, yOffset=-100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0181 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0182
     * @tc.name      ExpandTitle_ListOffsetOf_0182
     * @tc.desc      listOffsetOf(offset=2, yOffset=-1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ExpandTitle_ListOffsetOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0182 begin`);
      const actual: number = listOffsetOf(2, -1);
      logInfo(`listOffsetOf(offset=2, yOffset=-1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0182 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0183
     * @tc.name      ExpandTitle_ListOffsetOf_0183
     * @tc.desc      listOffsetOf(offset=2, yOffset=0) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0183 begin`);
      const actual: number = listOffsetOf(2, 0);
      logInfo(`listOffsetOf(offset=2, yOffset=0): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0183 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0184
     * @tc.name      ExpandTitle_ListOffsetOf_0184
     * @tc.desc      listOffsetOf(offset=2, yOffset=1) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('ExpandTitle_ListOffsetOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0184 begin`);
      const actual: number = listOffsetOf(2, 1);
      logInfo(`listOffsetOf(offset=2, yOffset=1): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0184 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0185
     * @tc.name      ExpandTitle_ListOffsetOf_0185
     * @tc.desc      listOffsetOf(offset=2, yOffset=50) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0185 begin`);
      const actual: number = listOffsetOf(2, 50);
      logInfo(`listOffsetOf(offset=2, yOffset=50): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0185 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0186
     * @tc.name      ExpandTitle_ListOffsetOf_0186
     * @tc.desc      listOffsetOf(offset=2, yOffset=100) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0186 begin`);
      const actual: number = listOffsetOf(2, 100);
      logInfo(`listOffsetOf(offset=2, yOffset=100): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0186 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0187
     * @tc.name      ExpandTitle_ListOffsetOf_0187
     * @tc.desc      listOffsetOf(offset=2, yOffset=2) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0187 begin`);
      const actual: number = listOffsetOf(2, 2);
      logInfo(`listOffsetOf(offset=2, yOffset=2): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0187 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0188
     * @tc.name      ExpandTitle_ListOffsetOf_0188
     * @tc.desc      listOffsetOf(offset=2, yOffset=3) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0188 begin`);
      const actual: number = listOffsetOf(2, 3);
      logInfo(`listOffsetOf(offset=2, yOffset=3): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0188 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0189
     * @tc.name      ExpandTitle_ListOffsetOf_0189
     * @tc.desc      listOffsetOf(offset=2, yOffset=10) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0189 begin`);
      const actual: number = listOffsetOf(2, 10);
      logInfo(`listOffsetOf(offset=2, yOffset=10): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0189 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0190
     * @tc.name      ExpandTitle_ListOffsetOf_0190
     * @tc.desc      listOffsetOf(offset=2, yOffset=5) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0190 begin`);
      const actual: number = listOffsetOf(2, 5);
      logInfo(`listOffsetOf(offset=2, yOffset=5): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0190 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0191
     * @tc.name      ExpandTitle_ListOffsetOf_0191
     * @tc.desc      listOffsetOf(offset=2, yOffset=15) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0191 begin`);
      const actual: number = listOffsetOf(2, 15);
      logInfo(`listOffsetOf(offset=2, yOffset=15): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0191 end`);
    });

    /**
     * @tc.number    SUB_EXPANDTITLE_LIST_OFFSET_OF_0192
     * @tc.name      ExpandTitle_ListOffsetOf_0192
     * @tc.desc      listOffsetOf(offset=2, yOffset=20) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ExpandTitle_ListOffsetOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ListOffsetOf_0192 begin`);
      const actual: number = listOffsetOf(2, 20);
      logInfo(`listOffsetOf(offset=2, yOffset=20): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ListOffsetOf_0192 end`);
    });
  });
}
