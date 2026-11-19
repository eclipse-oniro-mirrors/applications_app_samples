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
import { ParamEngine } from '../../../main/ets/core/ParamEngine';
import { SceneSpec } from '../../../main/ets/core/SchemaTypes';
import { CAPABILITY_GROUPS } from './SceneDefaults';
import { PROBE_MIN, defaultsText, verifyScene } from './MatrixSupport';

// 本桶承接能力域 11~19（image_io..error，共 88 个场景）的逐场景契约用例。
// 与 NdkRenderNodeMatrix.test.ets 合计 188 条，编号前缀独立以便 scripts/verify-matrix.js 分别计数。

// ---- 冻结基线：场景参数个数、默认值数组与第一个参数下界（取自 schema 声明，改动即视为契约变化）----
const MX_IMAGEIO_0_COUNT: number = 2;
const MX_IMAGEIO_0_DEFAULTS: string = '1,50';
const MX_IMAGEIO_0_LOW0: number = 0;
const MX_IMAGEIO_1_COUNT: number = 1;
const MX_IMAGEIO_1_DEFAULTS: string = '2';
const MX_IMAGEIO_1_LOW0: number = 0;
const MX_IMAGEIO_2_COUNT: number = 2;
const MX_IMAGEIO_2_DEFAULTS: string = '3,50';
const MX_IMAGEIO_2_LOW0: number = 0;
const MX_IMAGEIO_3_COUNT: number = 1;
const MX_IMAGEIO_3_DEFAULTS: string = '4';
const MX_IMAGEIO_3_LOW0: number = 0;
const MX_IMAGEIO_4_COUNT: number = 2;
const MX_IMAGEIO_4_DEFAULTS: string = '5,50';
const MX_IMAGEIO_4_LOW0: number = 0;
const MX_IMAGEIO_5_COUNT: number = 2;
const MX_IMAGEIO_5_DEFAULTS: string = '5,50';
const MX_IMAGEIO_5_LOW0: number = 0;
const MX_IMAGEIO_6_COUNT: number = 2;
const MX_IMAGEIO_6_DEFAULTS: string = '1,50';
const MX_IMAGEIO_6_LOW0: number = 0;
const MX_IMAGEIO_7_COUNT: number = 2;
const MX_IMAGEIO_7_DEFAULTS: string = '2,6';
const MX_IMAGEIO_7_LOW0: number = 0;
const MX_IMAGEIO_8_COUNT: number = 1;
const MX_IMAGEIO_8_DEFAULTS: string = '3';
const MX_IMAGEIO_8_LOW0: number = 0;
const MX_IMAGEIO_9_COUNT: number = 1;
const MX_IMAGEIO_9_DEFAULTS: string = '5';
const MX_IMAGEIO_9_LOW0: number = 0;
const MX_FONT_0_COUNT: number = 2;
const MX_FONT_0_DEFAULTS: string = '1,18';
const MX_FONT_0_LOW0: number = 0;
const MX_FONT_1_COUNT: number = 3;
const MX_FONT_1_DEFAULTS: string = '2,14,10';
const MX_FONT_1_LOW0: number = 0;
const MX_FONT_2_COUNT: number = 2;
const MX_FONT_2_DEFAULTS: string = '3,14';
const MX_FONT_2_LOW0: number = 0;
const MX_FONT_3_COUNT: number = 2;
const MX_FONT_3_DEFAULTS: string = '4,18';
const MX_FONT_3_LOW0: number = 0;
const MX_FONT_4_COUNT: number = 2;
const MX_FONT_4_DEFAULTS: string = '1,0.25';
const MX_FONT_4_LOW0: number = 0;
const MX_FONT_5_COUNT: number = 2;
const MX_FONT_5_DEFAULTS: string = '2,1';
const MX_FONT_5_LOW0: number = 0;
const MX_FONT_6_COUNT: number = 2;
const MX_FONT_6_DEFAULTS: string = '3,1.5';
const MX_FONT_6_LOW0: number = 0;
const MX_FONT_7_COUNT: number = 2;
const MX_FONT_7_DEFAULTS: string = '4,2';
const MX_FONT_7_LOW0: number = 0;
const MX_FONT_8_COUNT: number = 2;
const MX_FONT_8_DEFAULTS: string = '5,1';
const MX_FONT_8_LOW0: number = 0;
const MX_FONT_9_COUNT: number = 2;
const MX_FONT_9_DEFAULTS: string = '1,20';
const MX_FONT_9_LOW0: number = 0;
const MX_FONT_10_COUNT: number = 1;
const MX_FONT_10_DEFAULTS: string = '2';
const MX_FONT_10_LOW0: number = 0;
const MX_FONT_11_COUNT: number = 1;
const MX_FONT_11_DEFAULTS: string = '3';
const MX_FONT_11_LOW0: number = 0;
const MX_TEXTBLOB_0_COUNT: number = 2;
const MX_TEXTBLOB_0_DEFAULTS: string = '1,16';
const MX_TEXTBLOB_0_LOW0: number = 0;
const MX_TEXTBLOB_1_COUNT: number = 2;
const MX_TEXTBLOB_1_DEFAULTS: string = '2,100';
const MX_TEXTBLOB_1_LOW0: number = 0;
const MX_TEXTBLOB_2_COUNT: number = 2;
const MX_TEXTBLOB_2_DEFAULTS: string = '3,12';
const MX_TEXTBLOB_2_LOW0: number = 0;
const MX_TEXTBLOB_3_COUNT: number = 2;
const MX_TEXTBLOB_3_DEFAULTS: string = '4,1';
const MX_TEXTBLOB_3_LOW0: number = 0;
const MX_TEXTBLOB_4_COUNT: number = 2;
const MX_TEXTBLOB_4_DEFAULTS: string = '5,16';
const MX_TEXTBLOB_4_LOW0: number = 0;
const MX_TEXTBLOB_5_COUNT: number = 1;
const MX_TEXTBLOB_5_DEFAULTS: string = '1';
const MX_TEXTBLOB_5_LOW0: number = 0;
const MX_TEXTBLOB_6_COUNT: number = 2;
const MX_TEXTBLOB_6_DEFAULTS: string = '2,26';
const MX_TEXTBLOB_6_LOW0: number = 0;
const MX_TEXTBLOB_7_COUNT: number = 2;
const MX_TEXTBLOB_7_DEFAULTS: string = '3,1.5';
const MX_TEXTBLOB_7_LOW0: number = 0;
const MX_TYPOGRAPHY_0_COUNT: number = 2;
const MX_TYPOGRAPHY_0_DEFAULTS: string = '1,16';
const MX_TYPOGRAPHY_0_LOW0: number = 0;
const MX_TYPOGRAPHY_1_COUNT: number = 2;
const MX_TYPOGRAPHY_1_DEFAULTS: string = '2,2';
const MX_TYPOGRAPHY_1_LOW0: number = 0;
const MX_TYPOGRAPHY_2_COUNT: number = 2;
const MX_TYPOGRAPHY_2_DEFAULTS: string = '3,2';
const MX_TYPOGRAPHY_2_LOW0: number = 0;
const MX_TYPOGRAPHY_3_COUNT: number = 3;
const MX_TYPOGRAPHY_3_DEFAULTS: string = '4,2,1';
const MX_TYPOGRAPHY_3_LOW0: number = 0;
const MX_TYPOGRAPHY_4_COUNT: number = 3;
const MX_TYPOGRAPHY_4_DEFAULTS: string = '5,2,4';
const MX_TYPOGRAPHY_4_LOW0: number = 0;
const MX_TYPOGRAPHY_5_COUNT: number = 3;
const MX_TYPOGRAPHY_5_DEFAULTS: string = '1,1,0';
const MX_TYPOGRAPHY_5_LOW0: number = 0;
const MX_TYPOGRAPHY_6_COUNT: number = 3;
const MX_TYPOGRAPHY_6_DEFAULTS: string = '2,6,6';
const MX_TYPOGRAPHY_6_LOW0: number = 0;
const MX_TYPOGRAPHY_7_COUNT: number = 2;
const MX_TYPOGRAPHY_7_DEFAULTS: string = '3,30';
const MX_TYPOGRAPHY_7_LOW0: number = 0;
const MX_TYPOGRAPHY_8_COUNT: number = 2;
const MX_TYPOGRAPHY_8_DEFAULTS: string = '4,8';
const MX_TYPOGRAPHY_8_LOW0: number = 0;
const MX_TYPOGRAPHY_9_COUNT: number = 1;
const MX_TYPOGRAPHY_9_DEFAULTS: string = '5';
const MX_TYPOGRAPHY_9_LOW0: number = 0;
const MX_TYPOGRAPHY_10_COUNT: number = 2;
const MX_TYPOGRAPHY_10_DEFAULTS: string = '1,1';
const MX_TYPOGRAPHY_10_LOW0: number = 0;
const MX_TYPOGRAPHY_11_COUNT: number = 2;
const MX_TYPOGRAPHY_11_DEFAULTS: string = '2,2';
const MX_TYPOGRAPHY_11_LOW0: number = 0;
const MX_TYPOGRAPHY_12_COUNT: number = 2;
const MX_TYPOGRAPHY_12_DEFAULTS: string = '3,0';
const MX_TYPOGRAPHY_12_LOW0: number = 0;
const MX_TYPOGRAPHY_13_COUNT: number = 1;
const MX_TYPOGRAPHY_13_DEFAULTS: string = '4';
const MX_TYPOGRAPHY_13_LOW0: number = 0;
const MX_SHADOW_0_COUNT: number = 2;
const MX_SHADOW_0_DEFAULTS: string = '1,6';
const MX_SHADOW_0_LOW0: number = 0;
const MX_SHADOW_1_COUNT: number = 3;
const MX_SHADOW_1_DEFAULTS: string = '2,8,8';
const MX_SHADOW_1_LOW0: number = 0;
const MX_SHADOW_2_COUNT: number = 3;
const MX_SHADOW_2_DEFAULTS: string = '3,5,0.6';
const MX_SHADOW_2_LOW0: number = 0;
const MX_SHADOW_3_COUNT: number = 3;
const MX_SHADOW_3_DEFAULTS: string = '4,5,2';
const MX_SHADOW_3_LOW0: number = 0;
const MX_SHADOW_4_COUNT: number = 2;
const MX_SHADOW_4_DEFAULTS: string = '5,8';
const MX_SHADOW_4_LOW0: number = 0;
const MX_SHADOW_5_COUNT: number = 2;
const MX_SHADOW_5_DEFAULTS: string = '1,14';
const MX_SHADOW_5_LOW0: number = 0;
const MX_SHADOW_6_COUNT: number = 2;
const MX_SHADOW_6_DEFAULTS: string = '2,6';
const MX_SHADOW_6_LOW0: number = 0;
const MX_SHADOW_7_COUNT: number = 2;
const MX_SHADOW_7_DEFAULTS: string = '4,8';
const MX_SHADOW_7_LOW0: number = 0;
const MX_MATRIX_0_COUNT: number = 1;
const MX_MATRIX_0_DEFAULTS: string = '1';
const MX_MATRIX_0_LOW0: number = 0;
const MX_MATRIX_1_COUNT: number = 3;
const MX_MATRIX_1_DEFAULTS: string = '2,10,8';
const MX_MATRIX_1_LOW0: number = 0;
const MX_MATRIX_2_COUNT: number = 4;
const MX_MATRIX_2_DEFAULTS: string = '3,1.5,50,50';
const MX_MATRIX_2_LOW0: number = 0;
const MX_MATRIX_3_COUNT: number = 2;
const MX_MATRIX_3_DEFAULTS: string = '4,30';
const MX_MATRIX_3_LOW0: number = 0;
const MX_MATRIX_4_COUNT: number = 3;
const MX_MATRIX_4_DEFAULTS: string = '5,20,0';
const MX_MATRIX_4_LOW0: number = 0;
const MX_MATRIX_5_COUNT: number = 3;
const MX_MATRIX_5_DEFAULTS: string = '1,30,10';
const MX_MATRIX_5_LOW0: number = 0;
const MX_MATRIX_6_COUNT: number = 4;
const MX_MATRIX_6_DEFAULTS: string = '2,0,12,1.4';
const MX_MATRIX_6_LOW0: number = 0;
const MX_MATRIX_7_COUNT: number = 2;
const MX_MATRIX_7_DEFAULTS: string = '3,25';
const MX_MATRIX_7_LOW0: number = 0;
const MX_MATRIX_8_COUNT: number = 3;
const MX_MATRIX_8_DEFAULTS: string = '4,20,1.2';
const MX_MATRIX_8_LOW0: number = 0;
const MX_MATRIX_9_COUNT: number = 2;
const MX_MATRIX_9_DEFAULTS: string = '5,8';
const MX_MATRIX_9_LOW0: number = 0;
const MX_RECORD_0_COUNT: number = 1;
const MX_RECORD_0_DEFAULTS: string = '1';
const MX_RECORD_0_LOW0: number = 0;
const MX_RECORD_1_COUNT: number = 2;
const MX_RECORD_1_DEFAULTS: string = '2,12';
const MX_RECORD_1_LOW0: number = 0;
const MX_RECORD_2_COUNT: number = 2;
const MX_RECORD_2_DEFAULTS: string = '3,6';
const MX_RECORD_2_LOW0: number = 0;
const MX_RECORD_3_COUNT: number = 1;
const MX_RECORD_3_DEFAULTS: string = '4';
const MX_RECORD_3_LOW0: number = 0;
const MX_RECORD_4_COUNT: number = 2;
const MX_RECORD_4_DEFAULTS: string = '5,2';
const MX_RECORD_4_LOW0: number = 0;
const MX_RECORD_5_COUNT: number = 2;
const MX_RECORD_5_DEFAULTS: string = '1,0.5';
const MX_RECORD_5_LOW0: number = 0;
const MX_RECORD_6_COUNT: number = 2;
const MX_RECORD_6_DEFAULTS: string = '2,8';
const MX_RECORD_6_LOW0: number = 0;
const MX_RECORD_7_COUNT: number = 2;
const MX_RECORD_7_DEFAULTS: string = '3,4';
const MX_RECORD_7_LOW0: number = 0;
const MX_OFFSCREEN_0_COUNT: number = 1;
const MX_OFFSCREEN_0_DEFAULTS: string = '1';
const MX_OFFSCREEN_0_LOW0: number = 0;
const MX_OFFSCREEN_1_COUNT: number = 2;
const MX_OFFSCREEN_1_DEFAULTS: string = '2,0.6';
const MX_OFFSCREEN_1_LOW0: number = 0;
const MX_OFFSCREEN_2_COUNT: number = 2;
const MX_OFFSCREEN_2_DEFAULTS: string = '3,50';
const MX_OFFSCREEN_2_LOW0: number = 0;
const MX_OFFSCREEN_3_COUNT: number = 2;
const MX_OFFSCREEN_3_DEFAULTS: string = '4,3';
const MX_OFFSCREEN_3_LOW0: number = 0;
const MX_OFFSCREEN_4_COUNT: number = 2;
const MX_OFFSCREEN_4_DEFAULTS: string = '5,0.6';
const MX_OFFSCREEN_4_LOW0: number = 0;
const MX_OFFSCREEN_5_COUNT: number = 2;
const MX_OFFSCREEN_5_DEFAULTS: string = '1,0.5';
const MX_OFFSCREEN_5_LOW0: number = 0;
const MX_OFFSCREEN_6_COUNT: number = 2;
const MX_OFFSCREEN_6_DEFAULTS: string = '2,0.5';
const MX_OFFSCREEN_6_LOW0: number = 0;
const MX_OFFSCREEN_7_COUNT: number = 2;
const MX_OFFSCREEN_7_DEFAULTS: string = '4,0.8';
const MX_OFFSCREEN_7_LOW0: number = 0;
const MX_ERROR_0_COUNT: number = 1;
const MX_ERROR_0_DEFAULTS: string = '1';
const MX_ERROR_0_LOW0: number = 0;
const MX_ERROR_1_COUNT: number = 1;
const MX_ERROR_1_DEFAULTS: string = '2';
const MX_ERROR_1_LOW0: number = 0;
const MX_ERROR_2_COUNT: number = 1;
const MX_ERROR_2_DEFAULTS: string = '3';
const MX_ERROR_2_LOW0: number = 0;
const MX_ERROR_3_COUNT: number = 2;
const MX_ERROR_3_DEFAULTS: string = '4,20';
const MX_ERROR_3_LOW0: number = 0;
const MX_ERROR_4_COUNT: number = 1;
const MX_ERROR_4_DEFAULTS: string = '5';
const MX_ERROR_4_LOW0: number = 0;
const MX_ERROR_5_COUNT: number = 1;
const MX_ERROR_5_DEFAULTS: string = '1';
const MX_ERROR_5_LOW0: number = 0;
const MX_ERROR_6_COUNT: number = 1;
const MX_ERROR_6_DEFAULTS: string = '2';
const MX_ERROR_6_LOW0: number = 0;
const MX_ERROR_7_COUNT: number = 2;
const MX_ERROR_7_DEFAULTS: string = '3,0.6';
const MX_ERROR_7_LOW0: number = 0;
const MX_ERROR_8_COUNT: number = 2;
const MX_ERROR_8_DEFAULTS: string = '4,25';
const MX_ERROR_8_LOW0: number = 0;
const MX_ERROR_9_COUNT: number = 1;
const MX_ERROR_9_DEFAULTS: string = '5';
const MX_ERROR_9_LOW0: number = 0;
export default function ndkRenderNodeMatrixTailTest(): void {
  describe('NdkRenderNodeMatrixTail', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0001
     * @tc.name      testNdkRenderNodeMatrixTail0001
     * @tc.desc      image_io 场景 0：2 个参数、默认值 1,50 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(10, 0);
      const target: SceneSpec = CAPABILITY_GROUPS[10].scenes[0];
      expect(target.params.length).assertEqual(MX_IMAGEIO_0_COUNT);
      expect(defaultsText(target)).assertEqual(MX_IMAGEIO_0_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_IMAGEIO_0_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0002
     * @tc.name      testNdkRenderNodeMatrixTail0002
     * @tc.desc      image_io 场景 1：1 个参数、默认值 2 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(10, 1);
      const target: SceneSpec = CAPABILITY_GROUPS[10].scenes[1];
      expect(target.params.length).assertEqual(MX_IMAGEIO_1_COUNT);
      expect(defaultsText(target)).assertEqual(MX_IMAGEIO_1_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_IMAGEIO_1_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0003
     * @tc.name      testNdkRenderNodeMatrixTail0003
     * @tc.desc      image_io 场景 2：2 个参数、默认值 3,50 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(10, 2);
      const target: SceneSpec = CAPABILITY_GROUPS[10].scenes[2];
      expect(target.params.length).assertEqual(MX_IMAGEIO_2_COUNT);
      expect(defaultsText(target)).assertEqual(MX_IMAGEIO_2_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_IMAGEIO_2_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0004
     * @tc.name      testNdkRenderNodeMatrixTail0004
     * @tc.desc      image_io 场景 3：1 个参数、默认值 4 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(10, 3);
      const target: SceneSpec = CAPABILITY_GROUPS[10].scenes[3];
      expect(target.params.length).assertEqual(MX_IMAGEIO_3_COUNT);
      expect(defaultsText(target)).assertEqual(MX_IMAGEIO_3_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_IMAGEIO_3_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0005
     * @tc.name      testNdkRenderNodeMatrixTail0005
     * @tc.desc      image_io 场景 4：2 个参数、默认值 5,50 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(10, 4);
      const target: SceneSpec = CAPABILITY_GROUPS[10].scenes[4];
      expect(target.params.length).assertEqual(MX_IMAGEIO_4_COUNT);
      expect(defaultsText(target)).assertEqual(MX_IMAGEIO_4_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_IMAGEIO_4_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0006
     * @tc.name      testNdkRenderNodeMatrixTail0006
     * @tc.desc      image_io 场景 5：2 个参数、默认值 5,50 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(10, 5);
      const target: SceneSpec = CAPABILITY_GROUPS[10].scenes[5];
      expect(target.params.length).assertEqual(MX_IMAGEIO_5_COUNT);
      expect(defaultsText(target)).assertEqual(MX_IMAGEIO_5_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_IMAGEIO_5_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0007
     * @tc.name      testNdkRenderNodeMatrixTail0007
     * @tc.desc      image_io 场景 6：2 个参数、默认值 1,50 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(10, 6);
      const target: SceneSpec = CAPABILITY_GROUPS[10].scenes[6];
      expect(target.params.length).assertEqual(MX_IMAGEIO_6_COUNT);
      expect(defaultsText(target)).assertEqual(MX_IMAGEIO_6_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_IMAGEIO_6_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0008
     * @tc.name      testNdkRenderNodeMatrixTail0008
     * @tc.desc      image_io 场景 7：2 个参数、默认值 2,6 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(10, 7);
      const target: SceneSpec = CAPABILITY_GROUPS[10].scenes[7];
      expect(target.params.length).assertEqual(MX_IMAGEIO_7_COUNT);
      expect(defaultsText(target)).assertEqual(MX_IMAGEIO_7_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_IMAGEIO_7_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0009
     * @tc.name      testNdkRenderNodeMatrixTail0009
     * @tc.desc      image_io 场景 8：1 个参数、默认值 3 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(10, 8);
      const target: SceneSpec = CAPABILITY_GROUPS[10].scenes[8];
      expect(target.params.length).assertEqual(MX_IMAGEIO_8_COUNT);
      expect(defaultsText(target)).assertEqual(MX_IMAGEIO_8_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_IMAGEIO_8_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0010
     * @tc.name      testNdkRenderNodeMatrixTail0010
     * @tc.desc      image_io 场景 9：1 个参数、默认值 5 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(10, 9);
      const target: SceneSpec = CAPABILITY_GROUPS[10].scenes[9];
      expect(target.params.length).assertEqual(MX_IMAGEIO_9_COUNT);
      expect(defaultsText(target)).assertEqual(MX_IMAGEIO_9_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_IMAGEIO_9_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0011
     * @tc.name      testNdkRenderNodeMatrixTail0011
     * @tc.desc      font 场景 0：2 个参数、默认值 1,18 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(11, 0);
      const target: SceneSpec = CAPABILITY_GROUPS[11].scenes[0];
      expect(target.params.length).assertEqual(MX_FONT_0_COUNT);
      expect(defaultsText(target)).assertEqual(MX_FONT_0_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_FONT_0_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0012
     * @tc.name      testNdkRenderNodeMatrixTail0012
     * @tc.desc      font 场景 1：3 个参数、默认值 2,14,10 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(11, 1);
      const target: SceneSpec = CAPABILITY_GROUPS[11].scenes[1];
      expect(target.params.length).assertEqual(MX_FONT_1_COUNT);
      expect(defaultsText(target)).assertEqual(MX_FONT_1_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_FONT_1_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0013
     * @tc.name      testNdkRenderNodeMatrixTail0013
     * @tc.desc      font 场景 2：2 个参数、默认值 3,14 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(11, 2);
      const target: SceneSpec = CAPABILITY_GROUPS[11].scenes[2];
      expect(target.params.length).assertEqual(MX_FONT_2_COUNT);
      expect(defaultsText(target)).assertEqual(MX_FONT_2_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_FONT_2_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0014
     * @tc.name      testNdkRenderNodeMatrixTail0014
     * @tc.desc      font 场景 3：2 个参数、默认值 4,18 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(11, 3);
      const target: SceneSpec = CAPABILITY_GROUPS[11].scenes[3];
      expect(target.params.length).assertEqual(MX_FONT_3_COUNT);
      expect(defaultsText(target)).assertEqual(MX_FONT_3_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_FONT_3_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0015
     * @tc.name      testNdkRenderNodeMatrixTail0015
     * @tc.desc      font 场景 4：2 个参数、默认值 1,0.25 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(11, 4);
      const target: SceneSpec = CAPABILITY_GROUPS[11].scenes[4];
      expect(target.params.length).assertEqual(MX_FONT_4_COUNT);
      expect(defaultsText(target)).assertEqual(MX_FONT_4_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_FONT_4_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0016
     * @tc.name      testNdkRenderNodeMatrixTail0016
     * @tc.desc      font 场景 5：2 个参数、默认值 2,1 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(11, 5);
      const target: SceneSpec = CAPABILITY_GROUPS[11].scenes[5];
      expect(target.params.length).assertEqual(MX_FONT_5_COUNT);
      expect(defaultsText(target)).assertEqual(MX_FONT_5_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_FONT_5_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0017
     * @tc.name      testNdkRenderNodeMatrixTail0017
     * @tc.desc      font 场景 6：2 个参数、默认值 3,1.5 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(11, 6);
      const target: SceneSpec = CAPABILITY_GROUPS[11].scenes[6];
      expect(target.params.length).assertEqual(MX_FONT_6_COUNT);
      expect(defaultsText(target)).assertEqual(MX_FONT_6_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_FONT_6_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0018
     * @tc.name      testNdkRenderNodeMatrixTail0018
     * @tc.desc      font 场景 7：2 个参数、默认值 4,2 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(11, 7);
      const target: SceneSpec = CAPABILITY_GROUPS[11].scenes[7];
      expect(target.params.length).assertEqual(MX_FONT_7_COUNT);
      expect(defaultsText(target)).assertEqual(MX_FONT_7_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_FONT_7_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0019
     * @tc.name      testNdkRenderNodeMatrixTail0019
     * @tc.desc      font 场景 8：2 个参数、默认值 5,1 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(11, 8);
      const target: SceneSpec = CAPABILITY_GROUPS[11].scenes[8];
      expect(target.params.length).assertEqual(MX_FONT_8_COUNT);
      expect(defaultsText(target)).assertEqual(MX_FONT_8_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_FONT_8_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0020
     * @tc.name      testNdkRenderNodeMatrixTail0020
     * @tc.desc      font 场景 9：2 个参数、默认值 1,20 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(11, 9);
      const target: SceneSpec = CAPABILITY_GROUPS[11].scenes[9];
      expect(target.params.length).assertEqual(MX_FONT_9_COUNT);
      expect(defaultsText(target)).assertEqual(MX_FONT_9_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_FONT_9_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0021
     * @tc.name      testNdkRenderNodeMatrixTail0021
     * @tc.desc      font 场景 10：1 个参数、默认值 2 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(11, 10);
      const target: SceneSpec = CAPABILITY_GROUPS[11].scenes[10];
      expect(target.params.length).assertEqual(MX_FONT_10_COUNT);
      expect(defaultsText(target)).assertEqual(MX_FONT_10_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_FONT_10_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0022
     * @tc.name      testNdkRenderNodeMatrixTail0022
     * @tc.desc      font 场景 11：1 个参数、默认值 3 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(11, 11);
      const target: SceneSpec = CAPABILITY_GROUPS[11].scenes[11];
      expect(target.params.length).assertEqual(MX_FONT_11_COUNT);
      expect(defaultsText(target)).assertEqual(MX_FONT_11_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_FONT_11_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0023
     * @tc.name      testNdkRenderNodeMatrixTail0023
     * @tc.desc      textblob 场景 0：2 个参数、默认值 1,16 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(12, 0);
      const target: SceneSpec = CAPABILITY_GROUPS[12].scenes[0];
      expect(target.params.length).assertEqual(MX_TEXTBLOB_0_COUNT);
      expect(defaultsText(target)).assertEqual(MX_TEXTBLOB_0_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_TEXTBLOB_0_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0024
     * @tc.name      testNdkRenderNodeMatrixTail0024
     * @tc.desc      textblob 场景 1：2 个参数、默认值 2,100 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(12, 1);
      const target: SceneSpec = CAPABILITY_GROUPS[12].scenes[1];
      expect(target.params.length).assertEqual(MX_TEXTBLOB_1_COUNT);
      expect(defaultsText(target)).assertEqual(MX_TEXTBLOB_1_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_TEXTBLOB_1_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0025
     * @tc.name      testNdkRenderNodeMatrixTail0025
     * @tc.desc      textblob 场景 2：2 个参数、默认值 3,12 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(12, 2);
      const target: SceneSpec = CAPABILITY_GROUPS[12].scenes[2];
      expect(target.params.length).assertEqual(MX_TEXTBLOB_2_COUNT);
      expect(defaultsText(target)).assertEqual(MX_TEXTBLOB_2_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_TEXTBLOB_2_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0026
     * @tc.name      testNdkRenderNodeMatrixTail0026
     * @tc.desc      textblob 场景 3：2 个参数、默认值 4,1 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(12, 3);
      const target: SceneSpec = CAPABILITY_GROUPS[12].scenes[3];
      expect(target.params.length).assertEqual(MX_TEXTBLOB_3_COUNT);
      expect(defaultsText(target)).assertEqual(MX_TEXTBLOB_3_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_TEXTBLOB_3_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0027
     * @tc.name      testNdkRenderNodeMatrixTail0027
     * @tc.desc      textblob 场景 4：2 个参数、默认值 5,16 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(12, 4);
      const target: SceneSpec = CAPABILITY_GROUPS[12].scenes[4];
      expect(target.params.length).assertEqual(MX_TEXTBLOB_4_COUNT);
      expect(defaultsText(target)).assertEqual(MX_TEXTBLOB_4_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_TEXTBLOB_4_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0028
     * @tc.name      testNdkRenderNodeMatrixTail0028
     * @tc.desc      textblob 场景 5：1 个参数、默认值 1 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(12, 5);
      const target: SceneSpec = CAPABILITY_GROUPS[12].scenes[5];
      expect(target.params.length).assertEqual(MX_TEXTBLOB_5_COUNT);
      expect(defaultsText(target)).assertEqual(MX_TEXTBLOB_5_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_TEXTBLOB_5_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0029
     * @tc.name      testNdkRenderNodeMatrixTail0029
     * @tc.desc      textblob 场景 6：2 个参数、默认值 2,26 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(12, 6);
      const target: SceneSpec = CAPABILITY_GROUPS[12].scenes[6];
      expect(target.params.length).assertEqual(MX_TEXTBLOB_6_COUNT);
      expect(defaultsText(target)).assertEqual(MX_TEXTBLOB_6_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_TEXTBLOB_6_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0030
     * @tc.name      testNdkRenderNodeMatrixTail0030
     * @tc.desc      textblob 场景 7：2 个参数、默认值 3,1.5 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(12, 7);
      const target: SceneSpec = CAPABILITY_GROUPS[12].scenes[7];
      expect(target.params.length).assertEqual(MX_TEXTBLOB_7_COUNT);
      expect(defaultsText(target)).assertEqual(MX_TEXTBLOB_7_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_TEXTBLOB_7_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0031
     * @tc.name      testNdkRenderNodeMatrixTail0031
     * @tc.desc      typography 场景 0：2 个参数、默认值 1,16 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(13, 0);
      const target: SceneSpec = CAPABILITY_GROUPS[13].scenes[0];
      expect(target.params.length).assertEqual(MX_TYPOGRAPHY_0_COUNT);
      expect(defaultsText(target)).assertEqual(MX_TYPOGRAPHY_0_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_TYPOGRAPHY_0_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0032
     * @tc.name      testNdkRenderNodeMatrixTail0032
     * @tc.desc      typography 场景 1：2 个参数、默认值 2,2 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(13, 1);
      const target: SceneSpec = CAPABILITY_GROUPS[13].scenes[1];
      expect(target.params.length).assertEqual(MX_TYPOGRAPHY_1_COUNT);
      expect(defaultsText(target)).assertEqual(MX_TYPOGRAPHY_1_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_TYPOGRAPHY_1_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0033
     * @tc.name      testNdkRenderNodeMatrixTail0033
     * @tc.desc      typography 场景 2：2 个参数、默认值 3,2 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(13, 2);
      const target: SceneSpec = CAPABILITY_GROUPS[13].scenes[2];
      expect(target.params.length).assertEqual(MX_TYPOGRAPHY_2_COUNT);
      expect(defaultsText(target)).assertEqual(MX_TYPOGRAPHY_2_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_TYPOGRAPHY_2_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0034
     * @tc.name      testNdkRenderNodeMatrixTail0034
     * @tc.desc      typography 场景 3：3 个参数、默认值 4,2,1 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(13, 3);
      const target: SceneSpec = CAPABILITY_GROUPS[13].scenes[3];
      expect(target.params.length).assertEqual(MX_TYPOGRAPHY_3_COUNT);
      expect(defaultsText(target)).assertEqual(MX_TYPOGRAPHY_3_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_TYPOGRAPHY_3_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0035
     * @tc.name      testNdkRenderNodeMatrixTail0035
     * @tc.desc      typography 场景 4：3 个参数、默认值 5,2,4 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(13, 4);
      const target: SceneSpec = CAPABILITY_GROUPS[13].scenes[4];
      expect(target.params.length).assertEqual(MX_TYPOGRAPHY_4_COUNT);
      expect(defaultsText(target)).assertEqual(MX_TYPOGRAPHY_4_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_TYPOGRAPHY_4_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0036
     * @tc.name      testNdkRenderNodeMatrixTail0036
     * @tc.desc      typography 场景 5：3 个参数、默认值 1,1,0 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(13, 5);
      const target: SceneSpec = CAPABILITY_GROUPS[13].scenes[5];
      expect(target.params.length).assertEqual(MX_TYPOGRAPHY_5_COUNT);
      expect(defaultsText(target)).assertEqual(MX_TYPOGRAPHY_5_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_TYPOGRAPHY_5_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0037
     * @tc.name      testNdkRenderNodeMatrixTail0037
     * @tc.desc      typography 场景 6：3 个参数、默认值 2,6,6 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(13, 6);
      const target: SceneSpec = CAPABILITY_GROUPS[13].scenes[6];
      expect(target.params.length).assertEqual(MX_TYPOGRAPHY_6_COUNT);
      expect(defaultsText(target)).assertEqual(MX_TYPOGRAPHY_6_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_TYPOGRAPHY_6_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0038
     * @tc.name      testNdkRenderNodeMatrixTail0038
     * @tc.desc      typography 场景 7：2 个参数、默认值 3,30 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(13, 7);
      const target: SceneSpec = CAPABILITY_GROUPS[13].scenes[7];
      expect(target.params.length).assertEqual(MX_TYPOGRAPHY_7_COUNT);
      expect(defaultsText(target)).assertEqual(MX_TYPOGRAPHY_7_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_TYPOGRAPHY_7_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0039
     * @tc.name      testNdkRenderNodeMatrixTail0039
     * @tc.desc      typography 场景 8：2 个参数、默认值 4,8 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(13, 8);
      const target: SceneSpec = CAPABILITY_GROUPS[13].scenes[8];
      expect(target.params.length).assertEqual(MX_TYPOGRAPHY_8_COUNT);
      expect(defaultsText(target)).assertEqual(MX_TYPOGRAPHY_8_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_TYPOGRAPHY_8_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0040
     * @tc.name      testNdkRenderNodeMatrixTail0040
     * @tc.desc      typography 场景 9：1 个参数、默认值 5 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(13, 9);
      const target: SceneSpec = CAPABILITY_GROUPS[13].scenes[9];
      expect(target.params.length).assertEqual(MX_TYPOGRAPHY_9_COUNT);
      expect(defaultsText(target)).assertEqual(MX_TYPOGRAPHY_9_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_TYPOGRAPHY_9_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0041
     * @tc.name      testNdkRenderNodeMatrixTail0041
     * @tc.desc      typography 场景 10：2 个参数、默认值 1,1 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(13, 10);
      const target: SceneSpec = CAPABILITY_GROUPS[13].scenes[10];
      expect(target.params.length).assertEqual(MX_TYPOGRAPHY_10_COUNT);
      expect(defaultsText(target)).assertEqual(MX_TYPOGRAPHY_10_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_TYPOGRAPHY_10_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0042
     * @tc.name      testNdkRenderNodeMatrixTail0042
     * @tc.desc      typography 场景 11：2 个参数、默认值 2,2 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(13, 11);
      const target: SceneSpec = CAPABILITY_GROUPS[13].scenes[11];
      expect(target.params.length).assertEqual(MX_TYPOGRAPHY_11_COUNT);
      expect(defaultsText(target)).assertEqual(MX_TYPOGRAPHY_11_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_TYPOGRAPHY_11_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0043
     * @tc.name      testNdkRenderNodeMatrixTail0043
     * @tc.desc      typography 场景 12：2 个参数、默认值 3,0 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(13, 12);
      const target: SceneSpec = CAPABILITY_GROUPS[13].scenes[12];
      expect(target.params.length).assertEqual(MX_TYPOGRAPHY_12_COUNT);
      expect(defaultsText(target)).assertEqual(MX_TYPOGRAPHY_12_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_TYPOGRAPHY_12_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0044
     * @tc.name      testNdkRenderNodeMatrixTail0044
     * @tc.desc      typography 场景 13：1 个参数、默认值 4 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(13, 13);
      const target: SceneSpec = CAPABILITY_GROUPS[13].scenes[13];
      expect(target.params.length).assertEqual(MX_TYPOGRAPHY_13_COUNT);
      expect(defaultsText(target)).assertEqual(MX_TYPOGRAPHY_13_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_TYPOGRAPHY_13_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0045
     * @tc.name      testNdkRenderNodeMatrixTail0045
     * @tc.desc      shadow 场景 0：2 个参数、默认值 1,6 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(14, 0);
      const target: SceneSpec = CAPABILITY_GROUPS[14].scenes[0];
      expect(target.params.length).assertEqual(MX_SHADOW_0_COUNT);
      expect(defaultsText(target)).assertEqual(MX_SHADOW_0_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_SHADOW_0_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0046
     * @tc.name      testNdkRenderNodeMatrixTail0046
     * @tc.desc      shadow 场景 1：3 个参数、默认值 2,8,8 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(14, 1);
      const target: SceneSpec = CAPABILITY_GROUPS[14].scenes[1];
      expect(target.params.length).assertEqual(MX_SHADOW_1_COUNT);
      expect(defaultsText(target)).assertEqual(MX_SHADOW_1_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_SHADOW_1_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0047
     * @tc.name      testNdkRenderNodeMatrixTail0047
     * @tc.desc      shadow 场景 2：3 个参数、默认值 3,5,0.6 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(14, 2);
      const target: SceneSpec = CAPABILITY_GROUPS[14].scenes[2];
      expect(target.params.length).assertEqual(MX_SHADOW_2_COUNT);
      expect(defaultsText(target)).assertEqual(MX_SHADOW_2_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_SHADOW_2_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0048
     * @tc.name      testNdkRenderNodeMatrixTail0048
     * @tc.desc      shadow 场景 3：3 个参数、默认值 4,5,2 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(14, 3);
      const target: SceneSpec = CAPABILITY_GROUPS[14].scenes[3];
      expect(target.params.length).assertEqual(MX_SHADOW_3_COUNT);
      expect(defaultsText(target)).assertEqual(MX_SHADOW_3_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_SHADOW_3_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0049
     * @tc.name      testNdkRenderNodeMatrixTail0049
     * @tc.desc      shadow 场景 4：2 个参数、默认值 5,8 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(14, 4);
      const target: SceneSpec = CAPABILITY_GROUPS[14].scenes[4];
      expect(target.params.length).assertEqual(MX_SHADOW_4_COUNT);
      expect(defaultsText(target)).assertEqual(MX_SHADOW_4_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_SHADOW_4_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0050
     * @tc.name      testNdkRenderNodeMatrixTail0050
     * @tc.desc      shadow 场景 5：2 个参数、默认值 1,14 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(14, 5);
      const target: SceneSpec = CAPABILITY_GROUPS[14].scenes[5];
      expect(target.params.length).assertEqual(MX_SHADOW_5_COUNT);
      expect(defaultsText(target)).assertEqual(MX_SHADOW_5_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_SHADOW_5_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0051
     * @tc.name      testNdkRenderNodeMatrixTail0051
     * @tc.desc      shadow 场景 6：2 个参数、默认值 2,6 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(14, 6);
      const target: SceneSpec = CAPABILITY_GROUPS[14].scenes[6];
      expect(target.params.length).assertEqual(MX_SHADOW_6_COUNT);
      expect(defaultsText(target)).assertEqual(MX_SHADOW_6_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_SHADOW_6_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0052
     * @tc.name      testNdkRenderNodeMatrixTail0052
     * @tc.desc      shadow 场景 7：2 个参数、默认值 4,8 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(14, 7);
      const target: SceneSpec = CAPABILITY_GROUPS[14].scenes[7];
      expect(target.params.length).assertEqual(MX_SHADOW_7_COUNT);
      expect(defaultsText(target)).assertEqual(MX_SHADOW_7_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_SHADOW_7_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0053
     * @tc.name      testNdkRenderNodeMatrixTail0053
     * @tc.desc      matrix 场景 0：1 个参数、默认值 1 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(15, 0);
      const target: SceneSpec = CAPABILITY_GROUPS[15].scenes[0];
      expect(target.params.length).assertEqual(MX_MATRIX_0_COUNT);
      expect(defaultsText(target)).assertEqual(MX_MATRIX_0_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_MATRIX_0_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0054
     * @tc.name      testNdkRenderNodeMatrixTail0054
     * @tc.desc      matrix 场景 1：3 个参数、默认值 2,10,8 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(15, 1);
      const target: SceneSpec = CAPABILITY_GROUPS[15].scenes[1];
      expect(target.params.length).assertEqual(MX_MATRIX_1_COUNT);
      expect(defaultsText(target)).assertEqual(MX_MATRIX_1_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_MATRIX_1_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0055
     * @tc.name      testNdkRenderNodeMatrixTail0055
     * @tc.desc      matrix 场景 2：4 个参数、默认值 3,1.5,50,50 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(15, 2);
      const target: SceneSpec = CAPABILITY_GROUPS[15].scenes[2];
      expect(target.params.length).assertEqual(MX_MATRIX_2_COUNT);
      expect(defaultsText(target)).assertEqual(MX_MATRIX_2_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_MATRIX_2_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0056
     * @tc.name      testNdkRenderNodeMatrixTail0056
     * @tc.desc      matrix 场景 3：2 个参数、默认值 4,30 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(15, 3);
      const target: SceneSpec = CAPABILITY_GROUPS[15].scenes[3];
      expect(target.params.length).assertEqual(MX_MATRIX_3_COUNT);
      expect(defaultsText(target)).assertEqual(MX_MATRIX_3_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_MATRIX_3_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0057
     * @tc.name      testNdkRenderNodeMatrixTail0057
     * @tc.desc      matrix 场景 4：3 个参数、默认值 5,20,0 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(15, 4);
      const target: SceneSpec = CAPABILITY_GROUPS[15].scenes[4];
      expect(target.params.length).assertEqual(MX_MATRIX_4_COUNT);
      expect(defaultsText(target)).assertEqual(MX_MATRIX_4_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_MATRIX_4_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0058
     * @tc.name      testNdkRenderNodeMatrixTail0058
     * @tc.desc      matrix 场景 5：3 个参数、默认值 1,30,10 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(15, 5);
      const target: SceneSpec = CAPABILITY_GROUPS[15].scenes[5];
      expect(target.params.length).assertEqual(MX_MATRIX_5_COUNT);
      expect(defaultsText(target)).assertEqual(MX_MATRIX_5_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_MATRIX_5_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0059
     * @tc.name      testNdkRenderNodeMatrixTail0059
     * @tc.desc      matrix 场景 6：4 个参数、默认值 2,0,12,1.4 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(15, 6);
      const target: SceneSpec = CAPABILITY_GROUPS[15].scenes[6];
      expect(target.params.length).assertEqual(MX_MATRIX_6_COUNT);
      expect(defaultsText(target)).assertEqual(MX_MATRIX_6_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_MATRIX_6_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0060
     * @tc.name      testNdkRenderNodeMatrixTail0060
     * @tc.desc      matrix 场景 7：2 个参数、默认值 3,25 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(15, 7);
      const target: SceneSpec = CAPABILITY_GROUPS[15].scenes[7];
      expect(target.params.length).assertEqual(MX_MATRIX_7_COUNT);
      expect(defaultsText(target)).assertEqual(MX_MATRIX_7_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_MATRIX_7_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0061
     * @tc.name      testNdkRenderNodeMatrixTail0061
     * @tc.desc      matrix 场景 8：3 个参数、默认值 4,20,1.2 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(15, 8);
      const target: SceneSpec = CAPABILITY_GROUPS[15].scenes[8];
      expect(target.params.length).assertEqual(MX_MATRIX_8_COUNT);
      expect(defaultsText(target)).assertEqual(MX_MATRIX_8_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_MATRIX_8_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0062
     * @tc.name      testNdkRenderNodeMatrixTail0062
     * @tc.desc      matrix 场景 9：2 个参数、默认值 5,8 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(15, 9);
      const target: SceneSpec = CAPABILITY_GROUPS[15].scenes[9];
      expect(target.params.length).assertEqual(MX_MATRIX_9_COUNT);
      expect(defaultsText(target)).assertEqual(MX_MATRIX_9_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_MATRIX_9_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0063
     * @tc.name      testNdkRenderNodeMatrixTail0063
     * @tc.desc      record 场景 0：1 个参数、默认值 1 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(16, 0);
      const target: SceneSpec = CAPABILITY_GROUPS[16].scenes[0];
      expect(target.params.length).assertEqual(MX_RECORD_0_COUNT);
      expect(defaultsText(target)).assertEqual(MX_RECORD_0_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_RECORD_0_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0064
     * @tc.name      testNdkRenderNodeMatrixTail0064
     * @tc.desc      record 场景 1：2 个参数、默认值 2,12 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(16, 1);
      const target: SceneSpec = CAPABILITY_GROUPS[16].scenes[1];
      expect(target.params.length).assertEqual(MX_RECORD_1_COUNT);
      expect(defaultsText(target)).assertEqual(MX_RECORD_1_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_RECORD_1_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0065
     * @tc.name      testNdkRenderNodeMatrixTail0065
     * @tc.desc      record 场景 2：2 个参数、默认值 3,6 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(16, 2);
      const target: SceneSpec = CAPABILITY_GROUPS[16].scenes[2];
      expect(target.params.length).assertEqual(MX_RECORD_2_COUNT);
      expect(defaultsText(target)).assertEqual(MX_RECORD_2_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_RECORD_2_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0066
     * @tc.name      testNdkRenderNodeMatrixTail0066
     * @tc.desc      record 场景 3：1 个参数、默认值 4 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(16, 3);
      const target: SceneSpec = CAPABILITY_GROUPS[16].scenes[3];
      expect(target.params.length).assertEqual(MX_RECORD_3_COUNT);
      expect(defaultsText(target)).assertEqual(MX_RECORD_3_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_RECORD_3_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0067
     * @tc.name      testNdkRenderNodeMatrixTail0067
     * @tc.desc      record 场景 4：2 个参数、默认值 5,2 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(16, 4);
      const target: SceneSpec = CAPABILITY_GROUPS[16].scenes[4];
      expect(target.params.length).assertEqual(MX_RECORD_4_COUNT);
      expect(defaultsText(target)).assertEqual(MX_RECORD_4_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_RECORD_4_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0068
     * @tc.name      testNdkRenderNodeMatrixTail0068
     * @tc.desc      record 场景 5：2 个参数、默认值 1,0.5 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(16, 5);
      const target: SceneSpec = CAPABILITY_GROUPS[16].scenes[5];
      expect(target.params.length).assertEqual(MX_RECORD_5_COUNT);
      expect(defaultsText(target)).assertEqual(MX_RECORD_5_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_RECORD_5_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0069
     * @tc.name      testNdkRenderNodeMatrixTail0069
     * @tc.desc      record 场景 6：2 个参数、默认值 2,8 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(16, 6);
      const target: SceneSpec = CAPABILITY_GROUPS[16].scenes[6];
      expect(target.params.length).assertEqual(MX_RECORD_6_COUNT);
      expect(defaultsText(target)).assertEqual(MX_RECORD_6_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_RECORD_6_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0070
     * @tc.name      testNdkRenderNodeMatrixTail0070
     * @tc.desc      record 场景 7：2 个参数、默认值 3,4 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(16, 7);
      const target: SceneSpec = CAPABILITY_GROUPS[16].scenes[7];
      expect(target.params.length).assertEqual(MX_RECORD_7_COUNT);
      expect(defaultsText(target)).assertEqual(MX_RECORD_7_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_RECORD_7_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0071
     * @tc.name      testNdkRenderNodeMatrixTail0071
     * @tc.desc      离屏层场景 0：1 个参数、默认值 1 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(17, 0);
      const target: SceneSpec = CAPABILITY_GROUPS[17].scenes[0];
      expect(target.params.length).assertEqual(MX_OFFSCREEN_0_COUNT);
      expect(defaultsText(target)).assertEqual(MX_OFFSCREEN_0_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_OFFSCREEN_0_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0072
     * @tc.name      testNdkRenderNodeMatrixTail0072
     * @tc.desc      离屏层场景 1：2 个参数、默认值 2,0.6 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(17, 1);
      const target: SceneSpec = CAPABILITY_GROUPS[17].scenes[1];
      expect(target.params.length).assertEqual(MX_OFFSCREEN_1_COUNT);
      expect(defaultsText(target)).assertEqual(MX_OFFSCREEN_1_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_OFFSCREEN_1_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0073
     * @tc.name      testNdkRenderNodeMatrixTail0073
     * @tc.desc      离屏层场景 2：2 个参数、默认值 3,50 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(17, 2);
      const target: SceneSpec = CAPABILITY_GROUPS[17].scenes[2];
      expect(target.params.length).assertEqual(MX_OFFSCREEN_2_COUNT);
      expect(defaultsText(target)).assertEqual(MX_OFFSCREEN_2_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_OFFSCREEN_2_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0074
     * @tc.name      testNdkRenderNodeMatrixTail0074
     * @tc.desc      离屏层场景 3：2 个参数、默认值 4,3 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(17, 3);
      const target: SceneSpec = CAPABILITY_GROUPS[17].scenes[3];
      expect(target.params.length).assertEqual(MX_OFFSCREEN_3_COUNT);
      expect(defaultsText(target)).assertEqual(MX_OFFSCREEN_3_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_OFFSCREEN_3_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0075
     * @tc.name      testNdkRenderNodeMatrixTail0075
     * @tc.desc      离屏层场景 4：2 个参数、默认值 5,0.6 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(17, 4);
      const target: SceneSpec = CAPABILITY_GROUPS[17].scenes[4];
      expect(target.params.length).assertEqual(MX_OFFSCREEN_4_COUNT);
      expect(defaultsText(target)).assertEqual(MX_OFFSCREEN_4_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_OFFSCREEN_4_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0076
     * @tc.name      testNdkRenderNodeMatrixTail0076
     * @tc.desc      离屏层场景 5：2 个参数、默认值 1,0.5 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(17, 5);
      const target: SceneSpec = CAPABILITY_GROUPS[17].scenes[5];
      expect(target.params.length).assertEqual(MX_OFFSCREEN_5_COUNT);
      expect(defaultsText(target)).assertEqual(MX_OFFSCREEN_5_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_OFFSCREEN_5_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0077
     * @tc.name      testNdkRenderNodeMatrixTail0077
     * @tc.desc      离屏层场景 6：2 个参数、默认值 2,0.5 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(17, 6);
      const target: SceneSpec = CAPABILITY_GROUPS[17].scenes[6];
      expect(target.params.length).assertEqual(MX_OFFSCREEN_6_COUNT);
      expect(defaultsText(target)).assertEqual(MX_OFFSCREEN_6_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_OFFSCREEN_6_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0078
     * @tc.name      testNdkRenderNodeMatrixTail0078
     * @tc.desc      离屏层场景 7：2 个参数、默认值 4,0.8 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(17, 7);
      const target: SceneSpec = CAPABILITY_GROUPS[17].scenes[7];
      expect(target.params.length).assertEqual(MX_OFFSCREEN_7_COUNT);
      expect(defaultsText(target)).assertEqual(MX_OFFSCREEN_7_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_OFFSCREEN_7_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0079
     * @tc.name      testNdkRenderNodeMatrixTail0079
     * @tc.desc      error 场景 0：1 个参数、默认值 1 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(18, 0);
      const target: SceneSpec = CAPABILITY_GROUPS[18].scenes[0];
      expect(target.params.length).assertEqual(MX_ERROR_0_COUNT);
      expect(defaultsText(target)).assertEqual(MX_ERROR_0_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_ERROR_0_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0080
     * @tc.name      testNdkRenderNodeMatrixTail0080
     * @tc.desc      error 场景 1：1 个参数、默认值 2 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(18, 1);
      const target: SceneSpec = CAPABILITY_GROUPS[18].scenes[1];
      expect(target.params.length).assertEqual(MX_ERROR_1_COUNT);
      expect(defaultsText(target)).assertEqual(MX_ERROR_1_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_ERROR_1_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0081
     * @tc.name      testNdkRenderNodeMatrixTail0081
     * @tc.desc      error 场景 2：1 个参数、默认值 3 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(18, 2);
      const target: SceneSpec = CAPABILITY_GROUPS[18].scenes[2];
      expect(target.params.length).assertEqual(MX_ERROR_2_COUNT);
      expect(defaultsText(target)).assertEqual(MX_ERROR_2_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_ERROR_2_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0082
     * @tc.name      testNdkRenderNodeMatrixTail0082
     * @tc.desc      error 场景 3：2 个参数、默认值 4,20 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(18, 3);
      const target: SceneSpec = CAPABILITY_GROUPS[18].scenes[3];
      expect(target.params.length).assertEqual(MX_ERROR_3_COUNT);
      expect(defaultsText(target)).assertEqual(MX_ERROR_3_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_ERROR_3_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0083
     * @tc.name      testNdkRenderNodeMatrixTail0083
     * @tc.desc      error 场景 4：1 个参数、默认值 5 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(18, 4);
      const target: SceneSpec = CAPABILITY_GROUPS[18].scenes[4];
      expect(target.params.length).assertEqual(MX_ERROR_4_COUNT);
      expect(defaultsText(target)).assertEqual(MX_ERROR_4_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_ERROR_4_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0084
     * @tc.name      testNdkRenderNodeMatrixTail0084
     * @tc.desc      error 场景 5：1 个参数、默认值 1 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(18, 5);
      const target: SceneSpec = CAPABILITY_GROUPS[18].scenes[5];
      expect(target.params.length).assertEqual(MX_ERROR_5_COUNT);
      expect(defaultsText(target)).assertEqual(MX_ERROR_5_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_ERROR_5_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0085
     * @tc.name      testNdkRenderNodeMatrixTail0085
     * @tc.desc      error 场景 6：1 个参数、默认值 2 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(18, 6);
      const target: SceneSpec = CAPABILITY_GROUPS[18].scenes[6];
      expect(target.params.length).assertEqual(MX_ERROR_6_COUNT);
      expect(defaultsText(target)).assertEqual(MX_ERROR_6_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_ERROR_6_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0086
     * @tc.name      testNdkRenderNodeMatrixTail0086
     * @tc.desc      error 场景 7：2 个参数、默认值 3,0.6 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(18, 7);
      const target: SceneSpec = CAPABILITY_GROUPS[18].scenes[7];
      expect(target.params.length).assertEqual(MX_ERROR_7_COUNT);
      expect(defaultsText(target)).assertEqual(MX_ERROR_7_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_ERROR_7_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0087
     * @tc.name      testNdkRenderNodeMatrixTail0087
     * @tc.desc      error 场景 8：2 个参数、默认值 4,25 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(18, 8);
      const target: SceneSpec = CAPABILITY_GROUPS[18].scenes[8];
      expect(target.params.length).assertEqual(MX_ERROR_8_COUNT);
      expect(defaultsText(target)).assertEqual(MX_ERROR_8_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_ERROR_8_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIXTAIL_0088
     * @tc.name      testNdkRenderNodeMatrixTail0088
     * @tc.desc      error 场景 9：1 个参数、默认值 5 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrixTail0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(18, 9);
      const target: SceneSpec = CAPABILITY_GROUPS[18].scenes[9];
      expect(target.params.length).assertEqual(MX_ERROR_9_COUNT);
      expect(defaultsText(target)).assertEqual(MX_ERROR_9_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_ERROR_9_LOW0);
    })
  })
}
