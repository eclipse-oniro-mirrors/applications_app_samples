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

// 场景轴 PixelMap 桶：覆盖第 9 个分组的 12 个场景，每个场景六个维度各一条用例。
const PIXELMAP_BUCKET: number = 9;
const PIXELMAP_SCENE_TOTAL: number = 12;
const PIXELMAP_SCENE_00: number = 0;
const PIXELMAP_SCENE_01: number = 1;
const PIXELMAP_SCENE_02: number = 2;
const PIXELMAP_SCENE_03: number = 3;
const PIXELMAP_SCENE_04: number = 4;
const PIXELMAP_SCENE_05: number = 5;
const PIXELMAP_SCENE_06: number = 6;
const PIXELMAP_SCENE_07: number = 7;
const PIXELMAP_SCENE_08: number = 8;
const PIXELMAP_SCENE_09: number = 9;
const PIXELMAP_SCENE_10: number = 10;
const PIXELMAP_SCENE_11: number = 11;
const PIXELMAP_PARAMS_00: number = 3;
const PIXELMAP_PARAMS_01: number = 2;
const PIXELMAP_PARAMS_02: number = 2;
const PIXELMAP_PARAMS_03: number = 3;
const PIXELMAP_PARAMS_04: number = 3;
const PIXELMAP_PARAMS_05: number = 2;
const PIXELMAP_PARAMS_06: number = 1;
const PIXELMAP_PARAMS_07: number = 1;
const PIXELMAP_PARAMS_08: number = 2;
const PIXELMAP_PARAMS_09: number = 1;
const PIXELMAP_PARAMS_10: number = 2;
const PIXELMAP_PARAMS_11: number = 1;

