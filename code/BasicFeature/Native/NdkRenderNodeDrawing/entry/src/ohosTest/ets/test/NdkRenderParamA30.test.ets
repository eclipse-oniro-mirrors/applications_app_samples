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

// A 参数域第 30 组：覆盖矩阵域 matrix 第 17~27 个参数，每个参数六个维度各一条用例。
const MATRIX_BUCKET: number = 15;
const MATRIX_TOTAL: number = 27;
const MATRIX_ORDINAL_16: number = 16;
const MATRIX_ORDINAL_17: number = 17;
const MATRIX_ORDINAL_18: number = 18;
const MATRIX_ORDINAL_19: number = 19;
const MATRIX_ORDINAL_20: number = 20;
const MATRIX_ORDINAL_21: number = 21;
const MATRIX_ORDINAL_22: number = 22;
const MATRIX_ORDINAL_23: number = 23;
const MATRIX_ORDINAL_24: number = 24;
const MATRIX_ORDINAL_25: number = 25;
const MATRIX_ORDINAL_26: number = 26;

export default function ndkRenderParamA30Test(): void {
  describe('NdkRenderParamA30', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0001
     * @tc.name      testNdkRenderParamA300001
     * @tc.desc      校验矩阵域 matrix 第 17 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA300001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_16, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0002
     * @tc.name      testNdkRenderParamA300002
     * @tc.desc      校验矩阵域 matrix 第 17 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA300002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_16, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0003
     * @tc.name      testNdkRenderParamA300003
     * @tc.desc      校验矩阵域 matrix 第 17 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_16, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0004
     * @tc.name      testNdkRenderParamA300004
     * @tc.desc      校验矩阵域 matrix 第 17 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_16, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0005
     * @tc.name      testNdkRenderParamA300005
     * @tc.desc      校验矩阵域 matrix 第 17 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_16, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0006
     * @tc.name      testNdkRenderParamA300006
     * @tc.desc      校验矩阵域 matrix 第 17 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_16, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0007
     * @tc.name      testNdkRenderParamA300007
     * @tc.desc      校验矩阵域 matrix 第 18 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA300007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_17, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0008
     * @tc.name      testNdkRenderParamA300008
     * @tc.desc      校验矩阵域 matrix 第 18 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA300008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_17, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0009
     * @tc.name      testNdkRenderParamA300009
     * @tc.desc      校验矩阵域 matrix 第 18 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_17, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0010
     * @tc.name      testNdkRenderParamA300010
     * @tc.desc      校验矩阵域 matrix 第 18 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_17, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0011
     * @tc.name      testNdkRenderParamA300011
     * @tc.desc      校验矩阵域 matrix 第 18 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_17, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0012
     * @tc.name      testNdkRenderParamA300012
     * @tc.desc      校验矩阵域 matrix 第 18 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_17, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0013
     * @tc.name      testNdkRenderParamA300013
     * @tc.desc      校验矩阵域 matrix 第 19 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA300013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_18, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0014
     * @tc.name      testNdkRenderParamA300014
     * @tc.desc      校验矩阵域 matrix 第 19 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA300014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_18, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0015
     * @tc.name      testNdkRenderParamA300015
     * @tc.desc      校验矩阵域 matrix 第 19 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_18, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0016
     * @tc.name      testNdkRenderParamA300016
     * @tc.desc      校验矩阵域 matrix 第 19 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_18, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0017
     * @tc.name      testNdkRenderParamA300017
     * @tc.desc      校验矩阵域 matrix 第 19 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_18, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0018
     * @tc.name      testNdkRenderParamA300018
     * @tc.desc      校验矩阵域 matrix 第 19 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_18, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0019
     * @tc.name      testNdkRenderParamA300019
     * @tc.desc      校验矩阵域 matrix 第 20 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA300019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_19, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0020
     * @tc.name      testNdkRenderParamA300020
     * @tc.desc      校验矩阵域 matrix 第 20 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA300020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_19, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0021
     * @tc.name      testNdkRenderParamA300021
     * @tc.desc      校验矩阵域 matrix 第 20 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_19, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0022
     * @tc.name      testNdkRenderParamA300022
     * @tc.desc      校验矩阵域 matrix 第 20 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_19, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0023
     * @tc.name      testNdkRenderParamA300023
     * @tc.desc      校验矩阵域 matrix 第 20 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_19, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0024
     * @tc.name      testNdkRenderParamA300024
     * @tc.desc      校验矩阵域 matrix 第 20 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_19, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0025
     * @tc.name      testNdkRenderParamA300025
     * @tc.desc      校验矩阵域 matrix 第 21 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA300025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_20, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0026
     * @tc.name      testNdkRenderParamA300026
     * @tc.desc      校验矩阵域 matrix 第 21 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA300026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_20, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0027
     * @tc.name      testNdkRenderParamA300027
     * @tc.desc      校验矩阵域 matrix 第 21 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_20, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0028
     * @tc.name      testNdkRenderParamA300028
     * @tc.desc      校验矩阵域 matrix 第 21 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_20, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0029
     * @tc.name      testNdkRenderParamA300029
     * @tc.desc      校验矩阵域 matrix 第 21 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_20, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0030
     * @tc.name      testNdkRenderParamA300030
     * @tc.desc      校验矩阵域 matrix 第 21 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_20, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0031
     * @tc.name      testNdkRenderParamA300031
     * @tc.desc      校验矩阵域 matrix 第 22 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA300031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_21, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0032
     * @tc.name      testNdkRenderParamA300032
     * @tc.desc      校验矩阵域 matrix 第 22 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA300032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_21, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0033
     * @tc.name      testNdkRenderParamA300033
     * @tc.desc      校验矩阵域 matrix 第 22 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_21, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0034
     * @tc.name      testNdkRenderParamA300034
     * @tc.desc      校验矩阵域 matrix 第 22 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_21, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0035
     * @tc.name      testNdkRenderParamA300035
     * @tc.desc      校验矩阵域 matrix 第 22 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_21, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0036
     * @tc.name      testNdkRenderParamA300036
     * @tc.desc      校验矩阵域 matrix 第 22 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_21, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0037
     * @tc.name      testNdkRenderParamA300037
     * @tc.desc      校验矩阵域 matrix 第 23 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA300037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_22, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0038
     * @tc.name      testNdkRenderParamA300038
     * @tc.desc      校验矩阵域 matrix 第 23 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA300038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_22, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0039
     * @tc.name      testNdkRenderParamA300039
     * @tc.desc      校验矩阵域 matrix 第 23 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_22, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0040
     * @tc.name      testNdkRenderParamA300040
     * @tc.desc      校验矩阵域 matrix 第 23 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_22, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0041
     * @tc.name      testNdkRenderParamA300041
     * @tc.desc      校验矩阵域 matrix 第 23 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_22, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0042
     * @tc.name      testNdkRenderParamA300042
     * @tc.desc      校验矩阵域 matrix 第 23 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_22, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0043
     * @tc.name      testNdkRenderParamA300043
     * @tc.desc      校验矩阵域 matrix 第 24 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA300043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_23, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0044
     * @tc.name      testNdkRenderParamA300044
     * @tc.desc      校验矩阵域 matrix 第 24 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA300044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_23, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0045
     * @tc.name      testNdkRenderParamA300045
     * @tc.desc      校验矩阵域 matrix 第 24 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_23, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0046
     * @tc.name      testNdkRenderParamA300046
     * @tc.desc      校验矩阵域 matrix 第 24 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_23, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0047
     * @tc.name      testNdkRenderParamA300047
     * @tc.desc      校验矩阵域 matrix 第 24 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_23, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0048
     * @tc.name      testNdkRenderParamA300048
     * @tc.desc      校验矩阵域 matrix 第 24 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_23, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0049
     * @tc.name      testNdkRenderParamA300049
     * @tc.desc      校验矩阵域 matrix 第 25 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA300049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_24, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0050
     * @tc.name      testNdkRenderParamA300050
     * @tc.desc      校验矩阵域 matrix 第 25 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA300050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_24, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0051
     * @tc.name      testNdkRenderParamA300051
     * @tc.desc      校验矩阵域 matrix 第 25 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_24, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0052
     * @tc.name      testNdkRenderParamA300052
     * @tc.desc      校验矩阵域 matrix 第 25 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_24, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0053
     * @tc.name      testNdkRenderParamA300053
     * @tc.desc      校验矩阵域 matrix 第 25 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_24, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0054
     * @tc.name      testNdkRenderParamA300054
     * @tc.desc      校验矩阵域 matrix 第 25 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_24, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0055
     * @tc.name      testNdkRenderParamA300055
     * @tc.desc      校验矩阵域 matrix 第 26 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA300055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_25, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0056
     * @tc.name      testNdkRenderParamA300056
     * @tc.desc      校验矩阵域 matrix 第 26 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA300056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_25, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0057
     * @tc.name      testNdkRenderParamA300057
     * @tc.desc      校验矩阵域 matrix 第 26 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_25, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0058
     * @tc.name      testNdkRenderParamA300058
     * @tc.desc      校验矩阵域 matrix 第 26 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_25, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0059
     * @tc.name      testNdkRenderParamA300059
     * @tc.desc      校验矩阵域 matrix 第 26 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_25, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0060
     * @tc.name      testNdkRenderParamA300060
     * @tc.desc      校验矩阵域 matrix 第 26 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_25, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0061
     * @tc.name      testNdkRenderParamA300061
     * @tc.desc      校验矩阵域 matrix 第 27 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA300061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_26, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0062
     * @tc.name      testNdkRenderParamA300062
     * @tc.desc      校验矩阵域 matrix 第 27 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA300062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_26, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0063
     * @tc.name      testNdkRenderParamA300063
     * @tc.desc      校验矩阵域 matrix 第 27 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_26, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0064
     * @tc.name      testNdkRenderParamA300064
     * @tc.desc      校验矩阵域 matrix 第 27 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_26, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0065
     * @tc.name      testNdkRenderParamA300065
     * @tc.desc      校验矩阵域 matrix 第 27 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_26, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(MATRIX_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A30_0066
     * @tc.name      testNdkRenderParamA300066
     * @tc.desc      校验矩阵域 matrix 第 27 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA300066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(MATRIX_BUCKET, MATRIX_ORDINAL_26, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })
  })
}
