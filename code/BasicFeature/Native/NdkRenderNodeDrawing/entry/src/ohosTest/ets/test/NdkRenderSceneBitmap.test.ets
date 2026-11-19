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

// 场景轴 Bitmap 桶：覆盖第 8 个分组的 10 个场景，每个场景六个维度各一条用例。
const BITMAP_BUCKET: number = 8;
const BITMAP_SCENE_TOTAL: number = 10;
const BITMAP_SCENE_00: number = 0;
const BITMAP_SCENE_01: number = 1;
const BITMAP_SCENE_02: number = 2;
const BITMAP_SCENE_03: number = 3;
const BITMAP_SCENE_04: number = 4;
const BITMAP_SCENE_05: number = 5;
const BITMAP_SCENE_06: number = 6;
const BITMAP_SCENE_07: number = 7;
const BITMAP_SCENE_08: number = 8;
const BITMAP_SCENE_09: number = 9;
const BITMAP_PARAMS_00: number = 2;
const BITMAP_PARAMS_01: number = 2;
const BITMAP_PARAMS_02: number = 2;
const BITMAP_PARAMS_03: number = 1;
const BITMAP_PARAMS_04: number = 2;
const BITMAP_PARAMS_05: number = 3;
const BITMAP_PARAMS_06: number = 2;
const BITMAP_PARAMS_07: number = 1;
const BITMAP_PARAMS_08: number = 2;
const BITMAP_PARAMS_09: number = 2;

