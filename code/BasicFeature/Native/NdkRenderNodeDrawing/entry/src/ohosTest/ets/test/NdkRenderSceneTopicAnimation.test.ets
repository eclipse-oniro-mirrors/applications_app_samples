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

// 场景轴 TopicAnimation 桶：覆盖第 22 个分组的 4 个场景，每个场景六个维度各一条用例。
const ANIMATION_BUCKET: number = 22;
const ANIMATION_SCENE_TOTAL: number = 4;
const ANIMATION_SCENE_00: number = 0;
const ANIMATION_SCENE_01: number = 1;
const ANIMATION_SCENE_02: number = 2;
const ANIMATION_SCENE_03: number = 3;
const ANIMATION_PARAMS_00: number = 3;
const ANIMATION_PARAMS_01: number = 3;
const ANIMATION_PARAMS_02: number = 3;
const ANIMATION_PARAMS_03: number = 3;

export default function ndkRenderSceneTopicAnimationTest(): void {
  describe('NdkRenderSceneTopicAnimation', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_ANIMATION_0001
     * @tc.name      testNdkRenderSceneTopicAnimation0001
     * @tc.desc      校验 TopicAnimation 第 1 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicAnimation0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(ANIMATION_BUCKET, ANIMATION_SCENE_00, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(ANIMATION_SCENE_00);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(ANIMATION_PARAMS_00);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(ANIMATION_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_ANIMATION_0002
     * @tc.name      testNdkRenderSceneTopicAnimation0002
     * @tc.desc      校验 TopicAnimation 第 1 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicAnimation0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(ANIMATION_BUCKET, ANIMATION_SCENE_00, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(ANIMATION_PARAMS_00);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(ANIMATION_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_ANIMATION_0003
     * @tc.name      testNdkRenderSceneTopicAnimation0003
     * @tc.desc      校验 TopicAnimation 第 1 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicAnimation0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(ANIMATION_BUCKET, ANIMATION_SCENE_00, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(ANIMATION_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_ANIMATION_0004
     * @tc.name      testNdkRenderSceneTopicAnimation0004
     * @tc.desc      校验 TopicAnimation 第 1 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicAnimation0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(ANIMATION_BUCKET, ANIMATION_SCENE_00, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(ANIMATION_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_ANIMATION_0005
     * @tc.name      testNdkRenderSceneTopicAnimation0005
     * @tc.desc      校验 TopicAnimation 第 1 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicAnimation0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(ANIMATION_BUCKET, ANIMATION_SCENE_00, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(ANIMATION_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_ANIMATION_0006
     * @tc.name      testNdkRenderSceneTopicAnimation0006
     * @tc.desc      校验 TopicAnimation 第 1 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicAnimation0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(ANIMATION_BUCKET, ANIMATION_SCENE_00, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(ANIMATION_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_ANIMATION_0007
     * @tc.name      testNdkRenderSceneTopicAnimation0007
     * @tc.desc      校验 TopicAnimation 第 2 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicAnimation0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(ANIMATION_BUCKET, ANIMATION_SCENE_01, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(ANIMATION_SCENE_01);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(ANIMATION_PARAMS_01);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(ANIMATION_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_ANIMATION_0008
     * @tc.name      testNdkRenderSceneTopicAnimation0008
     * @tc.desc      校验 TopicAnimation 第 2 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicAnimation0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(ANIMATION_BUCKET, ANIMATION_SCENE_01, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(ANIMATION_PARAMS_01);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(ANIMATION_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_ANIMATION_0009
     * @tc.name      testNdkRenderSceneTopicAnimation0009
     * @tc.desc      校验 TopicAnimation 第 2 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicAnimation0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(ANIMATION_BUCKET, ANIMATION_SCENE_01, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(ANIMATION_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_ANIMATION_0010
     * @tc.name      testNdkRenderSceneTopicAnimation0010
     * @tc.desc      校验 TopicAnimation 第 2 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicAnimation0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(ANIMATION_BUCKET, ANIMATION_SCENE_01, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(ANIMATION_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_ANIMATION_0011
     * @tc.name      testNdkRenderSceneTopicAnimation0011
     * @tc.desc      校验 TopicAnimation 第 2 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicAnimation0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(ANIMATION_BUCKET, ANIMATION_SCENE_01, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(ANIMATION_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_ANIMATION_0012
     * @tc.name      testNdkRenderSceneTopicAnimation0012
     * @tc.desc      校验 TopicAnimation 第 2 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicAnimation0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(ANIMATION_BUCKET, ANIMATION_SCENE_01, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(ANIMATION_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_ANIMATION_0013
     * @tc.name      testNdkRenderSceneTopicAnimation0013
     * @tc.desc      校验 TopicAnimation 第 3 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicAnimation0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(ANIMATION_BUCKET, ANIMATION_SCENE_02, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(ANIMATION_SCENE_02);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(ANIMATION_PARAMS_02);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(ANIMATION_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_ANIMATION_0014
     * @tc.name      testNdkRenderSceneTopicAnimation0014
     * @tc.desc      校验 TopicAnimation 第 3 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicAnimation0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(ANIMATION_BUCKET, ANIMATION_SCENE_02, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(ANIMATION_PARAMS_02);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(ANIMATION_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_ANIMATION_0015
     * @tc.name      testNdkRenderSceneTopicAnimation0015
     * @tc.desc      校验 TopicAnimation 第 3 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicAnimation0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(ANIMATION_BUCKET, ANIMATION_SCENE_02, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(ANIMATION_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_ANIMATION_0016
     * @tc.name      testNdkRenderSceneTopicAnimation0016
     * @tc.desc      校验 TopicAnimation 第 3 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicAnimation0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(ANIMATION_BUCKET, ANIMATION_SCENE_02, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(ANIMATION_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_ANIMATION_0017
     * @tc.name      testNdkRenderSceneTopicAnimation0017
     * @tc.desc      校验 TopicAnimation 第 3 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicAnimation0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(ANIMATION_BUCKET, ANIMATION_SCENE_02, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(ANIMATION_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_ANIMATION_0018
     * @tc.name      testNdkRenderSceneTopicAnimation0018
     * @tc.desc      校验 TopicAnimation 第 3 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicAnimation0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(ANIMATION_BUCKET, ANIMATION_SCENE_02, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(ANIMATION_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_ANIMATION_0019
     * @tc.name      testNdkRenderSceneTopicAnimation0019
     * @tc.desc      校验 TopicAnimation 第 4 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicAnimation0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(ANIMATION_BUCKET, ANIMATION_SCENE_03, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(ANIMATION_SCENE_03);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(ANIMATION_PARAMS_03);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(ANIMATION_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_ANIMATION_0020
     * @tc.name      testNdkRenderSceneTopicAnimation0020
     * @tc.desc      校验 TopicAnimation 第 4 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicAnimation0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(ANIMATION_BUCKET, ANIMATION_SCENE_03, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(ANIMATION_PARAMS_03);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(ANIMATION_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_ANIMATION_0021
     * @tc.name      testNdkRenderSceneTopicAnimation0021
     * @tc.desc      校验 TopicAnimation 第 4 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicAnimation0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(ANIMATION_BUCKET, ANIMATION_SCENE_03, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(ANIMATION_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_ANIMATION_0022
     * @tc.name      testNdkRenderSceneTopicAnimation0022
     * @tc.desc      校验 TopicAnimation 第 4 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicAnimation0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(ANIMATION_BUCKET, ANIMATION_SCENE_03, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(ANIMATION_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_ANIMATION_0023
     * @tc.name      testNdkRenderSceneTopicAnimation0023
     * @tc.desc      校验 TopicAnimation 第 4 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicAnimation0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(ANIMATION_BUCKET, ANIMATION_SCENE_03, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(ANIMATION_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_ANIMATION_0024
     * @tc.name      testNdkRenderSceneTopicAnimation0024
     * @tc.desc      校验 TopicAnimation 第 4 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicAnimation0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(ANIMATION_BUCKET, ANIMATION_SCENE_03, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(ANIMATION_PARAMS_03);
    })

  })
}
