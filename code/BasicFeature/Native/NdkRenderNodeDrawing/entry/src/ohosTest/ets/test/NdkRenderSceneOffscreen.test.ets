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

// 场景轴离屏层桶：覆盖第 17 个分组的 8 个场景，每个场景六个维度各一条用例。
const OFFSCREEN_BUCKET: number = 17;
const OFFSCREEN_SCENE_TOTAL: number = 8;
const OFFSCREEN_SCENE_00: number = 0;
const OFFSCREEN_SCENE_01: number = 1;
const OFFSCREEN_SCENE_02: number = 2;
const OFFSCREEN_SCENE_03: number = 3;
const OFFSCREEN_SCENE_04: number = 4;
const OFFSCREEN_SCENE_05: number = 5;
const OFFSCREEN_SCENE_06: number = 6;
const OFFSCREEN_SCENE_07: number = 7;
const OFFSCREEN_PARAMS_00: number = 1;
const OFFSCREEN_PARAMS_01: number = 2;
const OFFSCREEN_PARAMS_02: number = 2;
const OFFSCREEN_PARAMS_03: number = 2;
const OFFSCREEN_PARAMS_04: number = 2;
const OFFSCREEN_PARAMS_05: number = 2;
const OFFSCREEN_PARAMS_06: number = 2;
const OFFSCREEN_PARAMS_07: number = 2;

