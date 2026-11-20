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

// 场景轴 ImageFilter 桶：覆盖第 7 个分组的 10 个场景，每个场景六个维度各一条用例。
const IMAGEFILTER_BUCKET: number = 7;
const IMAGEFILTER_SCENE_TOTAL: number = 10;
const IMAGEFILTER_SCENE_00: number = 0;
const IMAGEFILTER_SCENE_01: number = 1;
const IMAGEFILTER_SCENE_02: number = 2;
const IMAGEFILTER_SCENE_03: number = 3;
const IMAGEFILTER_SCENE_04: number = 4;
const IMAGEFILTER_SCENE_05: number = 5;
const IMAGEFILTER_SCENE_06: number = 6;
const IMAGEFILTER_SCENE_07: number = 7;
const IMAGEFILTER_SCENE_08: number = 8;
const IMAGEFILTER_SCENE_09: number = 9;
const IMAGEFILTER_PARAMS_00: number = 4;
const IMAGEFILTER_PARAMS_01: number = 3;
const IMAGEFILTER_PARAMS_02: number = 3;
const IMAGEFILTER_PARAMS_03: number = 2;
const IMAGEFILTER_PARAMS_04: number = 2;
const IMAGEFILTER_PARAMS_05: number = 2;
const IMAGEFILTER_PARAMS_06: number = 3;
const IMAGEFILTER_PARAMS_07: number = 3;
const IMAGEFILTER_PARAMS_08: number = 3;
const IMAGEFILTER_PARAMS_09: number = 3;

