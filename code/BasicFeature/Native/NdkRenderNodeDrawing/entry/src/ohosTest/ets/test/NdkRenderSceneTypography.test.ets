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

// 场景轴 Typography 桶：覆盖第 13 个分组的 14 个场景，每个场景六个维度各一条用例。
const TYPOGRAPHY_BUCKET: number = 13;
const TYPOGRAPHY_SCENE_TOTAL: number = 14;
const TYPOGRAPHY_SCENE_00: number = 0;
const TYPOGRAPHY_SCENE_01: number = 1;
const TYPOGRAPHY_SCENE_02: number = 2;
const TYPOGRAPHY_SCENE_03: number = 3;
const TYPOGRAPHY_SCENE_04: number = 4;
const TYPOGRAPHY_SCENE_05: number = 5;
const TYPOGRAPHY_SCENE_06: number = 6;
const TYPOGRAPHY_SCENE_07: number = 7;
const TYPOGRAPHY_SCENE_08: number = 8;
const TYPOGRAPHY_SCENE_09: number = 9;
const TYPOGRAPHY_SCENE_10: number = 10;
const TYPOGRAPHY_SCENE_11: number = 11;
const TYPOGRAPHY_SCENE_12: number = 12;
const TYPOGRAPHY_SCENE_13: number = 13;
const TYPOGRAPHY_PARAMS_00: number = 2;
const TYPOGRAPHY_PARAMS_01: number = 2;
const TYPOGRAPHY_PARAMS_02: number = 2;
const TYPOGRAPHY_PARAMS_03: number = 3;
const TYPOGRAPHY_PARAMS_04: number = 3;
const TYPOGRAPHY_PARAMS_05: number = 3;
const TYPOGRAPHY_PARAMS_06: number = 3;
const TYPOGRAPHY_PARAMS_07: number = 2;
const TYPOGRAPHY_PARAMS_08: number = 2;
const TYPOGRAPHY_PARAMS_09: number = 1;
const TYPOGRAPHY_PARAMS_10: number = 2;
const TYPOGRAPHY_PARAMS_11: number = 2;
const TYPOGRAPHY_PARAMS_12: number = 2;
const TYPOGRAPHY_PARAMS_13: number = 1;

