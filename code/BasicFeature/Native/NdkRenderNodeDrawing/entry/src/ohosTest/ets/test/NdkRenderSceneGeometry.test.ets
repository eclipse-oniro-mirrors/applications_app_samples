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

// 场景轴 Geometry 桶：覆盖第 1 个分组的 11 个场景，每个场景六个维度各一条用例。
const GEOMETRY_BUCKET: number = 1;
const GEOMETRY_SCENE_TOTAL: number = 11;
const GEOMETRY_SCENE_00: number = 0;
const GEOMETRY_SCENE_01: number = 1;
const GEOMETRY_SCENE_02: number = 2;
const GEOMETRY_SCENE_03: number = 3;
const GEOMETRY_SCENE_04: number = 4;
const GEOMETRY_SCENE_05: number = 5;
const GEOMETRY_SCENE_06: number = 6;
const GEOMETRY_SCENE_07: number = 7;
const GEOMETRY_SCENE_08: number = 8;
const GEOMETRY_SCENE_09: number = 9;
const GEOMETRY_SCENE_10: number = 10;
const GEOMETRY_PARAMS_00: number = 2;
const GEOMETRY_PARAMS_01: number = 2;
const GEOMETRY_PARAMS_02: number = 2;
const GEOMETRY_PARAMS_03: number = 2;
const GEOMETRY_PARAMS_04: number = 2;
const GEOMETRY_PARAMS_05: number = 3;
const GEOMETRY_PARAMS_06: number = 2;
const GEOMETRY_PARAMS_07: number = 2;
const GEOMETRY_PARAMS_08: number = 2;
const GEOMETRY_PARAMS_09: number = 2;
const GEOMETRY_PARAMS_10: number = 2;

