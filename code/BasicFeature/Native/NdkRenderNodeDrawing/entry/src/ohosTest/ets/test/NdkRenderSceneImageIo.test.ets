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

// 场景轴 ImageIo 桶：覆盖第 10 个分组的 10 个场景，每个场景六个维度各一条用例。
const IMAGEIO_BUCKET: number = 10;
const IMAGEIO_SCENE_TOTAL: number = 10;
const IMAGEIO_SCENE_00: number = 0;
const IMAGEIO_SCENE_01: number = 1;
const IMAGEIO_SCENE_02: number = 2;
const IMAGEIO_SCENE_03: number = 3;
const IMAGEIO_SCENE_04: number = 4;
const IMAGEIO_SCENE_05: number = 5;
const IMAGEIO_SCENE_06: number = 6;
const IMAGEIO_SCENE_07: number = 7;
const IMAGEIO_SCENE_08: number = 8;
const IMAGEIO_SCENE_09: number = 9;
const IMAGEIO_PARAMS_00: number = 2;
const IMAGEIO_PARAMS_01: number = 1;
const IMAGEIO_PARAMS_02: number = 2;
const IMAGEIO_PARAMS_03: number = 1;
const IMAGEIO_PARAMS_04: number = 2;
const IMAGEIO_PARAMS_05: number = 2;
const IMAGEIO_PARAMS_06: number = 2;
const IMAGEIO_PARAMS_07: number = 2;
const IMAGEIO_PARAMS_08: number = 1;
const IMAGEIO_PARAMS_09: number = 1;

