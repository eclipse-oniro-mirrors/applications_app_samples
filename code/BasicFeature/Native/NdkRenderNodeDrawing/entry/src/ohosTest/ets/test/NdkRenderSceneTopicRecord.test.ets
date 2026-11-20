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

// 场景轴 TopicRecord 桶：覆盖第 25 个分组的 4 个场景，每个场景六个维度各一条用例。
const TOPICRECORD_BUCKET: number = 25;
const TOPICRECORD_SCENE_TOTAL: number = 4;
const TOPICRECORD_SCENE_00: number = 0;
const TOPICRECORD_SCENE_01: number = 1;
const TOPICRECORD_SCENE_02: number = 2;
const TOPICRECORD_SCENE_03: number = 3;
const TOPICRECORD_PARAMS_00: number = 1;
const TOPICRECORD_PARAMS_01: number = 2;
const TOPICRECORD_PARAMS_02: number = 3;
const TOPICRECORD_PARAMS_03: number = 1;

export default function ndkRenderSceneTopicRecordTest(): void {
  describe('NdkRenderSceneTopicRecord', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TOPICRECORD_0001
     * @tc.name      testNdkRenderSceneTopicRecord0001
     * @tc.desc      校验 TopicRecord 第 1 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicRecord0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TOPICRECORD_BUCKET, TOPICRECORD_SCENE_00, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(TOPICRECORD_SCENE_00);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TOPICRECORD_PARAMS_00);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(TOPICRECORD_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TOPICRECORD_0002
     * @tc.name      testNdkRenderSceneTopicRecord0002
     * @tc.desc      校验 TopicRecord 第 1 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicRecord0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TOPICRECORD_BUCKET, TOPICRECORD_SCENE_00, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(TOPICRECORD_PARAMS_00);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(TOPICRECORD_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TOPICRECORD_0003
     * @tc.name      testNdkRenderSceneTopicRecord0003
     * @tc.desc      校验 TopicRecord 第 1 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicRecord0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TOPICRECORD_BUCKET, TOPICRECORD_SCENE_00, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TOPICRECORD_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TOPICRECORD_0004
     * @tc.name      testNdkRenderSceneTopicRecord0004
     * @tc.desc      校验 TopicRecord 第 1 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicRecord0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TOPICRECORD_BUCKET, TOPICRECORD_SCENE_00, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(TOPICRECORD_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TOPICRECORD_0005
     * @tc.name      testNdkRenderSceneTopicRecord0005
     * @tc.desc      校验 TopicRecord 第 1 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicRecord0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TOPICRECORD_BUCKET, TOPICRECORD_SCENE_00, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(TOPICRECORD_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TOPICRECORD_0006
     * @tc.name      testNdkRenderSceneTopicRecord0006
     * @tc.desc      校验 TopicRecord 第 1 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicRecord0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TOPICRECORD_BUCKET, TOPICRECORD_SCENE_00, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(TOPICRECORD_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TOPICRECORD_0007
     * @tc.name      testNdkRenderSceneTopicRecord0007
     * @tc.desc      校验 TopicRecord 第 2 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicRecord0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TOPICRECORD_BUCKET, TOPICRECORD_SCENE_01, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(TOPICRECORD_SCENE_01);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TOPICRECORD_PARAMS_01);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(TOPICRECORD_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TOPICRECORD_0008
     * @tc.name      testNdkRenderSceneTopicRecord0008
     * @tc.desc      校验 TopicRecord 第 2 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicRecord0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TOPICRECORD_BUCKET, TOPICRECORD_SCENE_01, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(TOPICRECORD_PARAMS_01);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(TOPICRECORD_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TOPICRECORD_0009
     * @tc.name      testNdkRenderSceneTopicRecord0009
     * @tc.desc      校验 TopicRecord 第 2 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicRecord0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TOPICRECORD_BUCKET, TOPICRECORD_SCENE_01, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TOPICRECORD_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TOPICRECORD_0010
     * @tc.name      testNdkRenderSceneTopicRecord0010
     * @tc.desc      校验 TopicRecord 第 2 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicRecord0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TOPICRECORD_BUCKET, TOPICRECORD_SCENE_01, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(TOPICRECORD_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TOPICRECORD_0011
     * @tc.name      testNdkRenderSceneTopicRecord0011
     * @tc.desc      校验 TopicRecord 第 2 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicRecord0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TOPICRECORD_BUCKET, TOPICRECORD_SCENE_01, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(TOPICRECORD_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TOPICRECORD_0012
     * @tc.name      testNdkRenderSceneTopicRecord0012
     * @tc.desc      校验 TopicRecord 第 2 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicRecord0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TOPICRECORD_BUCKET, TOPICRECORD_SCENE_01, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(TOPICRECORD_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TOPICRECORD_0013
     * @tc.name      testNdkRenderSceneTopicRecord0013
     * @tc.desc      校验 TopicRecord 第 3 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicRecord0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TOPICRECORD_BUCKET, TOPICRECORD_SCENE_02, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(TOPICRECORD_SCENE_02);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TOPICRECORD_PARAMS_02);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(TOPICRECORD_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TOPICRECORD_0014
     * @tc.name      testNdkRenderSceneTopicRecord0014
     * @tc.desc      校验 TopicRecord 第 3 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicRecord0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TOPICRECORD_BUCKET, TOPICRECORD_SCENE_02, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(TOPICRECORD_PARAMS_02);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(TOPICRECORD_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TOPICRECORD_0015
     * @tc.name      testNdkRenderSceneTopicRecord0015
     * @tc.desc      校验 TopicRecord 第 3 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicRecord0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TOPICRECORD_BUCKET, TOPICRECORD_SCENE_02, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TOPICRECORD_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TOPICRECORD_0016
     * @tc.name      testNdkRenderSceneTopicRecord0016
     * @tc.desc      校验 TopicRecord 第 3 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicRecord0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TOPICRECORD_BUCKET, TOPICRECORD_SCENE_02, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(TOPICRECORD_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TOPICRECORD_0017
     * @tc.name      testNdkRenderSceneTopicRecord0017
     * @tc.desc      校验 TopicRecord 第 3 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicRecord0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TOPICRECORD_BUCKET, TOPICRECORD_SCENE_02, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(TOPICRECORD_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TOPICRECORD_0018
     * @tc.name      testNdkRenderSceneTopicRecord0018
     * @tc.desc      校验 TopicRecord 第 3 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicRecord0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TOPICRECORD_BUCKET, TOPICRECORD_SCENE_02, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(TOPICRECORD_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TOPICRECORD_0019
     * @tc.name      testNdkRenderSceneTopicRecord0019
     * @tc.desc      校验 TopicRecord 第 4 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicRecord0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TOPICRECORD_BUCKET, TOPICRECORD_SCENE_03, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(TOPICRECORD_SCENE_03);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TOPICRECORD_PARAMS_03);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(TOPICRECORD_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TOPICRECORD_0020
     * @tc.name      testNdkRenderSceneTopicRecord0020
     * @tc.desc      校验 TopicRecord 第 4 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTopicRecord0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TOPICRECORD_BUCKET, TOPICRECORD_SCENE_03, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(TOPICRECORD_PARAMS_03);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(TOPICRECORD_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TOPICRECORD_0021
     * @tc.name      testNdkRenderSceneTopicRecord0021
     * @tc.desc      校验 TopicRecord 第 4 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicRecord0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TOPICRECORD_BUCKET, TOPICRECORD_SCENE_03, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TOPICRECORD_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TOPICRECORD_0022
     * @tc.name      testNdkRenderSceneTopicRecord0022
     * @tc.desc      校验 TopicRecord 第 4 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicRecord0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TOPICRECORD_BUCKET, TOPICRECORD_SCENE_03, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(TOPICRECORD_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TOPICRECORD_0023
     * @tc.name      testNdkRenderSceneTopicRecord0023
     * @tc.desc      校验 TopicRecord 第 4 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicRecord0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TOPICRECORD_BUCKET, TOPICRECORD_SCENE_03, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(TOPICRECORD_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TOPICRECORD_0024
     * @tc.name      testNdkRenderSceneTopicRecord0024
     * @tc.desc      校验 TopicRecord 第 4 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTopicRecord0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TOPICRECORD_BUCKET, TOPICRECORD_SCENE_03, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(TOPICRECORD_PARAMS_03);
    })

  })
}
