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
import { gridColumnsOf } from '../model/FoldLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FoldableAdaptation]';
const BUNDLE: string = 'FoldableAdaptation_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for gridColumnsOf (75 cases). */
export default function gridColumnsOfTest(): void {
  describe('GridColumnsOfTest', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0001
     * @tc.name      FoldableAdaptation_GridColumnsOf_0001
     * @tc.desc      gridColumnsOf(breakpoint="sm") returns 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('GridColumnsOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0001 begin`);
      const actual: number = gridColumnsOf('sm');
      logInfo(`gridColumnsOf(breakpoint="sm"): actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}GridColumnsOf_0001 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0002
     * @tc.name      FoldableAdaptation_GridColumnsOf_0002
     * @tc.desc      gridColumnsOf(breakpoint="md") returns 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('GridColumnsOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0002 begin`);
      const actual: number = gridColumnsOf('md');
      logInfo(`gridColumnsOf(breakpoint="md"): actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}GridColumnsOf_0002 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0003
     * @tc.name      FoldableAdaptation_GridColumnsOf_0003
     * @tc.desc      gridColumnsOf(breakpoint="SM") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('GridColumnsOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0003 begin`);
      const actual: number = gridColumnsOf('SM');
      logInfo(`gridColumnsOf(breakpoint="SM"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0003 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0004
     * @tc.name      FoldableAdaptation_GridColumnsOf_0004
     * @tc.desc      gridColumnsOf(breakpoint="s") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('GridColumnsOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0004 begin`);
      const actual: number = gridColumnsOf('s');
      logInfo(`gridColumnsOf(breakpoint="s"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0004 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0005
     * @tc.name      FoldableAdaptation_GridColumnsOf_0005
     * @tc.desc      gridColumnsOf(breakpoint="smx") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('GridColumnsOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0005 begin`);
      const actual: number = gridColumnsOf('smx');
      logInfo(`gridColumnsOf(breakpoint="smx"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0005 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0006
     * @tc.name      FoldableAdaptation_GridColumnsOf_0006
     * @tc.desc      gridColumnsOf(breakpoint="MD") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('GridColumnsOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0006 begin`);
      const actual: number = gridColumnsOf('MD');
      logInfo(`gridColumnsOf(breakpoint="MD"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0006 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0007
     * @tc.name      FoldableAdaptation_GridColumnsOf_0007
     * @tc.desc      gridColumnsOf(breakpoint="m") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('GridColumnsOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0007 begin`);
      const actual: number = gridColumnsOf('m');
      logInfo(`gridColumnsOf(breakpoint="m"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0007 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0008
     * @tc.name      FoldableAdaptation_GridColumnsOf_0008
     * @tc.desc      gridColumnsOf(breakpoint="mdx") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('GridColumnsOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0008 begin`);
      const actual: number = gridColumnsOf('mdx');
      logInfo(`gridColumnsOf(breakpoint="mdx"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0008 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0009
     * @tc.name      FoldableAdaptation_GridColumnsOf_0009
     * @tc.desc      gridColumnsOf(breakpoint="") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('GridColumnsOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0009 begin`);
      const actual: number = gridColumnsOf('');
      logInfo(`gridColumnsOf(breakpoint=""): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0009 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0010
     * @tc.name      FoldableAdaptation_GridColumnsOf_0010
     * @tc.desc      gridColumnsOf(breakpoint="a") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0010 begin`);
      const actual: number = gridColumnsOf('a');
      logInfo(`gridColumnsOf(breakpoint="a"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0010 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0011
     * @tc.name      FoldableAdaptation_GridColumnsOf_0011
     * @tc.desc      gridColumnsOf(breakpoint="abc") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0011 begin`);
      const actual: number = gridColumnsOf('abc');
      logInfo(`gridColumnsOf(breakpoint="abc"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0011 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0012
     * @tc.name      FoldableAdaptation_GridColumnsOf_0012
     * @tc.desc      gridColumnsOf(breakpoint="Hello World") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0012 begin`);
      const actual: number = gridColumnsOf('Hello World');
      logInfo(`gridColumnsOf(breakpoint="Hello World"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0012 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0013
     * @tc.name      FoldableAdaptation_GridColumnsOf_0013
     * @tc.desc      gridColumnsOf(breakpoint=" ") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0013 begin`);
      const actual: number = gridColumnsOf(' ');
      logInfo(`gridColumnsOf(breakpoint=" "): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0013 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0014
     * @tc.name      FoldableAdaptation_GridColumnsOf_0014
     * @tc.desc      gridColumnsOf(breakpoint="123") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0014 begin`);
      const actual: number = gridColumnsOf('123');
      logInfo(`gridColumnsOf(breakpoint="123"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0014 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0015
     * @tc.name      FoldableAdaptation_GridColumnsOf_0015
     * @tc.desc      gridColumnsOf(breakpoint=" sm ") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('GridColumnsOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0015 begin`);
      const actual: number = gridColumnsOf(' sm ');
      logInfo(`gridColumnsOf(breakpoint=" sm "): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0015 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0016
     * @tc.name      FoldableAdaptation_GridColumnsOf_0016
     * @tc.desc      gridColumnsOf(breakpoint="smsm") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0016 begin`);
      const actual: number = gridColumnsOf('smsm');
      logInfo(`gridColumnsOf(breakpoint="smsm"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0016 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0017
     * @tc.name      FoldableAdaptation_GridColumnsOf_0017
     * @tc.desc      gridColumnsOf(breakpoint="sm_1") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0017 begin`);
      const actual: number = gridColumnsOf('sm_1');
      logInfo(`gridColumnsOf(breakpoint="sm_1"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0017 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0018
     * @tc.name      FoldableAdaptation_GridColumnsOf_0018
     * @tc.desc      gridColumnsOf(breakpoint="xsm") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('GridColumnsOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0018 begin`);
      const actual: number = gridColumnsOf('xsm');
      logInfo(`gridColumnsOf(breakpoint="xsm"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0018 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0019
     * @tc.name      FoldableAdaptation_GridColumnsOf_0019
     * @tc.desc      gridColumnsOf(breakpoint=" md ") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('GridColumnsOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0019 begin`);
      const actual: number = gridColumnsOf(' md ');
      logInfo(`gridColumnsOf(breakpoint=" md "): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0019 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0020
     * @tc.name      FoldableAdaptation_GridColumnsOf_0020
     * @tc.desc      gridColumnsOf(breakpoint="mdmd") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0020 begin`);
      const actual: number = gridColumnsOf('mdmd');
      logInfo(`gridColumnsOf(breakpoint="mdmd"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0020 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0021
     * @tc.name      FoldableAdaptation_GridColumnsOf_0021
     * @tc.desc      gridColumnsOf(breakpoint="md_1") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0021 begin`);
      const actual: number = gridColumnsOf('md_1');
      logInfo(`gridColumnsOf(breakpoint="md_1"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0021 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0022
     * @tc.name      FoldableAdaptation_GridColumnsOf_0022
     * @tc.desc      gridColumnsOf(breakpoint="xmd") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('GridColumnsOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0022 begin`);
      const actual: number = gridColumnsOf('xmd');
      logInfo(`gridColumnsOf(breakpoint="xmd"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0022 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0023
     * @tc.name      FoldableAdaptation_GridColumnsOf_0023
     * @tc.desc      gridColumnsOf(breakpoint=" SM ") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('GridColumnsOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0023 begin`);
      const actual: number = gridColumnsOf(' SM ');
      logInfo(`gridColumnsOf(breakpoint=" SM "): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0023 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0024
     * @tc.name      FoldableAdaptation_GridColumnsOf_0024
     * @tc.desc      gridColumnsOf(breakpoint="SMSM") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0024 begin`);
      const actual: number = gridColumnsOf('SMSM');
      logInfo(`gridColumnsOf(breakpoint="SMSM"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0024 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0025
     * @tc.name      FoldableAdaptation_GridColumnsOf_0025
     * @tc.desc      gridColumnsOf(breakpoint="SM_1") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0025 begin`);
      const actual: number = gridColumnsOf('SM_1');
      logInfo(`gridColumnsOf(breakpoint="SM_1"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0025 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0026
     * @tc.name      FoldableAdaptation_GridColumnsOf_0026
     * @tc.desc      gridColumnsOf(breakpoint="xSM") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('GridColumnsOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0026 begin`);
      const actual: number = gridColumnsOf('xSM');
      logInfo(`gridColumnsOf(breakpoint="xSM"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0026 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0027
     * @tc.name      FoldableAdaptation_GridColumnsOf_0027
     * @tc.desc      gridColumnsOf(breakpoint=" s ") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('GridColumnsOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0027 begin`);
      const actual: number = gridColumnsOf(' s ');
      logInfo(`gridColumnsOf(breakpoint=" s "): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0027 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0028
     * @tc.name      FoldableAdaptation_GridColumnsOf_0028
     * @tc.desc      gridColumnsOf(breakpoint="ss") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0028 begin`);
      const actual: number = gridColumnsOf('ss');
      logInfo(`gridColumnsOf(breakpoint="ss"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0028 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0029
     * @tc.name      FoldableAdaptation_GridColumnsOf_0029
     * @tc.desc      gridColumnsOf(breakpoint="s_1") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0029 begin`);
      const actual: number = gridColumnsOf('s_1');
      logInfo(`gridColumnsOf(breakpoint="s_1"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0029 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0030
     * @tc.name      FoldableAdaptation_GridColumnsOf_0030
     * @tc.desc      gridColumnsOf(breakpoint="xs") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('GridColumnsOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0030 begin`);
      const actual: number = gridColumnsOf('xs');
      logInfo(`gridColumnsOf(breakpoint="xs"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0030 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0031
     * @tc.name      FoldableAdaptation_GridColumnsOf_0031
     * @tc.desc      gridColumnsOf(breakpoint=" smx ") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('GridColumnsOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0031 begin`);
      const actual: number = gridColumnsOf(' smx ');
      logInfo(`gridColumnsOf(breakpoint=" smx "): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0031 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0032
     * @tc.name      FoldableAdaptation_GridColumnsOf_0032
     * @tc.desc      gridColumnsOf(breakpoint="smxsmx") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0032 begin`);
      const actual: number = gridColumnsOf('smxsmx');
      logInfo(`gridColumnsOf(breakpoint="smxsmx"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0032 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0033
     * @tc.name      FoldableAdaptation_GridColumnsOf_0033
     * @tc.desc      gridColumnsOf(breakpoint="smx_1") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0033 begin`);
      const actual: number = gridColumnsOf('smx_1');
      logInfo(`gridColumnsOf(breakpoint="smx_1"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0033 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0034
     * @tc.name      FoldableAdaptation_GridColumnsOf_0034
     * @tc.desc      gridColumnsOf(breakpoint="xsmx") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('GridColumnsOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0034 begin`);
      const actual: number = gridColumnsOf('xsmx');
      logInfo(`gridColumnsOf(breakpoint="xsmx"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0034 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0035
     * @tc.name      FoldableAdaptation_GridColumnsOf_0035
     * @tc.desc      gridColumnsOf(breakpoint=" MD ") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('GridColumnsOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0035 begin`);
      const actual: number = gridColumnsOf(' MD ');
      logInfo(`gridColumnsOf(breakpoint=" MD "): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0035 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0036
     * @tc.name      FoldableAdaptation_GridColumnsOf_0036
     * @tc.desc      gridColumnsOf(breakpoint="MDMD") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0036 begin`);
      const actual: number = gridColumnsOf('MDMD');
      logInfo(`gridColumnsOf(breakpoint="MDMD"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0036 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0037
     * @tc.name      FoldableAdaptation_GridColumnsOf_0037
     * @tc.desc      gridColumnsOf(breakpoint="MD_1") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0037 begin`);
      const actual: number = gridColumnsOf('MD_1');
      logInfo(`gridColumnsOf(breakpoint="MD_1"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0037 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0038
     * @tc.name      FoldableAdaptation_GridColumnsOf_0038
     * @tc.desc      gridColumnsOf(breakpoint="xMD") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('GridColumnsOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0038 begin`);
      const actual: number = gridColumnsOf('xMD');
      logInfo(`gridColumnsOf(breakpoint="xMD"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0038 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0039
     * @tc.name      FoldableAdaptation_GridColumnsOf_0039
     * @tc.desc      gridColumnsOf(breakpoint=" m ") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('GridColumnsOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0039 begin`);
      const actual: number = gridColumnsOf(' m ');
      logInfo(`gridColumnsOf(breakpoint=" m "): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0039 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0040
     * @tc.name      FoldableAdaptation_GridColumnsOf_0040
     * @tc.desc      gridColumnsOf(breakpoint="mm") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0040 begin`);
      const actual: number = gridColumnsOf('mm');
      logInfo(`gridColumnsOf(breakpoint="mm"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0040 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0041
     * @tc.name      FoldableAdaptation_GridColumnsOf_0041
     * @tc.desc      gridColumnsOf(breakpoint="m_1") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0041 begin`);
      const actual: number = gridColumnsOf('m_1');
      logInfo(`gridColumnsOf(breakpoint="m_1"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0041 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0042
     * @tc.name      FoldableAdaptation_GridColumnsOf_0042
     * @tc.desc      gridColumnsOf(breakpoint="xm") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('GridColumnsOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0042 begin`);
      const actual: number = gridColumnsOf('xm');
      logInfo(`gridColumnsOf(breakpoint="xm"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0042 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0043
     * @tc.name      FoldableAdaptation_GridColumnsOf_0043
     * @tc.desc      gridColumnsOf(breakpoint=" mdx ") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('GridColumnsOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0043 begin`);
      const actual: number = gridColumnsOf(' mdx ');
      logInfo(`gridColumnsOf(breakpoint=" mdx "): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0043 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0044
     * @tc.name      FoldableAdaptation_GridColumnsOf_0044
     * @tc.desc      gridColumnsOf(breakpoint="mdxmdx") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0044 begin`);
      const actual: number = gridColumnsOf('mdxmdx');
      logInfo(`gridColumnsOf(breakpoint="mdxmdx"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0044 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0045
     * @tc.name      FoldableAdaptation_GridColumnsOf_0045
     * @tc.desc      gridColumnsOf(breakpoint="mdx_1") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0045 begin`);
      const actual: number = gridColumnsOf('mdx_1');
      logInfo(`gridColumnsOf(breakpoint="mdx_1"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0045 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0046
     * @tc.name      FoldableAdaptation_GridColumnsOf_0046
     * @tc.desc      gridColumnsOf(breakpoint="xmdx") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('GridColumnsOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0046 begin`);
      const actual: number = gridColumnsOf('xmdx');
      logInfo(`gridColumnsOf(breakpoint="xmdx"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0046 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0047
     * @tc.name      FoldableAdaptation_GridColumnsOf_0047
     * @tc.desc      gridColumnsOf(breakpoint=" a ") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('GridColumnsOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0047 begin`);
      const actual: number = gridColumnsOf(' a ');
      logInfo(`gridColumnsOf(breakpoint=" a "): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0047 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0048
     * @tc.name      FoldableAdaptation_GridColumnsOf_0048
     * @tc.desc      gridColumnsOf(breakpoint="aa") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0048 begin`);
      const actual: number = gridColumnsOf('aa');
      logInfo(`gridColumnsOf(breakpoint="aa"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0048 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0049
     * @tc.name      FoldableAdaptation_GridColumnsOf_0049
     * @tc.desc      gridColumnsOf(breakpoint="a_1") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0049 begin`);
      const actual: number = gridColumnsOf('a_1');
      logInfo(`gridColumnsOf(breakpoint="a_1"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0049 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0050
     * @tc.name      FoldableAdaptation_GridColumnsOf_0050
     * @tc.desc      gridColumnsOf(breakpoint="xa") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('GridColumnsOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0050 begin`);
      const actual: number = gridColumnsOf('xa');
      logInfo(`gridColumnsOf(breakpoint="xa"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0050 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0051
     * @tc.name      FoldableAdaptation_GridColumnsOf_0051
     * @tc.desc      gridColumnsOf(breakpoint=" abc ") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('GridColumnsOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0051 begin`);
      const actual: number = gridColumnsOf(' abc ');
      logInfo(`gridColumnsOf(breakpoint=" abc "): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0051 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0052
     * @tc.name      FoldableAdaptation_GridColumnsOf_0052
     * @tc.desc      gridColumnsOf(breakpoint="abcabc") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0052 begin`);
      const actual: number = gridColumnsOf('abcabc');
      logInfo(`gridColumnsOf(breakpoint="abcabc"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0052 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0053
     * @tc.name      FoldableAdaptation_GridColumnsOf_0053
     * @tc.desc      gridColumnsOf(breakpoint="abc_1") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0053 begin`);
      const actual: number = gridColumnsOf('abc_1');
      logInfo(`gridColumnsOf(breakpoint="abc_1"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0053 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0054
     * @tc.name      FoldableAdaptation_GridColumnsOf_0054
     * @tc.desc      gridColumnsOf(breakpoint="xabc") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('GridColumnsOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0054 begin`);
      const actual: number = gridColumnsOf('xabc');
      logInfo(`gridColumnsOf(breakpoint="xabc"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0054 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0055
     * @tc.name      FoldableAdaptation_GridColumnsOf_0055
     * @tc.desc      gridColumnsOf(breakpoint=" Hello World ") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('GridColumnsOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0055 begin`);
      const actual: number = gridColumnsOf(' Hello World ');
      logInfo(`gridColumnsOf(breakpoint=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0055 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0056
     * @tc.name      FoldableAdaptation_GridColumnsOf_0056
     * @tc.desc      gridColumnsOf(breakpoint="Hello WorldHello World") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0056 begin`);
      const actual: number = gridColumnsOf('Hello WorldHello World');
      logInfo(`gridColumnsOf(breakpoint="Hello WorldHell...: actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0056 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0057
     * @tc.name      FoldableAdaptation_GridColumnsOf_0057
     * @tc.desc      gridColumnsOf(breakpoint="Hello World_1") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0057 begin`);
      const actual: number = gridColumnsOf('Hello World_1');
      logInfo(`gridColumnsOf(breakpoint="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0057 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0058
     * @tc.name      FoldableAdaptation_GridColumnsOf_0058
     * @tc.desc      gridColumnsOf(breakpoint="xHello World") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('GridColumnsOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0058 begin`);
      const actual: number = gridColumnsOf('xHello World');
      logInfo(`gridColumnsOf(breakpoint="xHello World"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0058 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0059
     * @tc.name      FoldableAdaptation_GridColumnsOf_0059
     * @tc.desc      gridColumnsOf(breakpoint="   ") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('GridColumnsOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0059 begin`);
      const actual: number = gridColumnsOf('   ');
      logInfo(`gridColumnsOf(breakpoint="   "): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0059 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0060
     * @tc.name      FoldableAdaptation_GridColumnsOf_0060
     * @tc.desc      gridColumnsOf(breakpoint="  ") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0060 begin`);
      const actual: number = gridColumnsOf('  ');
      logInfo(`gridColumnsOf(breakpoint="  "): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0060 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0061
     * @tc.name      FoldableAdaptation_GridColumnsOf_0061
     * @tc.desc      gridColumnsOf(breakpoint=" _1") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0061 begin`);
      const actual: number = gridColumnsOf(' _1');
      logInfo(`gridColumnsOf(breakpoint=" _1"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0061 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0062
     * @tc.name      FoldableAdaptation_GridColumnsOf_0062
     * @tc.desc      gridColumnsOf(breakpoint="x ") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('GridColumnsOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0062 begin`);
      const actual: number = gridColumnsOf('x ');
      logInfo(`gridColumnsOf(breakpoint="x "): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0062 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0063
     * @tc.name      FoldableAdaptation_GridColumnsOf_0063
     * @tc.desc      gridColumnsOf(breakpoint="Q6iUHs") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0063 begin`);
      const actual: number = gridColumnsOf('Q6iUHs');
      logInfo(`gridColumnsOf(breakpoint="Q6iUHs"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0063 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0064
     * @tc.name      FoldableAdaptation_GridColumnsOf_0064
     * @tc.desc      gridColumnsOf(breakpoint="k6uFmB") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0064 begin`);
      const actual: number = gridColumnsOf('k6uFmB');
      logInfo(`gridColumnsOf(breakpoint="k6uFmB"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0064 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0065
     * @tc.name      FoldableAdaptation_GridColumnsOf_0065
     * @tc.desc      gridColumnsOf(breakpoint="Qu7fXPDrUu") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0065 begin`);
      const actual: number = gridColumnsOf('Qu7fXPDrUu');
      logInfo(`gridColumnsOf(breakpoint="Qu7fXPDrUu"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0065 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0066
     * @tc.name      FoldableAdaptation_GridColumnsOf_0066
     * @tc.desc      gridColumnsOf(breakpoint="2RoXw3nwDk4") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0066 begin`);
      const actual: number = gridColumnsOf('2RoXw3nwDk4');
      logInfo(`gridColumnsOf(breakpoint="2RoXw3nwDk4"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0066 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0067
     * @tc.name      FoldableAdaptation_GridColumnsOf_0067
     * @tc.desc      gridColumnsOf(breakpoint="ReUvs") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0067 begin`);
      const actual: number = gridColumnsOf('ReUvs');
      logInfo(`gridColumnsOf(breakpoint="ReUvs"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0067 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0068
     * @tc.name      FoldableAdaptation_GridColumnsOf_0068
     * @tc.desc      gridColumnsOf(breakpoint="SFKdfO") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0068 begin`);
      const actual: number = gridColumnsOf('SFKdfO');
      logInfo(`gridColumnsOf(breakpoint="SFKdfO"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0068 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0069
     * @tc.name      FoldableAdaptation_GridColumnsOf_0069
     * @tc.desc      gridColumnsOf(breakpoint="EQoKFukpXb") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0069 begin`);
      const actual: number = gridColumnsOf('EQoKFukpXb');
      logInfo(`gridColumnsOf(breakpoint="EQoKFukpXb"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0069 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0070
     * @tc.name      FoldableAdaptation_GridColumnsOf_0070
     * @tc.desc      gridColumnsOf(breakpoint="SV") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0070 begin`);
      const actual: number = gridColumnsOf('SV');
      logInfo(`gridColumnsOf(breakpoint="SV"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0070 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0071
     * @tc.name      FoldableAdaptation_GridColumnsOf_0071
     * @tc.desc      gridColumnsOf(breakpoint="Q2") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0071 begin`);
      const actual: number = gridColumnsOf('Q2');
      logInfo(`gridColumnsOf(breakpoint="Q2"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0071 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0072
     * @tc.name      FoldableAdaptation_GridColumnsOf_0072
     * @tc.desc      gridColumnsOf(breakpoint="0") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0072 begin`);
      const actual: number = gridColumnsOf('0');
      logInfo(`gridColumnsOf(breakpoint="0"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0072 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0073
     * @tc.name      FoldableAdaptation_GridColumnsOf_0073
     * @tc.desc      gridColumnsOf(breakpoint="T") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0073 begin`);
      const actual: number = gridColumnsOf('T');
      logInfo(`gridColumnsOf(breakpoint="T"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0073 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0074
     * @tc.name      FoldableAdaptation_GridColumnsOf_0074
     * @tc.desc      gridColumnsOf(breakpoint="qU56CAeRrCS") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0074 begin`);
      const actual: number = gridColumnsOf('qU56CAeRrCS');
      logInfo(`gridColumnsOf(breakpoint="qU56CAeRrCS"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0074 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_GRID_COLUMNS_OF_0075
     * @tc.name      FoldableAdaptation_GridColumnsOf_0075
     * @tc.desc      gridColumnsOf(breakpoint="zwY1lVyB") returns 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('GridColumnsOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}GridColumnsOf_0075 begin`);
      const actual: number = gridColumnsOf('zwY1lVyB');
      logInfo(`gridColumnsOf(breakpoint="zwY1lVyB"): actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}GridColumnsOf_0075 end`);
    });
  });
}