export default function ndkRenderSceneTypographyTest(): void {
  describe('NdkRenderSceneTypography', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0001
     * @tc.name      testNdkRenderSceneTypography0001
     * @tc.desc      校验 Typography 第 1 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTypography0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_00, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(TYPOGRAPHY_SCENE_00);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_00);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(TYPOGRAPHY_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0002
     * @tc.name      testNdkRenderSceneTypography0002
     * @tc.desc      校验 Typography 第 1 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTypography0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_00, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_00);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(TYPOGRAPHY_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0003
     * @tc.name      testNdkRenderSceneTypography0003
     * @tc.desc      校验 Typography 第 1 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_00, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0004
     * @tc.name      testNdkRenderSceneTypography0004
     * @tc.desc      校验 Typography 第 1 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_00, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0005
     * @tc.name      testNdkRenderSceneTypography0005
     * @tc.desc      校验 Typography 第 1 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_00, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0006
     * @tc.name      testNdkRenderSceneTypography0006
     * @tc.desc      校验 Typography 第 1 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_00, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0007
     * @tc.name      testNdkRenderSceneTypography0007
     * @tc.desc      校验 Typography 第 2 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTypography0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_01, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(TYPOGRAPHY_SCENE_01);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_01);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(TYPOGRAPHY_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0008
     * @tc.name      testNdkRenderSceneTypography0008
     * @tc.desc      校验 Typography 第 2 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTypography0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_01, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_01);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(TYPOGRAPHY_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0009
     * @tc.name      testNdkRenderSceneTypography0009
     * @tc.desc      校验 Typography 第 2 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_01, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0010
     * @tc.name      testNdkRenderSceneTypography0010
     * @tc.desc      校验 Typography 第 2 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_01, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0011
     * @tc.name      testNdkRenderSceneTypography0011
     * @tc.desc      校验 Typography 第 2 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_01, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0012
     * @tc.name      testNdkRenderSceneTypography0012
     * @tc.desc      校验 Typography 第 2 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_01, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0013
     * @tc.name      testNdkRenderSceneTypography0013
     * @tc.desc      校验 Typography 第 3 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTypography0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_02, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(TYPOGRAPHY_SCENE_02);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_02);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(TYPOGRAPHY_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0014
     * @tc.name      testNdkRenderSceneTypography0014
     * @tc.desc      校验 Typography 第 3 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTypography0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_02, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_02);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(TYPOGRAPHY_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0015
     * @tc.name      testNdkRenderSceneTypography0015
     * @tc.desc      校验 Typography 第 3 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_02, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0016
     * @tc.name      testNdkRenderSceneTypography0016
     * @tc.desc      校验 Typography 第 3 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_02, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0017
     * @tc.name      testNdkRenderSceneTypography0017
     * @tc.desc      校验 Typography 第 3 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_02, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0018
     * @tc.name      testNdkRenderSceneTypography0018
     * @tc.desc      校验 Typography 第 3 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_02, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0019
     * @tc.name      testNdkRenderSceneTypography0019
     * @tc.desc      校验 Typography 第 4 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTypography0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_03, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(TYPOGRAPHY_SCENE_03);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_03);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(TYPOGRAPHY_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0020
     * @tc.name      testNdkRenderSceneTypography0020
     * @tc.desc      校验 Typography 第 4 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTypography0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_03, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_03);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(TYPOGRAPHY_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0021
     * @tc.name      testNdkRenderSceneTypography0021
     * @tc.desc      校验 Typography 第 4 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_03, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0022
     * @tc.name      testNdkRenderSceneTypography0022
     * @tc.desc      校验 Typography 第 4 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_03, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0023
     * @tc.name      testNdkRenderSceneTypography0023
     * @tc.desc      校验 Typography 第 4 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_03, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0024
     * @tc.name      testNdkRenderSceneTypography0024
     * @tc.desc      校验 Typography 第 4 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_03, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0025
     * @tc.name      testNdkRenderSceneTypography0025
     * @tc.desc      校验 Typography 第 5 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTypography0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_04, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(TYPOGRAPHY_SCENE_04);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_04);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(TYPOGRAPHY_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0026
     * @tc.name      testNdkRenderSceneTypography0026
     * @tc.desc      校验 Typography 第 5 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTypography0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_04, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_04);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(TYPOGRAPHY_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0027
     * @tc.name      testNdkRenderSceneTypography0027
     * @tc.desc      校验 Typography 第 5 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_04, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0028
     * @tc.name      testNdkRenderSceneTypography0028
     * @tc.desc      校验 Typography 第 5 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_04, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0029
     * @tc.name      testNdkRenderSceneTypography0029
     * @tc.desc      校验 Typography 第 5 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_04, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0030
     * @tc.name      testNdkRenderSceneTypography0030
     * @tc.desc      校验 Typography 第 5 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_04, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0031
     * @tc.name      testNdkRenderSceneTypography0031
     * @tc.desc      校验 Typography 第 6 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTypography0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_05, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(TYPOGRAPHY_SCENE_05);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_05);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(TYPOGRAPHY_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0032
     * @tc.name      testNdkRenderSceneTypography0032
     * @tc.desc      校验 Typography 第 6 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTypography0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_05, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_05);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(TYPOGRAPHY_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0033
     * @tc.name      testNdkRenderSceneTypography0033
     * @tc.desc      校验 Typography 第 6 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_05, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0034
     * @tc.name      testNdkRenderSceneTypography0034
     * @tc.desc      校验 Typography 第 6 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_05, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0035
     * @tc.name      testNdkRenderSceneTypography0035
     * @tc.desc      校验 Typography 第 6 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_05, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0036
     * @tc.name      testNdkRenderSceneTypography0036
     * @tc.desc      校验 Typography 第 6 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_05, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0037
     * @tc.name      testNdkRenderSceneTypography0037
     * @tc.desc      校验 Typography 第 7 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTypography0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_06, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(TYPOGRAPHY_SCENE_06);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_06);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(TYPOGRAPHY_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0038
     * @tc.name      testNdkRenderSceneTypography0038
     * @tc.desc      校验 Typography 第 7 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTypography0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_06, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_06);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(TYPOGRAPHY_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0039
     * @tc.name      testNdkRenderSceneTypography0039
     * @tc.desc      校验 Typography 第 7 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_06, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0040
     * @tc.name      testNdkRenderSceneTypography0040
     * @tc.desc      校验 Typography 第 7 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_06, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0041
     * @tc.name      testNdkRenderSceneTypography0041
     * @tc.desc      校验 Typography 第 7 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_06, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0042
     * @tc.name      testNdkRenderSceneTypography0042
     * @tc.desc      校验 Typography 第 7 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_06, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0043
     * @tc.name      testNdkRenderSceneTypography0043
     * @tc.desc      校验 Typography 第 8 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTypography0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_07, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(TYPOGRAPHY_SCENE_07);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_07);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(TYPOGRAPHY_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0044
     * @tc.name      testNdkRenderSceneTypography0044
     * @tc.desc      校验 Typography 第 8 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTypography0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_07, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_07);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(TYPOGRAPHY_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0045
     * @tc.name      testNdkRenderSceneTypography0045
     * @tc.desc      校验 Typography 第 8 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_07, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0046
     * @tc.name      testNdkRenderSceneTypography0046
     * @tc.desc      校验 Typography 第 8 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_07, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0047
     * @tc.name      testNdkRenderSceneTypography0047
     * @tc.desc      校验 Typography 第 8 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_07, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0048
     * @tc.name      testNdkRenderSceneTypography0048
     * @tc.desc      校验 Typography 第 8 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_07, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0049
     * @tc.name      testNdkRenderSceneTypography0049
     * @tc.desc      校验 Typography 第 9 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTypography0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_08, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(TYPOGRAPHY_SCENE_08);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_08);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(TYPOGRAPHY_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0050
     * @tc.name      testNdkRenderSceneTypography0050
     * @tc.desc      校验 Typography 第 9 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTypography0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_08, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_08);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(TYPOGRAPHY_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0051
     * @tc.name      testNdkRenderSceneTypography0051
     * @tc.desc      校验 Typography 第 9 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_08, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0052
     * @tc.name      testNdkRenderSceneTypography0052
     * @tc.desc      校验 Typography 第 9 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_08, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0053
     * @tc.name      testNdkRenderSceneTypography0053
     * @tc.desc      校验 Typography 第 9 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_08, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0054
     * @tc.name      testNdkRenderSceneTypography0054
     * @tc.desc      校验 Typography 第 9 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_08, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0055
     * @tc.name      testNdkRenderSceneTypography0055
     * @tc.desc      校验 Typography 第 10 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTypography0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_09, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(TYPOGRAPHY_SCENE_09);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_09);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(TYPOGRAPHY_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0056
     * @tc.name      testNdkRenderSceneTypography0056
     * @tc.desc      校验 Typography 第 10 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTypography0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_09, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_09);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(TYPOGRAPHY_PARAMS_09);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0057
     * @tc.name      testNdkRenderSceneTypography0057
     * @tc.desc      校验 Typography 第 10 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_09, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_09);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0058
     * @tc.name      testNdkRenderSceneTypography0058
     * @tc.desc      校验 Typography 第 10 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_09, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_09);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0059
     * @tc.name      testNdkRenderSceneTypography0059
     * @tc.desc      校验 Typography 第 10 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_09, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_09);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0060
     * @tc.name      testNdkRenderSceneTypography0060
     * @tc.desc      校验 Typography 第 10 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_09, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_09);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0061
     * @tc.name      testNdkRenderSceneTypography0061
     * @tc.desc      校验 Typography 第 11 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTypography0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_10, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(TYPOGRAPHY_SCENE_10);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_10);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(TYPOGRAPHY_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0062
     * @tc.name      testNdkRenderSceneTypography0062
     * @tc.desc      校验 Typography 第 11 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTypography0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_10, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_10);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(TYPOGRAPHY_PARAMS_10);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0063
     * @tc.name      testNdkRenderSceneTypography0063
     * @tc.desc      校验 Typography 第 11 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_10, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_10);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0064
     * @tc.name      testNdkRenderSceneTypography0064
     * @tc.desc      校验 Typography 第 11 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_10, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_10);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0065
     * @tc.name      testNdkRenderSceneTypography0065
     * @tc.desc      校验 Typography 第 11 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_10, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_10);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0066
     * @tc.name      testNdkRenderSceneTypography0066
     * @tc.desc      校验 Typography 第 11 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_10, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_10);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0067
     * @tc.name      testNdkRenderSceneTypography0067
     * @tc.desc      校验 Typography 第 12 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTypography0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_11, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(TYPOGRAPHY_SCENE_11);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_11);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(TYPOGRAPHY_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0068
     * @tc.name      testNdkRenderSceneTypography0068
     * @tc.desc      校验 Typography 第 12 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTypography0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_11, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_11);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(TYPOGRAPHY_PARAMS_11);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0069
     * @tc.name      testNdkRenderSceneTypography0069
     * @tc.desc      校验 Typography 第 12 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_11, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_11);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0070
     * @tc.name      testNdkRenderSceneTypography0070
     * @tc.desc      校验 Typography 第 12 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_11, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_11);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0071
     * @tc.name      testNdkRenderSceneTypography0071
     * @tc.desc      校验 Typography 第 12 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_11, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_11);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0072
     * @tc.name      testNdkRenderSceneTypography0072
     * @tc.desc      校验 Typography 第 12 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_11, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_11);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0073
     * @tc.name      testNdkRenderSceneTypography0073
     * @tc.desc      校验 Typography 第 13 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTypography0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_12, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(TYPOGRAPHY_SCENE_12);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_12);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(TYPOGRAPHY_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0074
     * @tc.name      testNdkRenderSceneTypography0074
     * @tc.desc      校验 Typography 第 13 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTypography0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_12, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_12);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(TYPOGRAPHY_PARAMS_12);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0075
     * @tc.name      testNdkRenderSceneTypography0075
     * @tc.desc      校验 Typography 第 13 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_12, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_12);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0076
     * @tc.name      testNdkRenderSceneTypography0076
     * @tc.desc      校验 Typography 第 13 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_12, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_12);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0077
     * @tc.name      testNdkRenderSceneTypography0077
     * @tc.desc      校验 Typography 第 13 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_12, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_12);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0078
     * @tc.name      testNdkRenderSceneTypography0078
     * @tc.desc      校验 Typography 第 13 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_12, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_12);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0079
     * @tc.name      testNdkRenderSceneTypography0079
     * @tc.desc      校验 Typography 第 14 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTypography0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_13, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(TYPOGRAPHY_SCENE_13);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_13);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(TYPOGRAPHY_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0080
     * @tc.name      testNdkRenderSceneTypography0080
     * @tc.desc      校验 Typography 第 14 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTypography0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_13, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_13);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(TYPOGRAPHY_PARAMS_13);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0081
     * @tc.name      testNdkRenderSceneTypography0081
     * @tc.desc      校验 Typography 第 14 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_13, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_13);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0082
     * @tc.name      testNdkRenderSceneTypography0082
     * @tc.desc      校验 Typography 第 14 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_13, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_13);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0083
     * @tc.name      testNdkRenderSceneTypography0083
     * @tc.desc      校验 Typography 第 14 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_13, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_13);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TYPOGRAPHY_0084
     * @tc.name      testNdkRenderSceneTypography0084
     * @tc.desc      校验 Typography 第 14 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTypography0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TYPOGRAPHY_BUCKET, TYPOGRAPHY_SCENE_13, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(TYPOGRAPHY_PARAMS_13);
    })

  })
}
