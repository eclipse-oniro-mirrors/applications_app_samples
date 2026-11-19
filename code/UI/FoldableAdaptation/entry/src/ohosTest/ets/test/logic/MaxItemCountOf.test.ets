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

/** Logic checks for maxItemCountOf (96 cases). */
export default function maxItemCountOfTest(): void {
  describe('MaxItemCountOfTest', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0001
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0001
     * @tc.desc      maxItemCountOf(width=0, isFoldable=true) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('MaxItemCountOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0001 begin`);
      const actual: number = maxItemCountOf(0, true);
      logInfo(`maxItemCountOf(width=0, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}MaxItemCountOf_0001 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0002
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0002
     * @tc.desc      maxItemCountOf(width=360, isFoldable=true) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('MaxItemCountOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0002 begin`);
      const actual: number = maxItemCountOf(360, true);
      logInfo(`maxItemCountOf(width=360, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}MaxItemCountOf_0002 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0003
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0003
     * @tc.desc      maxItemCountOf(width=720, isFoldable=true) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0003 begin`);
      const actual: number = maxItemCountOf(720, true);
      logInfo(`maxItemCountOf(width=720, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}MaxItemCountOf_0003 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0004
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0004
     * @tc.desc      maxItemCountOf(width=1080, isFoldable=true) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0004 begin`);
      const actual: number = maxItemCountOf(1080, true);
      logInfo(`maxItemCountOf(width=1080, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}MaxItemCountOf_0004 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0005
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0005
     * @tc.desc      maxItemCountOf(width=1920, isFoldable=true) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0005 begin`);
      const actual: number = maxItemCountOf(1920, true);
      logInfo(`maxItemCountOf(width=1920, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}MaxItemCountOf_0005 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0006
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0006
     * @tc.desc      maxItemCountOf(width=1920, isFoldable=false) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0006 begin`);
      const actual: number = maxItemCountOf(1920, false);
      logInfo(`maxItemCountOf(width=1920, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}MaxItemCountOf_0006 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0007
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0007
     * @tc.desc      maxItemCountOf(width=-1, isFoldable=true) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('MaxItemCountOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0007 begin`);
      const actual: number = maxItemCountOf(-1, true);
      logInfo(`maxItemCountOf(width=-1, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MaxItemCountOf_0007 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0008
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0008
     * @tc.desc      maxItemCountOf(width=192, isFoldable=true) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0008 begin`);
      const actual: number = maxItemCountOf(192, true);
      logInfo(`maxItemCountOf(width=192, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}MaxItemCountOf_0008 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0009
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0009
     * @tc.desc      maxItemCountOf(width=480, isFoldable=true) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0009 begin`);
      const actual: number = maxItemCountOf(480, true);
      logInfo(`maxItemCountOf(width=480, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}MaxItemCountOf_0009 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0010
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0010
     * @tc.desc      maxItemCountOf(width=864, isFoldable=true) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0010 begin`);
      const actual: number = maxItemCountOf(864, true);
      logInfo(`maxItemCountOf(width=864, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}MaxItemCountOf_0010 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0011
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0011
     * @tc.desc      maxItemCountOf(width=1152, isFoldable=true) returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0011 begin`);
      const actual: number = maxItemCountOf(1152, true);
      logInfo(`maxItemCountOf(width=1152, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}MaxItemCountOf_0011 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0012
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0012
     * @tc.desc      maxItemCountOf(width=1344, isFoldable=true) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0012 begin`);
      const actual: number = maxItemCountOf(1344, true);
      logInfo(`maxItemCountOf(width=1344, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}MaxItemCountOf_0012 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0013
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0013
     * @tc.desc      maxItemCountOf(width=1440, isFoldable=true) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0013 begin`);
      const actual: number = maxItemCountOf(1440, true);
      logInfo(`maxItemCountOf(width=1440, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}MaxItemCountOf_0013 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0014
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0014
     * @tc.desc      maxItemCountOf(width=1824, isFoldable=true) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0014 begin`);
      const actual: number = maxItemCountOf(1824, true);
      logInfo(`maxItemCountOf(width=1824, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}MaxItemCountOf_0014 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0015
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0015
     * @tc.desc      maxItemCountOf(width=2112, isFoldable=true) returns 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0015 begin`);
      const actual: number = maxItemCountOf(2112, true);
      logInfo(`maxItemCountOf(width=2112, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}MaxItemCountOf_0015 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0016
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0016
     * @tc.desc      maxItemCountOf(width=2304, isFoldable=true) returns 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0016 begin`);
      const actual: number = maxItemCountOf(2304, true);
      logInfo(`maxItemCountOf(width=2304, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}MaxItemCountOf_0016 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0017
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0017
     * @tc.desc      maxItemCountOf(width=2400, isFoldable=true) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0017 begin`);
      const actual: number = maxItemCountOf(2400, true);
      logInfo(`maxItemCountOf(width=2400, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}MaxItemCountOf_0017 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0018
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0018
     * @tc.desc      maxItemCountOf(width=2592, isFoldable=true) returns 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0018 begin`);
      const actual: number = maxItemCountOf(2592, true);
      logInfo(`maxItemCountOf(width=2592, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}MaxItemCountOf_0018 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0019
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0019
     * @tc.desc      maxItemCountOf(width=2688, isFoldable=true) returns 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0019 begin`);
      const actual: number = maxItemCountOf(2688, true);
      logInfo(`maxItemCountOf(width=2688, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(17);
      logInfo(`${BUNDLE}MaxItemCountOf_0019 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0020
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0020
     * @tc.desc      maxItemCountOf(width=2880, isFoldable=true) returns 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0020 begin`);
      const actual: number = maxItemCountOf(2880, true);
      logInfo(`maxItemCountOf(width=2880, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(18);
      logInfo(`${BUNDLE}MaxItemCountOf_0020 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0021
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0021
     * @tc.desc      maxItemCountOf(width=3072, isFoldable=true) returns 19
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0021 begin`);
      const actual: number = maxItemCountOf(3072, true);
      logInfo(`maxItemCountOf(width=3072, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(19);
      logInfo(`${BUNDLE}MaxItemCountOf_0021 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0022
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0022
     * @tc.desc      maxItemCountOf(width=3168, isFoldable=true) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0022 begin`);
      const actual: number = maxItemCountOf(3168, true);
      logInfo(`maxItemCountOf(width=3168, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}MaxItemCountOf_0022 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0023
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0023
     * @tc.desc      maxItemCountOf(width=3360, isFoldable=true) returns 21
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0023 begin`);
      const actual: number = maxItemCountOf(3360, true);
      logInfo(`maxItemCountOf(width=3360, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(21);
      logInfo(`${BUNDLE}MaxItemCountOf_0023 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0024
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0024
     * @tc.desc      maxItemCountOf(width=3552, isFoldable=true) returns 22
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0024 begin`);
      const actual: number = maxItemCountOf(3552, true);
      logInfo(`maxItemCountOf(width=3552, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(22);
      logInfo(`${BUNDLE}MaxItemCountOf_0024 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0025
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0025
     * @tc.desc      maxItemCountOf(width=3648, isFoldable=true) returns 23
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0025 begin`);
      const actual: number = maxItemCountOf(3648, true);
      logInfo(`maxItemCountOf(width=3648, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(23);
      logInfo(`${BUNDLE}MaxItemCountOf_0025 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0026
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0026
     * @tc.desc      maxItemCountOf(width=3840, isFoldable=true) returns 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0026 begin`);
      const actual: number = maxItemCountOf(3840, true);
      logInfo(`maxItemCountOf(width=3840, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}MaxItemCountOf_0026 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0027
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0027
     * @tc.desc      maxItemCountOf(width=-1914, isFoldable=true) returns -13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('MaxItemCountOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0027 begin`);
      const actual: number = maxItemCountOf(-1914, true);
      logInfo(`maxItemCountOf(width=-1914, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(-13);
      logInfo(`${BUNDLE}MaxItemCountOf_0027 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0028
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0028
     * @tc.desc      maxItemCountOf(width=-1914, isFoldable=false) returns -11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('MaxItemCountOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0028 begin`);
      const actual: number = maxItemCountOf(-1914, false);
      logInfo(`maxItemCountOf(width=-1914, isFoldable=fa...: actual=${actual}`);
      expect(actual).assertEqual(-11);
      logInfo(`${BUNDLE}MaxItemCountOf_0028 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0029
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0029
     * @tc.desc      maxItemCountOf(width=-529, isFoldable=true) returns -4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('MaxItemCountOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0029 begin`);
      const actual: number = maxItemCountOf(-529, true);
      logInfo(`maxItemCountOf(width=-529, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(-4);
      logInfo(`${BUNDLE}MaxItemCountOf_0029 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0030
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0030
     * @tc.desc      maxItemCountOf(width=-529, isFoldable=false) returns -3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('MaxItemCountOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0030 begin`);
      const actual: number = maxItemCountOf(-529, false);
      logInfo(`maxItemCountOf(width=-529, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(-3);
      logInfo(`${BUNDLE}MaxItemCountOf_0030 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0031
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0031
     * @tc.desc      maxItemCountOf(width=0, isFoldable=false) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0031 begin`);
      const actual: number = maxItemCountOf(0, false);
      logInfo(`maxItemCountOf(width=0, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}MaxItemCountOf_0031 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0032
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0032
     * @tc.desc      maxItemCountOf(width=1, isFoldable=true) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0032 begin`);
      const actual: number = maxItemCountOf(1, true);
      logInfo(`maxItemCountOf(width=1, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}MaxItemCountOf_0032 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0033
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0033
     * @tc.desc      maxItemCountOf(width=1, isFoldable=false) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0033 begin`);
      const actual: number = maxItemCountOf(1, false);
      logInfo(`maxItemCountOf(width=1, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}MaxItemCountOf_0033 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0034
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0034
     * @tc.desc      maxItemCountOf(width=100, isFoldable=true) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0034 begin`);
      const actual: number = maxItemCountOf(100, true);
      logInfo(`maxItemCountOf(width=100, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}MaxItemCountOf_0034 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0035
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0035
     * @tc.desc      maxItemCountOf(width=100, isFoldable=false) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0035 begin`);
      const actual: number = maxItemCountOf(100, false);
      logInfo(`maxItemCountOf(width=100, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}MaxItemCountOf_0035 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0036
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0036
     * @tc.desc      maxItemCountOf(width=360, isFoldable=false) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0036 begin`);
      const actual: number = maxItemCountOf(360, false);
      logInfo(`maxItemCountOf(width=360, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}MaxItemCountOf_0036 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0037
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0037
     * @tc.desc      maxItemCountOf(width=720, isFoldable=false) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0037 begin`);
      const actual: number = maxItemCountOf(720, false);
      logInfo(`maxItemCountOf(width=720, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}MaxItemCountOf_0037 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0038
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0038
     * @tc.desc      maxItemCountOf(width=1080, isFoldable=false) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0038 begin`);
      const actual: number = maxItemCountOf(1080, false);
      logInfo(`maxItemCountOf(width=1080, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}MaxItemCountOf_0038 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0039
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0039
     * @tc.desc      maxItemCountOf(width=-1, isFoldable=false) returns -1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('MaxItemCountOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0039 begin`);
      const actual: number = maxItemCountOf(-1, false);
      logInfo(`maxItemCountOf(width=-1, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(-1);
      logInfo(`${BUNDLE}MaxItemCountOf_0039 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0040
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0040
     * @tc.desc      maxItemCountOf(width=2, isFoldable=true) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0040 begin`);
      const actual: number = maxItemCountOf(2, true);
      logInfo(`maxItemCountOf(width=2, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}MaxItemCountOf_0040 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0041
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0041
     * @tc.desc      maxItemCountOf(width=2, isFoldable=false) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0041 begin`);
      const actual: number = maxItemCountOf(2, false);
      logInfo(`maxItemCountOf(width=2, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}MaxItemCountOf_0041 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0042
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0042
     * @tc.desc      maxItemCountOf(width=3, isFoldable=true) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0042 begin`);
      const actual: number = maxItemCountOf(3, true);
      logInfo(`maxItemCountOf(width=3, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}MaxItemCountOf_0042 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0043
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0043
     * @tc.desc      maxItemCountOf(width=3, isFoldable=false) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0043 begin`);
      const actual: number = maxItemCountOf(3, false);
      logInfo(`maxItemCountOf(width=3, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}MaxItemCountOf_0043 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0044
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0044
     * @tc.desc      maxItemCountOf(width=10, isFoldable=true) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0044 begin`);
      const actual: number = maxItemCountOf(10, true);
      logInfo(`maxItemCountOf(width=10, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}MaxItemCountOf_0044 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0045
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0045
     * @tc.desc      maxItemCountOf(width=10, isFoldable=false) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0045 begin`);
      const actual: number = maxItemCountOf(10, false);
      logInfo(`maxItemCountOf(width=10, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}MaxItemCountOf_0045 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0046
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0046
     * @tc.desc      maxItemCountOf(width=96, isFoldable=true) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0046 begin`);
      const actual: number = maxItemCountOf(96, true);
      logInfo(`maxItemCountOf(width=96, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}MaxItemCountOf_0046 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0047
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0047
     * @tc.desc      maxItemCountOf(width=96, isFoldable=false) returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0047 begin`);
      const actual: number = maxItemCountOf(96, false);
      logInfo(`maxItemCountOf(width=96, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}MaxItemCountOf_0047 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0048
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0048
     * @tc.desc      maxItemCountOf(width=192, isFoldable=false) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0048 begin`);
      const actual: number = maxItemCountOf(192, false);
      logInfo(`maxItemCountOf(width=192, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}MaxItemCountOf_0048 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0049
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0049
     * @tc.desc      maxItemCountOf(width=288, isFoldable=true) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0049 begin`);
      const actual: number = maxItemCountOf(288, true);
      logInfo(`maxItemCountOf(width=288, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}MaxItemCountOf_0049 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0050
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0050
     * @tc.desc      maxItemCountOf(width=288, isFoldable=false) returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0050 begin`);
      const actual: number = maxItemCountOf(288, false);
      logInfo(`maxItemCountOf(width=288, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}MaxItemCountOf_0050 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0051
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0051
     * @tc.desc      maxItemCountOf(width=384, isFoldable=true) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0051 begin`);
      const actual: number = maxItemCountOf(384, true);
      logInfo(`maxItemCountOf(width=384, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}MaxItemCountOf_0051 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0052
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0052
     * @tc.desc      maxItemCountOf(width=384, isFoldable=false) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0052 begin`);
      const actual: number = maxItemCountOf(384, false);
      logInfo(`maxItemCountOf(width=384, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}MaxItemCountOf_0052 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0053
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0053
     * @tc.desc      maxItemCountOf(width=480, isFoldable=false) returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0053 begin`);
      const actual: number = maxItemCountOf(480, false);
      logInfo(`maxItemCountOf(width=480, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}MaxItemCountOf_0053 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0054
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0054
     * @tc.desc      maxItemCountOf(width=576, isFoldable=true) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0054 begin`);
      const actual: number = maxItemCountOf(576, true);
      logInfo(`maxItemCountOf(width=576, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}MaxItemCountOf_0054 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0055
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0055
     * @tc.desc      maxItemCountOf(width=576, isFoldable=false) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0055 begin`);
      const actual: number = maxItemCountOf(576, false);
      logInfo(`maxItemCountOf(width=576, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}MaxItemCountOf_0055 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0056
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0056
     * @tc.desc      maxItemCountOf(width=672, isFoldable=true) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0056 begin`);
      const actual: number = maxItemCountOf(672, true);
      logInfo(`maxItemCountOf(width=672, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}MaxItemCountOf_0056 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0057
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0057
     * @tc.desc      maxItemCountOf(width=672, isFoldable=false) returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0057 begin`);
      const actual: number = maxItemCountOf(672, false);
      logInfo(`maxItemCountOf(width=672, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}MaxItemCountOf_0057 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0058
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0058
     * @tc.desc      maxItemCountOf(width=768, isFoldable=true) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0058 begin`);
      const actual: number = maxItemCountOf(768, true);
      logInfo(`maxItemCountOf(width=768, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}MaxItemCountOf_0058 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0059
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0059
     * @tc.desc      maxItemCountOf(width=768, isFoldable=false) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0059 begin`);
      const actual: number = maxItemCountOf(768, false);
      logInfo(`maxItemCountOf(width=768, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}MaxItemCountOf_0059 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0060
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0060
     * @tc.desc      maxItemCountOf(width=864, isFoldable=false) returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0060 begin`);
      const actual: number = maxItemCountOf(864, false);
      logInfo(`maxItemCountOf(width=864, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}MaxItemCountOf_0060 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0061
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0061
     * @tc.desc      maxItemCountOf(width=960, isFoldable=true) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0061 begin`);
      const actual: number = maxItemCountOf(960, true);
      logInfo(`maxItemCountOf(width=960, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}MaxItemCountOf_0061 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0062
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0062
     * @tc.desc      maxItemCountOf(width=960, isFoldable=false) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0062 begin`);
      const actual: number = maxItemCountOf(960, false);
      logInfo(`maxItemCountOf(width=960, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}MaxItemCountOf_0062 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0063
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0063
     * @tc.desc      maxItemCountOf(width=1056, isFoldable=true) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0063 begin`);
      const actual: number = maxItemCountOf(1056, true);
      logInfo(`maxItemCountOf(width=1056, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}MaxItemCountOf_0063 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0064
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0064
     * @tc.desc      maxItemCountOf(width=1056, isFoldable=false) returns 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0064 begin`);
      const actual: number = maxItemCountOf(1056, false);
      logInfo(`maxItemCountOf(width=1056, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}MaxItemCountOf_0064 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0065
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0065
     * @tc.desc      maxItemCountOf(width=1152, isFoldable=false) returns 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0065 begin`);
      const actual: number = maxItemCountOf(1152, false);
      logInfo(`maxItemCountOf(width=1152, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}MaxItemCountOf_0065 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0066
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0066
     * @tc.desc      maxItemCountOf(width=1248, isFoldable=true) returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0066 begin`);
      const actual: number = maxItemCountOf(1248, true);
      logInfo(`maxItemCountOf(width=1248, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}MaxItemCountOf_0066 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0067
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0067
     * @tc.desc      maxItemCountOf(width=1248, isFoldable=false) returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0067 begin`);
      const actual: number = maxItemCountOf(1248, false);
      logInfo(`maxItemCountOf(width=1248, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}MaxItemCountOf_0067 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0068
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0068
     * @tc.desc      maxItemCountOf(width=1344, isFoldable=false) returns 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0068 begin`);
      const actual: number = maxItemCountOf(1344, false);
      logInfo(`maxItemCountOf(width=1344, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}MaxItemCountOf_0068 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0069
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0069
     * @tc.desc      maxItemCountOf(width=1440, isFoldable=false) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0069 begin`);
      const actual: number = maxItemCountOf(1440, false);
      logInfo(`maxItemCountOf(width=1440, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}MaxItemCountOf_0069 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0070
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0070
     * @tc.desc      maxItemCountOf(width=1536, isFoldable=true) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0070 begin`);
      const actual: number = maxItemCountOf(1536, true);
      logInfo(`maxItemCountOf(width=1536, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}MaxItemCountOf_0070 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0071
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0071
     * @tc.desc      maxItemCountOf(width=1536, isFoldable=false) returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0071 begin`);
      const actual: number = maxItemCountOf(1536, false);
      logInfo(`maxItemCountOf(width=1536, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}MaxItemCountOf_0071 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0072
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0072
     * @tc.desc      maxItemCountOf(width=1632, isFoldable=true) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0072 begin`);
      const actual: number = maxItemCountOf(1632, true);
      logInfo(`maxItemCountOf(width=1632, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}MaxItemCountOf_0072 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0073
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0073
     * @tc.desc      maxItemCountOf(width=1632, isFoldable=false) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0073 begin`);
      const actual: number = maxItemCountOf(1632, false);
      logInfo(`maxItemCountOf(width=1632, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}MaxItemCountOf_0073 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0074
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0074
     * @tc.desc      maxItemCountOf(width=1728, isFoldable=true) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0074 begin`);
      const actual: number = maxItemCountOf(1728, true);
      logInfo(`maxItemCountOf(width=1728, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}MaxItemCountOf_0074 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0075
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0075
     * @tc.desc      maxItemCountOf(width=1728, isFoldable=false) returns 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0075 begin`);
      const actual: number = maxItemCountOf(1728, false);
      logInfo(`maxItemCountOf(width=1728, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}MaxItemCountOf_0075 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0076
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0076
     * @tc.desc      maxItemCountOf(width=1824, isFoldable=false) returns 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0076 begin`);
      const actual: number = maxItemCountOf(1824, false);
      logInfo(`maxItemCountOf(width=1824, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}MaxItemCountOf_0076 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0077
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0077
     * @tc.desc      maxItemCountOf(width=2016, isFoldable=true) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0077 begin`);
      const actual: number = maxItemCountOf(2016, true);
      logInfo(`maxItemCountOf(width=2016, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}MaxItemCountOf_0077 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0078
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0078
     * @tc.desc      maxItemCountOf(width=2016, isFoldable=false) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0078 begin`);
      const actual: number = maxItemCountOf(2016, false);
      logInfo(`maxItemCountOf(width=2016, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}MaxItemCountOf_0078 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0079
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0079
     * @tc.desc      maxItemCountOf(width=2112, isFoldable=false) returns 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0079 begin`);
      const actual: number = maxItemCountOf(2112, false);
      logInfo(`maxItemCountOf(width=2112, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}MaxItemCountOf_0079 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0080
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0080
     * @tc.desc      maxItemCountOf(width=2208, isFoldable=true) returns 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0080 begin`);
      const actual: number = maxItemCountOf(2208, true);
      logInfo(`maxItemCountOf(width=2208, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}MaxItemCountOf_0080 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0081
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0081
     * @tc.desc      maxItemCountOf(width=2208, isFoldable=false) returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0081 begin`);
      const actual: number = maxItemCountOf(2208, false);
      logInfo(`maxItemCountOf(width=2208, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}MaxItemCountOf_0081 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0082
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0082
     * @tc.desc      maxItemCountOf(width=2304, isFoldable=false) returns 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0082 begin`);
      const actual: number = maxItemCountOf(2304, false);
      logInfo(`maxItemCountOf(width=2304, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}MaxItemCountOf_0082 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0083
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0083
     * @tc.desc      maxItemCountOf(width=2400, isFoldable=false) returns 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0083 begin`);
      const actual: number = maxItemCountOf(2400, false);
      logInfo(`maxItemCountOf(width=2400, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}MaxItemCountOf_0083 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0084
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0084
     * @tc.desc      maxItemCountOf(width=2496, isFoldable=true) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0084 begin`);
      const actual: number = maxItemCountOf(2496, true);
      logInfo(`maxItemCountOf(width=2496, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}MaxItemCountOf_0084 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0085
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0085
     * @tc.desc      maxItemCountOf(width=2496, isFoldable=false) returns 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0085 begin`);
      const actual: number = maxItemCountOf(2496, false);
      logInfo(`maxItemCountOf(width=2496, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}MaxItemCountOf_0085 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0086
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0086
     * @tc.desc      maxItemCountOf(width=2592, isFoldable=false) returns 14
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0086 begin`);
      const actual: number = maxItemCountOf(2592, false);
      logInfo(`maxItemCountOf(width=2592, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(14);
      logInfo(`${BUNDLE}MaxItemCountOf_0086 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0087
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0087
     * @tc.desc      maxItemCountOf(width=2688, isFoldable=false) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0087 begin`);
      const actual: number = maxItemCountOf(2688, false);
      logInfo(`maxItemCountOf(width=2688, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}MaxItemCountOf_0087 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0088
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0088
     * @tc.desc      maxItemCountOf(width=2784, isFoldable=true) returns 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0088 begin`);
      const actual: number = maxItemCountOf(2784, true);
      logInfo(`maxItemCountOf(width=2784, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(17);
      logInfo(`${BUNDLE}MaxItemCountOf_0088 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0089
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0089
     * @tc.desc      maxItemCountOf(width=2784, isFoldable=false) returns 15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0089 begin`);
      const actual: number = maxItemCountOf(2784, false);
      logInfo(`maxItemCountOf(width=2784, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(15);
      logInfo(`${BUNDLE}MaxItemCountOf_0089 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0090
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0090
     * @tc.desc      maxItemCountOf(width=2880, isFoldable=false) returns 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0090 begin`);
      const actual: number = maxItemCountOf(2880, false);
      logInfo(`maxItemCountOf(width=2880, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}MaxItemCountOf_0090 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0091
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0091
     * @tc.desc      maxItemCountOf(width=2976, isFoldable=true) returns 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0091 begin`);
      const actual: number = maxItemCountOf(2976, true);
      logInfo(`maxItemCountOf(width=2976, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(18);
      logInfo(`${BUNDLE}MaxItemCountOf_0091 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0092
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0092
     * @tc.desc      maxItemCountOf(width=2976, isFoldable=false) returns 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0092 begin`);
      const actual: number = maxItemCountOf(2976, false);
      logInfo(`maxItemCountOf(width=2976, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}MaxItemCountOf_0092 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0093
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0093
     * @tc.desc      maxItemCountOf(width=3072, isFoldable=false) returns 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0093 begin`);
      const actual: number = maxItemCountOf(3072, false);
      logInfo(`maxItemCountOf(width=3072, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(17);
      logInfo(`${BUNDLE}MaxItemCountOf_0093 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0094
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0094
     * @tc.desc      maxItemCountOf(width=3168, isFoldable=false) returns 17
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0094 begin`);
      const actual: number = maxItemCountOf(3168, false);
      logInfo(`maxItemCountOf(width=3168, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(17);
      logInfo(`${BUNDLE}MaxItemCountOf_0094 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0095
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0095
     * @tc.desc      maxItemCountOf(width=3264, isFoldable=true) returns 20
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0095 begin`);
      const actual: number = maxItemCountOf(3264, true);
      logInfo(`maxItemCountOf(width=3264, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual(20);
      logInfo(`${BUNDLE}MaxItemCountOf_0095 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_MAX_ITEM_COUNT_OF_0096
     * @tc.name      FoldableAdaptation_MaxItemCountOf_0096
     * @tc.desc      maxItemCountOf(width=3264, isFoldable=false) returns 18
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('MaxItemCountOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}MaxItemCountOf_0096 begin`);
      const actual: number = maxItemCountOf(3264, false);
      logInfo(`maxItemCountOf(width=3264, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual(18);
      logInfo(`${BUNDLE}MaxItemCountOf_0096 end`);
    });
  });
}