export default function ndkRenderSceneBitmapTest(): void {
  describe('NdkRenderSceneBitmap', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0001
     * @tc.name      testNdkRenderSceneBitmap0001
     * @tc.desc      校验 Bitmap 第 1 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneBitmap0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_00, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(BITMAP_SCENE_00);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_00);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(BITMAP_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0002
     * @tc.name      testNdkRenderSceneBitmap0002
     * @tc.desc      校验 Bitmap 第 1 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneBitmap0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_00, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_00);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(BITMAP_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0003
     * @tc.name      testNdkRenderSceneBitmap0003
     * @tc.desc      校验 Bitmap 第 1 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_00, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0004
     * @tc.name      testNdkRenderSceneBitmap0004
     * @tc.desc      校验 Bitmap 第 1 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_00, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0005
     * @tc.name      testNdkRenderSceneBitmap0005
     * @tc.desc      校验 Bitmap 第 1 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_00, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0006
     * @tc.name      testNdkRenderSceneBitmap0006
     * @tc.desc      校验 Bitmap 第 1 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_00, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_00);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0007
     * @tc.name      testNdkRenderSceneBitmap0007
     * @tc.desc      校验 Bitmap 第 2 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneBitmap0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_01, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(BITMAP_SCENE_01);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_01);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(BITMAP_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0008
     * @tc.name      testNdkRenderSceneBitmap0008
     * @tc.desc      校验 Bitmap 第 2 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneBitmap0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_01, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_01);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(BITMAP_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0009
     * @tc.name      testNdkRenderSceneBitmap0009
     * @tc.desc      校验 Bitmap 第 2 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_01, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0010
     * @tc.name      testNdkRenderSceneBitmap0010
     * @tc.desc      校验 Bitmap 第 2 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_01, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0011
     * @tc.name      testNdkRenderSceneBitmap0011
     * @tc.desc      校验 Bitmap 第 2 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_01, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0012
     * @tc.name      testNdkRenderSceneBitmap0012
     * @tc.desc      校验 Bitmap 第 2 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_01, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_01);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0013
     * @tc.name      testNdkRenderSceneBitmap0013
     * @tc.desc      校验 Bitmap 第 3 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneBitmap0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_02, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(BITMAP_SCENE_02);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_02);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(BITMAP_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0014
     * @tc.name      testNdkRenderSceneBitmap0014
     * @tc.desc      校验 Bitmap 第 3 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneBitmap0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_02, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_02);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(BITMAP_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0015
     * @tc.name      testNdkRenderSceneBitmap0015
     * @tc.desc      校验 Bitmap 第 3 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_02, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0016
     * @tc.name      testNdkRenderSceneBitmap0016
     * @tc.desc      校验 Bitmap 第 3 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_02, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0017
     * @tc.name      testNdkRenderSceneBitmap0017
     * @tc.desc      校验 Bitmap 第 3 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_02, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0018
     * @tc.name      testNdkRenderSceneBitmap0018
     * @tc.desc      校验 Bitmap 第 3 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_02, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_02);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0019
     * @tc.name      testNdkRenderSceneBitmap0019
     * @tc.desc      校验 Bitmap 第 4 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneBitmap0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_03, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(BITMAP_SCENE_03);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_03);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(BITMAP_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0020
     * @tc.name      testNdkRenderSceneBitmap0020
     * @tc.desc      校验 Bitmap 第 4 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneBitmap0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_03, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_03);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(BITMAP_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0021
     * @tc.name      testNdkRenderSceneBitmap0021
     * @tc.desc      校验 Bitmap 第 4 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_03, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0022
     * @tc.name      testNdkRenderSceneBitmap0022
     * @tc.desc      校验 Bitmap 第 4 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_03, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0023
     * @tc.name      testNdkRenderSceneBitmap0023
     * @tc.desc      校验 Bitmap 第 4 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_03, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0024
     * @tc.name      testNdkRenderSceneBitmap0024
     * @tc.desc      校验 Bitmap 第 4 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_03, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_03);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0025
     * @tc.name      testNdkRenderSceneBitmap0025
     * @tc.desc      校验 Bitmap 第 5 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneBitmap0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_04, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(BITMAP_SCENE_04);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_04);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(BITMAP_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0026
     * @tc.name      testNdkRenderSceneBitmap0026
     * @tc.desc      校验 Bitmap 第 5 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneBitmap0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_04, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_04);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(BITMAP_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0027
     * @tc.name      testNdkRenderSceneBitmap0027
     * @tc.desc      校验 Bitmap 第 5 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_04, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0028
     * @tc.name      testNdkRenderSceneBitmap0028
     * @tc.desc      校验 Bitmap 第 5 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_04, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0029
     * @tc.name      testNdkRenderSceneBitmap0029
     * @tc.desc      校验 Bitmap 第 5 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_04, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0030
     * @tc.name      testNdkRenderSceneBitmap0030
     * @tc.desc      校验 Bitmap 第 5 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_04, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_04);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0031
     * @tc.name      testNdkRenderSceneBitmap0031
     * @tc.desc      校验 Bitmap 第 6 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneBitmap0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_05, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(BITMAP_SCENE_05);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_05);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(BITMAP_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0032
     * @tc.name      testNdkRenderSceneBitmap0032
     * @tc.desc      校验 Bitmap 第 6 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneBitmap0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_05, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_05);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(BITMAP_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0033
     * @tc.name      testNdkRenderSceneBitmap0033
     * @tc.desc      校验 Bitmap 第 6 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_05, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0034
     * @tc.name      testNdkRenderSceneBitmap0034
     * @tc.desc      校验 Bitmap 第 6 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_05, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0035
     * @tc.name      testNdkRenderSceneBitmap0035
     * @tc.desc      校验 Bitmap 第 6 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_05, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0036
     * @tc.name      testNdkRenderSceneBitmap0036
     * @tc.desc      校验 Bitmap 第 6 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_05, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_05);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0037
     * @tc.name      testNdkRenderSceneBitmap0037
     * @tc.desc      校验 Bitmap 第 7 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneBitmap0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_06, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(BITMAP_SCENE_06);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_06);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(BITMAP_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0038
     * @tc.name      testNdkRenderSceneBitmap0038
     * @tc.desc      校验 Bitmap 第 7 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneBitmap0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_06, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_06);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(BITMAP_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0039
     * @tc.name      testNdkRenderSceneBitmap0039
     * @tc.desc      校验 Bitmap 第 7 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_06, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0040
     * @tc.name      testNdkRenderSceneBitmap0040
     * @tc.desc      校验 Bitmap 第 7 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_06, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0041
     * @tc.name      testNdkRenderSceneBitmap0041
     * @tc.desc      校验 Bitmap 第 7 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_06, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0042
     * @tc.name      testNdkRenderSceneBitmap0042
     * @tc.desc      校验 Bitmap 第 7 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_06, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_06);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0043
     * @tc.name      testNdkRenderSceneBitmap0043
     * @tc.desc      校验 Bitmap 第 8 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneBitmap0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_07, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(BITMAP_SCENE_07);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_07);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(BITMAP_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0044
     * @tc.name      testNdkRenderSceneBitmap0044
     * @tc.desc      校验 Bitmap 第 8 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneBitmap0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_07, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_07);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(BITMAP_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0045
     * @tc.name      testNdkRenderSceneBitmap0045
     * @tc.desc      校验 Bitmap 第 8 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_07, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0046
     * @tc.name      testNdkRenderSceneBitmap0046
     * @tc.desc      校验 Bitmap 第 8 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_07, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0047
     * @tc.name      testNdkRenderSceneBitmap0047
     * @tc.desc      校验 Bitmap 第 8 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_07, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0048
     * @tc.name      testNdkRenderSceneBitmap0048
     * @tc.desc      校验 Bitmap 第 8 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_07, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_07);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0049
     * @tc.name      testNdkRenderSceneBitmap0049
     * @tc.desc      校验 Bitmap 第 9 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneBitmap0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_08, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(BITMAP_SCENE_08);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_08);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(BITMAP_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0050
     * @tc.name      testNdkRenderSceneBitmap0050
     * @tc.desc      校验 Bitmap 第 9 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneBitmap0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_08, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_08);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(BITMAP_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0051
     * @tc.name      testNdkRenderSceneBitmap0051
     * @tc.desc      校验 Bitmap 第 9 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_08, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0052
     * @tc.name      testNdkRenderSceneBitmap0052
     * @tc.desc      校验 Bitmap 第 9 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_08, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0053
     * @tc.name      testNdkRenderSceneBitmap0053
     * @tc.desc      校验 Bitmap 第 9 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_08, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0054
     * @tc.name      testNdkRenderSceneBitmap0054
     * @tc.desc      校验 Bitmap 第 9 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_08, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_08);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0055
     * @tc.name      testNdkRenderSceneBitmap0055
     * @tc.desc      校验 Bitmap 第 10 个场景在合法取值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneBitmap0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_09, DIM_LEGAL);
      expect(observed.found).assertTrue();
      expect(observed.sceneId).assertEqual(BITMAP_SCENE_09);
      expect(observed.idMatchesIndex).assertTrue();
      expect(observed.titleIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_09);
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.sceneTotal).assertEqual(BITMAP_SCENE_TOTAL);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0056
     * @tc.name      testNdkRenderSceneBitmap0056
     * @tc.desc      校验 Bitmap 第 10 个场景在区间边界维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderSceneBitmap0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_09, DIM_BOUND);
      expect(observed.found).assertTrue();
      expect(observed.boundsHold).assertTrue();
      expect(observed.defaultInRange).assertTrue();
      expect(observed.defaultLengthOk).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_09);
      expect(observed.rangeCount + observed.toggleCount + observed.selectCount).assertEqual(BITMAP_PARAMS_09);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0057
     * @tc.name      testNdkRenderSceneBitmap0057
     * @tc.desc      校验 Bitmap 第 10 个场景在非法输入维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_09, DIM_INVALID);
      expect(observed.found).assertTrue();
      expect(observed.wildcardLengthOk).assertTrue();
      expect(observed.nanDefaulted).assertTrue();
      expect(observed.keyNonEmpty).assertTrue();
      expect(observed.descIsResource).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_09);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0058
     * @tc.name      testNdkRenderSceneBitmap0058
     * @tc.desc      校验 Bitmap 第 10 个场景在数值极值维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_09, DIM_EXTREME);
      expect(observed.found).assertTrue();
      expect(observed.idempotentExtreme).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.summaryStable).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_09);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0059
     * @tc.name      testNdkRenderSceneBitmap0059
     * @tc.desc      校验 Bitmap 第 10 个场景在多参数组合维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_09, DIM_COMBO);
      expect(observed.found).assertTrue();
      expect(observed.comboOrderOk).assertTrue();
      expect(observed.summaryHasAllKeys).assertTrue();
      expect(observed.allInRange).assertTrue();
      expect(observed.keyUnique).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_09);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_SCENE_BITMAP_0060
     * @tc.name      testNdkRenderSceneBitmap0060
     * @tc.desc      校验 Bitmap 第 10 个场景在重复操作状态维度上的场景声明与参数引擎行为。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderSceneBitmap0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const observed: SceneProbeObs = probeScene(BITMAP_BUCKET, BITMAP_SCENE_09, DIM_STATE);
      expect(observed.found).assertTrue();
      expect(observed.specStable).assertTrue();
      expect(observed.repeatStable).assertTrue();
      expect(observed.inputUntouched).assertTrue();
      expect(observed.describeNonEmpty).assertTrue();
      expect(observed.paramCount).assertEqual(BITMAP_PARAMS_09);
    })

  })
}