export default function ndkRenderSceneGeometryTest(): void {
  describe('NdkRenderSceneGeometry', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0001
     * @tc.name      testNdkRenderSceneGeometry0001
     * @tc.desc      校验 Geometry 第 1 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneGeometry0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_00, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(GEOMETRY_SCENE_00);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_00);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(GEOMETRY_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0002
     * @tc.name      testNdkRenderSceneGeometry0002
     * @tc.desc      校验 Geometry 第 1 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneGeometry0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_00, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_00);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(GEOMETRY_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0003
     * @tc.name      testNdkRenderSceneGeometry0003
     * @tc.desc      校验 Geometry 第 1 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_00, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0004
     * @tc.name      testNdkRenderSceneGeometry0004
     * @tc.desc      校验 Geometry 第 1 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_00, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0005
     * @tc.name      testNdkRenderSceneGeometry0005
     * @tc.desc      校验 Geometry 第 1 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_00, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0006
     * @tc.name      testNdkRenderSceneGeometry0006
     * @tc.desc      校验 Geometry 第 1 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_00, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0007
     * @tc.name      testNdkRenderSceneGeometry0007
     * @tc.desc      校验 Geometry 第 2 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneGeometry0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_01, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(GEOMETRY_SCENE_01);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_01);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(GEOMETRY_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0008
     * @tc.name      testNdkRenderSceneGeometry0008
     * @tc.desc      校验 Geometry 第 2 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneGeometry0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_01, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_01);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(GEOMETRY_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0009
     * @tc.name      testNdkRenderSceneGeometry0009
     * @tc.desc      校验 Geometry 第 2 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_01, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0010
     * @tc.name      testNdkRenderSceneGeometry0010
     * @tc.desc      校验 Geometry 第 2 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_01, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0011
     * @tc.name      testNdkRenderSceneGeometry0011
     * @tc.desc      校验 Geometry 第 2 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_01, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0012
     * @tc.name      testNdkRenderSceneGeometry0012
     * @tc.desc      校验 Geometry 第 2 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_01, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0013
     * @tc.name      testNdkRenderSceneGeometry0013
     * @tc.desc      校验 Geometry 第 3 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneGeometry0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_02, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(GEOMETRY_SCENE_02);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_02);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(GEOMETRY_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0014
     * @tc.name      testNdkRenderSceneGeometry0014
     * @tc.desc      校验 Geometry 第 3 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneGeometry0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_02, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_02);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(GEOMETRY_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0015
     * @tc.name      testNdkRenderSceneGeometry0015
     * @tc.desc      校验 Geometry 第 3 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_02, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0016
     * @tc.name      testNdkRenderSceneGeometry0016
     * @tc.desc      校验 Geometry 第 3 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_02, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0017
     * @tc.name      testNdkRenderSceneGeometry0017
     * @tc.desc      校验 Geometry 第 3 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_02, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0018
     * @tc.name      testNdkRenderSceneGeometry0018
     * @tc.desc      校验 Geometry 第 3 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_02, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0019
     * @tc.name      testNdkRenderSceneGeometry0019
     * @tc.desc      校验 Geometry 第 4 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneGeometry0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_03, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(GEOMETRY_SCENE_03);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_03);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(GEOMETRY_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0020
     * @tc.name      testNdkRenderSceneGeometry0020
     * @tc.desc      校验 Geometry 第 4 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneGeometry0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_03, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_03);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(GEOMETRY_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0021
     * @tc.name      testNdkRenderSceneGeometry0021
     * @tc.desc      校验 Geometry 第 4 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_03, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0022
     * @tc.name      testNdkRenderSceneGeometry0022
     * @tc.desc      校验 Geometry 第 4 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_03, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0023
     * @tc.name      testNdkRenderSceneGeometry0023
     * @tc.desc      校验 Geometry 第 4 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_03, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0024
     * @tc.name      testNdkRenderSceneGeometry0024
     * @tc.desc      校验 Geometry 第 4 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_03, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0025
     * @tc.name      testNdkRenderSceneGeometry0025
     * @tc.desc      校验 Geometry 第 5 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneGeometry0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_04, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(GEOMETRY_SCENE_04);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_04);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(GEOMETRY_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0026
     * @tc.name      testNdkRenderSceneGeometry0026
     * @tc.desc      校验 Geometry 第 5 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneGeometry0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_04, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_04);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(GEOMETRY_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0027
     * @tc.name      testNdkRenderSceneGeometry0027
     * @tc.desc      校验 Geometry 第 5 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_04, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0028
     * @tc.name      testNdkRenderSceneGeometry0028
     * @tc.desc      校验 Geometry 第 5 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_04, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0029
     * @tc.name      testNdkRenderSceneGeometry0029
     * @tc.desc      校验 Geometry 第 5 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_04, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0030
     * @tc.name      testNdkRenderSceneGeometry0030
     * @tc.desc      校验 Geometry 第 5 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_04, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0031
     * @tc.name      testNdkRenderSceneGeometry0031
     * @tc.desc      校验 Geometry 第 6 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneGeometry0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_05, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(GEOMETRY_SCENE_05);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_05);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(GEOMETRY_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0032
     * @tc.name      testNdkRenderSceneGeometry0032
     * @tc.desc      校验 Geometry 第 6 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneGeometry0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_05, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_05);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(GEOMETRY_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0033
     * @tc.name      testNdkRenderSceneGeometry0033
     * @tc.desc      校验 Geometry 第 6 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_05, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0034
     * @tc.name      testNdkRenderSceneGeometry0034
     * @tc.desc      校验 Geometry 第 6 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_05, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0035
     * @tc.name      testNdkRenderSceneGeometry0035
     * @tc.desc      校验 Geometry 第 6 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_05, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0036
     * @tc.name      testNdkRenderSceneGeometry0036
     * @tc.desc      校验 Geometry 第 6 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_05, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0037
     * @tc.name      testNdkRenderSceneGeometry0037
     * @tc.desc      校验 Geometry 第 7 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneGeometry0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_06, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(GEOMETRY_SCENE_06);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_06);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(GEOMETRY_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0038
     * @tc.name      testNdkRenderSceneGeometry0038
     * @tc.desc      校验 Geometry 第 7 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneGeometry0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_06, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_06);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(GEOMETRY_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0039
     * @tc.name      testNdkRenderSceneGeometry0039
     * @tc.desc      校验 Geometry 第 7 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_06, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0040
     * @tc.name      testNdkRenderSceneGeometry0040
     * @tc.desc      校验 Geometry 第 7 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_06, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0041
     * @tc.name      testNdkRenderSceneGeometry0041
     * @tc.desc      校验 Geometry 第 7 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_06, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0042
     * @tc.name      testNdkRenderSceneGeometry0042
     * @tc.desc      校验 Geometry 第 7 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_06, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0043
     * @tc.name      testNdkRenderSceneGeometry0043
     * @tc.desc      校验 Geometry 第 8 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneGeometry0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_07, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(GEOMETRY_SCENE_07);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_07);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(GEOMETRY_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0044
     * @tc.name      testNdkRenderSceneGeometry0044
     * @tc.desc      校验 Geometry 第 8 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneGeometry0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_07, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_07);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(GEOMETRY_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0045
     * @tc.name      testNdkRenderSceneGeometry0045
     * @tc.desc      校验 Geometry 第 8 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_07, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0046
     * @tc.name      testNdkRenderSceneGeometry0046
     * @tc.desc      校验 Geometry 第 8 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_07, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0047
     * @tc.name      testNdkRenderSceneGeometry0047
     * @tc.desc      校验 Geometry 第 8 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_07, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0048
     * @tc.name      testNdkRenderSceneGeometry0048
     * @tc.desc      校验 Geometry 第 8 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_07, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0049
     * @tc.name      testNdkRenderSceneGeometry0049
     * @tc.desc      校验 Geometry 第 9 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneGeometry0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_08, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(GEOMETRY_SCENE_08);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_08);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(GEOMETRY_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0050
     * @tc.name      testNdkRenderSceneGeometry0050
     * @tc.desc      校验 Geometry 第 9 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneGeometry0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_08, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_08);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(GEOMETRY_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0051
     * @tc.name      testNdkRenderSceneGeometry0051
     * @tc.desc      校验 Geometry 第 9 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_08, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0052
     * @tc.name      testNdkRenderSceneGeometry0052
     * @tc.desc      校验 Geometry 第 9 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_08, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0053
     * @tc.name      testNdkRenderSceneGeometry0053
     * @tc.desc      校验 Geometry 第 9 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_08, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0054
     * @tc.name      testNdkRenderSceneGeometry0054
     * @tc.desc      校验 Geometry 第 9 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_08, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0055
     * @tc.name      testNdkRenderSceneGeometry0055
     * @tc.desc      校验 Geometry 第 10 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneGeometry0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_09, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(GEOMETRY_SCENE_09);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_09);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(GEOMETRY_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0056
     * @tc.name      testNdkRenderSceneGeometry0056
     * @tc.desc      校验 Geometry 第 10 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneGeometry0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_09, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_09);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(GEOMETRY_PARAMS_09);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0057
     * @tc.name      testNdkRenderSceneGeometry0057
     * @tc.desc      校验 Geometry 第 10 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_09, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_09);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0058
     * @tc.name      testNdkRenderSceneGeometry0058
     * @tc.desc      校验 Geometry 第 10 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_09, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_09);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0059
     * @tc.name      testNdkRenderSceneGeometry0059
     * @tc.desc      校验 Geometry 第 10 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_09, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_09);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0060
     * @tc.name      testNdkRenderSceneGeometry0060
     * @tc.desc      校验 Geometry 第 10 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_09, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_09);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0061
     * @tc.name      testNdkRenderSceneGeometry0061
     * @tc.desc      校验 Geometry 第 11 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneGeometry0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_10, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(GEOMETRY_SCENE_10);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_10);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(GEOMETRY_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0062
     * @tc.name      testNdkRenderSceneGeometry0062
     * @tc.desc      校验 Geometry 第 11 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneGeometry0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_10, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_10);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(GEOMETRY_PARAMS_10);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0063
     * @tc.name      testNdkRenderSceneGeometry0063
     * @tc.desc      校验 Geometry 第 11 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_10, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_10);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0064
     * @tc.name      testNdkRenderSceneGeometry0064
     * @tc.desc      校验 Geometry 第 11 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_10, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_10);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0065
     * @tc.name      testNdkRenderSceneGeometry0065
     * @tc.desc      校验 Geometry 第 11 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_10, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_10);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_GEOMETRY_0066
     * @tc.name      testNdkRenderSceneGeometry0066
     * @tc.desc      校验 Geometry 第 11 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneGeometry0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(GEOMETRY_BUCKET, GEOMETRY_SCENE_10, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(GEOMETRY_PARAMS_10);
    })

  })
}
