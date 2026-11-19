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
import { DIM_BOUND, DIM_COMBO, DIM_EXTREME, DIM_INVALID, DIM_LEGAL, DIM_STATE, ParamProbeObs,
  probeParam } from './ParamProbe';

// A 参数域第 03 组：覆盖几何域 geometry 第 1~16 个参数，每个参数六个维度各一条用例。
const GEOMETRY_BUCKET: number = 1;
const GEOMETRY_TOTAL: number = 23;
const GEOMETRY_ORDINAL_00: number = 0;
const GEOMETRY_ORDINAL_01: number = 1;
const GEOMETRY_ORDINAL_02: number = 2;
const GEOMETRY_ORDINAL_03: number = 3;
const GEOMETRY_ORDINAL_04: number = 4;
const GEOMETRY_ORDINAL_05: number = 5;
const GEOMETRY_ORDINAL_06: number = 6;
const GEOMETRY_ORDINAL_07: number = 7;
const GEOMETRY_ORDINAL_08: number = 8;
const GEOMETRY_ORDINAL_09: number = 9;
const GEOMETRY_ORDINAL_10: number = 10;
const GEOMETRY_ORDINAL_11: number = 11;
const GEOMETRY_ORDINAL_12: number = 12;
const GEOMETRY_ORDINAL_13: number = 13;
const GEOMETRY_ORDINAL_14: number = 14;
const GEOMETRY_ORDINAL_15: number = 15;

