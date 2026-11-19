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

// A 参数域第 21 组：覆盖图像读写域 imageIo 第 1~16 个参数，每个参数六个维度各一条用例。
const IMAGE_IO_BUCKET: number = 10;
const IMAGE_IO_TOTAL: number = 16;
const IMAGE_IO_ORDINAL_00: number = 0;
const IMAGE_IO_ORDINAL_01: number = 1;
const IMAGE_IO_ORDINAL_02: number = 2;
const IMAGE_IO_ORDINAL_03: number = 3;
const IMAGE_IO_ORDINAL_04: number = 4;
const IMAGE_IO_ORDINAL_05: number = 5;
const IMAGE_IO_ORDINAL_06: number = 6;
const IMAGE_IO_ORDINAL_07: number = 7;
const IMAGE_IO_ORDINAL_08: number = 8;
const IMAGE_IO_ORDINAL_09: number = 9;
const IMAGE_IO_ORDINAL_10: number = 10;
const IMAGE_IO_ORDINAL_11: number = 11;
const IMAGE_IO_ORDINAL_12: number = 12;
const IMAGE_IO_ORDINAL_13: number = 13;
const IMAGE_IO_ORDINAL_14: number = 14;
const IMAGE_IO_ORDINAL_15: number = 15;

export default function ndkRenderParamA21Test(): void {
  describe('NdkRenderParamA21', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0001
     * @tc.name      testNdkRenderParamA210001
     * @tc.desc      校验图像读写域 imageIo 第 1 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_00, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0002
     * @tc.name      testNdkRenderParamA210002
     * @tc.desc      校验图像读写域 imageIo 第 1 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_00, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0003
     * @tc.name      testNdkRenderParamA210003
     * @tc.desc      校验图像读写域 imageIo 第 1 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_00, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0004
     * @tc.name      testNdkRenderParamA210004
     * @tc.desc      校验图像读写域 imageIo 第 1 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_00, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0005
     * @tc.name      testNdkRenderParamA210005
     * @tc.desc      校验图像读写域 imageIo 第 1 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_00, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0006
     * @tc.name      testNdkRenderParamA210006
     * @tc.desc      校验图像读写域 imageIo 第 1 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_00, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0007
     * @tc.name      testNdkRenderParamA210007
     * @tc.desc      校验图像读写域 imageIo 第 2 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_01, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0008
     * @tc.name      testNdkRenderParamA210008
     * @tc.desc      校验图像读写域 imageIo 第 2 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_01, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0009
     * @tc.name      testNdkRenderParamA210009
     * @tc.desc      校验图像读写域 imageIo 第 2 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_01, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0010
     * @tc.name      testNdkRenderParamA210010
     * @tc.desc      校验图像读写域 imageIo 第 2 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_01, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0011
     * @tc.name      testNdkRenderParamA210011
     * @tc.desc      校验图像读写域 imageIo 第 2 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_01, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0012
     * @tc.name      testNdkRenderParamA210012
     * @tc.desc      校验图像读写域 imageIo 第 2 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_01, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0013
     * @tc.name      testNdkRenderParamA210013
     * @tc.desc      校验图像读写域 imageIo 第 3 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_02, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0014
     * @tc.name      testNdkRenderParamA210014
     * @tc.desc      校验图像读写域 imageIo 第 3 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_02, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0015
     * @tc.name      testNdkRenderParamA210015
     * @tc.desc      校验图像读写域 imageIo 第 3 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_02, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0016
     * @tc.name      testNdkRenderParamA210016
     * @tc.desc      校验图像读写域 imageIo 第 3 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_02, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0017
     * @tc.name      testNdkRenderParamA210017
     * @tc.desc      校验图像读写域 imageIo 第 3 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_02, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0018
     * @tc.name      testNdkRenderParamA210018
     * @tc.desc      校验图像读写域 imageIo 第 3 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_02, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0019
     * @tc.name      testNdkRenderParamA210019
     * @tc.desc      校验图像读写域 imageIo 第 4 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_03, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0020
     * @tc.name      testNdkRenderParamA210020
     * @tc.desc      校验图像读写域 imageIo 第 4 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_03, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0021
     * @tc.name      testNdkRenderParamA210021
     * @tc.desc      校验图像读写域 imageIo 第 4 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_03, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0022
     * @tc.name      testNdkRenderParamA210022
     * @tc.desc      校验图像读写域 imageIo 第 4 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_03, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0023
     * @tc.name      testNdkRenderParamA210023
     * @tc.desc      校验图像读写域 imageIo 第 4 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_03, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0024
     * @tc.name      testNdkRenderParamA210024
     * @tc.desc      校验图像读写域 imageIo 第 4 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_03, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0025
     * @tc.name      testNdkRenderParamA210025
     * @tc.desc      校验图像读写域 imageIo 第 5 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_04, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0026
     * @tc.name      testNdkRenderParamA210026
     * @tc.desc      校验图像读写域 imageIo 第 5 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_04, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0027
     * @tc.name      testNdkRenderParamA210027
     * @tc.desc      校验图像读写域 imageIo 第 5 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_04, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0028
     * @tc.name      testNdkRenderParamA210028
     * @tc.desc      校验图像读写域 imageIo 第 5 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_04, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0029
     * @tc.name      testNdkRenderParamA210029
     * @tc.desc      校验图像读写域 imageIo 第 5 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_04, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0030
     * @tc.name      testNdkRenderParamA210030
     * @tc.desc      校验图像读写域 imageIo 第 5 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_04, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0031
     * @tc.name      testNdkRenderParamA210031
     * @tc.desc      校验图像读写域 imageIo 第 6 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_05, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0032
     * @tc.name      testNdkRenderParamA210032
     * @tc.desc      校验图像读写域 imageIo 第 6 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_05, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0033
     * @tc.name      testNdkRenderParamA210033
     * @tc.desc      校验图像读写域 imageIo 第 6 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_05, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0034
     * @tc.name      testNdkRenderParamA210034
     * @tc.desc      校验图像读写域 imageIo 第 6 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_05, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0035
     * @tc.name      testNdkRenderParamA210035
     * @tc.desc      校验图像读写域 imageIo 第 6 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_05, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0036
     * @tc.name      testNdkRenderParamA210036
     * @tc.desc      校验图像读写域 imageIo 第 6 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_05, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0037
     * @tc.name      testNdkRenderParamA210037
     * @tc.desc      校验图像读写域 imageIo 第 7 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_06, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0038
     * @tc.name      testNdkRenderParamA210038
     * @tc.desc      校验图像读写域 imageIo 第 7 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_06, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0039
     * @tc.name      testNdkRenderParamA210039
     * @tc.desc      校验图像读写域 imageIo 第 7 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_06, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0040
     * @tc.name      testNdkRenderParamA210040
     * @tc.desc      校验图像读写域 imageIo 第 7 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_06, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0041
     * @tc.name      testNdkRenderParamA210041
     * @tc.desc      校验图像读写域 imageIo 第 7 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_06, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0042
     * @tc.name      testNdkRenderParamA210042
     * @tc.desc      校验图像读写域 imageIo 第 7 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_06, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0043
     * @tc.name      testNdkRenderParamA210043
     * @tc.desc      校验图像读写域 imageIo 第 8 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_07, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0044
     * @tc.name      testNdkRenderParamA210044
     * @tc.desc      校验图像读写域 imageIo 第 8 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_07, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0045
     * @tc.name      testNdkRenderParamA210045
     * @tc.desc      校验图像读写域 imageIo 第 8 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_07, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0046
     * @tc.name      testNdkRenderParamA210046
     * @tc.desc      校验图像读写域 imageIo 第 8 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_07, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0047
     * @tc.name      testNdkRenderParamA210047
     * @tc.desc      校验图像读写域 imageIo 第 8 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_07, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0048
     * @tc.name      testNdkRenderParamA210048
     * @tc.desc      校验图像读写域 imageIo 第 8 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_07, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0049
     * @tc.name      testNdkRenderParamA210049
     * @tc.desc      校验图像读写域 imageIo 第 9 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_08, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0050
     * @tc.name      testNdkRenderParamA210050
     * @tc.desc      校验图像读写域 imageIo 第 9 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_08, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0051
     * @tc.name      testNdkRenderParamA210051
     * @tc.desc      校验图像读写域 imageIo 第 9 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_08, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0052
     * @tc.name      testNdkRenderParamA210052
     * @tc.desc      校验图像读写域 imageIo 第 9 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_08, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0053
     * @tc.name      testNdkRenderParamA210053
     * @tc.desc      校验图像读写域 imageIo 第 9 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_08, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0054
     * @tc.name      testNdkRenderParamA210054
     * @tc.desc      校验图像读写域 imageIo 第 9 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_08, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0055
     * @tc.name      testNdkRenderParamA210055
     * @tc.desc      校验图像读写域 imageIo 第 10 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_09, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0056
     * @tc.name      testNdkRenderParamA210056
     * @tc.desc      校验图像读写域 imageIo 第 10 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_09, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0057
     * @tc.name      testNdkRenderParamA210057
     * @tc.desc      校验图像读写域 imageIo 第 10 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_09, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0058
     * @tc.name      testNdkRenderParamA210058
     * @tc.desc      校验图像读写域 imageIo 第 10 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_09, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0059
     * @tc.name      testNdkRenderParamA210059
     * @tc.desc      校验图像读写域 imageIo 第 10 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_09, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0060
     * @tc.name      testNdkRenderParamA210060
     * @tc.desc      校验图像读写域 imageIo 第 10 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_09, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0061
     * @tc.name      testNdkRenderParamA210061
     * @tc.desc      校验图像读写域 imageIo 第 11 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_10, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0062
     * @tc.name      testNdkRenderParamA210062
     * @tc.desc      校验图像读写域 imageIo 第 11 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_10, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0063
     * @tc.name      testNdkRenderParamA210063
     * @tc.desc      校验图像读写域 imageIo 第 11 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_10, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0064
     * @tc.name      testNdkRenderParamA210064
     * @tc.desc      校验图像读写域 imageIo 第 11 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_10, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0065
     * @tc.name      testNdkRenderParamA210065
     * @tc.desc      校验图像读写域 imageIo 第 11 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_10, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0066
     * @tc.name      testNdkRenderParamA210066
     * @tc.desc      校验图像读写域 imageIo 第 11 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_10, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0067
     * @tc.name      testNdkRenderParamA210067
     * @tc.desc      校验图像读写域 imageIo 第 12 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_11, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0068
     * @tc.name      testNdkRenderParamA210068
     * @tc.desc      校验图像读写域 imageIo 第 12 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_11, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0069
     * @tc.name      testNdkRenderParamA210069
     * @tc.desc      校验图像读写域 imageIo 第 12 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_11, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0070
     * @tc.name      testNdkRenderParamA210070
     * @tc.desc      校验图像读写域 imageIo 第 12 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_11, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0071
     * @tc.name      testNdkRenderParamA210071
     * @tc.desc      校验图像读写域 imageIo 第 12 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_11, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0072
     * @tc.name      testNdkRenderParamA210072
     * @tc.desc      校验图像读写域 imageIo 第 12 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_11, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0073
     * @tc.name      testNdkRenderParamA210073
     * @tc.desc      校验图像读写域 imageIo 第 13 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_12, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0074
     * @tc.name      testNdkRenderParamA210074
     * @tc.desc      校验图像读写域 imageIo 第 13 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_12, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0075
     * @tc.name      testNdkRenderParamA210075
     * @tc.desc      校验图像读写域 imageIo 第 13 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_12, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0076
     * @tc.name      testNdkRenderParamA210076
     * @tc.desc      校验图像读写域 imageIo 第 13 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_12, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0077
     * @tc.name      testNdkRenderParamA210077
     * @tc.desc      校验图像读写域 imageIo 第 13 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_12, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0078
     * @tc.name      testNdkRenderParamA210078
     * @tc.desc      校验图像读写域 imageIo 第 13 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_12, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0079
     * @tc.name      testNdkRenderParamA210079
     * @tc.desc      校验图像读写域 imageIo 第 14 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_13, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0080
     * @tc.name      testNdkRenderParamA210080
     * @tc.desc      校验图像读写域 imageIo 第 14 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_13, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0081
     * @tc.name      testNdkRenderParamA210081
     * @tc.desc      校验图像读写域 imageIo 第 14 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_13, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0082
     * @tc.name      testNdkRenderParamA210082
     * @tc.desc      校验图像读写域 imageIo 第 14 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_13, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0083
     * @tc.name      testNdkRenderParamA210083
     * @tc.desc      校验图像读写域 imageIo 第 14 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_13, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0084
     * @tc.name      testNdkRenderParamA210084
     * @tc.desc      校验图像读写域 imageIo 第 14 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_13, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0085
     * @tc.name      testNdkRenderParamA210085
     * @tc.desc      校验图像读写域 imageIo 第 15 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_14, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0086
     * @tc.name      testNdkRenderParamA210086
     * @tc.desc      校验图像读写域 imageIo 第 15 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_14, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0087
     * @tc.name      testNdkRenderParamA210087
     * @tc.desc      校验图像读写域 imageIo 第 15 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_14, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0088
     * @tc.name      testNdkRenderParamA210088
     * @tc.desc      校验图像读写域 imageIo 第 15 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_14, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0089
     * @tc.name      testNdkRenderParamA210089
     * @tc.desc      校验图像读写域 imageIo 第 15 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_14, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0090
     * @tc.name      testNdkRenderParamA210090
     * @tc.desc      校验图像读写域 imageIo 第 15 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_14, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0091
     * @tc.name      testNdkRenderParamA210091
     * @tc.desc      校验图像读写域 imageIo 第 16 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_15, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0092
     * @tc.name      testNdkRenderParamA210092
     * @tc.desc      校验图像读写域 imageIo 第 16 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamA210092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_15, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0093
     * @tc.name      testNdkRenderParamA210093
     * @tc.desc      校验图像读写域 imageIo 第 16 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_15, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0094
     * @tc.name      testNdkRenderParamA210094
     * @tc.desc      校验图像读写域 imageIo 第 16 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_15, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0095
     * @tc.name      testNdkRenderParamA210095
     * @tc.desc      校验图像读写域 imageIo 第 16 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_15, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(IMAGE_IO_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_A21_0096
     * @tc.name      testNdkRenderParamA210096
     * @tc.desc      校验图像读写域 imageIo 第 16 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamA210096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(IMAGE_IO_BUCKET, IMAGE_IO_ORDINAL_15, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })
  })
}
