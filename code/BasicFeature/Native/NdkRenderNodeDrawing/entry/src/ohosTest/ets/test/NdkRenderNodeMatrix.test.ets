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
import { GroupSpec, SceneSpec } from '../../../main/ets/core/SchemaTypes';
import { CAPABILITY_GROUPS } from './SceneDefaults';
import { MAX_SCENE_PARAMS, PROBE_MIN, defaultsText, logInfo, verifyScene } from './MatrixSupport';

// 十九个能力域的场景数，逐个取自 cpp/capability/capability_type.h 的 *_SCENE_COUNT。
// 该数组与 native、schema 的镜像数组由 scripts/verify-matrix.js 四方比对。
const CAPABILITY_SCENE_COUNTS: number[] = [10, 11, 10, 9, 9, 11, 8, 10, 10, 12, 10, 12, 8, 14, 8, 10, 8, 8, 10];
// 十九个能力域的场景总数，等于逐场景矩阵用例条数。
const CAPABILITY_SCENE_TOTAL: number = 188;

// ---- 冻结基线：场景参数个数、默认值数组与第一个参数下界（取自 schema 声明，改动即视为契约变化）----
const MX_CANVAS_0_COUNT: number = 2;
const MX_CANVAS_0_DEFAULTS: string = '1,100';
const MX_CANVAS_0_LOW0: number = 0;
const MX_CANVAS_1_COUNT: number = 2;
const MX_CANVAS_1_DEFAULTS: string = '24,3';
const MX_CANVAS_1_LOW0: number = 8;
const MX_CANVAS_2_COUNT: number = 2;
const MX_CANVAS_2_DEFAULTS: string = '3,30';
const MX_CANVAS_2_LOW0: number = 1;
const MX_CANVAS_3_COUNT: number = 2;
const MX_CANVAS_3_DEFAULTS: string = '25,30';
const MX_CANVAS_3_LOW0: number = 5;
const MX_CANVAS_4_COUNT: number = 2;
const MX_CANVAS_4_DEFAULTS: string = '30,20';
const MX_CANVAS_4_LOW0: number = 5;
const MX_CANVAS_5_COUNT: number = 2;
const MX_CANVAS_5_DEFAULTS: string = '6,20';
const MX_CANVAS_5_LOW0: number = 3;
const MX_CANVAS_6_COUNT: number = 2;
const MX_CANVAS_6_DEFAULTS: string = '20,15';
const MX_CANVAS_6_LOW0: number = 5;
const MX_CANVAS_7_COUNT: number = 2;
const MX_CANVAS_7_DEFAULTS: string = '20,15';
const MX_CANVAS_7_LOW0: number = -40;
const MX_CANVAS_8_COUNT: number = 2;
const MX_CANVAS_8_DEFAULTS: string = '25,0';
const MX_CANVAS_8_LOW0: number = -60;
const MX_CANVAS_9_COUNT: number = 2;
const MX_CANVAS_9_DEFAULTS: string = '100,35';
const MX_CANVAS_9_LOW0: number = 0;
const MX_GEOMETRY_0_COUNT: number = 2;
const MX_GEOMETRY_0_DEFAULTS: string = '60,50';
const MX_GEOMETRY_0_LOW0: number = 10;
const MX_GEOMETRY_1_COUNT: number = 2;
const MX_GEOMETRY_1_DEFAULTS: string = '25,70';
const MX_GEOMETRY_1_LOW0: number = 5;
const MX_GEOMETRY_2_COUNT: number = 2;
const MX_GEOMETRY_2_DEFAULTS: string = '30,30';
const MX_GEOMETRY_2_LOW0: number = 5;
const MX_GEOMETRY_3_COUNT: number = 2;
const MX_GEOMETRY_3_DEFAULTS: string = '40,25';
const MX_GEOMETRY_3_LOW0: number = 10;
const MX_GEOMETRY_4_COUNT: number = 2;
const MX_GEOMETRY_4_DEFAULTS: string = '30,240';
const MX_GEOMETRY_4_LOW0: number = -180;
const MX_GEOMETRY_5_COUNT: number = 3;
const MX_GEOMETRY_5_DEFAULTS: string = '45,200,1';
const MX_GEOMETRY_5_LOW0: number = -180;
const MX_GEOMETRY_6_COUNT: number = 2;
const MX_GEOMETRY_6_DEFAULTS: string = '8,20';
const MX_GEOMETRY_6_LOW0: number = 1;
const MX_GEOMETRY_7_COUNT: number = 2;
const MX_GEOMETRY_7_DEFAULTS: string = '6,1';
const MX_GEOMETRY_7_LOW0: number = 3;
const MX_GEOMETRY_8_COUNT: number = 2;
const MX_GEOMETRY_8_DEFAULTS: string = '60,4';
const MX_GEOMETRY_8_LOW0: number = 0;
const MX_GEOMETRY_9_COUNT: number = 2;
const MX_GEOMETRY_9_DEFAULTS: string = '2,15';
const MX_GEOMETRY_9_LOW0: number = 0;
const MX_GEOMETRY_10_COUNT: number = 2;
const MX_GEOMETRY_10_DEFAULTS: string = '0,20';
const MX_GEOMETRY_10_LOW0: number = 0;
const MX_PAINT_0_COUNT: number = 2;
const MX_PAINT_0_DEFAULTS: string = '2,16';
const MX_PAINT_0_LOW0: number = 0;
const MX_PAINT_1_COUNT: number = 2;
const MX_PAINT_1_DEFAULTS: string = '1,18';
const MX_PAINT_1_LOW0: number = 0;
const MX_PAINT_2_COUNT: number = 2;
const MX_PAINT_2_DEFAULTS: string = '4,16';
const MX_PAINT_2_LOW0: number = 1;
const MX_PAINT_3_COUNT: number = 2;
const MX_PAINT_3_DEFAULTS: string = '12,100';
const MX_PAINT_3_LOW0: number = 1;
const MX_PAINT_4_COUNT: number = 2;
const MX_PAINT_4_DEFAULTS: string = '60,3';
const MX_PAINT_4_LOW0: number = 0;
const MX_PAINT_5_COUNT: number = 2;
const MX_PAINT_5_DEFAULTS: string = '0,100';
const MX_PAINT_5_LOW0: number = 0;
const MX_PAINT_6_COUNT: number = 2;
const MX_PAINT_6_DEFAULTS: string = '16,8';
const MX_PAINT_6_LOW0: number = 2;
const MX_PAINT_7_COUNT: number = 2;
const MX_PAINT_7_DEFAULTS: string = '16,12';
const MX_PAINT_7_LOW0: number = 2;
const MX_PAINT_8_COUNT: number = 2;
const MX_PAINT_8_DEFAULTS: string = '10,6';
const MX_PAINT_8_LOW0: number = 2;
const MX_PAINT_9_COUNT: number = 2;
const MX_PAINT_9_DEFAULTS: string = '16,10';
const MX_PAINT_9_LOW0: number = 0;
const MX_COLOR_0_COUNT: number = 2;
const MX_COLOR_0_DEFAULTS: string = '6,100';
const MX_COLOR_0_LOW0: number = 3;
const MX_COLOR_1_COUNT: number = 2;
const MX_COLOR_1_DEFAULTS: string = '8,1';
const MX_COLOR_1_LOW0: number = 4;
const MX_COLOR_2_COUNT: number = 3;
const MX_COLOR_2_DEFAULTS: string = '50,0,2';
const MX_COLOR_2_LOW0: number = 0;
const MX_COLOR_3_COUNT: number = 2;
const MX_COLOR_3_DEFAULTS: string = '80,1';
const MX_COLOR_3_LOW0: number = 0;
const MX_COLOR_4_COUNT: number = 2;
const MX_COLOR_4_DEFAULTS: string = '80,2';
const MX_COLOR_4_LOW0: number = 0;
const MX_COLOR_5_COUNT: number = 2;
const MX_COLOR_5_DEFAULTS: string = '1.5,3';
const MX_COLOR_5_LOW0: number = 0;
const MX_COLOR_6_COUNT: number = 2;
const MX_COLOR_6_DEFAULTS: string = '100,0';
const MX_COLOR_6_LOW0: number = 0;
const MX_COLOR_7_COUNT: number = 2;
const MX_COLOR_7_DEFAULTS: string = '50,1';
const MX_COLOR_7_LOW0: number = 0;
const MX_COLOR_8_COUNT: number = 2;
const MX_COLOR_8_DEFAULTS: string = '50,4';
const MX_COLOR_8_LOW0: number = 0;
const MX_COLORFILTER_0_COUNT: number = 2;
const MX_COLORFILTER_0_DEFAULTS: string = '0,2';
const MX_COLORFILTER_0_LOW0: number = 0;
const MX_COLORFILTER_1_COUNT: number = 2;
const MX_COLORFILTER_1_DEFAULTS: string = '0,100';
const MX_COLORFILTER_1_LOW0: number = 0;
const MX_COLORFILTER_2_COUNT: number = 2;
const MX_COLORFILTER_2_DEFAULTS: string = '70,100';
const MX_COLORFILTER_2_LOW0: number = 0;
const MX_COLORFILTER_3_COUNT: number = 2;
const MX_COLORFILTER_3_DEFAULTS: string = '100,100';
const MX_COLORFILTER_3_LOW0: number = 0;
const MX_COLORFILTER_4_COUNT: number = 2;
const MX_COLORFILTER_4_DEFAULTS: string = '1.5,100';
const MX_COLORFILTER_4_LOW0: number = 0;
const MX_COLORFILTER_5_COUNT: number = 2;
const MX_COLORFILTER_5_DEFAULTS: string = '100,1';
const MX_COLORFILTER_5_LOW0: number = 20;
const MX_COLORFILTER_6_COUNT: number = 2;
const MX_COLORFILTER_6_DEFAULTS: string = '0,1';
const MX_COLORFILTER_6_LOW0: number = 0;
const MX_COLORFILTER_7_COUNT: number = 2;
const MX_COLORFILTER_7_DEFAULTS: string = '1,4';
const MX_COLORFILTER_7_LOW0: number = 0;
const MX_COLORFILTER_8_COUNT: number = 2;
const MX_COLORFILTER_8_DEFAULTS: string = '1,10';
const MX_COLORFILTER_8_LOW0: number = 0;
const MX_SHADER_0_COUNT: number = 2;
const MX_SHADER_0_DEFAULTS: string = '45,100';
const MX_SHADER_0_LOW0: number = 0;
const MX_SHADER_1_COUNT: number = 2;
const MX_SHADER_1_DEFAULTS: string = '3,0';
const MX_SHADER_1_LOW0: number = 2;
const MX_SHADER_2_COUNT: number = 2;
const MX_SHADER_2_DEFAULTS: string = '35,50';
const MX_SHADER_2_LOW0: number = 10;
const MX_SHADER_3_COUNT: number = 2;
const MX_SHADER_3_DEFAULTS: string = '0,100';
const MX_SHADER_3_LOW0: number = 0;
const MX_SHADER_4_COUNT: number = 2;
const MX_SHADER_4_DEFAULTS: string = '10,50';
const MX_SHADER_4_LOW0: number = 0;
const MX_SHADER_5_COUNT: number = 2;
const MX_SHADER_5_DEFAULTS: string = '1,100';
const MX_SHADER_5_LOW0: number = 0;
const MX_SHADER_6_COUNT: number = 2;
const MX_SHADER_6_DEFAULTS: string = '0,45';
const MX_SHADER_6_LOW0: number = 0;
const MX_SHADER_7_COUNT: number = 2;
const MX_SHADER_7_DEFAULTS: string = '12,0';
const MX_SHADER_7_LOW0: number = 2;
const MX_SHADER_8_COUNT: number = 2;
const MX_SHADER_8_DEFAULTS: string = '100,30';
const MX_SHADER_8_LOW0: number = 20;
const MX_SHADER_9_COUNT: number = 2;
const MX_SHADER_9_DEFAULTS: string = '1,3';
const MX_SHADER_9_LOW0: number = 0;
const MX_SHADER_10_COUNT: number = 2;
const MX_SHADER_10_DEFAULTS: string = '100,20';
const MX_SHADER_10_LOW0: number = 0;
const MX_MASKFILTER_0_COUNT: number = 3;
const MX_MASKFILTER_0_DEFAULTS: string = '1,12,85';
const MX_MASKFILTER_0_LOW0: number = 0;
const MX_MASKFILTER_1_COUNT: number = 3;
const MX_MASKFILTER_1_DEFAULTS: string = '2,16,90';
const MX_MASKFILTER_1_LOW0: number = 0;
const MX_MASKFILTER_2_COUNT: number = 3;
const MX_MASKFILTER_2_DEFAULTS: string = '3,20,95';
const MX_MASKFILTER_2_LOW0: number = 0;
const MX_MASKFILTER_3_COUNT: number = 3;
const MX_MASKFILTER_3_DEFAULTS: string = '4,20,95';
const MX_MASKFILTER_3_LOW0: number = 0;
const MX_MASKFILTER_4_COUNT: number = 3;
const MX_MASKFILTER_4_DEFAULTS: string = '1,6,8';
const MX_MASKFILTER_4_LOW0: number = 0;
const MX_MASKFILTER_5_COUNT: number = 4;
const MX_MASKFILTER_5_DEFAULTS: string = '3,14,8,1';
const MX_MASKFILTER_5_LOW0: number = 0;
const MX_MASKFILTER_6_COUNT: number = 3;
const MX_MASKFILTER_6_DEFAULTS: string = '5,18,90';
const MX_MASKFILTER_6_LOW0: number = 0;
const MX_MASKFILTER_7_COUNT: number = 3;
const MX_MASKFILTER_7_DEFAULTS: string = '1,10,22';
const MX_MASKFILTER_7_LOW0: number = 0;
const MX_IMAGEFILTER_0_COUNT: number = 4;
const MX_IMAGEFILTER_0_DEFAULTS: string = '1,12,12,0';
const MX_IMAGEFILTER_0_LOW0: number = 0;
const MX_IMAGEFILTER_1_COUNT: number = 3;
const MX_IMAGEFILTER_1_DEFAULTS: string = '2,16,60';
const MX_IMAGEFILTER_1_LOW0: number = 0;
const MX_IMAGEFILTER_2_COUNT: number = 3;
const MX_IMAGEFILTER_2_DEFAULTS: string = '3,10,10';
const MX_IMAGEFILTER_2_LOW0: number = 0;
const MX_IMAGEFILTER_3_COUNT: number = 2;
const MX_IMAGEFILTER_3_DEFAULTS: string = '4,0';
const MX_IMAGEFILTER_3_LOW0: number = 0;
const MX_IMAGEFILTER_4_COUNT: number = 2;
const MX_IMAGEFILTER_4_DEFAULTS: string = '5,45';
const MX_IMAGEFILTER_4_LOW0: number = 0;
const MX_IMAGEFILTER_5_COUNT: number = 2;
const MX_IMAGEFILTER_5_DEFAULTS: string = '1,2';
const MX_IMAGEFILTER_5_LOW0: number = 0;
const MX_IMAGEFILTER_6_COUNT: number = 3;
const MX_IMAGEFILTER_6_DEFAULTS: string = '2,14,90';
const MX_IMAGEFILTER_6_LOW0: number = 0;
const MX_IMAGEFILTER_7_COUNT: number = 3;
const MX_IMAGEFILTER_7_DEFAULTS: string = '3,14,90';
const MX_IMAGEFILTER_7_LOW0: number = 0;
const MX_IMAGEFILTER_8_COUNT: number = 3;
const MX_IMAGEFILTER_8_DEFAULTS: string = '4,14,90';
const MX_IMAGEFILTER_8_LOW0: number = 0;
const MX_IMAGEFILTER_9_COUNT: number = 3;
const MX_IMAGEFILTER_9_DEFAULTS: string = '4,18,95';
const MX_IMAGEFILTER_9_LOW0: number = 0;
const MX_BITMAP_0_COUNT: number = 2;
const MX_BITMAP_0_DEFAULTS: string = '1,40';
const MX_BITMAP_0_LOW0: number = 0;
const MX_BITMAP_1_COUNT: number = 2;
const MX_BITMAP_1_DEFAULTS: string = '2,96';
const MX_BITMAP_1_LOW0: number = 0;
const MX_BITMAP_2_COUNT: number = 2;
const MX_BITMAP_2_DEFAULTS: string = '3,80';
const MX_BITMAP_2_LOW0: number = 0;
const MX_BITMAP_3_COUNT: number = 1;
const MX_BITMAP_3_DEFAULTS: string = '4';
const MX_BITMAP_3_LOW0: number = 0;
const MX_BITMAP_4_COUNT: number = 2;
const MX_BITMAP_4_DEFAULTS: string = '5,4';
const MX_BITMAP_4_LOW0: number = 0;
const MX_BITMAP_5_COUNT: number = 3;
const MX_BITMAP_5_DEFAULTS: string = '1,64,32';
const MX_BITMAP_5_LOW0: number = 0;
const MX_BITMAP_6_COUNT: number = 2;
const MX_BITMAP_6_DEFAULTS: string = '3,50';
const MX_BITMAP_6_LOW0: number = 0;
const MX_BITMAP_7_COUNT: number = 1;
const MX_BITMAP_7_DEFAULTS: string = '4';
const MX_BITMAP_7_LOW0: number = 0;
const MX_BITMAP_8_COUNT: number = 2;
const MX_BITMAP_8_DEFAULTS: string = '5,64';
const MX_BITMAP_8_LOW0: number = 0;
const MX_BITMAP_9_COUNT: number = 2;
const MX_BITMAP_9_DEFAULTS: string = '1,4';
const MX_BITMAP_9_LOW0: number = 0;
const MX_PIXELMAP_0_COUNT: number = 3;
const MX_PIXELMAP_0_DEFAULTS: string = '1,70,1';
const MX_PIXELMAP_0_LOW0: number = 0;
const MX_PIXELMAP_1_COUNT: number = 2;
const MX_PIXELMAP_1_DEFAULTS: string = '2,80';
const MX_PIXELMAP_1_LOW0: number = 0;
const MX_PIXELMAP_2_COUNT: number = 2;
const MX_PIXELMAP_2_DEFAULTS: string = '2,80';
const MX_PIXELMAP_2_LOW0: number = 0;
const MX_PIXELMAP_3_COUNT: number = 3;
const MX_PIXELMAP_3_DEFAULTS: string = '3,50,0';
const MX_PIXELMAP_3_LOW0: number = 0;
const MX_PIXELMAP_4_COUNT: number = 3;
const MX_PIXELMAP_4_DEFAULTS: string = '4,30,0';
const MX_PIXELMAP_4_LOW0: number = 0;
const MX_PIXELMAP_5_COUNT: number = 2;
const MX_PIXELMAP_5_DEFAULTS: string = '5,8';
const MX_PIXELMAP_5_LOW0: number = 0;
const MX_PIXELMAP_6_COUNT: number = 1;
const MX_PIXELMAP_6_DEFAULTS: string = '15';
const MX_PIXELMAP_6_LOW0: number = -180;
const MX_PIXELMAP_7_COUNT: number = 1;
const MX_PIXELMAP_7_DEFAULTS: string = '3';
const MX_PIXELMAP_7_LOW0: number = 1;
const MX_PIXELMAP_8_COUNT: number = 2;
const MX_PIXELMAP_8_DEFAULTS: string = '2,50';
const MX_PIXELMAP_8_LOW0: number = 0;
const MX_PIXELMAP_9_COUNT: number = 1;
const MX_PIXELMAP_9_DEFAULTS: string = '60';
const MX_PIXELMAP_9_LOW0: number = 10;
const MX_PIXELMAP_10_COUNT: number = 2;
const MX_PIXELMAP_10_DEFAULTS: string = '4,12';
const MX_PIXELMAP_10_LOW0: number = 0;
const MX_PIXELMAP_11_COUNT: number = 1;
const MX_PIXELMAP_11_DEFAULTS: string = '1';
const MX_PIXELMAP_11_LOW0: number = 0;
export default function ndkRenderNodeMatrixTest(): void {
  describe('NdkRenderNodeMatrix', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0001
     * @tc.name      testNdkRenderNodeMatrix0001
     * @tc.desc      canvas 场景 0：2 个参数、默认值 1,100 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(0, 0);
      const target: SceneSpec = CAPABILITY_GROUPS[0].scenes[0];
      expect(target.params.length).assertEqual(MX_CANVAS_0_COUNT);
      expect(defaultsText(target)).assertEqual(MX_CANVAS_0_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_CANVAS_0_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0002
     * @tc.name      testNdkRenderNodeMatrix0002
     * @tc.desc      canvas 场景 1：2 个参数、默认值 24,3 与首参下界 8 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(0, 1);
      const target: SceneSpec = CAPABILITY_GROUPS[0].scenes[1];
      expect(target.params.length).assertEqual(MX_CANVAS_1_COUNT);
      expect(defaultsText(target)).assertEqual(MX_CANVAS_1_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_CANVAS_1_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0003
     * @tc.name      testNdkRenderNodeMatrix0003
     * @tc.desc      canvas 场景 2：2 个参数、默认值 3,30 与首参下界 1 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(0, 2);
      const target: SceneSpec = CAPABILITY_GROUPS[0].scenes[2];
      expect(target.params.length).assertEqual(MX_CANVAS_2_COUNT);
      expect(defaultsText(target)).assertEqual(MX_CANVAS_2_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_CANVAS_2_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0004
     * @tc.name      testNdkRenderNodeMatrix0004
     * @tc.desc      canvas 场景 3：2 个参数、默认值 25,30 与首参下界 5 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(0, 3);
      const target: SceneSpec = CAPABILITY_GROUPS[0].scenes[3];
      expect(target.params.length).assertEqual(MX_CANVAS_3_COUNT);
      expect(defaultsText(target)).assertEqual(MX_CANVAS_3_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_CANVAS_3_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0005
     * @tc.name      testNdkRenderNodeMatrix0005
     * @tc.desc      canvas 场景 4：2 个参数、默认值 30,20 与首参下界 5 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(0, 4);
      const target: SceneSpec = CAPABILITY_GROUPS[0].scenes[4];
      expect(target.params.length).assertEqual(MX_CANVAS_4_COUNT);
      expect(defaultsText(target)).assertEqual(MX_CANVAS_4_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_CANVAS_4_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0006
     * @tc.name      testNdkRenderNodeMatrix0006
     * @tc.desc      canvas 场景 5：2 个参数、默认值 6,20 与首参下界 3 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(0, 5);
      const target: SceneSpec = CAPABILITY_GROUPS[0].scenes[5];
      expect(target.params.length).assertEqual(MX_CANVAS_5_COUNT);
      expect(defaultsText(target)).assertEqual(MX_CANVAS_5_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_CANVAS_5_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0007
     * @tc.name      testNdkRenderNodeMatrix0007
     * @tc.desc      canvas 场景 6：2 个参数、默认值 20,15 与首参下界 5 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(0, 6);
      const target: SceneSpec = CAPABILITY_GROUPS[0].scenes[6];
      expect(target.params.length).assertEqual(MX_CANVAS_6_COUNT);
      expect(defaultsText(target)).assertEqual(MX_CANVAS_6_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_CANVAS_6_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0008
     * @tc.name      testNdkRenderNodeMatrix0008
     * @tc.desc      canvas 场景 7：2 个参数、默认值 20,15 与首参下界 -40 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(0, 7);
      const target: SceneSpec = CAPABILITY_GROUPS[0].scenes[7];
      expect(target.params.length).assertEqual(MX_CANVAS_7_COUNT);
      expect(defaultsText(target)).assertEqual(MX_CANVAS_7_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_CANVAS_7_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0009
     * @tc.name      testNdkRenderNodeMatrix0009
     * @tc.desc      canvas 场景 8：2 个参数、默认值 25,0 与首参下界 -60 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(0, 8);
      const target: SceneSpec = CAPABILITY_GROUPS[0].scenes[8];
      expect(target.params.length).assertEqual(MX_CANVAS_8_COUNT);
      expect(defaultsText(target)).assertEqual(MX_CANVAS_8_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_CANVAS_8_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0010
     * @tc.name      testNdkRenderNodeMatrix0010
     * @tc.desc      canvas 场景 9：2 个参数、默认值 100,35 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(0, 9);
      const target: SceneSpec = CAPABILITY_GROUPS[0].scenes[9];
      expect(target.params.length).assertEqual(MX_CANVAS_9_COUNT);
      expect(defaultsText(target)).assertEqual(MX_CANVAS_9_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_CANVAS_9_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0011
     * @tc.name      testNdkRenderNodeMatrix0011
     * @tc.desc      geometry 场景 0：2 个参数、默认值 60,50 与首参下界 10 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(1, 0);
      const target: SceneSpec = CAPABILITY_GROUPS[1].scenes[0];
      expect(target.params.length).assertEqual(MX_GEOMETRY_0_COUNT);
      expect(defaultsText(target)).assertEqual(MX_GEOMETRY_0_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_GEOMETRY_0_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0012
     * @tc.name      testNdkRenderNodeMatrix0012
     * @tc.desc      geometry 场景 1：2 个参数、默认值 25,70 与首参下界 5 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(1, 1);
      const target: SceneSpec = CAPABILITY_GROUPS[1].scenes[1];
      expect(target.params.length).assertEqual(MX_GEOMETRY_1_COUNT);
      expect(defaultsText(target)).assertEqual(MX_GEOMETRY_1_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_GEOMETRY_1_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0013
     * @tc.name      testNdkRenderNodeMatrix0013
     * @tc.desc      geometry 场景 2：2 个参数、默认值 30,30 与首参下界 5 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(1, 2);
      const target: SceneSpec = CAPABILITY_GROUPS[1].scenes[2];
      expect(target.params.length).assertEqual(MX_GEOMETRY_2_COUNT);
      expect(defaultsText(target)).assertEqual(MX_GEOMETRY_2_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_GEOMETRY_2_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0014
     * @tc.name      testNdkRenderNodeMatrix0014
     * @tc.desc      geometry 场景 3：2 个参数、默认值 40,25 与首参下界 10 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(1, 3);
      const target: SceneSpec = CAPABILITY_GROUPS[1].scenes[3];
      expect(target.params.length).assertEqual(MX_GEOMETRY_3_COUNT);
      expect(defaultsText(target)).assertEqual(MX_GEOMETRY_3_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_GEOMETRY_3_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0015
     * @tc.name      testNdkRenderNodeMatrix0015
     * @tc.desc      geometry 场景 4：2 个参数、默认值 30,240 与首参下界 -180 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(1, 4);
      const target: SceneSpec = CAPABILITY_GROUPS[1].scenes[4];
      expect(target.params.length).assertEqual(MX_GEOMETRY_4_COUNT);
      expect(defaultsText(target)).assertEqual(MX_GEOMETRY_4_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_GEOMETRY_4_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0016
     * @tc.name      testNdkRenderNodeMatrix0016
     * @tc.desc      geometry 场景 5：3 个参数、默认值 45,200,1 与首参下界 -180 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(1, 5);
      const target: SceneSpec = CAPABILITY_GROUPS[1].scenes[5];
      expect(target.params.length).assertEqual(MX_GEOMETRY_5_COUNT);
      expect(defaultsText(target)).assertEqual(MX_GEOMETRY_5_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_GEOMETRY_5_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0017
     * @tc.name      testNdkRenderNodeMatrix0017
     * @tc.desc      geometry 场景 6：2 个参数、默认值 8,20 与首参下界 1 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(1, 6);
      const target: SceneSpec = CAPABILITY_GROUPS[1].scenes[6];
      expect(target.params.length).assertEqual(MX_GEOMETRY_6_COUNT);
      expect(defaultsText(target)).assertEqual(MX_GEOMETRY_6_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_GEOMETRY_6_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0018
     * @tc.name      testNdkRenderNodeMatrix0018
     * @tc.desc      geometry 场景 7：2 个参数、默认值 6,1 与首参下界 3 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(1, 7);
      const target: SceneSpec = CAPABILITY_GROUPS[1].scenes[7];
      expect(target.params.length).assertEqual(MX_GEOMETRY_7_COUNT);
      expect(defaultsText(target)).assertEqual(MX_GEOMETRY_7_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_GEOMETRY_7_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0019
     * @tc.name      testNdkRenderNodeMatrix0019
     * @tc.desc      geometry 场景 8：2 个参数、默认值 60,4 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(1, 8);
      const target: SceneSpec = CAPABILITY_GROUPS[1].scenes[8];
      expect(target.params.length).assertEqual(MX_GEOMETRY_8_COUNT);
      expect(defaultsText(target)).assertEqual(MX_GEOMETRY_8_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_GEOMETRY_8_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0020
     * @tc.name      testNdkRenderNodeMatrix0020
     * @tc.desc      geometry 场景 9：2 个参数、默认值 2,15 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(1, 9);
      const target: SceneSpec = CAPABILITY_GROUPS[1].scenes[9];
      expect(target.params.length).assertEqual(MX_GEOMETRY_9_COUNT);
      expect(defaultsText(target)).assertEqual(MX_GEOMETRY_9_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_GEOMETRY_9_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0021
     * @tc.name      testNdkRenderNodeMatrix0021
     * @tc.desc      geometry 场景 10：2 个参数、默认值 0,20 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(1, 10);
      const target: SceneSpec = CAPABILITY_GROUPS[1].scenes[10];
      expect(target.params.length).assertEqual(MX_GEOMETRY_10_COUNT);
      expect(defaultsText(target)).assertEqual(MX_GEOMETRY_10_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_GEOMETRY_10_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0022
     * @tc.name      testNdkRenderNodeMatrix0022
     * @tc.desc      paint 场景 0：2 个参数、默认值 2,16 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(2, 0);
      const target: SceneSpec = CAPABILITY_GROUPS[2].scenes[0];
      expect(target.params.length).assertEqual(MX_PAINT_0_COUNT);
      expect(defaultsText(target)).assertEqual(MX_PAINT_0_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_PAINT_0_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0023
     * @tc.name      testNdkRenderNodeMatrix0023
     * @tc.desc      paint 场景 1：2 个参数、默认值 1,18 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(2, 1);
      const target: SceneSpec = CAPABILITY_GROUPS[2].scenes[1];
      expect(target.params.length).assertEqual(MX_PAINT_1_COUNT);
      expect(defaultsText(target)).assertEqual(MX_PAINT_1_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_PAINT_1_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0024
     * @tc.name      testNdkRenderNodeMatrix0024
     * @tc.desc      paint 场景 2：2 个参数、默认值 4,16 与首参下界 1 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(2, 2);
      const target: SceneSpec = CAPABILITY_GROUPS[2].scenes[2];
      expect(target.params.length).assertEqual(MX_PAINT_2_COUNT);
      expect(defaultsText(target)).assertEqual(MX_PAINT_2_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_PAINT_2_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0025
     * @tc.name      testNdkRenderNodeMatrix0025
     * @tc.desc      paint 场景 3：2 个参数、默认值 12,100 与首参下界 1 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(2, 3);
      const target: SceneSpec = CAPABILITY_GROUPS[2].scenes[3];
      expect(target.params.length).assertEqual(MX_PAINT_3_COUNT);
      expect(defaultsText(target)).assertEqual(MX_PAINT_3_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_PAINT_3_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0026
     * @tc.name      testNdkRenderNodeMatrix0026
     * @tc.desc      paint 场景 4：2 个参数、默认值 60,3 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(2, 4);
      const target: SceneSpec = CAPABILITY_GROUPS[2].scenes[4];
      expect(target.params.length).assertEqual(MX_PAINT_4_COUNT);
      expect(defaultsText(target)).assertEqual(MX_PAINT_4_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_PAINT_4_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0027
     * @tc.name      testNdkRenderNodeMatrix0027
     * @tc.desc      paint 场景 5：2 个参数、默认值 0,100 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(2, 5);
      const target: SceneSpec = CAPABILITY_GROUPS[2].scenes[5];
      expect(target.params.length).assertEqual(MX_PAINT_5_COUNT);
      expect(defaultsText(target)).assertEqual(MX_PAINT_5_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_PAINT_5_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0028
     * @tc.name      testNdkRenderNodeMatrix0028
     * @tc.desc      paint 场景 6：2 个参数、默认值 16,8 与首参下界 2 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(2, 6);
      const target: SceneSpec = CAPABILITY_GROUPS[2].scenes[6];
      expect(target.params.length).assertEqual(MX_PAINT_6_COUNT);
      expect(defaultsText(target)).assertEqual(MX_PAINT_6_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_PAINT_6_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0029
     * @tc.name      testNdkRenderNodeMatrix0029
     * @tc.desc      paint 场景 7：2 个参数、默认值 16,12 与首参下界 2 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(2, 7);
      const target: SceneSpec = CAPABILITY_GROUPS[2].scenes[7];
      expect(target.params.length).assertEqual(MX_PAINT_7_COUNT);
      expect(defaultsText(target)).assertEqual(MX_PAINT_7_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_PAINT_7_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0030
     * @tc.name      testNdkRenderNodeMatrix0030
     * @tc.desc      paint 场景 8：2 个参数、默认值 10,6 与首参下界 2 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(2, 8);
      const target: SceneSpec = CAPABILITY_GROUPS[2].scenes[8];
      expect(target.params.length).assertEqual(MX_PAINT_8_COUNT);
      expect(defaultsText(target)).assertEqual(MX_PAINT_8_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_PAINT_8_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0031
     * @tc.name      testNdkRenderNodeMatrix0031
     * @tc.desc      paint 场景 9：2 个参数、默认值 16,10 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(2, 9);
      const target: SceneSpec = CAPABILITY_GROUPS[2].scenes[9];
      expect(target.params.length).assertEqual(MX_PAINT_9_COUNT);
      expect(defaultsText(target)).assertEqual(MX_PAINT_9_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_PAINT_9_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0032
     * @tc.name      testNdkRenderNodeMatrix0032
     * @tc.desc      color 场景 0：2 个参数、默认值 6,100 与首参下界 3 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(3, 0);
      const target: SceneSpec = CAPABILITY_GROUPS[3].scenes[0];
      expect(target.params.length).assertEqual(MX_COLOR_0_COUNT);
      expect(defaultsText(target)).assertEqual(MX_COLOR_0_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_COLOR_0_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0033
     * @tc.name      testNdkRenderNodeMatrix0033
     * @tc.desc      color 场景 1：2 个参数、默认值 8,1 与首参下界 4 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(3, 1);
      const target: SceneSpec = CAPABILITY_GROUPS[3].scenes[1];
      expect(target.params.length).assertEqual(MX_COLOR_1_COUNT);
      expect(defaultsText(target)).assertEqual(MX_COLOR_1_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_COLOR_1_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0034
     * @tc.name      testNdkRenderNodeMatrix0034
     * @tc.desc      color 场景 2：3 个参数、默认值 50,0,2 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(3, 2);
      const target: SceneSpec = CAPABILITY_GROUPS[3].scenes[2];
      expect(target.params.length).assertEqual(MX_COLOR_2_COUNT);
      expect(defaultsText(target)).assertEqual(MX_COLOR_2_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_COLOR_2_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0035
     * @tc.name      testNdkRenderNodeMatrix0035
     * @tc.desc      color 场景 3：2 个参数、默认值 80,1 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(3, 3);
      const target: SceneSpec = CAPABILITY_GROUPS[3].scenes[3];
      expect(target.params.length).assertEqual(MX_COLOR_3_COUNT);
      expect(defaultsText(target)).assertEqual(MX_COLOR_3_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_COLOR_3_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0036
     * @tc.name      testNdkRenderNodeMatrix0036
     * @tc.desc      color 场景 4：2 个参数、默认值 80,2 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(3, 4);
      const target: SceneSpec = CAPABILITY_GROUPS[3].scenes[4];
      expect(target.params.length).assertEqual(MX_COLOR_4_COUNT);
      expect(defaultsText(target)).assertEqual(MX_COLOR_4_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_COLOR_4_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0037
     * @tc.name      testNdkRenderNodeMatrix0037
     * @tc.desc      color 场景 5：2 个参数、默认值 1.5,3 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(3, 5);
      const target: SceneSpec = CAPABILITY_GROUPS[3].scenes[5];
      expect(target.params.length).assertEqual(MX_COLOR_5_COUNT);
      expect(defaultsText(target)).assertEqual(MX_COLOR_5_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_COLOR_5_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0038
     * @tc.name      testNdkRenderNodeMatrix0038
     * @tc.desc      color 场景 6：2 个参数、默认值 100,0 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(3, 6);
      const target: SceneSpec = CAPABILITY_GROUPS[3].scenes[6];
      expect(target.params.length).assertEqual(MX_COLOR_6_COUNT);
      expect(defaultsText(target)).assertEqual(MX_COLOR_6_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_COLOR_6_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0039
     * @tc.name      testNdkRenderNodeMatrix0039
     * @tc.desc      color 场景 7：2 个参数、默认值 50,1 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(3, 7);
      const target: SceneSpec = CAPABILITY_GROUPS[3].scenes[7];
      expect(target.params.length).assertEqual(MX_COLOR_7_COUNT);
      expect(defaultsText(target)).assertEqual(MX_COLOR_7_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_COLOR_7_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0040
     * @tc.name      testNdkRenderNodeMatrix0040
     * @tc.desc      color 场景 8：2 个参数、默认值 50,4 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(3, 8);
      const target: SceneSpec = CAPABILITY_GROUPS[3].scenes[8];
      expect(target.params.length).assertEqual(MX_COLOR_8_COUNT);
      expect(defaultsText(target)).assertEqual(MX_COLOR_8_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_COLOR_8_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0041
     * @tc.name      testNdkRenderNodeMatrix0041
     * @tc.desc      color_filter 场景 0：2 个参数、默认值 0,2 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(4, 0);
      const target: SceneSpec = CAPABILITY_GROUPS[4].scenes[0];
      expect(target.params.length).assertEqual(MX_COLORFILTER_0_COUNT);
      expect(defaultsText(target)).assertEqual(MX_COLORFILTER_0_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_COLORFILTER_0_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0042
     * @tc.name      testNdkRenderNodeMatrix0042
     * @tc.desc      color_filter 场景 1：2 个参数、默认值 0,100 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(4, 1);
      const target: SceneSpec = CAPABILITY_GROUPS[4].scenes[1];
      expect(target.params.length).assertEqual(MX_COLORFILTER_1_COUNT);
      expect(defaultsText(target)).assertEqual(MX_COLORFILTER_1_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_COLORFILTER_1_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0043
     * @tc.name      testNdkRenderNodeMatrix0043
     * @tc.desc      color_filter 场景 2：2 个参数、默认值 70,100 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(4, 2);
      const target: SceneSpec = CAPABILITY_GROUPS[4].scenes[2];
      expect(target.params.length).assertEqual(MX_COLORFILTER_2_COUNT);
      expect(defaultsText(target)).assertEqual(MX_COLORFILTER_2_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_COLORFILTER_2_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0044
     * @tc.name      testNdkRenderNodeMatrix0044
     * @tc.desc      color_filter 场景 3：2 个参数、默认值 100,100 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(4, 3);
      const target: SceneSpec = CAPABILITY_GROUPS[4].scenes[3];
      expect(target.params.length).assertEqual(MX_COLORFILTER_3_COUNT);
      expect(defaultsText(target)).assertEqual(MX_COLORFILTER_3_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_COLORFILTER_3_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0045
     * @tc.name      testNdkRenderNodeMatrix0045
     * @tc.desc      color_filter 场景 4：2 个参数、默认值 1.5,100 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(4, 4);
      const target: SceneSpec = CAPABILITY_GROUPS[4].scenes[4];
      expect(target.params.length).assertEqual(MX_COLORFILTER_4_COUNT);
      expect(defaultsText(target)).assertEqual(MX_COLORFILTER_4_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_COLORFILTER_4_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0046
     * @tc.name      testNdkRenderNodeMatrix0046
     * @tc.desc      color_filter 场景 5：2 个参数、默认值 100,1 与首参下界 20 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(4, 5);
      const target: SceneSpec = CAPABILITY_GROUPS[4].scenes[5];
      expect(target.params.length).assertEqual(MX_COLORFILTER_5_COUNT);
      expect(defaultsText(target)).assertEqual(MX_COLORFILTER_5_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_COLORFILTER_5_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0047
     * @tc.name      testNdkRenderNodeMatrix0047
     * @tc.desc      color_filter 场景 6：2 个参数、默认值 0,1 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(4, 6);
      const target: SceneSpec = CAPABILITY_GROUPS[4].scenes[6];
      expect(target.params.length).assertEqual(MX_COLORFILTER_6_COUNT);
      expect(defaultsText(target)).assertEqual(MX_COLORFILTER_6_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_COLORFILTER_6_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0048
     * @tc.name      testNdkRenderNodeMatrix0048
     * @tc.desc      color_filter 场景 7：2 个参数、默认值 1,4 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(4, 7);
      const target: SceneSpec = CAPABILITY_GROUPS[4].scenes[7];
      expect(target.params.length).assertEqual(MX_COLORFILTER_7_COUNT);
      expect(defaultsText(target)).assertEqual(MX_COLORFILTER_7_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_COLORFILTER_7_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0049
     * @tc.name      testNdkRenderNodeMatrix0049
     * @tc.desc      color_filter 场景 8：2 个参数、默认值 1,10 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(4, 8);
      const target: SceneSpec = CAPABILITY_GROUPS[4].scenes[8];
      expect(target.params.length).assertEqual(MX_COLORFILTER_8_COUNT);
      expect(defaultsText(target)).assertEqual(MX_COLORFILTER_8_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_COLORFILTER_8_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0050
     * @tc.name      testNdkRenderNodeMatrix0050
     * @tc.desc      shader 场景 0：2 个参数、默认值 45,100 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(5, 0);
      const target: SceneSpec = CAPABILITY_GROUPS[5].scenes[0];
      expect(target.params.length).assertEqual(MX_SHADER_0_COUNT);
      expect(defaultsText(target)).assertEqual(MX_SHADER_0_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_SHADER_0_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0051
     * @tc.name      testNdkRenderNodeMatrix0051
     * @tc.desc      shader 场景 1：2 个参数、默认值 3,0 与首参下界 2 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(5, 1);
      const target: SceneSpec = CAPABILITY_GROUPS[5].scenes[1];
      expect(target.params.length).assertEqual(MX_SHADER_1_COUNT);
      expect(defaultsText(target)).assertEqual(MX_SHADER_1_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_SHADER_1_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0052
     * @tc.name      testNdkRenderNodeMatrix0052
     * @tc.desc      shader 场景 2：2 个参数、默认值 35,50 与首参下界 10 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(5, 2);
      const target: SceneSpec = CAPABILITY_GROUPS[5].scenes[2];
      expect(target.params.length).assertEqual(MX_SHADER_2_COUNT);
      expect(defaultsText(target)).assertEqual(MX_SHADER_2_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_SHADER_2_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0053
     * @tc.name      testNdkRenderNodeMatrix0053
     * @tc.desc      shader 场景 3：2 个参数、默认值 0,100 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(5, 3);
      const target: SceneSpec = CAPABILITY_GROUPS[5].scenes[3];
      expect(target.params.length).assertEqual(MX_SHADER_3_COUNT);
      expect(defaultsText(target)).assertEqual(MX_SHADER_3_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_SHADER_3_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0054
     * @tc.name      testNdkRenderNodeMatrix0054
     * @tc.desc      shader 场景 4：2 个参数、默认值 10,50 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(5, 4);
      const target: SceneSpec = CAPABILITY_GROUPS[5].scenes[4];
      expect(target.params.length).assertEqual(MX_SHADER_4_COUNT);
      expect(defaultsText(target)).assertEqual(MX_SHADER_4_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_SHADER_4_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0055
     * @tc.name      testNdkRenderNodeMatrix0055
     * @tc.desc      shader 场景 5：2 个参数、默认值 1,100 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(5, 5);
      const target: SceneSpec = CAPABILITY_GROUPS[5].scenes[5];
      expect(target.params.length).assertEqual(MX_SHADER_5_COUNT);
      expect(defaultsText(target)).assertEqual(MX_SHADER_5_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_SHADER_5_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0056
     * @tc.name      testNdkRenderNodeMatrix0056
     * @tc.desc      shader 场景 6：2 个参数、默认值 0,45 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(5, 6);
      const target: SceneSpec = CAPABILITY_GROUPS[5].scenes[6];
      expect(target.params.length).assertEqual(MX_SHADER_6_COUNT);
      expect(defaultsText(target)).assertEqual(MX_SHADER_6_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_SHADER_6_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0057
     * @tc.name      testNdkRenderNodeMatrix0057
     * @tc.desc      shader 场景 7：2 个参数、默认值 12,0 与首参下界 2 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(5, 7);
      const target: SceneSpec = CAPABILITY_GROUPS[5].scenes[7];
      expect(target.params.length).assertEqual(MX_SHADER_7_COUNT);
      expect(defaultsText(target)).assertEqual(MX_SHADER_7_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_SHADER_7_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0058
     * @tc.name      testNdkRenderNodeMatrix0058
     * @tc.desc      shader 场景 8：2 个参数、默认值 100,30 与首参下界 20 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(5, 8);
      const target: SceneSpec = CAPABILITY_GROUPS[5].scenes[8];
      expect(target.params.length).assertEqual(MX_SHADER_8_COUNT);
      expect(defaultsText(target)).assertEqual(MX_SHADER_8_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_SHADER_8_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0059
     * @tc.name      testNdkRenderNodeMatrix0059
     * @tc.desc      shader 场景 9：2 个参数、默认值 1,3 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(5, 9);
      const target: SceneSpec = CAPABILITY_GROUPS[5].scenes[9];
      expect(target.params.length).assertEqual(MX_SHADER_9_COUNT);
      expect(defaultsText(target)).assertEqual(MX_SHADER_9_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_SHADER_9_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0060
     * @tc.name      testNdkRenderNodeMatrix0060
     * @tc.desc      shader 场景 10：2 个参数、默认值 100,20 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(5, 10);
      const target: SceneSpec = CAPABILITY_GROUPS[5].scenes[10];
      expect(target.params.length).assertEqual(MX_SHADER_10_COUNT);
      expect(defaultsText(target)).assertEqual(MX_SHADER_10_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_SHADER_10_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0061
     * @tc.name      testNdkRenderNodeMatrix0061
     * @tc.desc      mask_filter 场景 0：3 个参数、默认值 1,12,85 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(6, 0);
      const target: SceneSpec = CAPABILITY_GROUPS[6].scenes[0];
      expect(target.params.length).assertEqual(MX_MASKFILTER_0_COUNT);
      expect(defaultsText(target)).assertEqual(MX_MASKFILTER_0_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_MASKFILTER_0_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0062
     * @tc.name      testNdkRenderNodeMatrix0062
     * @tc.desc      mask_filter 场景 1：3 个参数、默认值 2,16,90 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(6, 1);
      const target: SceneSpec = CAPABILITY_GROUPS[6].scenes[1];
      expect(target.params.length).assertEqual(MX_MASKFILTER_1_COUNT);
      expect(defaultsText(target)).assertEqual(MX_MASKFILTER_1_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_MASKFILTER_1_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0063
     * @tc.name      testNdkRenderNodeMatrix0063
     * @tc.desc      mask_filter 场景 2：3 个参数、默认值 3,20,95 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(6, 2);
      const target: SceneSpec = CAPABILITY_GROUPS[6].scenes[2];
      expect(target.params.length).assertEqual(MX_MASKFILTER_2_COUNT);
      expect(defaultsText(target)).assertEqual(MX_MASKFILTER_2_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_MASKFILTER_2_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0064
     * @tc.name      testNdkRenderNodeMatrix0064
     * @tc.desc      mask_filter 场景 3：3 个参数、默认值 4,20,95 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(6, 3);
      const target: SceneSpec = CAPABILITY_GROUPS[6].scenes[3];
      expect(target.params.length).assertEqual(MX_MASKFILTER_3_COUNT);
      expect(defaultsText(target)).assertEqual(MX_MASKFILTER_3_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_MASKFILTER_3_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0065
     * @tc.name      testNdkRenderNodeMatrix0065
     * @tc.desc      mask_filter 场景 4：3 个参数、默认值 1,6,8 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(6, 4);
      const target: SceneSpec = CAPABILITY_GROUPS[6].scenes[4];
      expect(target.params.length).assertEqual(MX_MASKFILTER_4_COUNT);
      expect(defaultsText(target)).assertEqual(MX_MASKFILTER_4_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_MASKFILTER_4_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0066
     * @tc.name      testNdkRenderNodeMatrix0066
     * @tc.desc      mask_filter 场景 5：4 个参数、默认值 3,14,8,1 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(6, 5);
      const target: SceneSpec = CAPABILITY_GROUPS[6].scenes[5];
      expect(target.params.length).assertEqual(MX_MASKFILTER_5_COUNT);
      expect(defaultsText(target)).assertEqual(MX_MASKFILTER_5_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_MASKFILTER_5_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0067
     * @tc.name      testNdkRenderNodeMatrix0067
     * @tc.desc      mask_filter 场景 6：3 个参数、默认值 5,18,90 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(6, 6);
      const target: SceneSpec = CAPABILITY_GROUPS[6].scenes[6];
      expect(target.params.length).assertEqual(MX_MASKFILTER_6_COUNT);
      expect(defaultsText(target)).assertEqual(MX_MASKFILTER_6_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_MASKFILTER_6_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0068
     * @tc.name      testNdkRenderNodeMatrix0068
     * @tc.desc      mask_filter 场景 7：3 个参数、默认值 1,10,22 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(6, 7);
      const target: SceneSpec = CAPABILITY_GROUPS[6].scenes[7];
      expect(target.params.length).assertEqual(MX_MASKFILTER_7_COUNT);
      expect(defaultsText(target)).assertEqual(MX_MASKFILTER_7_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_MASKFILTER_7_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0069
     * @tc.name      testNdkRenderNodeMatrix0069
     * @tc.desc      image_filter 场景 0：4 个参数、默认值 1,12,12,0 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(7, 0);
      const target: SceneSpec = CAPABILITY_GROUPS[7].scenes[0];
      expect(target.params.length).assertEqual(MX_IMAGEFILTER_0_COUNT);
      expect(defaultsText(target)).assertEqual(MX_IMAGEFILTER_0_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_IMAGEFILTER_0_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0070
     * @tc.name      testNdkRenderNodeMatrix0070
     * @tc.desc      image_filter 场景 1：3 个参数、默认值 2,16,60 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(7, 1);
      const target: SceneSpec = CAPABILITY_GROUPS[7].scenes[1];
      expect(target.params.length).assertEqual(MX_IMAGEFILTER_1_COUNT);
      expect(defaultsText(target)).assertEqual(MX_IMAGEFILTER_1_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_IMAGEFILTER_1_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0071
     * @tc.name      testNdkRenderNodeMatrix0071
     * @tc.desc      image_filter 场景 2：3 个参数、默认值 3,10,10 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(7, 2);
      const target: SceneSpec = CAPABILITY_GROUPS[7].scenes[2];
      expect(target.params.length).assertEqual(MX_IMAGEFILTER_2_COUNT);
      expect(defaultsText(target)).assertEqual(MX_IMAGEFILTER_2_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_IMAGEFILTER_2_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0072
     * @tc.name      testNdkRenderNodeMatrix0072
     * @tc.desc      image_filter 场景 3：2 个参数、默认值 4,0 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(7, 3);
      const target: SceneSpec = CAPABILITY_GROUPS[7].scenes[3];
      expect(target.params.length).assertEqual(MX_IMAGEFILTER_3_COUNT);
      expect(defaultsText(target)).assertEqual(MX_IMAGEFILTER_3_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_IMAGEFILTER_3_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0073
     * @tc.name      testNdkRenderNodeMatrix0073
     * @tc.desc      image_filter 场景 4：2 个参数、默认值 5,45 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(7, 4);
      const target: SceneSpec = CAPABILITY_GROUPS[7].scenes[4];
      expect(target.params.length).assertEqual(MX_IMAGEFILTER_4_COUNT);
      expect(defaultsText(target)).assertEqual(MX_IMAGEFILTER_4_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_IMAGEFILTER_4_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0074
     * @tc.name      testNdkRenderNodeMatrix0074
     * @tc.desc      image_filter 场景 5：2 个参数、默认值 1,2 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(7, 5);
      const target: SceneSpec = CAPABILITY_GROUPS[7].scenes[5];
      expect(target.params.length).assertEqual(MX_IMAGEFILTER_5_COUNT);
      expect(defaultsText(target)).assertEqual(MX_IMAGEFILTER_5_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_IMAGEFILTER_5_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0075
     * @tc.name      testNdkRenderNodeMatrix0075
     * @tc.desc      image_filter 场景 6：3 个参数、默认值 2,14,90 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(7, 6);
      const target: SceneSpec = CAPABILITY_GROUPS[7].scenes[6];
      expect(target.params.length).assertEqual(MX_IMAGEFILTER_6_COUNT);
      expect(defaultsText(target)).assertEqual(MX_IMAGEFILTER_6_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_IMAGEFILTER_6_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0076
     * @tc.name      testNdkRenderNodeMatrix0076
     * @tc.desc      image_filter 场景 7：3 个参数、默认值 3,14,90 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(7, 7);
      const target: SceneSpec = CAPABILITY_GROUPS[7].scenes[7];
      expect(target.params.length).assertEqual(MX_IMAGEFILTER_7_COUNT);
      expect(defaultsText(target)).assertEqual(MX_IMAGEFILTER_7_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_IMAGEFILTER_7_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0077
     * @tc.name      testNdkRenderNodeMatrix0077
     * @tc.desc      image_filter 场景 8：3 个参数、默认值 4,14,90 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(7, 8);
      const target: SceneSpec = CAPABILITY_GROUPS[7].scenes[8];
      expect(target.params.length).assertEqual(MX_IMAGEFILTER_8_COUNT);
      expect(defaultsText(target)).assertEqual(MX_IMAGEFILTER_8_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_IMAGEFILTER_8_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0078
     * @tc.name      testNdkRenderNodeMatrix0078
     * @tc.desc      image_filter 场景 9：3 个参数、默认值 4,18,95 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(7, 9);
      const target: SceneSpec = CAPABILITY_GROUPS[7].scenes[9];
      expect(target.params.length).assertEqual(MX_IMAGEFILTER_9_COUNT);
      expect(defaultsText(target)).assertEqual(MX_IMAGEFILTER_9_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_IMAGEFILTER_9_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0079
     * @tc.name      testNdkRenderNodeMatrix0079
     * @tc.desc      bitmap 场景 0：2 个参数、默认值 1,40 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(8, 0);
      const target: SceneSpec = CAPABILITY_GROUPS[8].scenes[0];
      expect(target.params.length).assertEqual(MX_BITMAP_0_COUNT);
      expect(defaultsText(target)).assertEqual(MX_BITMAP_0_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_BITMAP_0_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0080
     * @tc.name      testNdkRenderNodeMatrix0080
     * @tc.desc      bitmap 场景 1：2 个参数、默认值 2,96 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(8, 1);
      const target: SceneSpec = CAPABILITY_GROUPS[8].scenes[1];
      expect(target.params.length).assertEqual(MX_BITMAP_1_COUNT);
      expect(defaultsText(target)).assertEqual(MX_BITMAP_1_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_BITMAP_1_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0081
     * @tc.name      testNdkRenderNodeMatrix0081
     * @tc.desc      bitmap 场景 2：2 个参数、默认值 3,80 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(8, 2);
      const target: SceneSpec = CAPABILITY_GROUPS[8].scenes[2];
      expect(target.params.length).assertEqual(MX_BITMAP_2_COUNT);
      expect(defaultsText(target)).assertEqual(MX_BITMAP_2_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_BITMAP_2_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0082
     * @tc.name      testNdkRenderNodeMatrix0082
     * @tc.desc      bitmap 场景 3：1 个参数、默认值 4 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(8, 3);
      const target: SceneSpec = CAPABILITY_GROUPS[8].scenes[3];
      expect(target.params.length).assertEqual(MX_BITMAP_3_COUNT);
      expect(defaultsText(target)).assertEqual(MX_BITMAP_3_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_BITMAP_3_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0083
     * @tc.name      testNdkRenderNodeMatrix0083
     * @tc.desc      bitmap 场景 4：2 个参数、默认值 5,4 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(8, 4);
      const target: SceneSpec = CAPABILITY_GROUPS[8].scenes[4];
      expect(target.params.length).assertEqual(MX_BITMAP_4_COUNT);
      expect(defaultsText(target)).assertEqual(MX_BITMAP_4_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_BITMAP_4_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0084
     * @tc.name      testNdkRenderNodeMatrix0084
     * @tc.desc      bitmap 场景 5：3 个参数、默认值 1,64,32 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(8, 5);
      const target: SceneSpec = CAPABILITY_GROUPS[8].scenes[5];
      expect(target.params.length).assertEqual(MX_BITMAP_5_COUNT);
      expect(defaultsText(target)).assertEqual(MX_BITMAP_5_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_BITMAP_5_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0085
     * @tc.name      testNdkRenderNodeMatrix0085
     * @tc.desc      bitmap 场景 6：2 个参数、默认值 3,50 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(8, 6);
      const target: SceneSpec = CAPABILITY_GROUPS[8].scenes[6];
      expect(target.params.length).assertEqual(MX_BITMAP_6_COUNT);
      expect(defaultsText(target)).assertEqual(MX_BITMAP_6_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_BITMAP_6_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0086
     * @tc.name      testNdkRenderNodeMatrix0086
     * @tc.desc      bitmap 场景 7：1 个参数、默认值 4 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(8, 7);
      const target: SceneSpec = CAPABILITY_GROUPS[8].scenes[7];
      expect(target.params.length).assertEqual(MX_BITMAP_7_COUNT);
      expect(defaultsText(target)).assertEqual(MX_BITMAP_7_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_BITMAP_7_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0087
     * @tc.name      testNdkRenderNodeMatrix0087
     * @tc.desc      bitmap 场景 8：2 个参数、默认值 5,64 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(8, 8);
      const target: SceneSpec = CAPABILITY_GROUPS[8].scenes[8];
      expect(target.params.length).assertEqual(MX_BITMAP_8_COUNT);
      expect(defaultsText(target)).assertEqual(MX_BITMAP_8_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_BITMAP_8_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0088
     * @tc.name      testNdkRenderNodeMatrix0088
     * @tc.desc      bitmap 场景 9：2 个参数、默认值 1,4 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(8, 9);
      const target: SceneSpec = CAPABILITY_GROUPS[8].scenes[9];
      expect(target.params.length).assertEqual(MX_BITMAP_9_COUNT);
      expect(defaultsText(target)).assertEqual(MX_BITMAP_9_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_BITMAP_9_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0089
     * @tc.name      testNdkRenderNodeMatrix0089
     * @tc.desc      pixelmap 场景 0：3 个参数、默认值 1,70,1 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(9, 0);
      const target: SceneSpec = CAPABILITY_GROUPS[9].scenes[0];
      expect(target.params.length).assertEqual(MX_PIXELMAP_0_COUNT);
      expect(defaultsText(target)).assertEqual(MX_PIXELMAP_0_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_PIXELMAP_0_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0090
     * @tc.name      testNdkRenderNodeMatrix0090
     * @tc.desc      pixelmap 场景 1：2 个参数、默认值 2,80 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(9, 1);
      const target: SceneSpec = CAPABILITY_GROUPS[9].scenes[1];
      expect(target.params.length).assertEqual(MX_PIXELMAP_1_COUNT);
      expect(defaultsText(target)).assertEqual(MX_PIXELMAP_1_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_PIXELMAP_1_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0091
     * @tc.name      testNdkRenderNodeMatrix0091
     * @tc.desc      pixelmap 场景 2：2 个参数、默认值 2,80 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(9, 2);
      const target: SceneSpec = CAPABILITY_GROUPS[9].scenes[2];
      expect(target.params.length).assertEqual(MX_PIXELMAP_2_COUNT);
      expect(defaultsText(target)).assertEqual(MX_PIXELMAP_2_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_PIXELMAP_2_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0092
     * @tc.name      testNdkRenderNodeMatrix0092
     * @tc.desc      pixelmap 场景 3：3 个参数、默认值 3,50,0 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(9, 3);
      const target: SceneSpec = CAPABILITY_GROUPS[9].scenes[3];
      expect(target.params.length).assertEqual(MX_PIXELMAP_3_COUNT);
      expect(defaultsText(target)).assertEqual(MX_PIXELMAP_3_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_PIXELMAP_3_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0093
     * @tc.name      testNdkRenderNodeMatrix0093
     * @tc.desc      pixelmap 场景 4：3 个参数、默认值 4,30,0 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(9, 4);
      const target: SceneSpec = CAPABILITY_GROUPS[9].scenes[4];
      expect(target.params.length).assertEqual(MX_PIXELMAP_4_COUNT);
      expect(defaultsText(target)).assertEqual(MX_PIXELMAP_4_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_PIXELMAP_4_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0094
     * @tc.name      testNdkRenderNodeMatrix0094
     * @tc.desc      pixelmap 场景 5：2 个参数、默认值 5,8 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(9, 5);
      const target: SceneSpec = CAPABILITY_GROUPS[9].scenes[5];
      expect(target.params.length).assertEqual(MX_PIXELMAP_5_COUNT);
      expect(defaultsText(target)).assertEqual(MX_PIXELMAP_5_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_PIXELMAP_5_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0095
     * @tc.name      testNdkRenderNodeMatrix0095
     * @tc.desc      pixelmap 场景 6：1 个参数、默认值 15 与首参下界 -180 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(9, 6);
      const target: SceneSpec = CAPABILITY_GROUPS[9].scenes[6];
      expect(target.params.length).assertEqual(MX_PIXELMAP_6_COUNT);
      expect(defaultsText(target)).assertEqual(MX_PIXELMAP_6_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_PIXELMAP_6_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0096
     * @tc.name      testNdkRenderNodeMatrix0096
     * @tc.desc      pixelmap 场景 7：1 个参数、默认值 3 与首参下界 1 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(9, 7);
      const target: SceneSpec = CAPABILITY_GROUPS[9].scenes[7];
      expect(target.params.length).assertEqual(MX_PIXELMAP_7_COUNT);
      expect(defaultsText(target)).assertEqual(MX_PIXELMAP_7_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_PIXELMAP_7_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0097
     * @tc.name      testNdkRenderNodeMatrix0097
     * @tc.desc      pixelmap 场景 8：2 个参数、默认值 2,50 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(9, 8);
      const target: SceneSpec = CAPABILITY_GROUPS[9].scenes[8];
      expect(target.params.length).assertEqual(MX_PIXELMAP_8_COUNT);
      expect(defaultsText(target)).assertEqual(MX_PIXELMAP_8_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_PIXELMAP_8_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0098
     * @tc.name      testNdkRenderNodeMatrix0098
     * @tc.desc      pixelmap 场景 9：1 个参数、默认值 60 与首参下界 10 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(9, 9);
      const target: SceneSpec = CAPABILITY_GROUPS[9].scenes[9];
      expect(target.params.length).assertEqual(MX_PIXELMAP_9_COUNT);
      expect(defaultsText(target)).assertEqual(MX_PIXELMAP_9_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_PIXELMAP_9_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0099
     * @tc.name      testNdkRenderNodeMatrix0099
     * @tc.desc      pixelmap 场景 10：2 个参数、默认值 4,12 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(9, 10);
      const target: SceneSpec = CAPABILITY_GROUPS[9].scenes[10];
      expect(target.params.length).assertEqual(MX_PIXELMAP_10_COUNT);
      expect(defaultsText(target)).assertEqual(MX_PIXELMAP_10_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_PIXELMAP_10_LOW0);
    })

    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_0100
     * @tc.name      testNdkRenderNodeMatrix0100
     * @tc.desc      pixelmap 场景 11：1 个参数、默认值 1 与首参下界 0 符合冻结基线。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodeMatrix0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      verifyScene(9, 11);
      const target: SceneSpec = CAPABILITY_GROUPS[9].scenes[11];
      expect(target.params.length).assertEqual(MX_PIXELMAP_11_COUNT);
      expect(defaultsText(target)).assertEqual(MX_PIXELMAP_11_DEFAULTS);
      expect(ParamEngine.clamp(target.params[0], PROBE_MIN)).assertEqual(MX_PIXELMAP_11_LOW0);
    })
    /**
     * @tc.number    SUB_RENDER_NODE_MATRIX_TOTAL_0001
     * @tc.name      testNdkRenderNodeMatrixTotal0001
     * @tc.desc      校验十九个能力域编号连续、场景数逐域等于 native 声明、场景总数为 188。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodeMatrixTotal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(CAPABILITY_GROUPS.length).assertEqual(CAPABILITY_SCENE_COUNTS.length);
      let total: number = 0;
      for (let index = 0; index < CAPABILITY_GROUPS.length; index++) {
        const group: GroupSpec = CAPABILITY_GROUPS[index];
        expect(group.id).assertEqual(index + 1);
        expect(group.scenes.length).assertEqual(CAPABILITY_SCENE_COUNTS[index]);
        total += group.scenes.length;
      }
      expect(total).assertEqual(CAPABILITY_SCENE_TOTAL);
      expect(MAX_SCENE_PARAMS).assertEqual(8);
      logInfo('capability matrix total scenes = ' + total.toString());
    })
  })
}
