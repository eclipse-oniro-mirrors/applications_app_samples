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

// 场景轴 TopicLifecycle 桶：覆盖第 27 个分组的 4 个场景，每个场景六个维度各一条用例。
const LIFECYCLE_BUCKET: number = 27;
const LIFECYCLE_SCENE_TOTAL: number = 4;
const LIFECYCLE_SCENE_00: number = 0;
const LIFECYCLE_SCENE_01: number = 1;
const LIFECYCLE_SCENE_02: number = 2;
const LIFECYCLE_SCENE_03: number = 3;
const LIFECYCLE_PARAMS_00: number = 2;
const LIFECYCLE_PARAMS_01: number = 2;
const LIFECYCLE_PARAMS_02: number = 2;
const LIFECYCLE_PARAMS_03: number = 2;

export default function ndkRenderSceneTopicLifecycleTest(): void {
  describe('NdkRenderSceneTopicLifecycle', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_LIFECYCLE_0001
     * @tc.name      testNdkRenderSceneTopicLifecycle0001
     * @tc.desc      校验 TopicLifecycle 第 1 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicLifecycle0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(LIFECYCLE_BUCKET, LIFECYCLE_SCENE_00, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(LIFECYCLE_SCENE_00);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(LIFECYCLE_PARAMS_00);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(LIFECYCLE_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_LIFECYCLE_0002
     * @tc.name      testNdkRenderSceneTopicLifecycle0002
     * @tc.desc      校验 TopicLifecycle 第 1 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicLifecycle0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(LIFECYCLE_BUCKET, LIFECYCLE_SCENE_00, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(LIFECYCLE_PARAMS_00);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(LIFECYCLE_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_LIFECYCLE_0003
     * @tc.name      testNdkRenderSceneTopicLifecycle0003
     * @tc.desc      校验 TopicLifecycle 第 1 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicLifecycle0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(LIFECYCLE_BUCKET, LIFECYCLE_SCENE_00, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(LIFECYCLE_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_LIFECYCLE_0004
     * @tc.name      testNdkRenderSceneTopicLifecycle0004
     * @tc.desc      校验 TopicLifecycle 第 1 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicLifecycle0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(LIFECYCLE_BUCKET, LIFECYCLE_SCENE_00, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(LIFECYCLE_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_LIFECYCLE_0005
     * @tc.name      testNdkRenderSceneTopicLifecycle0005
     * @tc.desc      校验 TopicLifecycle 第 1 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicLifecycle0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(LIFECYCLE_BUCKET, LIFECYCLE_SCENE_00, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(LIFECYCLE_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_LIFECYCLE_0006
     * @tc.name      testNdkRenderSceneTopicLifecycle0006
     * @tc.desc      校验 TopicLifecycle 第 1 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicLifecycle0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(LIFECYCLE_BUCKET, LIFECYCLE_SCENE_00, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(LIFECYCLE_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_LIFECYCLE_0007
     * @tc.name      testNdkRenderSceneTopicLifecycle0007
     * @tc.desc      校验 TopicLifecycle 第 2 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicLifecycle0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(LIFECYCLE_BUCKET, LIFECYCLE_SCENE_01, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(LIFECYCLE_SCENE_01);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(LIFECYCLE_PARAMS_01);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(LIFECYCLE_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_LIFECYCLE_0008
     * @tc.name      testNdkRenderSceneTopicLifecycle0008
     * @tc.desc      校验 TopicLifecycle 第 2 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicLifecycle0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(LIFECYCLE_BUCKET, LIFECYCLE_SCENE_01, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(LIFECYCLE_PARAMS_01);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(LIFECYCLE_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_LIFECYCLE_0009
     * @tc.name      testNdkRenderSceneTopicLifecycle0009
     * @tc.desc      校验 TopicLifecycle 第 2 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicLifecycle0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(LIFECYCLE_BUCKET, LIFECYCLE_SCENE_01, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(LIFECYCLE_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_LIFECYCLE_0010
     * @tc.name      testNdkRenderSceneTopicLifecycle0010
     * @tc.desc      校验 TopicLifecycle 第 2 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicLifecycle0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(LIFECYCLE_BUCKET, LIFECYCLE_SCENE_01, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(LIFECYCLE_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_LIFECYCLE_0011
     * @tc.name      testNdkRenderSceneTopicLifecycle0011
     * @tc.desc      校验 TopicLifecycle 第 2 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicLifecycle0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(LIFECYCLE_BUCKET, LIFECYCLE_SCENE_01, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(LIFECYCLE_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_LIFECYCLE_0012
     * @tc.name      testNdkRenderSceneTopicLifecycle0012
     * @tc.desc      校验 TopicLifecycle 第 2 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicLifecycle0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(LIFECYCLE_BUCKET, LIFECYCLE_SCENE_01, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(LIFECYCLE_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_LIFECYCLE_0013
     * @tc.name      testNdkRenderSceneTopicLifecycle0013
     * @tc.desc      校验 TopicLifecycle 第 3 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicLifecycle0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(LIFECYCLE_BUCKET, LIFECYCLE_SCENE_02, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(LIFECYCLE_SCENE_02);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(LIFECYCLE_PARAMS_02);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(LIFECYCLE_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_LIFECYCLE_0014
     * @tc.name      testNdkRenderSceneTopicLifecycle0014
     * @tc.desc      校验 TopicLifecycle 第 3 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicLifecycle0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(LIFECYCLE_BUCKET, LIFECYCLE_SCENE_02, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(LIFECYCLE_PARAMS_02);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(LIFECYCLE_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_LIFECYCLE_0015
     * @tc.name      testNdkRenderSceneTopicLifecycle0015
     * @tc.desc      校验 TopicLifecycle 第 3 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicLifecycle0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(LIFECYCLE_BUCKET, LIFECYCLE_SCENE_02, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(LIFECYCLE_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_LIFECYCLE_0016
     * @tc.name      testNdkRenderSceneTopicLifecycle0016
     * @tc.desc      校验 TopicLifecycle 第 3 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicLifecycle0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(LIFECYCLE_BUCKET, LIFECYCLE_SCENE_02, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(LIFECYCLE_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_LIFECYCLE_0017
     * @tc.name      testNdkRenderSceneTopicLifecycle0017
     * @tc.desc      校验 TopicLifecycle 第 3 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicLifecycle0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(LIFECYCLE_BUCKET, LIFECYCLE_SCENE_02, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(LIFECYCLE_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_LIFECYCLE_0018
     * @tc.name      testNdkRenderSceneTopicLifecycle0018
     * @tc.desc      校验 TopicLifecycle 第 3 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicLifecycle0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(LIFECYCLE_BUCKET, LIFECYCLE_SCENE_02, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(LIFECYCLE_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_LIFECYCLE_0019
     * @tc.name      testNdkRenderSceneTopicLifecycle0019
     * @tc.desc      校验 TopicLifecycle 第 4 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicLifecycle0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(LIFECYCLE_BUCKET, LIFECYCLE_SCENE_03, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(LIFECYCLE_SCENE_03);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(LIFECYCLE_PARAMS_03);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(LIFECYCLE_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_LIFECYCLE_0020
     * @tc.name      testNdkRenderSceneTopicLifecycle0020
     * @tc.desc      校验 TopicLifecycle 第 4 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicLifecycle0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(LIFECYCLE_BUCKET, LIFECYCLE_SCENE_03, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(LIFECYCLE_PARAMS_03);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(LIFECYCLE_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_LIFECYCLE_0021
     * @tc.name      testNdkRenderSceneTopicLifecycle0021
     * @tc.desc      校验 TopicLifecycle 第 4 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicLifecycle0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(LIFECYCLE_BUCKET, LIFECYCLE_SCENE_03, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(LIFECYCLE_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_LIFECYCLE_0022
     * @tc.name      testNdkRenderSceneTopicLifecycle0022
     * @tc.desc      校验 TopicLifecycle 第 4 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicLifecycle0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(LIFECYCLE_BUCKET, LIFECYCLE_SCENE_03, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(LIFECYCLE_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_LIFECYCLE_0023
     * @tc.name      testNdkRenderSceneTopicLifecycle0023
     * @tc.desc      校验 TopicLifecycle 第 4 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicLifecycle0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(LIFECYCLE_BUCKET, LIFECYCLE_SCENE_03, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(LIFECYCLE_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_LIFECYCLE_0024
     * @tc.name      testNdkRenderSceneTopicLifecycle0024
     * @tc.desc      校验 TopicLifecycle 第 4 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicLifecycle0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(LIFECYCLE_BUCKET, LIFECYCLE_SCENE_03, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(LIFECYCLE_PARAMS_03);
    })

  })
}
