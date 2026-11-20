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
import { DIM_BOUND, DIM_COMBO, DIM_EXTREME, DIM_INVALID, DIM_LEGAL, DIM_STATE } from './ParamProbe';
import { probeScene, SceneProbeObs } from './SceneProbe';

// 场景轴 MaskFilter 桶：覆盖第 6 个分组的 8 个场景，每个场景六个维度各一条用例。
const MASKFILTER_BUCKET: number = 6;
const MASKFILTER_SCENE_TOTAL: number = 8;
const MASKFILTER_SCENE_00: number = 0;
const MASKFILTER_SCENE_01: number = 1;
const MASKFILTER_SCENE_02: number = 2;
const MASKFILTER_SCENE_03: number = 3;
const MASKFILTER_SCENE_04: number = 4;
const MASKFILTER_SCENE_05: number = 5;
const MASKFILTER_SCENE_06: number = 6;
const MASKFILTER_SCENE_07: number = 7;
const MASKFILTER_PARAMS_00: number = 3;
const MASKFILTER_PARAMS_01: number = 3;
const MASKFILTER_PARAMS_02: number = 3;
const MASKFILTER_PARAMS_03: number = 3;
const MASKFILTER_PARAMS_04: number = 3;
const MASKFILTER_PARAMS_05: number = 4;
const MASKFILTER_PARAMS_06: number = 3;
const MASKFILTER_PARAMS_07: number = 3;

