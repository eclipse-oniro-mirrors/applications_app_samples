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

// T 参数域第 10 组：覆盖专题 帧信号 topic-frame-tick 第 1~7 个参数，每个参数六个维度各一条用例。
const TOPIC_FRAME_TICK_BUCKET: number = 28;
const TOPIC_FRAME_TICK_TOTAL: number = 7;
const TOPIC_FRAME_TICK_ORDINAL_00: number = 0;
const TOPIC_FRAME_TICK_ORDINAL_01: number = 1;
const TOPIC_FRAME_TICK_ORDINAL_02: number = 2;
const TOPIC_FRAME_TICK_ORDINAL_03: number = 3;
const TOPIC_FRAME_TICK_ORDINAL_04: number = 4;
const TOPIC_FRAME_TICK_ORDINAL_05: number = 5;
const TOPIC_FRAME_TICK_ORDINAL_06: number = 6;

export default function ndkRenderParamT10Test(): void {
  describe('NdkRenderParamT10', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0001
     * @tc.name      testNdkRenderParamT100001
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 1 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamT100001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_00, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(TOPIC_FRAME_TICK_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0002
     * @tc.name      testNdkRenderParamT100002
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 1 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamT100002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_00, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(TOPIC_FRAME_TICK_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0003
     * @tc.name      testNdkRenderParamT100003
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 1 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamT100003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_00, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0004
     * @tc.name      testNdkRenderParamT100004
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 1 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamT100004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_00, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(TOPIC_FRAME_TICK_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0005
     * @tc.name      testNdkRenderParamT100005
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 1 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamT100005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_00, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(TOPIC_FRAME_TICK_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0006
     * @tc.name      testNdkRenderParamT100006
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 1 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamT100006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_00, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0007
     * @tc.name      testNdkRenderParamT100007
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 2 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamT100007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_01, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(TOPIC_FRAME_TICK_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0008
     * @tc.name      testNdkRenderParamT100008
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 2 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamT100008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_01, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(TOPIC_FRAME_TICK_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0009
     * @tc.name      testNdkRenderParamT100009
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 2 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamT100009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_01, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0010
     * @tc.name      testNdkRenderParamT100010
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 2 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamT100010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_01, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(TOPIC_FRAME_TICK_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0011
     * @tc.name      testNdkRenderParamT100011
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 2 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamT100011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_01, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(TOPIC_FRAME_TICK_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0012
     * @tc.name      testNdkRenderParamT100012
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 2 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamT100012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_01, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0013
     * @tc.name      testNdkRenderParamT100013
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 3 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamT100013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_02, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(TOPIC_FRAME_TICK_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0014
     * @tc.name      testNdkRenderParamT100014
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 3 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamT100014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_02, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(TOPIC_FRAME_TICK_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0015
     * @tc.name      testNdkRenderParamT100015
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 3 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamT100015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_02, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0016
     * @tc.name      testNdkRenderParamT100016
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 3 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamT100016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_02, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(TOPIC_FRAME_TICK_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0017
     * @tc.name      testNdkRenderParamT100017
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 3 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamT100017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_02, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(TOPIC_FRAME_TICK_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0018
     * @tc.name      testNdkRenderParamT100018
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 3 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamT100018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_02, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0019
     * @tc.name      testNdkRenderParamT100019
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 4 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamT100019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_03, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(TOPIC_FRAME_TICK_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0020
     * @tc.name      testNdkRenderParamT100020
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 4 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamT100020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_03, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(TOPIC_FRAME_TICK_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0021
     * @tc.name      testNdkRenderParamT100021
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 4 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamT100021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_03, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0022
     * @tc.name      testNdkRenderParamT100022
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 4 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamT100022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_03, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(TOPIC_FRAME_TICK_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0023
     * @tc.name      testNdkRenderParamT100023
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 4 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamT100023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_03, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(TOPIC_FRAME_TICK_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0024
     * @tc.name      testNdkRenderParamT100024
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 4 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamT100024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_03, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0025
     * @tc.name      testNdkRenderParamT100025
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 5 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamT100025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_04, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(TOPIC_FRAME_TICK_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0026
     * @tc.name      testNdkRenderParamT100026
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 5 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamT100026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_04, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(TOPIC_FRAME_TICK_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0027
     * @tc.name      testNdkRenderParamT100027
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 5 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamT100027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_04, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0028
     * @tc.name      testNdkRenderParamT100028
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 5 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamT100028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_04, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(TOPIC_FRAME_TICK_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0029
     * @tc.name      testNdkRenderParamT100029
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 5 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamT100029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_04, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(TOPIC_FRAME_TICK_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0030
     * @tc.name      testNdkRenderParamT100030
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 5 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamT100030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_04, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0031
     * @tc.name      testNdkRenderParamT100031
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 6 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamT100031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_05, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(TOPIC_FRAME_TICK_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0032
     * @tc.name      testNdkRenderParamT100032
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 6 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamT100032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_05, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(TOPIC_FRAME_TICK_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0033
     * @tc.name      testNdkRenderParamT100033
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 6 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamT100033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_05, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0034
     * @tc.name      testNdkRenderParamT100034
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 6 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamT100034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_05, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(TOPIC_FRAME_TICK_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0035
     * @tc.name      testNdkRenderParamT100035
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 6 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamT100035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_05, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(TOPIC_FRAME_TICK_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0036
     * @tc.name      testNdkRenderParamT100036
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 6 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamT100036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_05, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0037
     * @tc.name      testNdkRenderParamT100037
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 7 个参数在合法取值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamT100037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_06, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(TOPIC_FRAME_TICK_TOTAL);
      expect(observed.sceneIndex >= 0).assertTrue();
      expect(observed.paramKey.length).assertLarger(0);
      expect(observed.defaultLegal).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0038
     * @tc.name      testNdkRenderParamT100038
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 7 个参数在区间边界维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderParamT100038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_06, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(TOPIC_FRAME_TICK_TOTAL);
      expect(observed.kind >= 0).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.defaultLegal).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0039
     * @tc.name      testNdkRenderParamT100039
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 7 个参数在非法输入维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamT100039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_06, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.nanFallback).assertTrue();
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.stepAligned).assertTrue();
      expect(observed.summaryHasKey).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0040
     * @tc.name      testNdkRenderParamT100040
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 7 个参数在数值极值维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamT100040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_06, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.paramTotal).assertEqual(TOPIC_FRAME_TICK_TOTAL);
      expect(observed.lowExact).assertTrue();
      expect(observed.highExact).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0041
     * @tc.name      testNdkRenderParamT100041
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 7 个参数在多参数组合维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamT100041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_06, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.sceneCount).assertLarger(0);
      expect(observed.neighborsKept).assertTrue();
      expect(observed.normalizeIdempotent).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramTotal).assertEqual(TOPIC_FRAME_TICK_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PARAM_T10_0042
     * @tc.name      testNdkRenderParamT100042
     * @tc.desc      校验专题 帧信号 topic-frame-tick 第 7 个参数在重复操作状态维度上的参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderParamT100042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: ParamProbeObs = probeParam(TOPIC_FRAME_TICK_BUCKET, TOPIC_FRAME_TICK_ORDINAL_06, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.neighborsKept).assertTrue();
      expect(observed.selectIntegral).assertTrue();
    })
  })
}