export default function ndkRenderParamA03Test(): void {
  describe('NdkRenderParamA03', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0001
     * @tc.name      testNdkRenderParamA030001
     * @tc.desc      校验几何域 geometry 第 1 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_00, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0002
     * @tc.name      testNdkRenderParamA030002
     * @tc.desc      校验几何域 geometry 第 1 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_00, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0003
     * @tc.name      testNdkRenderParamA030003
     * @tc.desc      校验几何域 geometry 第 1 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_00, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0004
     * @tc.name      testNdkRenderParamA030004
     * @tc.desc      校验几何域 geometry 第 1 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_00, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0005
     * @tc.name      testNdkRenderParamA030005
     * @tc.desc      校验几何域 geometry 第 1 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_00, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0006
     * @tc.name      testNdkRenderParamA030006
     * @tc.desc      校验几何域 geometry 第 1 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_00, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0007
     * @tc.name      testNdkRenderParamA030007
     * @tc.desc      校验几何域 geometry 第 2 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_01, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0008
     * @tc.name      testNdkRenderParamA030008
     * @tc.desc      校验几何域 geometry 第 2 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_01, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0009
     * @tc.name      testNdkRenderParamA030009
     * @tc.desc      校验几何域 geometry 第 2 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_01, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0010
     * @tc.name      testNdkRenderParamA030010
     * @tc.desc      校验几何域 geometry 第 2 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_01, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0011
     * @tc.name      testNdkRenderParamA030011
     * @tc.desc      校验几何域 geometry 第 2 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_01, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0012
     * @tc.name      testNdkRenderParamA030012
     * @tc.desc      校验几何域 geometry 第 2 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_01, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0013
     * @tc.name      testNdkRenderParamA030013
     * @tc.desc      校验几何域 geometry 第 3 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_02, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0014
     * @tc.name      testNdkRenderParamA030014
     * @tc.desc      校验几何域 geometry 第 3 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_02, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0015
     * @tc.name      testNdkRenderParamA030015
     * @tc.desc      校验几何域 geometry 第 3 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_02, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0016
     * @tc.name      testNdkRenderParamA030016
     * @tc.desc      校验几何域 geometry 第 3 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_02, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0017
     * @tc.name      testNdkRenderParamA030017
     * @tc.desc      校验几何域 geometry 第 3 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_02, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0018
     * @tc.name      testNdkRenderParamA030018
     * @tc.desc      校验几何域 geometry 第 3 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_02, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0019
     * @tc.name      testNdkRenderParamA030019
     * @tc.desc      校验几何域 geometry 第 4 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_03, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0020
     * @tc.name      testNdkRenderParamA030020
     * @tc.desc      校验几何域 geometry 第 4 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_03, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0021
     * @tc.name      testNdkRenderParamA030021
     * @tc.desc      校验几何域 geometry 第 4 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_03, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0022
     * @tc.name      testNdkRenderParamA030022
     * @tc.desc      校验几何域 geometry 第 4 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_03, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0023
     * @tc.name      testNdkRenderParamA030023
     * @tc.desc      校验几何域 geometry 第 4 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_03, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0024
     * @tc.name      testNdkRenderParamA030024
     * @tc.desc      校验几何域 geometry 第 4 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_03, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0025
     * @tc.name      testNdkRenderParamA030025
     * @tc.desc      校验几何域 geometry 第 5 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_04, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0026
     * @tc.name      testNdkRenderParamA030026
     * @tc.desc      校验几何域 geometry 第 5 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_04, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0027
     * @tc.name      testNdkRenderParamA030027
     * @tc.desc      校验几何域 geometry 第 5 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_04, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0028
     * @tc.name      testNdkRenderParamA030028
     * @tc.desc      校验几何域 geometry 第 5 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_04, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0029
     * @tc.name      testNdkRenderParamA030029
     * @tc.desc      校验几何域 geometry 第 5 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_04, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0030
     * @tc.name      testNdkRenderParamA030030
     * @tc.desc      校验几何域 geometry 第 5 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_04, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0031
     * @tc.name      testNdkRenderParamA030031
     * @tc.desc      校验几何域 geometry 第 6 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_05, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0032
     * @tc.name      testNdkRenderParamA030032
     * @tc.desc      校验几何域 geometry 第 6 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_05, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0033
     * @tc.name      testNdkRenderParamA030033
     * @tc.desc      校验几何域 geometry 第 6 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_05, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0034
     * @tc.name      testNdkRenderParamA030034
     * @tc.desc      校验几何域 geometry 第 6 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_05, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0035
     * @tc.name      testNdkRenderParamA030035
     * @tc.desc      校验几何域 geometry 第 6 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_05, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0036
     * @tc.name      testNdkRenderParamA030036
     * @tc.desc      校验几何域 geometry 第 6 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_05, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0037
     * @tc.name      testNdkRenderParamA030037
     * @tc.desc      校验几何域 geometry 第 7 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_06, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0038
     * @tc.name      testNdkRenderParamA030038
     * @tc.desc      校验几何域 geometry 第 7 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_06, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0039
     * @tc.name      testNdkRenderParamA030039
     * @tc.desc      校验几何域 geometry 第 7 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_06, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0040
     * @tc.name      testNdkRenderParamA030040
     * @tc.desc      校验几何域 geometry 第 7 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_06, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0041
     * @tc.name      testNdkRenderParamA030041
     * @tc.desc      校验几何域 geometry 第 7 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_06, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0042
     * @tc.name      testNdkRenderParamA030042
     * @tc.desc      校验几何域 geometry 第 7 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_06, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0043
     * @tc.name      testNdkRenderParamA030043
     * @tc.desc      校验几何域 geometry 第 8 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_07, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0044
     * @tc.name      testNdkRenderParamA030044
     * @tc.desc      校验几何域 geometry 第 8 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_07, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0045
     * @tc.name      testNdkRenderParamA030045
     * @tc.desc      校验几何域 geometry 第 8 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_07, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0046
     * @tc.name      testNdkRenderParamA030046
     * @tc.desc      校验几何域 geometry 第 8 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_07, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0047
     * @tc.name      testNdkRenderParamA030047
     * @tc.desc      校验几何域 geometry 第 8 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_07, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0048
     * @tc.name      testNdkRenderParamA030048
     * @tc.desc      校验几何域 geometry 第 8 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_07, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0049
     * @tc.name      testNdkRenderParamA030049
     * @tc.desc      校验几何域 geometry 第 9 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_08, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0050
     * @tc.name      testNdkRenderParamA030050
     * @tc.desc      校验几何域 geometry 第 9 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_08, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0051
     * @tc.name      testNdkRenderParamA030051
     * @tc.desc      校验几何域 geometry 第 9 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_08, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0052
     * @tc.name      testNdkRenderParamA030052
     * @tc.desc      校验几何域 geometry 第 9 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_08, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0053
     * @tc.name      testNdkRenderParamA030053
     * @tc.desc      校验几何域 geometry 第 9 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_08, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0054
     * @tc.name      testNdkRenderParamA030054
     * @tc.desc      校验几何域 geometry 第 9 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_08, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0055
     * @tc.name      testNdkRenderParamA030055
     * @tc.desc      校验几何域 geometry 第 10 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_09, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0056
     * @tc.name      testNdkRenderParamA030056
     * @tc.desc      校验几何域 geometry 第 10 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_09, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0057
     * @tc.name      testNdkRenderParamA030057
     * @tc.desc      校验几何域 geometry 第 10 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_09, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0058
     * @tc.name      testNdkRenderParamA030058
     * @tc.desc      校验几何域 geometry 第 10 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_09, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0059
     * @tc.name      testNdkRenderParamA030059
     * @tc.desc      校验几何域 geometry 第 10 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_09, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0060
     * @tc.name      testNdkRenderParamA030060
     * @tc.desc      校验几何域 geometry 第 10 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_09, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0061
     * @tc.name      testNdkRenderParamA030061
     * @tc.desc      校验几何域 geometry 第 11 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_10, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0062
     * @tc.name      testNdkRenderParamA030062
     * @tc.desc      校验几何域 geometry 第 11 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_10, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0063
     * @tc.name      testNdkRenderParamA030063
     * @tc.desc      校验几何域 geometry 第 11 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_10, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0064
     * @tc.name      testNdkRenderParamA030064
     * @tc.desc      校验几何域 geometry 第 11 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_10, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0065
     * @tc.name      testNdkRenderParamA030065
     * @tc.desc      校验几何域 geometry 第 11 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_10, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0066
     * @tc.name      testNdkRenderParamA030066
     * @tc.desc      校验几何域 geometry 第 11 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_10, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0067
     * @tc.name      testNdkRenderParamA030067
     * @tc.desc      校验几何域 geometry 第 12 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_11, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0068
     * @tc.name      testNdkRenderParamA030068
     * @tc.desc      校验几何域 geometry 第 12 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_11, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0069
     * @tc.name      testNdkRenderParamA030069
     * @tc.desc      校验几何域 geometry 第 12 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_11, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0070
     * @tc.name      testNdkRenderParamA030070
     * @tc.desc      校验几何域 geometry 第 12 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_11, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0071
     * @tc.name      testNdkRenderParamA030071
     * @tc.desc      校验几何域 geometry 第 12 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_11, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0072
     * @tc.name      testNdkRenderParamA030072
     * @tc.desc      校验几何域 geometry 第 12 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_11, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0073
     * @tc.name      testNdkRenderParamA030073
     * @tc.desc      校验几何域 geometry 第 13 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_12, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0074
     * @tc.name      testNdkRenderParamA030074
     * @tc.desc      校验几何域 geometry 第 13 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_12, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0075
     * @tc.name      testNdkRenderParamA030075
     * @tc.desc      校验几何域 geometry 第 13 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_12, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0076
     * @tc.name      testNdkRenderParamA030076
     * @tc.desc      校验几何域 geometry 第 13 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_12, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0077
     * @tc.name      testNdkRenderParamA030077
     * @tc.desc      校验几何域 geometry 第 13 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_12, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0078
     * @tc.name      testNdkRenderParamA030078
     * @tc.desc      校验几何域 geometry 第 13 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_12, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0079
     * @tc.name      testNdkRenderParamA030079
     * @tc.desc      校验几何域 geometry 第 14 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_13, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0080
     * @tc.name      testNdkRenderParamA030080
     * @tc.desc      校验几何域 geometry 第 14 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_13, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0081
     * @tc.name      testNdkRenderParamA030081
     * @tc.desc      校验几何域 geometry 第 14 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_13, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0082
     * @tc.name      testNdkRenderParamA030082
     * @tc.desc      校验几何域 geometry 第 14 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_13, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0083
     * @tc.name      testNdkRenderParamA030083
     * @tc.desc      校验几何域 geometry 第 14 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_13, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0084
     * @tc.name      testNdkRenderParamA030084
     * @tc.desc      校验几何域 geometry 第 14 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_13, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0085
     * @tc.name      testNdkRenderParamA030085
     * @tc.desc      校验几何域 geometry 第 15 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_14, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0086
     * @tc.name      testNdkRenderParamA030086
     * @tc.desc      校验几何域 geometry 第 15 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_14, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0087
     * @tc.name      testNdkRenderParamA030087
     * @tc.desc      校验几何域 geometry 第 15 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_14, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0088
     * @tc.name      testNdkRenderParamA030088
     * @tc.desc      校验几何域 geometry 第 15 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_14, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0089
     * @tc.name      testNdkRenderParamA030089
     * @tc.desc      校验几何域 geometry 第 15 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_14, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0090
     * @tc.name      testNdkRenderParamA030090
     * @tc.desc      校验几何域 geometry 第 15 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_14, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0091
     * @tc.name      testNdkRenderParamA030091
     * @tc.desc      校验几何域 geometry 第 16 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_15, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0092
     * @tc.name      testNdkRenderParamA030092
     * @tc.desc      校验几何域 geometry 第 16 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA030092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_15, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0093
     * @tc.name      testNdkRenderParamA030093
     * @tc.desc      校验几何域 geometry 第 16 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_15, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0094
     * @tc.name      testNdkRenderParamA030094
     * @tc.desc      校验几何域 geometry 第 16 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_15, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0095
     * @tc.name      testNdkRenderParamA030095
     * @tc.desc      校验几何域 geometry 第 16 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_15, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(GEOMETRY_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A03_0096
     * @tc.name      testNdkRenderParamA030096
     * @tc.desc      校验几何域 geometry 第 16 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA030096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(GEOMETRY_BUCKET, GEOMETRY_ORDINAL_15, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })
  })
}
