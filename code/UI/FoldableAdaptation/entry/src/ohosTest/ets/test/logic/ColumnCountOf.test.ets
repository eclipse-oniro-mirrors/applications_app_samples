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
import { columnCountOf } from '../model/FoldLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FoldableAdaptation]';
const BUNDLE: string = 'FoldableAdaptation_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for columnCountOf (96 cases). */
export default function columnCountOfTest(): void {
  describe('ColumnCountOfTest', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0001
     * @tc.name      FoldableAdaptation_ColumnCountOf_0001
     * @tc.desc      columnCountOf(template="") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ColumnCountOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0001 begin`);
      const actual: number = columnCountOf('');
      logInfo(`columnCountOf(template=""): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ColumnCountOf_0001 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0002
     * @tc.name      FoldableAdaptation_ColumnCountOf_0002
     * @tc.desc      columnCountOf(template="a") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ColumnCountOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0002 begin`);
      const actual: number = columnCountOf('a');
      logInfo(`columnCountOf(template="a"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0002 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0003
     * @tc.name      FoldableAdaptation_ColumnCountOf_0003
     * @tc.desc      columnCountOf(template="Hello World") returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0003 begin`);
      const actual: number = columnCountOf('Hello World');
      logInfo(`columnCountOf(template="Hello World"): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ColumnCountOf_0003 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0004
     * @tc.name      FoldableAdaptation_ColumnCountOf_0004
     * @tc.desc      columnCountOf(template="Hello WorldHello World") returns 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0004 begin`);
      const actual: number = columnCountOf('Hello WorldHello World');
      logInfo(`columnCountOf(template="Hello WorldHello ...: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}ColumnCountOf_0004 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0005
     * @tc.name      FoldableAdaptation_ColumnCountOf_0005
     * @tc.desc      columnCountOf(template="abc") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0005 begin`);
      const actual: number = columnCountOf('abc');
      logInfo(`columnCountOf(template="abc"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0005 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0006
     * @tc.name      FoldableAdaptation_ColumnCountOf_0006
     * @tc.desc      columnCountOf(template=" ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0006 begin`);
      const actual: number = columnCountOf(' ');
      logInfo(`columnCountOf(template=" "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ColumnCountOf_0006 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0007
     * @tc.name      FoldableAdaptation_ColumnCountOf_0007
     * @tc.desc      columnCountOf(template="123") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0007 begin`);
      const actual: number = columnCountOf('123');
      logInfo(`columnCountOf(template="123"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0007 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0008
     * @tc.name      FoldableAdaptation_ColumnCountOf_0008
     * @tc.desc      columnCountOf(template=" a ") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ColumnCountOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0008 begin`);
      const actual: number = columnCountOf(' a ');
      logInfo(`columnCountOf(template=" a "): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0008 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0009
     * @tc.name      FoldableAdaptation_ColumnCountOf_0009
     * @tc.desc      columnCountOf(template="aa") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0009 begin`);
      const actual: number = columnCountOf('aa');
      logInfo(`columnCountOf(template="aa"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0009 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0010
     * @tc.name      FoldableAdaptation_ColumnCountOf_0010
     * @tc.desc      columnCountOf(template="a_1") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0010 begin`);
      const actual: number = columnCountOf('a_1');
      logInfo(`columnCountOf(template="a_1"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0010 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0011
     * @tc.name      FoldableAdaptation_ColumnCountOf_0011
     * @tc.desc      columnCountOf(template="xa") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ColumnCountOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0011 begin`);
      const actual: number = columnCountOf('xa');
      logInfo(`columnCountOf(template="xa"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0011 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0012
     * @tc.name      FoldableAdaptation_ColumnCountOf_0012
     * @tc.desc      columnCountOf(template=" abc ") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ColumnCountOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0012 begin`);
      const actual: number = columnCountOf(' abc ');
      logInfo(`columnCountOf(template=" abc "): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0012 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0013
     * @tc.name      FoldableAdaptation_ColumnCountOf_0013
     * @tc.desc      columnCountOf(template="abcabc") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0013 begin`);
      const actual: number = columnCountOf('abcabc');
      logInfo(`columnCountOf(template="abcabc"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0013 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0014
     * @tc.name      FoldableAdaptation_ColumnCountOf_0014
     * @tc.desc      columnCountOf(template="abc_1") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0014 begin`);
      const actual: number = columnCountOf('abc_1');
      logInfo(`columnCountOf(template="abc_1"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0014 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0015
     * @tc.name      FoldableAdaptation_ColumnCountOf_0015
     * @tc.desc      columnCountOf(template="xabc") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ColumnCountOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0015 begin`);
      const actual: number = columnCountOf('xabc');
      logInfo(`columnCountOf(template="xabc"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0015 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0016
     * @tc.name      FoldableAdaptation_ColumnCountOf_0016
     * @tc.desc      columnCountOf(template=" Hello World ") returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ColumnCountOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0016 begin`);
      const actual: number = columnCountOf(' Hello World ');
      logInfo(`columnCountOf(template=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ColumnCountOf_0016 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0017
     * @tc.name      FoldableAdaptation_ColumnCountOf_0017
     * @tc.desc      columnCountOf(template="Hello World_1") returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0017 begin`);
      const actual: number = columnCountOf('Hello World_1');
      logInfo(`columnCountOf(template="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ColumnCountOf_0017 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0018
     * @tc.name      FoldableAdaptation_ColumnCountOf_0018
     * @tc.desc      columnCountOf(template="xHello World") returns 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ColumnCountOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0018 begin`);
      const actual: number = columnCountOf('xHello World');
      logInfo(`columnCountOf(template="xHello World"): actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ColumnCountOf_0018 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0019
     * @tc.name      FoldableAdaptation_ColumnCountOf_0019
     * @tc.desc      columnCountOf(template="   ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ColumnCountOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0019 begin`);
      const actual: number = columnCountOf('   ');
      logInfo(`columnCountOf(template="   "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ColumnCountOf_0019 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0020
     * @tc.name      FoldableAdaptation_ColumnCountOf_0020
     * @tc.desc      columnCountOf(template="  ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0020 begin`);
      const actual: number = columnCountOf('  ');
      logInfo(`columnCountOf(template="  "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ColumnCountOf_0020 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0021
     * @tc.name      FoldableAdaptation_ColumnCountOf_0021
     * @tc.desc      columnCountOf(template=" _1") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0021 begin`);
      const actual: number = columnCountOf(' _1');
      logInfo(`columnCountOf(template=" _1"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0021 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0022
     * @tc.name      FoldableAdaptation_ColumnCountOf_0022
     * @tc.desc      columnCountOf(template="x ") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ColumnCountOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0022 begin`);
      const actual: number = columnCountOf('x ');
      logInfo(`columnCountOf(template="x "): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0022 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0023
     * @tc.name      FoldableAdaptation_ColumnCountOf_0023
     * @tc.desc      columnCountOf(template=" 123 ") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ColumnCountOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0023 begin`);
      const actual: number = columnCountOf(' 123 ');
      logInfo(`columnCountOf(template=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0023 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0024
     * @tc.name      FoldableAdaptation_ColumnCountOf_0024
     * @tc.desc      columnCountOf(template="123123") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0024 begin`);
      const actual: number = columnCountOf('123123');
      logInfo(`columnCountOf(template="123123"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0024 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0025
     * @tc.name      FoldableAdaptation_ColumnCountOf_0025
     * @tc.desc      columnCountOf(template="123_1") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0025 begin`);
      const actual: number = columnCountOf('123_1');
      logInfo(`columnCountOf(template="123_1"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0025 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0026
     * @tc.name      FoldableAdaptation_ColumnCountOf_0026
     * @tc.desc      columnCountOf(template="x123") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ColumnCountOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0026 begin`);
      const actual: number = columnCountOf('x123');
      logInfo(`columnCountOf(template="x123"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0026 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0027
     * @tc.name      FoldableAdaptation_ColumnCountOf_0027
     * @tc.desc      columnCountOf(template="e1S00PztU") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0027 begin`);
      const actual: number = columnCountOf('e1S00PztU');
      logInfo(`columnCountOf(template="e1S00PztU"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0027 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0028
     * @tc.name      FoldableAdaptation_ColumnCountOf_0028
     * @tc.desc      columnCountOf(template="7") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0028 begin`);
      const actual: number = columnCountOf('7');
      logInfo(`columnCountOf(template="7"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0028 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0029
     * @tc.name      FoldableAdaptation_ColumnCountOf_0029
     * @tc.desc      columnCountOf(template="ecVc0Gl") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0029 begin`);
      const actual: number = columnCountOf('ecVc0Gl');
      logInfo(`columnCountOf(template="ecVc0Gl"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0029 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0030
     * @tc.name      FoldableAdaptation_ColumnCountOf_0030
     * @tc.desc      columnCountOf(template="3m3I3798GxOJ") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0030 begin`);
      const actual: number = columnCountOf('3m3I3798GxOJ');
      logInfo(`columnCountOf(template="3m3I3798GxOJ"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0030 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0031
     * @tc.name      FoldableAdaptation_ColumnCountOf_0031
     * @tc.desc      columnCountOf(template="aB5zC5KBf") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0031 begin`);
      const actual: number = columnCountOf('aB5zC5KBf');
      logInfo(`columnCountOf(template="aB5zC5KBf"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0031 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0032
     * @tc.name      FoldableAdaptation_ColumnCountOf_0032
     * @tc.desc      columnCountOf(template="6xgojp") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0032 begin`);
      const actual: number = columnCountOf('6xgojp');
      logInfo(`columnCountOf(template="6xgojp"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0032 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0033
     * @tc.name      FoldableAdaptation_ColumnCountOf_0033
     * @tc.desc      columnCountOf(template="A7E41W") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0033 begin`);
      const actual: number = columnCountOf('A7E41W');
      logInfo(`columnCountOf(template="A7E41W"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0033 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0034
     * @tc.name      FoldableAdaptation_ColumnCountOf_0034
     * @tc.desc      columnCountOf(template="7pdn39") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0034 begin`);
      const actual: number = columnCountOf('7pdn39');
      logInfo(`columnCountOf(template="7pdn39"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0034 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0035
     * @tc.name      FoldableAdaptation_ColumnCountOf_0035
     * @tc.desc      columnCountOf(template="09vpUwRR") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0035 begin`);
      const actual: number = columnCountOf('09vpUwRR');
      logInfo(`columnCountOf(template="09vpUwRR"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0035 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0036
     * @tc.name      FoldableAdaptation_ColumnCountOf_0036
     * @tc.desc      columnCountOf(template="wPXnPj") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0036 begin`);
      const actual: number = columnCountOf('wPXnPj');
      logInfo(`columnCountOf(template="wPXnPj"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0036 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0037
     * @tc.name      FoldableAdaptation_ColumnCountOf_0037
     * @tc.desc      columnCountOf(template="FC4h") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0037 begin`);
      const actual: number = columnCountOf('FC4h');
      logInfo(`columnCountOf(template="FC4h"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0037 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0038
     * @tc.name      FoldableAdaptation_ColumnCountOf_0038
     * @tc.desc      columnCountOf(template="gaNV") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0038 begin`);
      const actual: number = columnCountOf('gaNV');
      logInfo(`columnCountOf(template="gaNV"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0038 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0039
     * @tc.name      FoldableAdaptation_ColumnCountOf_0039
     * @tc.desc      columnCountOf(template="9vJpp7KMGtEg") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0039 begin`);
      const actual: number = columnCountOf('9vJpp7KMGtEg');
      logInfo(`columnCountOf(template="9vJpp7KMGtEg"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0039 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0040
     * @tc.name      FoldableAdaptation_ColumnCountOf_0040
     * @tc.desc      columnCountOf(template="vcMdF") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0040 begin`);
      const actual: number = columnCountOf('vcMdF');
      logInfo(`columnCountOf(template="vcMdF"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0040 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0041
     * @tc.name      FoldableAdaptation_ColumnCountOf_0041
     * @tc.desc      columnCountOf(template="4j6") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0041 begin`);
      const actual: number = columnCountOf('4j6');
      logInfo(`columnCountOf(template="4j6"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0041 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0042
     * @tc.name      FoldableAdaptation_ColumnCountOf_0042
     * @tc.desc      columnCountOf(template="thYlX8l24hN") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0042 begin`);
      const actual: number = columnCountOf('thYlX8l24hN');
      logInfo(`columnCountOf(template="thYlX8l24hN"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0042 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0043
     * @tc.name      FoldableAdaptation_ColumnCountOf_0043
     * @tc.desc      columnCountOf(template="W4") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0043 begin`);
      const actual: number = columnCountOf('W4');
      logInfo(`columnCountOf(template="W4"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0043 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0044
     * @tc.name      FoldableAdaptation_ColumnCountOf_0044
     * @tc.desc      columnCountOf(template="Wc") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0044 begin`);
      const actual: number = columnCountOf('Wc');
      logInfo(`columnCountOf(template="Wc"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0044 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0045
     * @tc.name      FoldableAdaptation_ColumnCountOf_0045
     * @tc.desc      columnCountOf(template="i43Jf2ryTc") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0045 begin`);
      const actual: number = columnCountOf('i43Jf2ryTc');
      logInfo(`columnCountOf(template="i43Jf2ryTc"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0045 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0046
     * @tc.name      FoldableAdaptation_ColumnCountOf_0046
     * @tc.desc      columnCountOf(template="r0u2cFiLei97") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0046 begin`);
      const actual: number = columnCountOf('r0u2cFiLei97');
      logInfo(`columnCountOf(template="r0u2cFiLei97"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0046 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0047
     * @tc.name      FoldableAdaptation_ColumnCountOf_0047
     * @tc.desc      columnCountOf(template="SuL6W") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0047 begin`);
      const actual: number = columnCountOf('SuL6W');
      logInfo(`columnCountOf(template="SuL6W"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0047 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0048
     * @tc.name      FoldableAdaptation_ColumnCountOf_0048
     * @tc.desc      columnCountOf(template="Jz") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0048 begin`);
      const actual: number = columnCountOf('Jz');
      logInfo(`columnCountOf(template="Jz"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0048 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0049
     * @tc.name      FoldableAdaptation_ColumnCountOf_0049
     * @tc.desc      columnCountOf(template="Rb0imDrd") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0049 begin`);
      const actual: number = columnCountOf('Rb0imDrd');
      logInfo(`columnCountOf(template="Rb0imDrd"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0049 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0050
     * @tc.name      FoldableAdaptation_ColumnCountOf_0050
     * @tc.desc      columnCountOf(template="kyL") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0050 begin`);
      const actual: number = columnCountOf('kyL');
      logInfo(`columnCountOf(template="kyL"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0050 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0051
     * @tc.name      FoldableAdaptation_ColumnCountOf_0051
     * @tc.desc      columnCountOf(template="fnCzD") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0051 begin`);
      const actual: number = columnCountOf('fnCzD');
      logInfo(`columnCountOf(template="fnCzD"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0051 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0052
     * @tc.name      FoldableAdaptation_ColumnCountOf_0052
     * @tc.desc      columnCountOf(template="TnzWaN7OATsQ") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0052 begin`);
      const actual: number = columnCountOf('TnzWaN7OATsQ');
      logInfo(`columnCountOf(template="TnzWaN7OATsQ"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0052 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0053
     * @tc.name      FoldableAdaptation_ColumnCountOf_0053
     * @tc.desc      columnCountOf(template="ChO") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0053 begin`);
      const actual: number = columnCountOf('ChO');
      logInfo(`columnCountOf(template="ChO"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0053 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0054
     * @tc.name      FoldableAdaptation_ColumnCountOf_0054
     * @tc.desc      columnCountOf(template="i2ze") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0054 begin`);
      const actual: number = columnCountOf('i2ze');
      logInfo(`columnCountOf(template="i2ze"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0054 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0055
     * @tc.name      FoldableAdaptation_ColumnCountOf_0055
     * @tc.desc      columnCountOf(template="2RA4A7") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0055 begin`);
      const actual: number = columnCountOf('2RA4A7');
      logInfo(`columnCountOf(template="2RA4A7"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0055 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0056
     * @tc.name      FoldableAdaptation_ColumnCountOf_0056
     * @tc.desc      columnCountOf(template="DmIQHfhlQir") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0056 begin`);
      const actual: number = columnCountOf('DmIQHfhlQir');
      logInfo(`columnCountOf(template="DmIQHfhlQir"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0056 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0057
     * @tc.name      FoldableAdaptation_ColumnCountOf_0057
     * @tc.desc      columnCountOf(template="tAAa") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0057 begin`);
      const actual: number = columnCountOf('tAAa');
      logInfo(`columnCountOf(template="tAAa"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0057 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0058
     * @tc.name      FoldableAdaptation_ColumnCountOf_0058
     * @tc.desc      columnCountOf(template="3v4bmTb") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0058 begin`);
      const actual: number = columnCountOf('3v4bmTb');
      logInfo(`columnCountOf(template="3v4bmTb"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0058 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0059
     * @tc.name      FoldableAdaptation_ColumnCountOf_0059
     * @tc.desc      columnCountOf(template="i73A6CCvWq") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0059 begin`);
      const actual: number = columnCountOf('i73A6CCvWq');
      logInfo(`columnCountOf(template="i73A6CCvWq"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0059 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0060
     * @tc.name      FoldableAdaptation_ColumnCountOf_0060
     * @tc.desc      columnCountOf(template="Wf3u5RBmB0A") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0060 begin`);
      const actual: number = columnCountOf('Wf3u5RBmB0A');
      logInfo(`columnCountOf(template="Wf3u5RBmB0A"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0060 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0061
     * @tc.name      FoldableAdaptation_ColumnCountOf_0061
     * @tc.desc      columnCountOf(template="Y8I1d") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0061 begin`);
      const actual: number = columnCountOf('Y8I1d');
      logInfo(`columnCountOf(template="Y8I1d"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0061 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0062
     * @tc.name      FoldableAdaptation_ColumnCountOf_0062
     * @tc.desc      columnCountOf(template="MAHUsqPHF") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0062 begin`);
      const actual: number = columnCountOf('MAHUsqPHF');
      logInfo(`columnCountOf(template="MAHUsqPHF"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0062 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0063
     * @tc.name      FoldableAdaptation_ColumnCountOf_0063
     * @tc.desc      columnCountOf(template="ZhMt") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0063 begin`);
      const actual: number = columnCountOf('ZhMt');
      logInfo(`columnCountOf(template="ZhMt"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0063 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0064
     * @tc.name      FoldableAdaptation_ColumnCountOf_0064
     * @tc.desc      columnCountOf(template="JsKaxzKvjB0p") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0064 begin`);
      const actual: number = columnCountOf('JsKaxzKvjB0p');
      logInfo(`columnCountOf(template="JsKaxzKvjB0p"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0064 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0065
     * @tc.name      FoldableAdaptation_ColumnCountOf_0065
     * @tc.desc      columnCountOf(template="WJzrJ") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0065 begin`);
      const actual: number = columnCountOf('WJzrJ');
      logInfo(`columnCountOf(template="WJzrJ"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0065 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0066
     * @tc.name      FoldableAdaptation_ColumnCountOf_0066
     * @tc.desc      columnCountOf(template="fJrv") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0066 begin`);
      const actual: number = columnCountOf('fJrv');
      logInfo(`columnCountOf(template="fJrv"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0066 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0067
     * @tc.name      FoldableAdaptation_ColumnCountOf_0067
     * @tc.desc      columnCountOf(template="3A") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0067 begin`);
      const actual: number = columnCountOf('3A');
      logInfo(`columnCountOf(template="3A"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0067 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0068
     * @tc.name      FoldableAdaptation_ColumnCountOf_0068
     * @tc.desc      columnCountOf(template="XBpPJ5") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0068 begin`);
      const actual: number = columnCountOf('XBpPJ5');
      logInfo(`columnCountOf(template="XBpPJ5"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0068 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0069
     * @tc.name      FoldableAdaptation_ColumnCountOf_0069
     * @tc.desc      columnCountOf(template="wREi") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0069 begin`);
      const actual: number = columnCountOf('wREi');
      logInfo(`columnCountOf(template="wREi"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0069 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0070
     * @tc.name      FoldableAdaptation_ColumnCountOf_0070
     * @tc.desc      columnCountOf(template="9cPYOAe") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0070 begin`);
      const actual: number = columnCountOf('9cPYOAe');
      logInfo(`columnCountOf(template="9cPYOAe"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0070 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0071
     * @tc.name      FoldableAdaptation_ColumnCountOf_0071
     * @tc.desc      columnCountOf(template="whWj") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0071 begin`);
      const actual: number = columnCountOf('whWj');
      logInfo(`columnCountOf(template="whWj"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0071 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0072
     * @tc.name      FoldableAdaptation_ColumnCountOf_0072
     * @tc.desc      columnCountOf(template="EWcsMeNE") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0072 begin`);
      const actual: number = columnCountOf('EWcsMeNE');
      logInfo(`columnCountOf(template="EWcsMeNE"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0072 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0073
     * @tc.name      FoldableAdaptation_ColumnCountOf_0073
     * @tc.desc      columnCountOf(template="sOi0u5IHhEhn") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0073 begin`);
      const actual: number = columnCountOf('sOi0u5IHhEhn');
      logInfo(`columnCountOf(template="sOi0u5IHhEhn"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0073 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0074
     * @tc.name      FoldableAdaptation_ColumnCountOf_0074
     * @tc.desc      columnCountOf(template="b") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0074 begin`);
      const actual: number = columnCountOf('b');
      logInfo(`columnCountOf(template="b"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0074 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0075
     * @tc.name      FoldableAdaptation_ColumnCountOf_0075
     * @tc.desc      columnCountOf(template="KLHXc0gZ") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0075 begin`);
      const actual: number = columnCountOf('KLHXc0gZ');
      logInfo(`columnCountOf(template="KLHXc0gZ"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0075 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0076
     * @tc.name      FoldableAdaptation_ColumnCountOf_0076
     * @tc.desc      columnCountOf(template="TRhUO27") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0076 begin`);
      const actual: number = columnCountOf('TRhUO27');
      logInfo(`columnCountOf(template="TRhUO27"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0076 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0077
     * @tc.name      FoldableAdaptation_ColumnCountOf_0077
     * @tc.desc      columnCountOf(template="utNe5J7") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0077 begin`);
      const actual: number = columnCountOf('utNe5J7');
      logInfo(`columnCountOf(template="utNe5J7"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0077 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0078
     * @tc.name      FoldableAdaptation_ColumnCountOf_0078
     * @tc.desc      columnCountOf(template="tW74JP3EP") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0078 begin`);
      const actual: number = columnCountOf('tW74JP3EP');
      logInfo(`columnCountOf(template="tW74JP3EP"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0078 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0079
     * @tc.name      FoldableAdaptation_ColumnCountOf_0079
     * @tc.desc      columnCountOf(template="2O7jMHLGuOh5") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0079 begin`);
      const actual: number = columnCountOf('2O7jMHLGuOh5');
      logInfo(`columnCountOf(template="2O7jMHLGuOh5"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0079 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0080
     * @tc.name      FoldableAdaptation_ColumnCountOf_0080
     * @tc.desc      columnCountOf(template="9V9t8e0bu") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0080 begin`);
      const actual: number = columnCountOf('9V9t8e0bu');
      logInfo(`columnCountOf(template="9V9t8e0bu"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0080 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0081
     * @tc.name      FoldableAdaptation_ColumnCountOf_0081
     * @tc.desc      columnCountOf(template="542a6FQlSqa") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0081 begin`);
      const actual: number = columnCountOf('542a6FQlSqa');
      logInfo(`columnCountOf(template="542a6FQlSqa"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0081 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0082
     * @tc.name      FoldableAdaptation_ColumnCountOf_0082
     * @tc.desc      columnCountOf(template="LGM9amCfPx") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0082 begin`);
      const actual: number = columnCountOf('LGM9amCfPx');
      logInfo(`columnCountOf(template="LGM9amCfPx"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0082 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0083
     * @tc.name      FoldableAdaptation_ColumnCountOf_0083
     * @tc.desc      columnCountOf(template="9R") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0083 begin`);
      const actual: number = columnCountOf('9R');
      logInfo(`columnCountOf(template="9R"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0083 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0084
     * @tc.name      FoldableAdaptation_ColumnCountOf_0084
     * @tc.desc      columnCountOf(template="ou78eMsH0") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0084 begin`);
      const actual: number = columnCountOf('ou78eMsH0');
      logInfo(`columnCountOf(template="ou78eMsH0"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0084 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0085
     * @tc.name      FoldableAdaptation_ColumnCountOf_0085
     * @tc.desc      columnCountOf(template="ti8bJThMjc8") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0085 begin`);
      const actual: number = columnCountOf('ti8bJThMjc8');
      logInfo(`columnCountOf(template="ti8bJThMjc8"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0085 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0086
     * @tc.name      FoldableAdaptation_ColumnCountOf_0086
     * @tc.desc      columnCountOf(template="6UGZu20a") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0086 begin`);
      const actual: number = columnCountOf('6UGZu20a');
      logInfo(`columnCountOf(template="6UGZu20a"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0086 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0087
     * @tc.name      FoldableAdaptation_ColumnCountOf_0087
     * @tc.desc      columnCountOf(template="K") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0087 begin`);
      const actual: number = columnCountOf('K');
      logInfo(`columnCountOf(template="K"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0087 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0088
     * @tc.name      FoldableAdaptation_ColumnCountOf_0088
     * @tc.desc      columnCountOf(template="85YwH") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0088 begin`);
      const actual: number = columnCountOf('85YwH');
      logInfo(`columnCountOf(template="85YwH"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0088 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0089
     * @tc.name      FoldableAdaptation_ColumnCountOf_0089
     * @tc.desc      columnCountOf(template="jjABYwjAIz3i") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0089 begin`);
      const actual: number = columnCountOf('jjABYwjAIz3i');
      logInfo(`columnCountOf(template="jjABYwjAIz3i"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0089 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0090
     * @tc.name      FoldableAdaptation_ColumnCountOf_0090
     * @tc.desc      columnCountOf(template="pDRz") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0090 begin`);
      const actual: number = columnCountOf('pDRz');
      logInfo(`columnCountOf(template="pDRz"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0090 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0091
     * @tc.name      FoldableAdaptation_ColumnCountOf_0091
     * @tc.desc      columnCountOf(template="lmyD2HbrJX") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0091 begin`);
      const actual: number = columnCountOf('lmyD2HbrJX');
      logInfo(`columnCountOf(template="lmyD2HbrJX"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0091 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0092
     * @tc.name      FoldableAdaptation_ColumnCountOf_0092
     * @tc.desc      columnCountOf(template="Hx") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0092 begin`);
      const actual: number = columnCountOf('Hx');
      logInfo(`columnCountOf(template="Hx"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0092 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0093
     * @tc.name      FoldableAdaptation_ColumnCountOf_0093
     * @tc.desc      columnCountOf(template="IKBuKpfzrx") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0093 begin`);
      const actual: number = columnCountOf('IKBuKpfzrx');
      logInfo(`columnCountOf(template="IKBuKpfzrx"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0093 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0094
     * @tc.name      FoldableAdaptation_ColumnCountOf_0094
     * @tc.desc      columnCountOf(template="39ZApJu032h") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0094 begin`);
      const actual: number = columnCountOf('39ZApJu032h');
      logInfo(`columnCountOf(template="39ZApJu032h"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0094 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0095
     * @tc.name      FoldableAdaptation_ColumnCountOf_0095
     * @tc.desc      columnCountOf(template="L6P") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0095 begin`);
      const actual: number = columnCountOf('L6P');
      logInfo(`columnCountOf(template="L6P"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0095 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_COLUMN_COUNT_OF_0096
     * @tc.name      FoldableAdaptation_ColumnCountOf_0096
     * @tc.desc      columnCountOf(template="EEG") returns 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ColumnCountOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColumnCountOf_0096 begin`);
      const actual: number = columnCountOf('EEG');
      logInfo(`columnCountOf(template="EEG"): actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColumnCountOf_0096 end`);
    });
  });
}
