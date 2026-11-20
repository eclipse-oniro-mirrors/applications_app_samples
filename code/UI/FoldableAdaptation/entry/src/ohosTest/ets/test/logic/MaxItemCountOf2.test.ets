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
import { maxItemCountOf } from '../model/FoldLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FoldableAdaptation]';
const BUNDLE: string = 'FoldableAdaptation_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for maxItemCountOf (24 cases). */
export default function maxItemCountOf2Test(): void {
  describe('MaxItemCountOf2Test', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0097
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0097
     * @tc.desc      maxItemCountOf(width=3360, isFoldable=false) returns 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0097 begin`);
      const actual: number = maxItemCountOf(3360, false);
      logInfo(`maxItemCountOf(width=3360, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(18);
      logInfo(`${BUNDLE}MaxItemCountOf_0097 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0098
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0098
     * @tc.desc      maxItemCountOf(width=3456, isFoldable=true) returns 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0098 begin`);
      const actual: number = maxItemCountOf(3456, true);
      logInfo(`maxItemCountOf(width=3456, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(21);
      logInfo(`${BUNDLE}MaxItemCountOf_0098 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0099
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0099
     * @tc.desc      maxItemCountOf(width=3456, isFoldable=false) returns 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0099 begin`);
      const actual: number = maxItemCountOf(3456, false);
      logInfo(`maxItemCountOf(width=3456, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(19);
      logInfo(`${BUNDLE}MaxItemCountOf_0099 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0100
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0100
     * @tc.desc      maxItemCountOf(width=3552, isFoldable=false) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0100 begin`);
      const actual: number = maxItemCountOf(3552, false);
      logInfo(`maxItemCountOf(width=3552, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}MaxItemCountOf_0100 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0101
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0101
     * @tc.desc      maxItemCountOf(width=3648, isFoldable=false) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0101 begin`);
      const actual: number = maxItemCountOf(3648, false);
      logInfo(`maxItemCountOf(width=3648, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}MaxItemCountOf_0101 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0102
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0102
     * @tc.desc      maxItemCountOf(width=3744, isFoldable=true) returns 23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0102 begin`);
      const actual: number = maxItemCountOf(3744, true);
      logInfo(`maxItemCountOf(width=3744, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(23);
      logInfo(`${BUNDLE}MaxItemCountOf_0102 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0103
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0103
     * @tc.desc      maxItemCountOf(width=3744, isFoldable=false) returns 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0103 begin`);
      const actual: number = maxItemCountOf(3744, false);
      logInfo(`maxItemCountOf(width=3744, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(21);
      logInfo(`${BUNDLE}MaxItemCountOf_0103 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0104
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0104
     * @tc.desc      maxItemCountOf(width=3840, isFoldable=false) returns 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0104 begin`);
      const actual: number = maxItemCountOf(3840, false);
      logInfo(`maxItemCountOf(width=3840, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(21);
      logInfo(`${BUNDLE}MaxItemCountOf_0104 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0105
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0105
     * @tc.desc      maxItemCountOf(width=3471, isFoldable=true) returns 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0105 begin`);
      const actual: number = maxItemCountOf(3471, true);
      logInfo(`maxItemCountOf(width=3471, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(21);
      logInfo(`${BUNDLE}MaxItemCountOf_0105 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0106
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0106
     * @tc.desc      maxItemCountOf(width=3471, isFoldable=false) returns 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0106 begin`);
      const actual: number = maxItemCountOf(3471, false);
      logInfo(`maxItemCountOf(width=3471, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(19);
      logInfo(`${BUNDLE}MaxItemCountOf_0106 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0107
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0107
     * @tc.desc      maxItemCountOf(width=-73, isFoldable=true) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('MaxItemCountOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0107 begin`);
      const actual: number = maxItemCountOf(-73, true);
      logInfo(`maxItemCountOf(width=-73, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MaxItemCountOf_0107 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0108
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0108
     * @tc.desc      maxItemCountOf(width=-73, isFoldable=false) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('MaxItemCountOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0108 begin`);
      const actual: number = maxItemCountOf(-73, false);
      logInfo(`maxItemCountOf(width=-73, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MaxItemCountOf_0108 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0109
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0109
     * @tc.desc      maxItemCountOf(width=1867, isFoldable=true) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0109 begin`);
      const actual: number = maxItemCountOf(1867, true);
      logInfo(`maxItemCountOf(width=1867, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}MaxItemCountOf_0109 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0110
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0110
     * @tc.desc      maxItemCountOf(width=1867, isFoldable=false) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0110 begin`);
      const actual: number = maxItemCountOf(1867, false);
      logInfo(`maxItemCountOf(width=1867, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}MaxItemCountOf_0110 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0111
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0111
     * @tc.desc      maxItemCountOf(width=2998, isFoldable=true) returns 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0111 begin`);
      const actual: number = maxItemCountOf(2998, true);
      logInfo(`maxItemCountOf(width=2998, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(18);
      logInfo(`${BUNDLE}MaxItemCountOf_0111 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0112
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0112
     * @tc.desc      maxItemCountOf(width=2998, isFoldable=false) returns 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0112 begin`);
      const actual: number = maxItemCountOf(2998, false);
      logInfo(`maxItemCountOf(width=2998, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}MaxItemCountOf_0112 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0113
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0113
     * @tc.desc      maxItemCountOf(width=264, isFoldable=true) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0113 begin`);
      const actual: number = maxItemCountOf(264, true);
      logInfo(`maxItemCountOf(width=264, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}MaxItemCountOf_0113 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0114
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0114
     * @tc.desc      maxItemCountOf(width=264, isFoldable=false) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0114 begin`);
      const actual: number = maxItemCountOf(264, false);
      logInfo(`maxItemCountOf(width=264, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}MaxItemCountOf_0114 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0115
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0115
     * @tc.desc      maxItemCountOf(width=577, isFoldable=true) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0115 begin`);
      const actual: number = maxItemCountOf(577, true);
      logInfo(`maxItemCountOf(width=577, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}MaxItemCountOf_0115 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0116
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0116
     * @tc.desc      maxItemCountOf(width=577, isFoldable=false) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0116 begin`);
      const actual: number = maxItemCountOf(577, false);
      logInfo(`maxItemCountOf(width=577, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}MaxItemCountOf_0116 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0117
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0117
     * @tc.desc      maxItemCountOf(width=2175, isFoldable=true) returns 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0117 begin`);
      const actual: number = maxItemCountOf(2175, true);
      logInfo(`maxItemCountOf(width=2175, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}MaxItemCountOf_0117 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0118
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0118
     * @tc.desc      maxItemCountOf(width=2175, isFoldable=false) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0118 begin`);
      const actual: number = maxItemCountOf(2175, false);
      logInfo(`maxItemCountOf(width=2175, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}MaxItemCountOf_0118 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0119
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0119
     * @tc.desc      maxItemCountOf(width=1815.47, isFoldable=true) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0119 begin`);
      const actual: number = maxItemCountOf(1815.47, true);
      logInfo(`maxItemCountOf(width=1815.47, isFoldable=...: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}MaxItemCountOf_0119 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0120
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0120
     * @tc.desc      maxItemCountOf(width=1815.47, isFoldable=false) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0120 begin`);
      const actual: number = maxItemCountOf(1815.47, false);
      logInfo(`maxItemCountOf(width=1815.47, isFoldable=...: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}MaxItemCountOf_0120 end`);
    });
  });
}