export default function ndkRenderSceneOffscreenTest(): void {
  describe('NdkRenderSceneOffscreen', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0001
     * @tc.name      testNdkRenderSceneOffscreen0001
     * @tc.desc      校验离屏层第 1 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneOffscreen0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_00, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(OFFSCREEN_SCENE_00);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_00);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(OFFSCREEN_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0002
     * @tc.name      testNdkRenderSceneOffscreen0002
     * @tc.desc      校验离屏层第 1 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneOffscreen0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_00, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_00);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(OFFSCREEN_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0003
     * @tc.name      testNdkRenderSceneOffscreen0003
     * @tc.desc      校验离屏层第 1 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_00, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0004
     * @tc.name      testNdkRenderSceneOffscreen0004
     * @tc.desc      校验离屏层第 1 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_00, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0005
     * @tc.name      testNdkRenderSceneOffscreen0005
     * @tc.desc      校验离屏层第 1 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_00, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0006
     * @tc.name      testNdkRenderSceneOffscreen0006
     * @tc.desc      校验离屏层第 1 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_00, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0007
     * @tc.name      testNdkRenderSceneOffscreen0007
     * @tc.desc      校验离屏层第 2 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneOffscreen0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_01, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(OFFSCREEN_SCENE_01);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_01);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(OFFSCREEN_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0008
     * @tc.name      testNdkRenderSceneOffscreen0008
     * @tc.desc      校验离屏层第 2 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneOffscreen0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_01, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_01);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(OFFSCREEN_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0009
     * @tc.name      testNdkRenderSceneOffscreen0009
     * @tc.desc      校验离屏层第 2 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_01, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0010
     * @tc.name      testNdkRenderSceneOffscreen0010
     * @tc.desc      校验离屏层第 2 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_01, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0011
     * @tc.name      testNdkRenderSceneOffscreen0011
     * @tc.desc      校验离屏层第 2 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_01, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0012
     * @tc.name      testNdkRenderSceneOffscreen0012
     * @tc.desc      校验离屏层第 2 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_01, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0013
     * @tc.name      testNdkRenderSceneOffscreen0013
     * @tc.desc      校验离屏层第 3 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneOffscreen0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_02, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(OFFSCREEN_SCENE_02);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_02);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(OFFSCREEN_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0014
     * @tc.name      testNdkRenderSceneOffscreen0014
     * @tc.desc      校验离屏层第 3 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneOffscreen0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_02, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_02);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(OFFSCREEN_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0015
     * @tc.name      testNdkRenderSceneOffscreen0015
     * @tc.desc      校验离屏层第 3 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_02, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0016
     * @tc.name      testNdkRenderSceneOffscreen0016
     * @tc.desc      校验离屏层第 3 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_02, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0017
     * @tc.name      testNdkRenderSceneOffscreen0017
     * @tc.desc      校验离屏层第 3 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_02, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0018
     * @tc.name      testNdkRenderSceneOffscreen0018
     * @tc.desc      校验离屏层第 3 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_02, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0019
     * @tc.name      testNdkRenderSceneOffscreen0019
     * @tc.desc      校验离屏层第 4 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneOffscreen0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_03, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(OFFSCREEN_SCENE_03);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_03);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(OFFSCREEN_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0020
     * @tc.name      testNdkRenderSceneOffscreen0020
     * @tc.desc      校验离屏层第 4 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneOffscreen0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_03, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_03);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(OFFSCREEN_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0021
     * @tc.name      testNdkRenderSceneOffscreen0021
     * @tc.desc      校验离屏层第 4 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_03, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0022
     * @tc.name      testNdkRenderSceneOffscreen0022
     * @tc.desc      校验离屏层第 4 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_03, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0023
     * @tc.name      testNdkRenderSceneOffscreen0023
     * @tc.desc      校验离屏层第 4 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_03, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0024
     * @tc.name      testNdkRenderSceneOffscreen0024
     * @tc.desc      校验离屏层第 4 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_03, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0025
     * @tc.name      testNdkRenderSceneOffscreen0025
     * @tc.desc      校验离屏层第 5 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneOffscreen0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_04, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(OFFSCREEN_SCENE_04);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_04);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(OFFSCREEN_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0026
     * @tc.name      testNdkRenderSceneOffscreen0026
     * @tc.desc      校验离屏层第 5 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneOffscreen0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_04, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_04);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(OFFSCREEN_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0027
     * @tc.name      testNdkRenderSceneOffscreen0027
     * @tc.desc      校验离屏层第 5 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_04, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0028
     * @tc.name      testNdkRenderSceneOffscreen0028
     * @tc.desc      校验离屏层第 5 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_04, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0029
     * @tc.name      testNdkRenderSceneOffscreen0029
     * @tc.desc      校验离屏层第 5 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_04, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0030
     * @tc.name      testNdkRenderSceneOffscreen0030
     * @tc.desc      校验离屏层第 5 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_04, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0031
     * @tc.name      testNdkRenderSceneOffscreen0031
     * @tc.desc      校验离屏层第 6 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneOffscreen0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_05, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(OFFSCREEN_SCENE_05);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_05);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(OFFSCREEN_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0032
     * @tc.name      testNdkRenderSceneOffscreen0032
     * @tc.desc      校验离屏层第 6 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneOffscreen0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_05, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_05);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(OFFSCREEN_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0033
     * @tc.name      testNdkRenderSceneOffscreen0033
     * @tc.desc      校验离屏层第 6 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_05, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0034
     * @tc.name      testNdkRenderSceneOffscreen0034
     * @tc.desc      校验离屏层第 6 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_05, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0035
     * @tc.name      testNdkRenderSceneOffscreen0035
     * @tc.desc      校验离屏层第 6 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_05, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0036
     * @tc.name      testNdkRenderSceneOffscreen0036
     * @tc.desc      校验离屏层第 6 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_05, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0037
     * @tc.name      testNdkRenderSceneOffscreen0037
     * @tc.desc      校验离屏层第 7 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneOffscreen0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_06, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(OFFSCREEN_SCENE_06);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_06);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(OFFSCREEN_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0038
     * @tc.name      testNdkRenderSceneOffscreen0038
     * @tc.desc      校验离屏层第 7 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneOffscreen0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_06, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_06);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(OFFSCREEN_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0039
     * @tc.name      testNdkRenderSceneOffscreen0039
     * @tc.desc      校验离屏层第 7 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_06, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0040
     * @tc.name      testNdkRenderSceneOffscreen0040
     * @tc.desc      校验离屏层第 7 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_06, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0041
     * @tc.name      testNdkRenderSceneOffscreen0041
     * @tc.desc      校验离屏层第 7 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_06, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0042
     * @tc.name      testNdkRenderSceneOffscreen0042
     * @tc.desc      校验离屏层第 7 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_06, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0043
     * @tc.name      testNdkRenderSceneOffscreen0043
     * @tc.desc      校验离屏层第 8 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneOffscreen0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_07, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(OFFSCREEN_SCENE_07);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_07);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(OFFSCREEN_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0044
     * @tc.name      testNdkRenderSceneOffscreen0044
     * @tc.desc      校验离屏层第 8 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneOffscreen0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_07, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_07);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(OFFSCREEN_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0045
     * @tc.name      testNdkRenderSceneOffscreen0045
     * @tc.desc      校验离屏层第 8 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_07, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0046
     * @tc.name      testNdkRenderSceneOffscreen0046
     * @tc.desc      校验离屏层第 8 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_07, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0047
     * @tc.name      testNdkRenderSceneOffscreen0047
     * @tc.desc      校验离屏层第 8 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_07, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_OFFSCREEN_0048
     * @tc.name      testNdkRenderSceneOffscreen0048
     * @tc.desc      校验离屏层第 8 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneOffscreen0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(OFFSCREEN_BUCKET, OFFSCREEN_SCENE_07, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(OFFSCREEN_PARAMS_07);
    })

  })
}