export default function ndkRenderScenePixelMapTest(): void {
  describe('NdkRenderScenePixelMap', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0001
     * @tc.name      testNdkRenderScenePixelMap0001
     * @tc.desc      校验 PixelMap 第 1 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderScenePixelMap0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_00, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(PIXELMAP_SCENE_00);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_00);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(PIXELMAP_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0002
     * @tc.name      testNdkRenderScenePixelMap0002
     * @tc.desc      校验 PixelMap 第 1 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderScenePixelMap0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_00, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_00);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(PIXELMAP_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0003
     * @tc.name      testNdkRenderScenePixelMap0003
     * @tc.desc      校验 PixelMap 第 1 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_00, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0004
     * @tc.name      testNdkRenderScenePixelMap0004
     * @tc.desc      校验 PixelMap 第 1 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_00, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0005
     * @tc.name      testNdkRenderScenePixelMap0005
     * @tc.desc      校验 PixelMap 第 1 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_00, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0006
     * @tc.name      testNdkRenderScenePixelMap0006
     * @tc.desc      校验 PixelMap 第 1 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_00, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0007
     * @tc.name      testNdkRenderScenePixelMap0007
     * @tc.desc      校验 PixelMap 第 2 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderScenePixelMap0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_01, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(PIXELMAP_SCENE_01);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_01);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(PIXELMAP_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0008
     * @tc.name      testNdkRenderScenePixelMap0008
     * @tc.desc      校验 PixelMap 第 2 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderScenePixelMap0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_01, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_01);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(PIXELMAP_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0009
     * @tc.name      testNdkRenderScenePixelMap0009
     * @tc.desc      校验 PixelMap 第 2 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_01, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0010
     * @tc.name      testNdkRenderScenePixelMap0010
     * @tc.desc      校验 PixelMap 第 2 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_01, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0011
     * @tc.name      testNdkRenderScenePixelMap0011
     * @tc.desc      校验 PixelMap 第 2 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_01, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0012
     * @tc.name      testNdkRenderScenePixelMap0012
     * @tc.desc      校验 PixelMap 第 2 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_01, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0013
     * @tc.name      testNdkRenderScenePixelMap0013
     * @tc.desc      校验 PixelMap 第 3 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderScenePixelMap0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_02, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(PIXELMAP_SCENE_02);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_02);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(PIXELMAP_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0014
     * @tc.name      testNdkRenderScenePixelMap0014
     * @tc.desc      校验 PixelMap 第 3 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderScenePixelMap0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_02, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_02);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(PIXELMAP_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0015
     * @tc.name      testNdkRenderScenePixelMap0015
     * @tc.desc      校验 PixelMap 第 3 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_02, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0016
     * @tc.name      testNdkRenderScenePixelMap0016
     * @tc.desc      校验 PixelMap 第 3 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_02, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0017
     * @tc.name      testNdkRenderScenePixelMap0017
     * @tc.desc      校验 PixelMap 第 3 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_02, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0018
     * @tc.name      testNdkRenderScenePixelMap0018
     * @tc.desc      校验 PixelMap 第 3 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_02, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0019
     * @tc.name      testNdkRenderScenePixelMap0019
     * @tc.desc      校验 PixelMap 第 4 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderScenePixelMap0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_03, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(PIXELMAP_SCENE_03);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_03);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(PIXELMAP_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0020
     * @tc.name      testNdkRenderScenePixelMap0020
     * @tc.desc      校验 PixelMap 第 4 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderScenePixelMap0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_03, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_03);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(PIXELMAP_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0021
     * @tc.name      testNdkRenderScenePixelMap0021
     * @tc.desc      校验 PixelMap 第 4 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_03, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0022
     * @tc.name      testNdkRenderScenePixelMap0022
     * @tc.desc      校验 PixelMap 第 4 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_03, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0023
     * @tc.name      testNdkRenderScenePixelMap0023
     * @tc.desc      校验 PixelMap 第 4 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_03, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0024
     * @tc.name      testNdkRenderScenePixelMap0024
     * @tc.desc      校验 PixelMap 第 4 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_03, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0025
     * @tc.name      testNdkRenderScenePixelMap0025
     * @tc.desc      校验 PixelMap 第 5 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderScenePixelMap0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_04, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(PIXELMAP_SCENE_04);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_04);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(PIXELMAP_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0026
     * @tc.name      testNdkRenderScenePixelMap0026
     * @tc.desc      校验 PixelMap 第 5 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderScenePixelMap0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_04, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_04);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(PIXELMAP_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0027
     * @tc.name      testNdkRenderScenePixelMap0027
     * @tc.desc      校验 PixelMap 第 5 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_04, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0028
     * @tc.name      testNdkRenderScenePixelMap0028
     * @tc.desc      校验 PixelMap 第 5 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_04, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0029
     * @tc.name      testNdkRenderScenePixelMap0029
     * @tc.desc      校验 PixelMap 第 5 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_04, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0030
     * @tc.name      testNdkRenderScenePixelMap0030
     * @tc.desc      校验 PixelMap 第 5 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_04, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0031
     * @tc.name      testNdkRenderScenePixelMap0031
     * @tc.desc      校验 PixelMap 第 6 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderScenePixelMap0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_05, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(PIXELMAP_SCENE_05);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_05);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(PIXELMAP_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0032
     * @tc.name      testNdkRenderScenePixelMap0032
     * @tc.desc      校验 PixelMap 第 6 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderScenePixelMap0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_05, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_05);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(PIXELMAP_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0033
     * @tc.name      testNdkRenderScenePixelMap0033
     * @tc.desc      校验 PixelMap 第 6 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_05, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0034
     * @tc.name      testNdkRenderScenePixelMap0034
     * @tc.desc      校验 PixelMap 第 6 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_05, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0035
     * @tc.name      testNdkRenderScenePixelMap0035
     * @tc.desc      校验 PixelMap 第 6 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_05, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0036
     * @tc.name      testNdkRenderScenePixelMap0036
     * @tc.desc      校验 PixelMap 第 6 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_05, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0037
     * @tc.name      testNdkRenderScenePixelMap0037
     * @tc.desc      校验 PixelMap 第 7 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderScenePixelMap0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_06, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(PIXELMAP_SCENE_06);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_06);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(PIXELMAP_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0038
     * @tc.name      testNdkRenderScenePixelMap0038
     * @tc.desc      校验 PixelMap 第 7 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderScenePixelMap0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_06, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_06);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(PIXELMAP_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0039
     * @tc.name      testNdkRenderScenePixelMap0039
     * @tc.desc      校验 PixelMap 第 7 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_06, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0040
     * @tc.name      testNdkRenderScenePixelMap0040
     * @tc.desc      校验 PixelMap 第 7 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_06, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0041
     * @tc.name      testNdkRenderScenePixelMap0041
     * @tc.desc      校验 PixelMap 第 7 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_06, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0042
     * @tc.name      testNdkRenderScenePixelMap0042
     * @tc.desc      校验 PixelMap 第 7 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_06, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0043
     * @tc.name      testNdkRenderScenePixelMap0043
     * @tc.desc      校验 PixelMap 第 8 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderScenePixelMap0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_07, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(PIXELMAP_SCENE_07);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_07);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(PIXELMAP_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0044
     * @tc.name      testNdkRenderScenePixelMap0044
     * @tc.desc      校验 PixelMap 第 8 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderScenePixelMap0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_07, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_07);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(PIXELMAP_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0045
     * @tc.name      testNdkRenderScenePixelMap0045
     * @tc.desc      校验 PixelMap 第 8 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_07, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0046
     * @tc.name      testNdkRenderScenePixelMap0046
     * @tc.desc      校验 PixelMap 第 8 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_07, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0047
     * @tc.name      testNdkRenderScenePixelMap0047
     * @tc.desc      校验 PixelMap 第 8 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_07, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0048
     * @tc.name      testNdkRenderScenePixelMap0048
     * @tc.desc      校验 PixelMap 第 8 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_07, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0049
     * @tc.name      testNdkRenderScenePixelMap0049
     * @tc.desc      校验 PixelMap 第 9 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderScenePixelMap0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_08, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(PIXELMAP_SCENE_08);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_08);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(PIXELMAP_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0050
     * @tc.name      testNdkRenderScenePixelMap0050
     * @tc.desc      校验 PixelMap 第 9 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderScenePixelMap0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_08, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_08);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(PIXELMAP_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0051
     * @tc.name      testNdkRenderScenePixelMap0051
     * @tc.desc      校验 PixelMap 第 9 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_08, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0052
     * @tc.name      testNdkRenderScenePixelMap0052
     * @tc.desc      校验 PixelMap 第 9 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_08, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0053
     * @tc.name      testNdkRenderScenePixelMap0053
     * @tc.desc      校验 PixelMap 第 9 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_08, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0054
     * @tc.name      testNdkRenderScenePixelMap0054
     * @tc.desc      校验 PixelMap 第 9 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_08, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0055
     * @tc.name      testNdkRenderScenePixelMap0055
     * @tc.desc      校验 PixelMap 第 10 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderScenePixelMap0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_09, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(PIXELMAP_SCENE_09);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_09);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(PIXELMAP_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0056
     * @tc.name      testNdkRenderScenePixelMap0056
     * @tc.desc      校验 PixelMap 第 10 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderScenePixelMap0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_09, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_09);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(PIXELMAP_PARAMS_09);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0057
     * @tc.name      testNdkRenderScenePixelMap0057
     * @tc.desc      校验 PixelMap 第 10 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_09, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_09);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0058
     * @tc.name      testNdkRenderScenePixelMap0058
     * @tc.desc      校验 PixelMap 第 10 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_09, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_09);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0059
     * @tc.name      testNdkRenderScenePixelMap0059
     * @tc.desc      校验 PixelMap 第 10 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_09, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_09);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0060
     * @tc.name      testNdkRenderScenePixelMap0060
     * @tc.desc      校验 PixelMap 第 10 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_09, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_09);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0061
     * @tc.name      testNdkRenderScenePixelMap0061
     * @tc.desc      校验 PixelMap 第 11 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderScenePixelMap0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_10, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(PIXELMAP_SCENE_10);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_10);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(PIXELMAP_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0062
     * @tc.name      testNdkRenderScenePixelMap0062
     * @tc.desc      校验 PixelMap 第 11 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderScenePixelMap0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_10, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_10);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(PIXELMAP_PARAMS_10);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0063
     * @tc.name      testNdkRenderScenePixelMap0063
     * @tc.desc      校验 PixelMap 第 11 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_10, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_10);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0064
     * @tc.name      testNdkRenderScenePixelMap0064
     * @tc.desc      校验 PixelMap 第 11 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_10, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_10);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0065
     * @tc.name      testNdkRenderScenePixelMap0065
     * @tc.desc      校验 PixelMap 第 11 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_10, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_10);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0066
     * @tc.name      testNdkRenderScenePixelMap0066
     * @tc.desc      校验 PixelMap 第 11 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_10, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_10);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0067
     * @tc.name      testNdkRenderScenePixelMap0067
     * @tc.desc      校验 PixelMap 第 12 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderScenePixelMap0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_11, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(PIXELMAP_SCENE_11);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_11);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(PIXELMAP_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0068
     * @tc.name      testNdkRenderScenePixelMap0068
     * @tc.desc      校验 PixelMap 第 12 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderScenePixelMap0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_11, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_11);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(PIXELMAP_PARAMS_11);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0069
     * @tc.name      testNdkRenderScenePixelMap0069
     * @tc.desc      校验 PixelMap 第 12 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_11, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_11);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0070
     * @tc.name      testNdkRenderScenePixelMap0070
     * @tc.desc      校验 PixelMap 第 12 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_11, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_11);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0071
     * @tc.name      testNdkRenderScenePixelMap0071
     * @tc.desc      校验 PixelMap 第 12 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_11, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_11);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_PIXELMAP_0072
     * @tc.name      testNdkRenderScenePixelMap0072
     * @tc.desc      校验 PixelMap 第 12 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderScenePixelMap0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(PIXELMAP_BUCKET, PIXELMAP_SCENE_11, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(PIXELMAP_PARAMS_11);
    })

  })
}
