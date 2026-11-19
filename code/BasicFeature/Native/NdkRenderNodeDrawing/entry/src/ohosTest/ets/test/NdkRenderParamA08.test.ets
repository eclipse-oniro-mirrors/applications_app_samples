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

// A 参数域第 08 组：覆盖颜色域 color 第 17~19 个参数，每个参数六个维度各一条用例。
const COLOR_BUCKET: number = 3;
const COLOR_TOTAL: number = 19;
const COLOR_ORDINAL_16: number = 16;
const COLOR_ORDINAL_17: number = 17;
const COLOR_ORDINAL_18: number = 18;

export default function ndkRenderParamA08Test(): void {
  describe('NdkRenderParamA08', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A08_0001
     * @tc.name      testNdkRenderParamA080001
     * @tc.desc      校验颜色域 color 第 17 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA080001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(COLOR_BUCKET, COLOR_ORDINAL_16, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(COLOR_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A08_0002
     * @tc.name      testNdkRenderParamA080002
     * @tc.desc      校验颜色域 color 第 17 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA080002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(COLOR_BUCKET, COLOR_ORDINAL_16, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(COLOR_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A08_0003
     * @tc.name      testNdkRenderParamA080003
     * @tc.desc      校验颜色域 color 第 17 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA080003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(COLOR_BUCKET, COLOR_ORDINAL_16, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A08_0004
     * @tc.name      testNdkRenderParamA080004
     * @tc.desc      校验颜色域 color 第 17 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA080004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(COLOR_BUCKET, COLOR_ORDINAL_16, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(COLOR_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A08_0005
     * @tc.name      testNdkRenderParamA080005
     * @tc.desc      校验颜色域 color 第 17 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA080005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(COLOR_BUCKET, COLOR_ORDINAL_16, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(COLOR_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A08_0006
     * @tc.name      testNdkRenderParamA080006
     * @tc.desc      校验颜色域 color 第 17 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA080006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(COLOR_BUCKET, COLOR_ORDINAL_16, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A08_0007
     * @tc.name      testNdkRenderParamA080007
     * @tc.desc      校验颜色域 color 第 18 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA080007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(COLOR_BUCKET, COLOR_ORDINAL_17, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(COLOR_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A08_0008
     * @tc.name      testNdkRenderParamA080008
     * @tc.desc      校验颜色域 color 第 18 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA080008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(COLOR_BUCKET, COLOR_ORDINAL_17, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(COLOR_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A08_0009
     * @tc.name      testNdkRenderParamA080009
     * @tc.desc      校验颜色域 color 第 18 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA080009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(COLOR_BUCKET, COLOR_ORDINAL_17, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A08_0010
     * @tc.name      testNdkRenderParamA080010
     * @tc.desc      校验颜色域 color 第 18 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA080010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(COLOR_BUCKET, COLOR_ORDINAL_17, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(COLOR_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A08_0011
     * @tc.name      testNdkRenderParamA080011
     * @tc.desc      校验颜色域 color 第 18 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA080011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(COLOR_BUCKET, COLOR_ORDINAL_17, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(COLOR_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A08_0012
     * @tc.name      testNdkRenderParamA080012
     * @tc.desc      校验颜色域 color 第 18 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA080012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(COLOR_BUCKET, COLOR_ORDINAL_17, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A08_0013
     * @tc.name      testNdkRenderParamA080013
     * @tc.desc      校验颜色域 color 第 19 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA080013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(COLOR_BUCKET, COLOR_ORDINAL_18, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(COLOR_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A08_0014
     * @tc.name      testNdkRenderParamA080014
     * @tc.desc      校验颜色域 color 第 19 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA080014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(COLOR_BUCKET, COLOR_ORDINAL_18, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(COLOR_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A08_0015
     * @tc.name      testNdkRenderParamA080015
     * @tc.desc      校验颜色域 color 第 19 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA080015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(COLOR_BUCKET, COLOR_ORDINAL_18, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A08_0016
     * @tc.name      testNdkRenderParamA080016
     * @tc.desc      校验颜色域 color 第 19 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA080016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(COLOR_BUCKET, COLOR_ORDINAL_18, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(COLOR_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A08_0017
     * @tc.name      testNdkRenderParamA080017
     * @tc.desc      校验颜色域 color 第 19 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA080017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(COLOR_BUCKET, COLOR_ORDINAL_18, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(COLOR_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A08_0018
     * @tc.name      testNdkRenderParamA080018
     * @tc.desc      校验颜色域 color 第 19 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA080018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(COLOR_BUCKET, COLOR_ORDINAL_18, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })
  })
}
