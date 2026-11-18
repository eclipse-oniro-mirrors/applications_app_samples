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

// 场景轴 TextBlob 桶：覆盖第 12 个分组的 8 个场景，每个场景六个维度各一条用例。
const TEXTBLOB_BUCKET: number = 12;
const TEXTBLOB_SCENE_TOTAL: number = 8;
const TEXTBLOB_SCENE_00: number = 0;
const TEXTBLOB_SCENE_01: number = 1;
const TEXTBLOB_SCENE_02: number = 2;
const TEXTBLOB_SCENE_03: number = 3;
const TEXTBLOB_SCENE_04: number = 4;
const TEXTBLOB_SCENE_05: number = 5;
const TEXTBLOB_SCENE_06: number = 6;
const TEXTBLOB_SCENE_07: number = 7;
const TEXTBLOB_PARAMS_00: number = 2;
const TEXTBLOB_PARAMS_01: number = 2;
const TEXTBLOB_PARAMS_02: number = 2;
const TEXTBLOB_PARAMS_03: number = 2;
const TEXTBLOB_PARAMS_04: number = 2;
const TEXTBLOB_PARAMS_05: number = 1;
const TEXTBLOB_PARAMS_06: number = 2;
const TEXTBLOB_PARAMS_07: number = 2;

export default function ndkRenderSceneTextBlobTest(): void {
  describe('NdkRenderSceneTextBlob', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0001
     * @tc.name      testNdkRenderSceneTextBlob0001
     * @tc.desc      校验 TextBlob 第 1 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTextBlob0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_00, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(TEXTBLOB_SCENE_00);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_00);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(TEXTBLOB_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0002
     * @tc.name      testNdkRenderSceneTextBlob0002
     * @tc.desc      校验 TextBlob 第 1 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTextBlob0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_00, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_00);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(TEXTBLOB_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0003
     * @tc.name      testNdkRenderSceneTextBlob0003
     * @tc.desc      校验 TextBlob 第 1 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_00, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0004
     * @tc.name      testNdkRenderSceneTextBlob0004
     * @tc.desc      校验 TextBlob 第 1 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_00, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0005
     * @tc.name      testNdkRenderSceneTextBlob0005
     * @tc.desc      校验 TextBlob 第 1 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_00, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0006
     * @tc.name      testNdkRenderSceneTextBlob0006
     * @tc.desc      校验 TextBlob 第 1 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_00, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0007
     * @tc.name      testNdkRenderSceneTextBlob0007
     * @tc.desc      校验 TextBlob 第 2 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTextBlob0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_01, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(TEXTBLOB_SCENE_01);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_01);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(TEXTBLOB_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0008
     * @tc.name      testNdkRenderSceneTextBlob0008
     * @tc.desc      校验 TextBlob 第 2 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTextBlob0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_01, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_01);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(TEXTBLOB_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0009
     * @tc.name      testNdkRenderSceneTextBlob0009
     * @tc.desc      校验 TextBlob 第 2 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_01, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0010
     * @tc.name      testNdkRenderSceneTextBlob0010
     * @tc.desc      校验 TextBlob 第 2 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_01, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0011
     * @tc.name      testNdkRenderSceneTextBlob0011
     * @tc.desc      校验 TextBlob 第 2 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_01, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0012
     * @tc.name      testNdkRenderSceneTextBlob0012
     * @tc.desc      校验 TextBlob 第 2 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_01, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0013
     * @tc.name      testNdkRenderSceneTextBlob0013
     * @tc.desc      校验 TextBlob 第 3 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTextBlob0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_02, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(TEXTBLOB_SCENE_02);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_02);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(TEXTBLOB_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0014
     * @tc.name      testNdkRenderSceneTextBlob0014
     * @tc.desc      校验 TextBlob 第 3 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTextBlob0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_02, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_02);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(TEXTBLOB_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0015
     * @tc.name      testNdkRenderSceneTextBlob0015
     * @tc.desc      校验 TextBlob 第 3 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_02, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0016
     * @tc.name      testNdkRenderSceneTextBlob0016
     * @tc.desc      校验 TextBlob 第 3 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_02, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0017
     * @tc.name      testNdkRenderSceneTextBlob0017
     * @tc.desc      校验 TextBlob 第 3 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_02, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0018
     * @tc.name      testNdkRenderSceneTextBlob0018
     * @tc.desc      校验 TextBlob 第 3 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_02, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0019
     * @tc.name      testNdkRenderSceneTextBlob0019
     * @tc.desc      校验 TextBlob 第 4 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTextBlob0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_03, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(TEXTBLOB_SCENE_03);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_03);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(TEXTBLOB_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0020
     * @tc.name      testNdkRenderSceneTextBlob0020
     * @tc.desc      校验 TextBlob 第 4 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTextBlob0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_03, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_03);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(TEXTBLOB_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0021
     * @tc.name      testNdkRenderSceneTextBlob0021
     * @tc.desc      校验 TextBlob 第 4 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_03, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0022
     * @tc.name      testNdkRenderSceneTextBlob0022
     * @tc.desc      校验 TextBlob 第 4 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_03, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0023
     * @tc.name      testNdkRenderSceneTextBlob0023
     * @tc.desc      校验 TextBlob 第 4 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_03, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0024
     * @tc.name      testNdkRenderSceneTextBlob0024
     * @tc.desc      校验 TextBlob 第 4 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_03, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0025
     * @tc.name      testNdkRenderSceneTextBlob0025
     * @tc.desc      校验 TextBlob 第 5 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTextBlob0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_04, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(TEXTBLOB_SCENE_04);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_04);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(TEXTBLOB_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0026
     * @tc.name      testNdkRenderSceneTextBlob0026
     * @tc.desc      校验 TextBlob 第 5 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTextBlob0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_04, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_04);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(TEXTBLOB_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0027
     * @tc.name      testNdkRenderSceneTextBlob0027
     * @tc.desc      校验 TextBlob 第 5 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_04, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0028
     * @tc.name      testNdkRenderSceneTextBlob0028
     * @tc.desc      校验 TextBlob 第 5 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_04, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0029
     * @tc.name      testNdkRenderSceneTextBlob0029
     * @tc.desc      校验 TextBlob 第 5 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_04, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0030
     * @tc.name      testNdkRenderSceneTextBlob0030
     * @tc.desc      校验 TextBlob 第 5 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_04, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0031
     * @tc.name      testNdkRenderSceneTextBlob0031
     * @tc.desc      校验 TextBlob 第 6 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTextBlob0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_05, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(TEXTBLOB_SCENE_05);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_05);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(TEXTBLOB_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0032
     * @tc.name      testNdkRenderSceneTextBlob0032
     * @tc.desc      校验 TextBlob 第 6 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTextBlob0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_05, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_05);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(TEXTBLOB_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0033
     * @tc.name      testNdkRenderSceneTextBlob0033
     * @tc.desc      校验 TextBlob 第 6 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_05, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0034
     * @tc.name      testNdkRenderSceneTextBlob0034
     * @tc.desc      校验 TextBlob 第 6 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_05, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0035
     * @tc.name      testNdkRenderSceneTextBlob0035
     * @tc.desc      校验 TextBlob 第 6 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_05, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0036
     * @tc.name      testNdkRenderSceneTextBlob0036
     * @tc.desc      校验 TextBlob 第 6 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_05, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0037
     * @tc.name      testNdkRenderSceneTextBlob0037
     * @tc.desc      校验 TextBlob 第 7 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTextBlob0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_06, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(TEXTBLOB_SCENE_06);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_06);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(TEXTBLOB_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0038
     * @tc.name      testNdkRenderSceneTextBlob0038
     * @tc.desc      校验 TextBlob 第 7 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTextBlob0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_06, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_06);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(TEXTBLOB_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0039
     * @tc.name      testNdkRenderSceneTextBlob0039
     * @tc.desc      校验 TextBlob 第 7 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_06, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0040
     * @tc.name      testNdkRenderSceneTextBlob0040
     * @tc.desc      校验 TextBlob 第 7 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_06, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0041
     * @tc.name      testNdkRenderSceneTextBlob0041
     * @tc.desc      校验 TextBlob 第 7 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_06, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0042
     * @tc.name      testNdkRenderSceneTextBlob0042
     * @tc.desc      校验 TextBlob 第 7 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_06, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0043
     * @tc.name      testNdkRenderSceneTextBlob0043
     * @tc.desc      校验 TextBlob 第 8 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTextBlob0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_07, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(TEXTBLOB_SCENE_07);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_07);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(TEXTBLOB_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0044
     * @tc.name      testNdkRenderSceneTextBlob0044
     * @tc.desc      校验 TextBlob 第 8 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneTextBlob0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_07, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_07);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(TEXTBLOB_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0045
     * @tc.name      testNdkRenderSceneTextBlob0045
     * @tc.desc      校验 TextBlob 第 8 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_07, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0046
     * @tc.name      testNdkRenderSceneTextBlob0046
     * @tc.desc      校验 TextBlob 第 8 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_07, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0047
     * @tc.name      testNdkRenderSceneTextBlob0047
     * @tc.desc      校验 TextBlob 第 8 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_07, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_TEXTBLOB_0048
     * @tc.name      testNdkRenderSceneTextBlob0048
     * @tc.desc      校验 TextBlob 第 8 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneTextBlob0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(TEXTBLOB_BUCKET, TEXTBLOB_SCENE_07, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(TEXTBLOB_PARAMS_07);
    })

  })
}