export default function ndkRenderSceneImageFilterTest(): void {
  describe('NdkRenderSceneImageFilter', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0001
     * @tc.name      testNdkRenderSceneImageFilter0001
     * @tc.desc      校验 ImageFilter 第 1 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageFilter0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_00, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(IMAGEFILTER_SCENE_00);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_00);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(IMAGEFILTER_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0002
     * @tc.name      testNdkRenderSceneImageFilter0002
     * @tc.desc      校验 ImageFilter 第 1 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageFilter0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_00, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_00);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(IMAGEFILTER_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0003
     * @tc.name      testNdkRenderSceneImageFilter0003
     * @tc.desc      校验 ImageFilter 第 1 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_00, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0004
     * @tc.name      testNdkRenderSceneImageFilter0004
     * @tc.desc      校验 ImageFilter 第 1 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_00, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0005
     * @tc.name      testNdkRenderSceneImageFilter0005
     * @tc.desc      校验 ImageFilter 第 1 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_00, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0006
     * @tc.name      testNdkRenderSceneImageFilter0006
     * @tc.desc      校验 ImageFilter 第 1 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_00, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0007
     * @tc.name      testNdkRenderSceneImageFilter0007
     * @tc.desc      校验 ImageFilter 第 2 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageFilter0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_01, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(IMAGEFILTER_SCENE_01);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_01);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(IMAGEFILTER_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0008
     * @tc.name      testNdkRenderSceneImageFilter0008
     * @tc.desc      校验 ImageFilter 第 2 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageFilter0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_01, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_01);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(IMAGEFILTER_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0009
     * @tc.name      testNdkRenderSceneImageFilter0009
     * @tc.desc      校验 ImageFilter 第 2 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_01, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0010
     * @tc.name      testNdkRenderSceneImageFilter0010
     * @tc.desc      校验 ImageFilter 第 2 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_01, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0011
     * @tc.name      testNdkRenderSceneImageFilter0011
     * @tc.desc      校验 ImageFilter 第 2 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_01, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0012
     * @tc.name      testNdkRenderSceneImageFilter0012
     * @tc.desc      校验 ImageFilter 第 2 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_01, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0013
     * @tc.name      testNdkRenderSceneImageFilter0013
     * @tc.desc      校验 ImageFilter 第 3 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageFilter0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_02, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(IMAGEFILTER_SCENE_02);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_02);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(IMAGEFILTER_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0014
     * @tc.name      testNdkRenderSceneImageFilter0014
     * @tc.desc      校验 ImageFilter 第 3 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageFilter0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_02, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_02);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(IMAGEFILTER_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0015
     * @tc.name      testNdkRenderSceneImageFilter0015
     * @tc.desc      校验 ImageFilter 第 3 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_02, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0016
     * @tc.name      testNdkRenderSceneImageFilter0016
     * @tc.desc      校验 ImageFilter 第 3 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_02, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0017
     * @tc.name      testNdkRenderSceneImageFilter0017
     * @tc.desc      校验 ImageFilter 第 3 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_02, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0018
     * @tc.name      testNdkRenderSceneImageFilter0018
     * @tc.desc      校验 ImageFilter 第 3 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_02, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0019
     * @tc.name      testNdkRenderSceneImageFilter0019
     * @tc.desc      校验 ImageFilter 第 4 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageFilter0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_03, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(IMAGEFILTER_SCENE_03);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_03);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(IMAGEFILTER_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0020
     * @tc.name      testNdkRenderSceneImageFilter0020
     * @tc.desc      校验 ImageFilter 第 4 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageFilter0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_03, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_03);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(IMAGEFILTER_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0021
     * @tc.name      testNdkRenderSceneImageFilter0021
     * @tc.desc      校验 ImageFilter 第 4 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_03, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0022
     * @tc.name      testNdkRenderSceneImageFilter0022
     * @tc.desc      校验 ImageFilter 第 4 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_03, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0023
     * @tc.name      testNdkRenderSceneImageFilter0023
     * @tc.desc      校验 ImageFilter 第 4 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_03, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0024
     * @tc.name      testNdkRenderSceneImageFilter0024
     * @tc.desc      校验 ImageFilter 第 4 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_03, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0025
     * @tc.name      testNdkRenderSceneImageFilter0025
     * @tc.desc      校验 ImageFilter 第 5 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageFilter0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_04, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(IMAGEFILTER_SCENE_04);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_04);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(IMAGEFILTER_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0026
     * @tc.name      testNdkRenderSceneImageFilter0026
     * @tc.desc      校验 ImageFilter 第 5 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageFilter0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_04, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_04);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(IMAGEFILTER_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0027
     * @tc.name      testNdkRenderSceneImageFilter0027
     * @tc.desc      校验 ImageFilter 第 5 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_04, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0028
     * @tc.name      testNdkRenderSceneImageFilter0028
     * @tc.desc      校验 ImageFilter 第 5 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_04, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0029
     * @tc.name      testNdkRenderSceneImageFilter0029
     * @tc.desc      校验 ImageFilter 第 5 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_04, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0030
     * @tc.name      testNdkRenderSceneImageFilter0030
     * @tc.desc      校验 ImageFilter 第 5 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_04, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0031
     * @tc.name      testNdkRenderSceneImageFilter0031
     * @tc.desc      校验 ImageFilter 第 6 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageFilter0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_05, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(IMAGEFILTER_SCENE_05);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_05);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(IMAGEFILTER_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0032
     * @tc.name      testNdkRenderSceneImageFilter0032
     * @tc.desc      校验 ImageFilter 第 6 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageFilter0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_05, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_05);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(IMAGEFILTER_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0033
     * @tc.name      testNdkRenderSceneImageFilter0033
     * @tc.desc      校验 ImageFilter 第 6 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_05, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0034
     * @tc.name      testNdkRenderSceneImageFilter0034
     * @tc.desc      校验 ImageFilter 第 6 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_05, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0035
     * @tc.name      testNdkRenderSceneImageFilter0035
     * @tc.desc      校验 ImageFilter 第 6 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_05, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0036
     * @tc.name      testNdkRenderSceneImageFilter0036
     * @tc.desc      校验 ImageFilter 第 6 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_05, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0037
     * @tc.name      testNdkRenderSceneImageFilter0037
     * @tc.desc      校验 ImageFilter 第 7 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageFilter0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_06, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(IMAGEFILTER_SCENE_06);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_06);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(IMAGEFILTER_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0038
     * @tc.name      testNdkRenderSceneImageFilter0038
     * @tc.desc      校验 ImageFilter 第 7 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageFilter0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_06, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_06);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(IMAGEFILTER_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0039
     * @tc.name      testNdkRenderSceneImageFilter0039
     * @tc.desc      校验 ImageFilter 第 7 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_06, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0040
     * @tc.name      testNdkRenderSceneImageFilter0040
     * @tc.desc      校验 ImageFilter 第 7 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_06, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0041
     * @tc.name      testNdkRenderSceneImageFilter0041
     * @tc.desc      校验 ImageFilter 第 7 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_06, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0042
     * @tc.name      testNdkRenderSceneImageFilter0042
     * @tc.desc      校验 ImageFilter 第 7 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_06, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0043
     * @tc.name      testNdkRenderSceneImageFilter0043
     * @tc.desc      校验 ImageFilter 第 8 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageFilter0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_07, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(IMAGEFILTER_SCENE_07);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_07);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(IMAGEFILTER_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0044
     * @tc.name      testNdkRenderSceneImageFilter0044
     * @tc.desc      校验 ImageFilter 第 8 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageFilter0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_07, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_07);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(IMAGEFILTER_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0045
     * @tc.name      testNdkRenderSceneImageFilter0045
     * @tc.desc      校验 ImageFilter 第 8 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_07, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0046
     * @tc.name      testNdkRenderSceneImageFilter0046
     * @tc.desc      校验 ImageFilter 第 8 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_07, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0047
     * @tc.name      testNdkRenderSceneImageFilter0047
     * @tc.desc      校验 ImageFilter 第 8 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_07, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0048
     * @tc.name      testNdkRenderSceneImageFilter0048
     * @tc.desc      校验 ImageFilter 第 8 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_07, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0049
     * @tc.name      testNdkRenderSceneImageFilter0049
     * @tc.desc      校验 ImageFilter 第 9 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageFilter0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_08, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(IMAGEFILTER_SCENE_08);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_08);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(IMAGEFILTER_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0050
     * @tc.name      testNdkRenderSceneImageFilter0050
     * @tc.desc      校验 ImageFilter 第 9 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageFilter0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_08, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_08);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(IMAGEFILTER_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0051
     * @tc.name      testNdkRenderSceneImageFilter0051
     * @tc.desc      校验 ImageFilter 第 9 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_08, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0052
     * @tc.name      testNdkRenderSceneImageFilter0052
     * @tc.desc      校验 ImageFilter 第 9 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_08, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0053
     * @tc.name      testNdkRenderSceneImageFilter0053
     * @tc.desc      校验 ImageFilter 第 9 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_08, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0054
     * @tc.name      testNdkRenderSceneImageFilter0054
     * @tc.desc      校验 ImageFilter 第 9 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_08, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0055
     * @tc.name      testNdkRenderSceneImageFilter0055
     * @tc.desc      校验 ImageFilter 第 10 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageFilter0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_09, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(IMAGEFILTER_SCENE_09);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_09);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(IMAGEFILTER_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0056
     * @tc.name      testNdkRenderSceneImageFilter0056
     * @tc.desc      校验 ImageFilter 第 10 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneImageFilter0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_09, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_09);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(IMAGEFILTER_PARAMS_09);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0057
     * @tc.name      testNdkRenderSceneImageFilter0057
     * @tc.desc      校验 ImageFilter 第 10 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_09, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_09);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0058
     * @tc.name      testNdkRenderSceneImageFilter0058
     * @tc.desc      校验 ImageFilter 第 10 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_09, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_09);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0059
     * @tc.name      testNdkRenderSceneImageFilter0059
     * @tc.desc      校验 ImageFilter 第 10 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_09, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_09);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_IMAGEFILTER_0060
     * @tc.name      testNdkRenderSceneImageFilter0060
     * @tc.desc      校验 ImageFilter 第 10 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneImageFilter0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(IMAGEFILTER_BUCKET, IMAGEFILTER_SCENE_09, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(IMAGEFILTER_PARAMS_09);
    })

  })
}