export default function ndkRenderSceneImageIoTest(): void {
  describe('NdkRenderSceneImageIo', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0001
     * @tc.name      testNdkRenderSceneImageIo0001
     * @tc.desc      校验 ImageIo 第 1 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageIo0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_00, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(IMAGEIO_SCENE_00);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_00);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(IMAGEIO_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0002
     * @tc.name      testNdkRenderSceneImageIo0002
     * @tc.desc      校验 ImageIo 第 1 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageIo0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_00, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_00);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(IMAGEIO_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0003
     * @tc.name      testNdkRenderSceneImageIo0003
     * @tc.desc      校验 ImageIo 第 1 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_00, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0004
     * @tc.name      testNdkRenderSceneImageIo0004
     * @tc.desc      校验 ImageIo 第 1 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_00, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0005
     * @tc.name      testNdkRenderSceneImageIo0005
     * @tc.desc      校验 ImageIo 第 1 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_00, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0006
     * @tc.name      testNdkRenderSceneImageIo0006
     * @tc.desc      校验 ImageIo 第 1 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_00, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0007
     * @tc.name      testNdkRenderSceneImageIo0007
     * @tc.desc      校验 ImageIo 第 2 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageIo0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_01, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(IMAGEIO_SCENE_01);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_01);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(IMAGEIO_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0008
     * @tc.name      testNdkRenderSceneImageIo0008
     * @tc.desc      校验 ImageIo 第 2 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageIo0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_01, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_01);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(IMAGEIO_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0009
     * @tc.name      testNdkRenderSceneImageIo0009
     * @tc.desc      校验 ImageIo 第 2 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_01, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0010
     * @tc.name      testNdkRenderSceneImageIo0010
     * @tc.desc      校验 ImageIo 第 2 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_01, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0011
     * @tc.name      testNdkRenderSceneImageIo0011
     * @tc.desc      校验 ImageIo 第 2 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_01, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0012
     * @tc.name      testNdkRenderSceneImageIo0012
     * @tc.desc      校验 ImageIo 第 2 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_01, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0013
     * @tc.name      testNdkRenderSceneImageIo0013
     * @tc.desc      校验 ImageIo 第 3 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageIo0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_02, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(IMAGEIO_SCENE_02);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_02);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(IMAGEIO_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0014
     * @tc.name      testNdkRenderSceneImageIo0014
     * @tc.desc      校验 ImageIo 第 3 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageIo0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_02, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_02);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(IMAGEIO_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0015
     * @tc.name      testNdkRenderSceneImageIo0015
     * @tc.desc      校验 ImageIo 第 3 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_02, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0016
     * @tc.name      testNdkRenderSceneImageIo0016
     * @tc.desc      校验 ImageIo 第 3 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_02, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0017
     * @tc.name      testNdkRenderSceneImageIo0017
     * @tc.desc      校验 ImageIo 第 3 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_02, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0018
     * @tc.name      testNdkRenderSceneImageIo0018
     * @tc.desc      校验 ImageIo 第 3 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_02, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0019
     * @tc.name      testNdkRenderSceneImageIo0019
     * @tc.desc      校验 ImageIo 第 4 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageIo0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_03, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(IMAGEIO_SCENE_03);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_03);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(IMAGEIO_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0020
     * @tc.name      testNdkRenderSceneImageIo0020
     * @tc.desc      校验 ImageIo 第 4 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageIo0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_03, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_03);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(IMAGEIO_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0021
     * @tc.name      testNdkRenderSceneImageIo0021
     * @tc.desc      校验 ImageIo 第 4 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_03, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0022
     * @tc.name      testNdkRenderSceneImageIo0022
     * @tc.desc      校验 ImageIo 第 4 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_03, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0023
     * @tc.name      testNdkRenderSceneImageIo0023
     * @tc.desc      校验 ImageIo 第 4 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_03, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0024
     * @tc.name      testNdkRenderSceneImageIo0024
     * @tc.desc      校验 ImageIo 第 4 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_03, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0025
     * @tc.name      testNdkRenderSceneImageIo0025
     * @tc.desc      校验 ImageIo 第 5 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageIo0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_04, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(IMAGEIO_SCENE_04);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_04);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(IMAGEIO_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0026
     * @tc.name      testNdkRenderSceneImageIo0026
     * @tc.desc      校验 ImageIo 第 5 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageIo0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_04, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_04);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(IMAGEIO_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0027
     * @tc.name      testNdkRenderSceneImageIo0027
     * @tc.desc      校验 ImageIo 第 5 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_04, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0028
     * @tc.name      testNdkRenderSceneImageIo0028
     * @tc.desc      校验 ImageIo 第 5 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_04, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0029
     * @tc.name      testNdkRenderSceneImageIo0029
     * @tc.desc      校验 ImageIo 第 5 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_04, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0030
     * @tc.name      testNdkRenderSceneImageIo0030
     * @tc.desc      校验 ImageIo 第 5 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_04, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0031
     * @tc.name      testNdkRenderSceneImageIo0031
     * @tc.desc      校验 ImageIo 第 6 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageIo0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_05, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(IMAGEIO_SCENE_05);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_05);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(IMAGEIO_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0032
     * @tc.name      testNdkRenderSceneImageIo0032
     * @tc.desc      校验 ImageIo 第 6 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageIo0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_05, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_05);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(IMAGEIO_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0033
     * @tc.name      testNdkRenderSceneImageIo0033
     * @tc.desc      校验 ImageIo 第 6 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_05, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0034
     * @tc.name      testNdkRenderSceneImageIo0034
     * @tc.desc      校验 ImageIo 第 6 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_05, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0035
     * @tc.name      testNdkRenderSceneImageIo0035
     * @tc.desc      校验 ImageIo 第 6 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_05, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0036
     * @tc.name      testNdkRenderSceneImageIo0036
     * @tc.desc      校验 ImageIo 第 6 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_05, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0037
     * @tc.name      testNdkRenderSceneImageIo0037
     * @tc.desc      校验 ImageIo 第 7 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageIo0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_06, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(IMAGEIO_SCENE_06);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_06);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(IMAGEIO_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0038
     * @tc.name      testNdkRenderSceneImageIo0038
     * @tc.desc      校验 ImageIo 第 7 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageIo0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_06, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_06);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(IMAGEIO_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0039
     * @tc.name      testNdkRenderSceneImageIo0039
     * @tc.desc      校验 ImageIo 第 7 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_06, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0040
     * @tc.name      testNdkRenderSceneImageIo0040
     * @tc.desc      校验 ImageIo 第 7 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_06, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0041
     * @tc.name      testNdkRenderSceneImageIo0041
     * @tc.desc      校验 ImageIo 第 7 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_06, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0042
     * @tc.name      testNdkRenderSceneImageIo0042
     * @tc.desc      校验 ImageIo 第 7 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_06, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0043
     * @tc.name      testNdkRenderSceneImageIo0043
     * @tc.desc      校验 ImageIo 第 8 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageIo0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_07, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(IMAGEIO_SCENE_07);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_07);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(IMAGEIO_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0044
     * @tc.name      testNdkRenderSceneImageIo0044
     * @tc.desc      校验 ImageIo 第 8 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageIo0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_07, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_07);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(IMAGEIO_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0045
     * @tc.name      testNdkRenderSceneImageIo0045
     * @tc.desc      校验 ImageIo 第 8 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_07, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0046
     * @tc.name      testNdkRenderSceneImageIo0046
     * @tc.desc      校验 ImageIo 第 8 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_07, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0047
     * @tc.name      testNdkRenderSceneImageIo0047
     * @tc.desc      校验 ImageIo 第 8 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_07, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0048
     * @tc.name      testNdkRenderSceneImageIo0048
     * @tc.desc      校验 ImageIo 第 8 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_07, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0049
     * @tc.name      testNdkRenderSceneImageIo0049
     * @tc.desc      校验 ImageIo 第 9 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageIo0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_08, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(IMAGEIO_SCENE_08);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_08);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(IMAGEIO_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0050
     * @tc.name      testNdkRenderSceneImageIo0050
     * @tc.desc      校验 ImageIo 第 9 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageIo0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_08, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_08);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(IMAGEIO_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0051
     * @tc.name      testNdkRenderSceneImageIo0051
     * @tc.desc      校验 ImageIo 第 9 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_08, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0052
     * @tc.name      testNdkRenderSceneImageIo0052
     * @tc.desc      校验 ImageIo 第 9 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_08, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0053
     * @tc.name      testNdkRenderSceneImageIo0053
     * @tc.desc      校验 ImageIo 第 9 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_08, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0054
     * @tc.name      testNdkRenderSceneImageIo0054
     * @tc.desc      校验 ImageIo 第 9 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_08, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0055
     * @tc.name      testNdkRenderSceneImageIo0055
     * @tc.desc      校验 ImageIo 第 10 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageIo0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_09, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(IMAGEIO_SCENE_09);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_09);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(IMAGEIO_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0056
     * @tc.name      testNdkRenderSceneImageIo0056
     * @tc.desc      校验 ImageIo 第 10 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageIo0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_09, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_09);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(IMAGEIO_PARAMS_09);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0057
     * @tc.name      testNdkRenderSceneImageIo0057
     * @tc.desc      校验 ImageIo 第 10 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_09, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_09);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0058
     * @tc.name      testNdkRenderSceneImageIo0058
     * @tc.desc      校验 ImageIo 第 10 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_09, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_09);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0059
     * @tc.name      testNdkRenderSceneImageIo0059
     * @tc.desc      校验 ImageIo 第 10 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_09, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_09);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEIO_0060
     * @tc.name      testNdkRenderSceneImageIo0060
     * @tc.desc      校验 ImageIo 第 10 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageIo0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEIO_BUCKET, IMAGEIO_SCENE_09, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEIO_PARAMS_09);
    })

  })
}
