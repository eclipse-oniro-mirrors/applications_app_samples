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

// 场景轴 ColorFilter 桶：覆盖第 4 个分组的 9 个场景，每个场景六个维度各一条用例。
const COLORFILTER_BUCKET: number = 4;
const COLORFILTER_SCENE_TOTAL: number = 9;
const COLORFILTER_SCENE_00: number = 0;
const COLORFILTER_SCENE_01: number = 1;
const COLORFILTER_SCENE_02: number = 2;
const COLORFILTER_SCENE_03: number = 3;
const COLORFILTER_SCENE_04: number = 4;
const COLORFILTER_SCENE_05: number = 5;
const COLORFILTER_SCENE_06: number = 6;
const COLORFILTER_SCENE_07: number = 7;
const COLORFILTER_SCENE_08: number = 8;
const COLORFILTER_PARAMS_00: number = 2;
const COLORFILTER_PARAMS_01: number = 2;
const COLORFILTER_PARAMS_02: number = 2;
const COLORFILTER_PARAMS_03: number = 2;
const COLORFILTER_PARAMS_04: number = 2;
const COLORFILTER_PARAMS_05: number = 2;
const COLORFILTER_PARAMS_06: number = 2;
const COLORFILTER_PARAMS_07: number = 2;
const COLORFILTER_PARAMS_08: number = 2;

