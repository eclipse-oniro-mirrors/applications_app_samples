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

// 场景轴 TopicFrameTick 桶：覆盖第 28 个分组的 4 个场景，每个场景六个维度各一条用例。
const FRAMETICK_BUCKET: number = 28;
const FRAMETICK_SCENE_TOTAL: number = 4;
const FRAMETICK_SCENE_00: number = 0;
const FRAMETICK_SCENE_01: number = 1;
const FRAMETICK_SCENE_02: number = 2;
const FRAMETICK_SCENE_03: number = 3;
const FRAMETICK_PARAMS_00: number = 2;
const FRAMETICK_PARAMS_01: number = 2;
const FRAMETICK_PARAMS_02: number = 2;
const FRAMETICK_PARAMS_03: number = 1;

export default function ndkRenderSceneTopicFrameTickTest(): void {
  describe('NdkRenderSceneTopicFrameTick', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_FRAMETICK_0001
     * @tc.name      testNdkRenderSceneTopicFrameTick0001
     * @tc.desc      校验 TopicFrameTick 第 1 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicFrameTick0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(FRAMETICK_BUCKET, FRAMETICK_SCENE_00, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(FRAMETICK_SCENE_00);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(FRAMETICK_PARAMS_00);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(FRAMETICK_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_FRAMETICK_0002
     * @tc.name      testNdkRenderSceneTopicFrameTick0002
     * @tc.desc      校验 TopicFrameTick 第 1 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicFrameTick0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(FRAMETICK_BUCKET, FRAMETICK_SCENE_00, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(FRAMETICK_PARAMS_00);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(FRAMETICK_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_FRAMETICK_0003
     * @tc.name      testNdkRenderSceneTopicFrameTick0003
     * @tc.desc      校验 TopicFrameTick 第 1 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicFrameTick0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(FRAMETICK_BUCKET, FRAMETICK_SCENE_00, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(FRAMETICK_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_FRAMETICK_0004
     * @tc.name      testNdkRenderSceneTopicFrameTick0004
     * @tc.desc      校验 TopicFrameTick 第 1 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicFrameTick0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(FRAMETICK_BUCKET, FRAMETICK_SCENE_00, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(FRAMETICK_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_FRAMETICK_0005
     * @tc.name      testNdkRenderSceneTopicFrameTick0005
     * @tc.desc      校验 TopicFrameTick 第 1 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicFrameTick0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(FRAMETICK_BUCKET, FRAMETICK_SCENE_00, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(FRAMETICK_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_FRAMETICK_0006
     * @tc.name      testNdkRenderSceneTopicFrameTick0006
     * @tc.desc      校验 TopicFrameTick 第 1 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicFrameTick0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(FRAMETICK_BUCKET, FRAMETICK_SCENE_00, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(FRAMETICK_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_FRAMETICK_0007
     * @tc.name      testNdkRenderSceneTopicFrameTick0007
     * @tc.desc      校验 TopicFrameTick 第 2 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicFrameTick0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(FRAMETICK_BUCKET, FRAMETICK_SCENE_01, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(FRAMETICK_SCENE_01);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(FRAMETICK_PARAMS_01);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(FRAMETICK_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_FRAMETICK_0008
     * @tc.name      testNdkRenderSceneTopicFrameTick0008
     * @tc.desc      校验 TopicFrameTick 第 2 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicFrameTick0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(FRAMETICK_BUCKET, FRAMETICK_SCENE_01, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(FRAMETICK_PARAMS_01);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(FRAMETICK_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_FRAMETICK_0009
     * @tc.name      testNdkRenderSceneTopicFrameTick0009
     * @tc.desc      校验 TopicFrameTick 第 2 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicFrameTick0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(FRAMETICK_BUCKET, FRAMETICK_SCENE_01, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(FRAMETICK_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_FRAMETICK_0010
     * @tc.name      testNdkRenderSceneTopicFrameTick0010
     * @tc.desc      校验 TopicFrameTick 第 2 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicFrameTick0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(FRAMETICK_BUCKET, FRAMETICK_SCENE_01, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(FRAMETICK_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_FRAMETICK_0011
     * @tc.name      testNdkRenderSceneTopicFrameTick0011
     * @tc.desc      校验 TopicFrameTick 第 2 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicFrameTick0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(FRAMETICK_BUCKET, FRAMETICK_SCENE_01, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(FRAMETICK_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_FRAMETICK_0012
     * @tc.name      testNdkRenderSceneTopicFrameTick0012
     * @tc.desc      校验 TopicFrameTick 第 2 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicFrameTick0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(FRAMETICK_BUCKET, FRAMETICK_SCENE_01, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(FRAMETICK_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_FRAMETICK_0013
     * @tc.name      testNdkRenderSceneTopicFrameTick0013
     * @tc.desc      校验 TopicFrameTick 第 3 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicFrameTick0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(FRAMETICK_BUCKET, FRAMETICK_SCENE_02, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(FRAMETICK_SCENE_02);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(FRAMETICK_PARAMS_02);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(FRAMETICK_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_FRAMETICK_0014
     * @tc.name      testNdkRenderSceneTopicFrameTick0014
     * @tc.desc      校验 TopicFrameTick 第 3 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicFrameTick0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(FRAMETICK_BUCKET, FRAMETICK_SCENE_02, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(FRAMETICK_PARAMS_02);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(FRAMETICK_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_FRAMETICK_0015
     * @tc.name      testNdkRenderSceneTopicFrameTick0015
     * @tc.desc      校验 TopicFrameTick 第 3 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicFrameTick0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(FRAMETICK_BUCKET, FRAMETICK_SCENE_02, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(FRAMETICK_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_FRAMETICK_0016
     * @tc.name      testNdkRenderSceneTopicFrameTick0016
     * @tc.desc      校验 TopicFrameTick 第 3 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicFrameTick0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(FRAMETICK_BUCKET, FRAMETICK_SCENE_02, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(FRAMETICK_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_FRAMETICK_0017
     * @tc.name      testNdkRenderSceneTopicFrameTick0017
     * @tc.desc      校验 TopicFrameTick 第 3 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicFrameTick0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(FRAMETICK_BUCKET, FRAMETICK_SCENE_02, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(FRAMETICK_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_FRAMETICK_0018
     * @tc.name      testNdkRenderSceneTopicFrameTick0018
     * @tc.desc      校验 TopicFrameTick 第 3 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicFrameTick0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(FRAMETICK_BUCKET, FRAMETICK_SCENE_02, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(FRAMETICK_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_FRAMETICK_0019
     * @tc.name      testNdkRenderSceneTopicFrameTick0019
     * @tc.desc      校验 TopicFrameTick 第 4 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicFrameTick0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(FRAMETICK_BUCKET, FRAMETICK_SCENE_03, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(FRAMETICK_SCENE_03);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(FRAMETICK_PARAMS_03);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(FRAMETICK_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_FRAMETICK_0020
     * @tc.name      testNdkRenderSceneTopicFrameTick0020
     * @tc.desc      校验 TopicFrameTick 第 4 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicFrameTick0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(FRAMETICK_BUCKET, FRAMETICK_SCENE_03, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(FRAMETICK_PARAMS_03);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(FRAMETICK_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_FRAMETICK_0021
     * @tc.name      testNdkRenderSceneTopicFrameTick0021
     * @tc.desc      校验 TopicFrameTick 第 4 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicFrameTick0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(FRAMETICK_BUCKET, FRAMETICK_SCENE_03, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(FRAMETICK_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_FRAMETICK_0022
     * @tc.name      testNdkRenderSceneTopicFrameTick0022
     * @tc.desc      校验 TopicFrameTick 第 4 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicFrameTick0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(FRAMETICK_BUCKET, FRAMETICK_SCENE_03, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(FRAMETICK_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_FRAMETICK_0023
     * @tc.name      testNdkRenderSceneTopicFrameTick0023
     * @tc.desc      校验 TopicFrameTick 第 4 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicFrameTick0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(FRAMETICK_BUCKET, FRAMETICK_SCENE_03, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(FRAMETICK_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_FRAMETICK_0024
     * @tc.name      testNdkRenderSceneTopicFrameTick0024
     * @tc.desc      校验 TopicFrameTick 第 4 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicFrameTick0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(FRAMETICK_BUCKET, FRAMETICK_SCENE_03, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(FRAMETICK_PARAMS_03);
    })

  })
}