export default function ndkRenderSceneMaskFilterTest(): void {
  describe('NdkRenderSceneMaskFilter', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0001
     * @tc.name      testNdkRenderSceneMaskFilter0001
     * @tc.desc      校验 MaskFilter 第 1 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneMaskFilter0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_00, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(MASKFILTER_SCENE_00);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_00);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(MASKFILTER_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0002
     * @tc.name      testNdkRenderSceneMaskFilter0002
     * @tc.desc      校验 MaskFilter 第 1 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneMaskFilter0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_00, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_00);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(MASKFILTER_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0003
     * @tc.name      testNdkRenderSceneMaskFilter0003
     * @tc.desc      校验 MaskFilter 第 1 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_00, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0004
     * @tc.name      testNdkRenderSceneMaskFilter0004
     * @tc.desc      校验 MaskFilter 第 1 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_00, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0005
     * @tc.name      testNdkRenderSceneMaskFilter0005
     * @tc.desc      校验 MaskFilter 第 1 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_00, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0006
     * @tc.name      testNdkRenderSceneMaskFilter0006
     * @tc.desc      校验 MaskFilter 第 1 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_00, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0007
     * @tc.name      testNdkRenderSceneMaskFilter0007
     * @tc.desc      校验 MaskFilter 第 2 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneMaskFilter0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_01, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(MASKFILTER_SCENE_01);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_01);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(MASKFILTER_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0008
     * @tc.name      testNdkRenderSceneMaskFilter0008
     * @tc.desc      校验 MaskFilter 第 2 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneMaskFilter0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_01, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_01);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(MASKFILTER_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0009
     * @tc.name      testNdkRenderSceneMaskFilter0009
     * @tc.desc      校验 MaskFilter 第 2 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_01, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0010
     * @tc.name      testNdkRenderSceneMaskFilter0010
     * @tc.desc      校验 MaskFilter 第 2 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_01, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0011
     * @tc.name      testNdkRenderSceneMaskFilter0011
     * @tc.desc      校验 MaskFilter 第 2 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_01, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0012
     * @tc.name      testNdkRenderSceneMaskFilter0012
     * @tc.desc      校验 MaskFilter 第 2 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_01, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0013
     * @tc.name      testNdkRenderSceneMaskFilter0013
     * @tc.desc      校验 MaskFilter 第 3 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneMaskFilter0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_02, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(MASKFILTER_SCENE_02);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_02);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(MASKFILTER_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0014
     * @tc.name      testNdkRenderSceneMaskFilter0014
     * @tc.desc      校验 MaskFilter 第 3 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneMaskFilter0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_02, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_02);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(MASKFILTER_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0015
     * @tc.name      testNdkRenderSceneMaskFilter0015
     * @tc.desc      校验 MaskFilter 第 3 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_02, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0016
     * @tc.name      testNdkRenderSceneMaskFilter0016
     * @tc.desc      校验 MaskFilter 第 3 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_02, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0017
     * @tc.name      testNdkRenderSceneMaskFilter0017
     * @tc.desc      校验 MaskFilter 第 3 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_02, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0018
     * @tc.name      testNdkRenderSceneMaskFilter0018
     * @tc.desc      校验 MaskFilter 第 3 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_02, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0019
     * @tc.name      testNdkRenderSceneMaskFilter0019
     * @tc.desc      校验 MaskFilter 第 4 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneMaskFilter0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_03, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(MASKFILTER_SCENE_03);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_03);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(MASKFILTER_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0020
     * @tc.name      testNdkRenderSceneMaskFilter0020
     * @tc.desc      校验 MaskFilter 第 4 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneMaskFilter0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_03, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_03);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(MASKFILTER_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0021
     * @tc.name      testNdkRenderSceneMaskFilter0021
     * @tc.desc      校验 MaskFilter 第 4 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_03, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0022
     * @tc.name      testNdkRenderSceneMaskFilter0022
     * @tc.desc      校验 MaskFilter 第 4 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_03, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0023
     * @tc.name      testNdkRenderSceneMaskFilter0023
     * @tc.desc      校验 MaskFilter 第 4 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_03, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0024
     * @tc.name      testNdkRenderSceneMaskFilter0024
     * @tc.desc      校验 MaskFilter 第 4 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_03, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0025
     * @tc.name      testNdkRenderSceneMaskFilter0025
     * @tc.desc      校验 MaskFilter 第 5 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneMaskFilter0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_04, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(MASKFILTER_SCENE_04);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_04);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(MASKFILTER_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0026
     * @tc.name      testNdkRenderSceneMaskFilter0026
     * @tc.desc      校验 MaskFilter 第 5 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneMaskFilter0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_04, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_04);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(MASKFILTER_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0027
     * @tc.name      testNdkRenderSceneMaskFilter0027
     * @tc.desc      校验 MaskFilter 第 5 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_04, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0028
     * @tc.name      testNdkRenderSceneMaskFilter0028
     * @tc.desc      校验 MaskFilter 第 5 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_04, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0029
     * @tc.name      testNdkRenderSceneMaskFilter0029
     * @tc.desc      校验 MaskFilter 第 5 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_04, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0030
     * @tc.name      testNdkRenderSceneMaskFilter0030
     * @tc.desc      校验 MaskFilter 第 5 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_04, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0031
     * @tc.name      testNdkRenderSceneMaskFilter0031
     * @tc.desc      校验 MaskFilter 第 6 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneMaskFilter0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_05, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(MASKFILTER_SCENE_05);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_05);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(MASKFILTER_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0032
     * @tc.name      testNdkRenderSceneMaskFilter0032
     * @tc.desc      校验 MaskFilter 第 6 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneMaskFilter0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_05, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_05);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(MASKFILTER_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0033
     * @tc.name      testNdkRenderSceneMaskFilter0033
     * @tc.desc      校验 MaskFilter 第 6 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_05, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0034
     * @tc.name      testNdkRenderSceneMaskFilter0034
     * @tc.desc      校验 MaskFilter 第 6 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_05, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0035
     * @tc.name      testNdkRenderSceneMaskFilter0035
     * @tc.desc      校验 MaskFilter 第 6 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_05, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0036
     * @tc.name      testNdkRenderSceneMaskFilter0036
     * @tc.desc      校验 MaskFilter 第 6 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_05, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0037
     * @tc.name      testNdkRenderSceneMaskFilter0037
     * @tc.desc      校验 MaskFilter 第 7 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneMaskFilter0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_06, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(MASKFILTER_SCENE_06);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_06);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(MASKFILTER_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0038
     * @tc.name      testNdkRenderSceneMaskFilter0038
     * @tc.desc      校验 MaskFilter 第 7 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneMaskFilter0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_06, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_06);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(MASKFILTER_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0039
     * @tc.name      testNdkRenderSceneMaskFilter0039
     * @tc.desc      校验 MaskFilter 第 7 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_06, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0040
     * @tc.name      testNdkRenderSceneMaskFilter0040
     * @tc.desc      校验 MaskFilter 第 7 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_06, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0041
     * @tc.name      testNdkRenderSceneMaskFilter0041
     * @tc.desc      校验 MaskFilter 第 7 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_06, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0042
     * @tc.name      testNdkRenderSceneMaskFilter0042
     * @tc.desc      校验 MaskFilter 第 7 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_06, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0043
     * @tc.name      testNdkRenderSceneMaskFilter0043
     * @tc.desc      校验 MaskFilter 第 8 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneMaskFilter0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_07, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(MASKFILTER_SCENE_07);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_07);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(MASKFILTER_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0044
     * @tc.name      testNdkRenderSceneMaskFilter0044
     * @tc.desc      校验 MaskFilter 第 8 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneMaskFilter0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_07, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_07);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(MASKFILTER_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0045
     * @tc.name      testNdkRenderSceneMaskFilter0045
     * @tc.desc      校验 MaskFilter 第 8 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_07, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0046
     * @tc.name      testNdkRenderSceneMaskFilter0046
     * @tc.desc      校验 MaskFilter 第 8 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_07, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0047
     * @tc.name      testNdkRenderSceneMaskFilter0047
     * @tc.desc      校验 MaskFilter 第 8 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_07, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_MASKFILTER_0048
     * @tc.name      testNdkRenderSceneMaskFilter0048
     * @tc.desc      校验 MaskFilter 第 8 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneMaskFilter0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(MASKFILTER_BUCKET, MASKFILTER_SCENE_07, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(MASKFILTER_PARAMS_07);
    })

  })
}
