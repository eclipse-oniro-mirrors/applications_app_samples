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

// 场景轴 Record 桶：覆盖第 16 个分组的 8 个场景，每个场景六个维度各一条用例。
const RECORD_BUCKET: number = 16;
const RECORD_SCENE_TOTAL: number = 8;
const RECORD_SCENE_00: number = 0;
const RECORD_SCENE_01: number = 1;
const RECORD_SCENE_02: number = 2;
const RECORD_SCENE_03: number = 3;
const RECORD_SCENE_04: number = 4;
const RECORD_SCENE_05: number = 5;
const RECORD_SCENE_06: number = 6;
const RECORD_SCENE_07: number = 7;
const RECORD_PARAMS_00: number = 1;
const RECORD_PARAMS_01: number = 2;
const RECORD_PARAMS_02: number = 2;
const RECORD_PARAMS_03: number = 1;
const RECORD_PARAMS_04: number = 2;
const RECORD_PARAMS_05: number = 2;
const RECORD_PARAMS_06: number = 2;
const RECORD_PARAMS_07: number = 2;

export default function ndkRenderSceneRecordTest(): void {
  describe('NdkRenderSceneRecord', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0001
     * @tc.name      testNdkRenderSceneRecord0001
     * @tc.desc      校验 Record 第 1 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneRecord0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_00, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(RECORD_SCENE_00);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_00);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(RECORD_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0002
     * @tc.name      testNdkRenderSceneRecord0002
     * @tc.desc      校验 Record 第 1 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneRecord0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_00, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_00);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(RECORD_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0003
     * @tc.name      testNdkRenderSceneRecord0003
     * @tc.desc      校验 Record 第 1 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_00, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0004
     * @tc.name      testNdkRenderSceneRecord0004
     * @tc.desc      校验 Record 第 1 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_00, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0005
     * @tc.name      testNdkRenderSceneRecord0005
     * @tc.desc      校验 Record 第 1 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_00, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0006
     * @tc.name      testNdkRenderSceneRecord0006
     * @tc.desc      校验 Record 第 1 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_00, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0007
     * @tc.name      testNdkRenderSceneRecord0007
     * @tc.desc      校验 Record 第 2 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneRecord0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_01, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(RECORD_SCENE_01);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_01);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(RECORD_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0008
     * @tc.name      testNdkRenderSceneRecord0008
     * @tc.desc      校验 Record 第 2 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneRecord0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_01, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_01);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(RECORD_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0009
     * @tc.name      testNdkRenderSceneRecord0009
     * @tc.desc      校验 Record 第 2 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_01, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0010
     * @tc.name      testNdkRenderSceneRecord0010
     * @tc.desc      校验 Record 第 2 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_01, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0011
     * @tc.name      testNdkRenderSceneRecord0011
     * @tc.desc      校验 Record 第 2 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_01, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0012
     * @tc.name      testNdkRenderSceneRecord0012
     * @tc.desc      校验 Record 第 2 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_01, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0013
     * @tc.name      testNdkRenderSceneRecord0013
     * @tc.desc      校验 Record 第 3 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneRecord0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_02, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(RECORD_SCENE_02);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_02);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(RECORD_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0014
     * @tc.name      testNdkRenderSceneRecord0014
     * @tc.desc      校验 Record 第 3 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneRecord0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_02, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_02);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(RECORD_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0015
     * @tc.name      testNdkRenderSceneRecord0015
     * @tc.desc      校验 Record 第 3 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_02, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0016
     * @tc.name      testNdkRenderSceneRecord0016
     * @tc.desc      校验 Record 第 3 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_02, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0017
     * @tc.name      testNdkRenderSceneRecord0017
     * @tc.desc      校验 Record 第 3 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_02, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0018
     * @tc.name      testNdkRenderSceneRecord0018
     * @tc.desc      校验 Record 第 3 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_02, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0019
     * @tc.name      testNdkRenderSceneRecord0019
     * @tc.desc      校验 Record 第 4 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneRecord0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_03, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(RECORD_SCENE_03);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_03);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(RECORD_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0020
     * @tc.name      testNdkRenderSceneRecord0020
     * @tc.desc      校验 Record 第 4 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneRecord0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_03, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_03);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(RECORD_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0021
     * @tc.name      testNdkRenderSceneRecord0021
     * @tc.desc      校验 Record 第 4 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_03, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0022
     * @tc.name      testNdkRenderSceneRecord0022
     * @tc.desc      校验 Record 第 4 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_03, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0023
     * @tc.name      testNdkRenderSceneRecord0023
     * @tc.desc      校验 Record 第 4 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_03, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0024
     * @tc.name      testNdkRenderSceneRecord0024
     * @tc.desc      校验 Record 第 4 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_03, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0025
     * @tc.name      testNdkRenderSceneRecord0025
     * @tc.desc      校验 Record 第 5 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneRecord0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_04, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(RECORD_SCENE_04);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_04);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(RECORD_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0026
     * @tc.name      testNdkRenderSceneRecord0026
     * @tc.desc      校验 Record 第 5 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneRecord0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_04, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_04);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(RECORD_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0027
     * @tc.name      testNdkRenderSceneRecord0027
     * @tc.desc      校验 Record 第 5 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_04, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0028
     * @tc.name      testNdkRenderSceneRecord0028
     * @tc.desc      校验 Record 第 5 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_04, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0029
     * @tc.name      testNdkRenderSceneRecord0029
     * @tc.desc      校验 Record 第 5 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_04, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0030
     * @tc.name      testNdkRenderSceneRecord0030
     * @tc.desc      校验 Record 第 5 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_04, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0031
     * @tc.name      testNdkRenderSceneRecord0031
     * @tc.desc      校验 Record 第 6 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneRecord0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_05, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(RECORD_SCENE_05);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_05);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(RECORD_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0032
     * @tc.name      testNdkRenderSceneRecord0032
     * @tc.desc      校验 Record 第 6 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneRecord0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_05, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_05);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(RECORD_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0033
     * @tc.name      testNdkRenderSceneRecord0033
     * @tc.desc      校验 Record 第 6 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_05, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0034
     * @tc.name      testNdkRenderSceneRecord0034
     * @tc.desc      校验 Record 第 6 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_05, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0035
     * @tc.name      testNdkRenderSceneRecord0035
     * @tc.desc      校验 Record 第 6 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_05, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0036
     * @tc.name      testNdkRenderSceneRecord0036
     * @tc.desc      校验 Record 第 6 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_05, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0037
     * @tc.name      testNdkRenderSceneRecord0037
     * @tc.desc      校验 Record 第 7 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneRecord0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_06, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(RECORD_SCENE_06);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_06);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(RECORD_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0038
     * @tc.name      testNdkRenderSceneRecord0038
     * @tc.desc      校验 Record 第 7 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneRecord0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_06, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_06);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(RECORD_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0039
     * @tc.name      testNdkRenderSceneRecord0039
     * @tc.desc      校验 Record 第 7 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_06, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0040
     * @tc.name      testNdkRenderSceneRecord0040
     * @tc.desc      校验 Record 第 7 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_06, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0041
     * @tc.name      testNdkRenderSceneRecord0041
     * @tc.desc      校验 Record 第 7 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_06, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0042
     * @tc.name      testNdkRenderSceneRecord0042
     * @tc.desc      校验 Record 第 7 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_06, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0043
     * @tc.name      testNdkRenderSceneRecord0043
     * @tc.desc      校验 Record 第 8 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneRecord0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_07, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(RECORD_SCENE_07);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_07);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(RECORD_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0044
     * @tc.name      testNdkRenderSceneRecord0044
     * @tc.desc      校验 Record 第 8 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneRecord0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_07, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_07);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(RECORD_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0045
     * @tc.name      testNdkRenderSceneRecord0045
     * @tc.desc      校验 Record 第 8 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_07, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0046
     * @tc.name      testNdkRenderSceneRecord0046
     * @tc.desc      校验 Record 第 8 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_07, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0047
     * @tc.name      testNdkRenderSceneRecord0047
     * @tc.desc      校验 Record 第 8 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_07, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_RECORD_0048
     * @tc.name      testNdkRenderSceneRecord0048
     * @tc.desc      校验 Record 第 8 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneRecord0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(RECORD_BUCKET, RECORD_SCENE_07, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(RECORD_PARAMS_07);
    })

  })
}