export default function ndkRenderSceneColorFilterTest(): void {
  describe('NdkRenderSceneColorFilter', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0001
     * @tc.name      testNdkRenderSceneColorFilter0001
     * @tc.desc      校验 ColorFilter 第 1 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneColorFilter0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_00, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(COLORFILTER_SCENE_00);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_00);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(COLORFILTER_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0002
     * @tc.name      testNdkRenderSceneColorFilter0002
     * @tc.desc      校验 ColorFilter 第 1 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneColorFilter0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_00, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_00);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(COLORFILTER_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0003
     * @tc.name      testNdkRenderSceneColorFilter0003
     * @tc.desc      校验 ColorFilter 第 1 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_00, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0004
     * @tc.name      testNdkRenderSceneColorFilter0004
     * @tc.desc      校验 ColorFilter 第 1 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_00, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0005
     * @tc.name      testNdkRenderSceneColorFilter0005
     * @tc.desc      校验 ColorFilter 第 1 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_00, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0006
     * @tc.name      testNdkRenderSceneColorFilter0006
     * @tc.desc      校验 ColorFilter 第 1 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_00, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0007
     * @tc.name      testNdkRenderSceneColorFilter0007
     * @tc.desc      校验 ColorFilter 第 2 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneColorFilter0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_01, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(COLORFILTER_SCENE_01);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_01);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(COLORFILTER_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0008
     * @tc.name      testNdkRenderSceneColorFilter0008
     * @tc.desc      校验 ColorFilter 第 2 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneColorFilter0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_01, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_01);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(COLORFILTER_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0009
     * @tc.name      testNdkRenderSceneColorFilter0009
     * @tc.desc      校验 ColorFilter 第 2 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_01, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0010
     * @tc.name      testNdkRenderSceneColorFilter0010
     * @tc.desc      校验 ColorFilter 第 2 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_01, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0011
     * @tc.name      testNdkRenderSceneColorFilter0011
     * @tc.desc      校验 ColorFilter 第 2 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_01, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0012
     * @tc.name      testNdkRenderSceneColorFilter0012
     * @tc.desc      校验 ColorFilter 第 2 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_01, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0013
     * @tc.name      testNdkRenderSceneColorFilter0013
     * @tc.desc      校验 ColorFilter 第 3 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneColorFilter0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_02, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(COLORFILTER_SCENE_02);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_02);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(COLORFILTER_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0014
     * @tc.name      testNdkRenderSceneColorFilter0014
     * @tc.desc      校验 ColorFilter 第 3 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneColorFilter0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_02, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_02);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(COLORFILTER_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0015
     * @tc.name      testNdkRenderSceneColorFilter0015
     * @tc.desc      校验 ColorFilter 第 3 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_02, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0016
     * @tc.name      testNdkRenderSceneColorFilter0016
     * @tc.desc      校验 ColorFilter 第 3 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_02, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0017
     * @tc.name      testNdkRenderSceneColorFilter0017
     * @tc.desc      校验 ColorFilter 第 3 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_02, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0018
     * @tc.name      testNdkRenderSceneColorFilter0018
     * @tc.desc      校验 ColorFilter 第 3 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_02, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0019
     * @tc.name      testNdkRenderSceneColorFilter0019
     * @tc.desc      校验 ColorFilter 第 4 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneColorFilter0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_03, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(COLORFILTER_SCENE_03);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_03);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(COLORFILTER_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0020
     * @tc.name      testNdkRenderSceneColorFilter0020
     * @tc.desc      校验 ColorFilter 第 4 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneColorFilter0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_03, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_03);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(COLORFILTER_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0021
     * @tc.name      testNdkRenderSceneColorFilter0021
     * @tc.desc      校验 ColorFilter 第 4 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_03, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0022
     * @tc.name      testNdkRenderSceneColorFilter0022
     * @tc.desc      校验 ColorFilter 第 4 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_03, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0023
     * @tc.name      testNdkRenderSceneColorFilter0023
     * @tc.desc      校验 ColorFilter 第 4 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_03, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0024
     * @tc.name      testNdkRenderSceneColorFilter0024
     * @tc.desc      校验 ColorFilter 第 4 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_03, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0025
     * @tc.name      testNdkRenderSceneColorFilter0025
     * @tc.desc      校验 ColorFilter 第 5 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneColorFilter0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_04, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(COLORFILTER_SCENE_04);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_04);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(COLORFILTER_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0026
     * @tc.name      testNdkRenderSceneColorFilter0026
     * @tc.desc      校验 ColorFilter 第 5 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneColorFilter0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_04, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_04);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(COLORFILTER_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0027
     * @tc.name      testNdkRenderSceneColorFilter0027
     * @tc.desc      校验 ColorFilter 第 5 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_04, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0028
     * @tc.name      testNdkRenderSceneColorFilter0028
     * @tc.desc      校验 ColorFilter 第 5 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_04, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0029
     * @tc.name      testNdkRenderSceneColorFilter0029
     * @tc.desc      校验 ColorFilter 第 5 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_04, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0030
     * @tc.name      testNdkRenderSceneColorFilter0030
     * @tc.desc      校验 ColorFilter 第 5 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_04, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0031
     * @tc.name      testNdkRenderSceneColorFilter0031
     * @tc.desc      校验 ColorFilter 第 6 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneColorFilter0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_05, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(COLORFILTER_SCENE_05);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_05);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(COLORFILTER_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0032
     * @tc.name      testNdkRenderSceneColorFilter0032
     * @tc.desc      校验 ColorFilter 第 6 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneColorFilter0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_05, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_05);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(COLORFILTER_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0033
     * @tc.name      testNdkRenderSceneColorFilter0033
     * @tc.desc      校验 ColorFilter 第 6 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_05, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0034
     * @tc.name      testNdkRenderSceneColorFilter0034
     * @tc.desc      校验 ColorFilter 第 6 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_05, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0035
     * @tc.name      testNdkRenderSceneColorFilter0035
     * @tc.desc      校验 ColorFilter 第 6 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_05, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0036
     * @tc.name      testNdkRenderSceneColorFilter0036
     * @tc.desc      校验 ColorFilter 第 6 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_05, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0037
     * @tc.name      testNdkRenderSceneColorFilter0037
     * @tc.desc      校验 ColorFilter 第 7 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneColorFilter0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_06, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(COLORFILTER_SCENE_06);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_06);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(COLORFILTER_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0038
     * @tc.name      testNdkRenderSceneColorFilter0038
     * @tc.desc      校验 ColorFilter 第 7 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneColorFilter0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_06, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_06);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(COLORFILTER_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0039
     * @tc.name      testNdkRenderSceneColorFilter0039
     * @tc.desc      校验 ColorFilter 第 7 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_06, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0040
     * @tc.name      testNdkRenderSceneColorFilter0040
     * @tc.desc      校验 ColorFilter 第 7 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_06, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0041
     * @tc.name      testNdkRenderSceneColorFilter0041
     * @tc.desc      校验 ColorFilter 第 7 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_06, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0042
     * @tc.name      testNdkRenderSceneColorFilter0042
     * @tc.desc      校验 ColorFilter 第 7 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_06, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0043
     * @tc.name      testNdkRenderSceneColorFilter0043
     * @tc.desc      校验 ColorFilter 第 8 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneColorFilter0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_07, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(COLORFILTER_SCENE_07);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_07);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(COLORFILTER_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0044
     * @tc.name      testNdkRenderSceneColorFilter0044
     * @tc.desc      校验 ColorFilter 第 8 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneColorFilter0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_07, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_07);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(COLORFILTER_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0045
     * @tc.name      testNdkRenderSceneColorFilter0045
     * @tc.desc      校验 ColorFilter 第 8 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_07, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0046
     * @tc.name      testNdkRenderSceneColorFilter0046
     * @tc.desc      校验 ColorFilter 第 8 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_07, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0047
     * @tc.name      testNdkRenderSceneColorFilter0047
     * @tc.desc      校验 ColorFilter 第 8 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_07, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0048
     * @tc.name      testNdkRenderSceneColorFilter0048
     * @tc.desc      校验 ColorFilter 第 8 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_07, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0049
     * @tc.name      testNdkRenderSceneColorFilter0049
     * @tc.desc      校验 ColorFilter 第 9 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneColorFilter0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_08, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(COLORFILTER_SCENE_08);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_08);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(COLORFILTER_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0050
     * @tc.name      testNdkRenderSceneColorFilter0050
     * @tc.desc      校验 ColorFilter 第 9 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneColorFilter0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_08, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_08);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(COLORFILTER_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0051
     * @tc.name      testNdkRenderSceneColorFilter0051
     * @tc.desc      校验 ColorFilter 第 9 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_08, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0052
     * @tc.name      testNdkRenderSceneColorFilter0052
     * @tc.desc      校验 ColorFilter 第 9 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_08, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0053
     * @tc.name      testNdkRenderSceneColorFilter0053
     * @tc.desc      校验 ColorFilter 第 9 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_08, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_COLORFILTER_0054
     * @tc.name      testNdkRenderSceneColorFilter0054
     * @tc.desc      校验 ColorFilter 第 9 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneColorFilter0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(COLORFILTER_BUCKET, COLORFILTER_SCENE_08, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(COLORFILTER_PARAMS_08);
    })

  })
}
