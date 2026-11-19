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

// 六个能力域（颜色滤波器至像素图）逐场景像素基线：48 个场景各一条，
// 断言「能重绘、画出了内容、帧尺寸不变、重复绘制逐字节一致」。
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { UIContext } from '@kit.ArkUI';
import {
  GROUP_COLOR_FILTER, GROUP_SHADER, GROUP_MASK_FILTER, GROUP_IMAGE_FILTER, GROUP_BITMAP, GROUP_PIXELMAP
} from '../../../main/ets/core/SchemaTypes';
import { MIN_CHANGED_PIXELS, readyUiContext, waitReady } from './PixelProbe';
import { DrawFrame, drawFrame, RepeatObs, repeatPair } from './PixelCaseSupport';

const TAG: string = '[Sample_NdkRenderNodePixelSceneB]';
const DOMAIN: number = 0xF811;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

// 场景下标常量：每个场景一个具名常量，避免用例体退化成同一段数字。
const COLOR_FILTER_SCENE_02: number = 2;
const COLOR_FILTER_SCENE_03: number = 3;
const COLOR_FILTER_SCENE_04: number = 4;
const COLOR_FILTER_SCENE_05: number = 5;
const COLOR_FILTER_SCENE_06: number = 6;
const COLOR_FILTER_SCENE_07: number = 7;
const COLOR_FILTER_SCENE_08: number = 8;
const SHADER_SCENE_02: number = 2;
const SHADER_SCENE_03: number = 3;
const SHADER_SCENE_04: number = 4;
const SHADER_SCENE_05: number = 5;
const SHADER_SCENE_06: number = 6;
const SHADER_SCENE_07: number = 7;
const SHADER_SCENE_08: number = 8;
const SHADER_SCENE_09: number = 9;
const SHADER_SCENE_10: number = 10;
const MASK_FILTER_SCENE_02: number = 2;
const MASK_FILTER_SCENE_03: number = 3;
const MASK_FILTER_SCENE_04: number = 4;
const MASK_FILTER_SCENE_05: number = 5;
const MASK_FILTER_SCENE_06: number = 6;
const MASK_FILTER_SCENE_07: number = 7;
const IMAGE_FILTER_SCENE_02: number = 2;
const IMAGE_FILTER_SCENE_03: number = 3;
const IMAGE_FILTER_SCENE_04: number = 4;
const IMAGE_FILTER_SCENE_05: number = 5;
const IMAGE_FILTER_SCENE_06: number = 6;
const IMAGE_FILTER_SCENE_07: number = 7;
const IMAGE_FILTER_SCENE_08: number = 8;
const IMAGE_FILTER_SCENE_09: number = 9;
const BITMAP_SCENE_02: number = 2;
const BITMAP_SCENE_03: number = 3;
const BITMAP_SCENE_04: number = 4;
const BITMAP_SCENE_05: number = 5;
const BITMAP_SCENE_06: number = 6;
const BITMAP_SCENE_07: number = 7;
const BITMAP_SCENE_08: number = 8;
const BITMAP_SCENE_09: number = 9;
const PIXELMAP_SCENE_02: number = 2;
const PIXELMAP_SCENE_03: number = 3;
const PIXELMAP_SCENE_04: number = 4;
const PIXELMAP_SCENE_05: number = 5;
const PIXELMAP_SCENE_06: number = 6;
const PIXELMAP_SCENE_07: number = 7;
const PIXELMAP_SCENE_08: number = 8;
const PIXELMAP_SCENE_09: number = 9;
const PIXELMAP_SCENE_10: number = 10;
const PIXELMAP_SCENE_11: number = 11;

export default function ndkRenderNodePixelSceneB(): void {
  describe('NdkRenderNodePixelSceneB', () => {
    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0001
         * @tc.name      testNdkRenderNodePixelSceneB0001
         * @tc.desc      校验颜色滤波器域第 3 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0001 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_COLOR_FILTER, COLOR_FILTER_SCENE_02);
      logInfo('color_filter#2 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_COLOR_FILTER, COLOR_FILTER_SCENE_02);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0001 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0002
         * @tc.name      testNdkRenderNodePixelSceneB0002
         * @tc.desc      校验颜色滤波器域第 4 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0002 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_COLOR_FILTER, COLOR_FILTER_SCENE_03);
      logInfo('color_filter#3 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_COLOR_FILTER, COLOR_FILTER_SCENE_03);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0002 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0003
         * @tc.name      testNdkRenderNodePixelSceneB0003
         * @tc.desc      校验颜色滤波器域第 5 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0003 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_COLOR_FILTER, COLOR_FILTER_SCENE_04);
      logInfo('color_filter#4 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_COLOR_FILTER, COLOR_FILTER_SCENE_04);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0003 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0004
         * @tc.name      testNdkRenderNodePixelSceneB0004
         * @tc.desc      校验颜色滤波器域第 6 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0004 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_COLOR_FILTER, COLOR_FILTER_SCENE_05);
      logInfo('color_filter#5 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_COLOR_FILTER, COLOR_FILTER_SCENE_05);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0004 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0005
         * @tc.name      testNdkRenderNodePixelSceneB0005
         * @tc.desc      校验颜色滤波器域第 7 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0005 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_COLOR_FILTER, COLOR_FILTER_SCENE_06);
      logInfo('color_filter#6 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_COLOR_FILTER, COLOR_FILTER_SCENE_06);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0005 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0006
         * @tc.name      testNdkRenderNodePixelSceneB0006
         * @tc.desc      校验颜色滤波器域第 8 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0006 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_COLOR_FILTER, COLOR_FILTER_SCENE_07);
      logInfo('color_filter#7 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_COLOR_FILTER, COLOR_FILTER_SCENE_07);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0006 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0007
         * @tc.name      testNdkRenderNodePixelSceneB0007
         * @tc.desc      校验颜色滤波器域第 9 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0007 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_COLOR_FILTER, COLOR_FILTER_SCENE_08);
      logInfo('color_filter#8 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_COLOR_FILTER, COLOR_FILTER_SCENE_08);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0007 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0008
         * @tc.name      testNdkRenderNodePixelSceneB0008
         * @tc.desc      校验着色器域第 3 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0008 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_SHADER, SHADER_SCENE_02);
      logInfo('shader#2 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_SHADER, SHADER_SCENE_02);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0008 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0009
         * @tc.name      testNdkRenderNodePixelSceneB0009
         * @tc.desc      校验着色器域第 4 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0009 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_SHADER, SHADER_SCENE_03);
      logInfo('shader#3 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_SHADER, SHADER_SCENE_03);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0009 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0010
         * @tc.name      testNdkRenderNodePixelSceneB0010
         * @tc.desc      校验着色器域第 5 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0010 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_SHADER, SHADER_SCENE_04);
      logInfo('shader#4 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_SHADER, SHADER_SCENE_04);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0010 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0011
         * @tc.name      testNdkRenderNodePixelSceneB0011
         * @tc.desc      校验着色器域第 6 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0011 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_SHADER, SHADER_SCENE_05);
      logInfo('shader#5 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_SHADER, SHADER_SCENE_05);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0011 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0012
         * @tc.name      testNdkRenderNodePixelSceneB0012
         * @tc.desc      校验着色器域第 7 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0012 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_SHADER, SHADER_SCENE_06);
      logInfo('shader#6 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_SHADER, SHADER_SCENE_06);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0012 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0013
         * @tc.name      testNdkRenderNodePixelSceneB0013
         * @tc.desc      校验着色器域第 8 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0013 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_SHADER, SHADER_SCENE_07);
      logInfo('shader#7 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_SHADER, SHADER_SCENE_07);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0013 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0014
         * @tc.name      testNdkRenderNodePixelSceneB0014
         * @tc.desc      校验着色器域第 9 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0014 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_SHADER, SHADER_SCENE_08);
      logInfo('shader#8 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_SHADER, SHADER_SCENE_08);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0014 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0015
         * @tc.name      testNdkRenderNodePixelSceneB0015
         * @tc.desc      校验着色器域第 10 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0015 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_SHADER, SHADER_SCENE_09);
      logInfo('shader#9 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_SHADER, SHADER_SCENE_09);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0015 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0016
         * @tc.name      testNdkRenderNodePixelSceneB0016
         * @tc.desc      校验着色器域第 11 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0016 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_SHADER, SHADER_SCENE_10);
      logInfo('shader#10 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_SHADER, SHADER_SCENE_10);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0016 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0017
         * @tc.name      testNdkRenderNodePixelSceneB0017
         * @tc.desc      校验遮罩滤波器域第 3 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0017 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_MASK_FILTER, MASK_FILTER_SCENE_02);
      logInfo('mask_filter#2 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_MASK_FILTER, MASK_FILTER_SCENE_02);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0017 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0018
         * @tc.name      testNdkRenderNodePixelSceneB0018
         * @tc.desc      校验遮罩滤波器域第 4 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0018 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_MASK_FILTER, MASK_FILTER_SCENE_03);
      logInfo('mask_filter#3 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_MASK_FILTER, MASK_FILTER_SCENE_03);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0018 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0019
         * @tc.name      testNdkRenderNodePixelSceneB0019
         * @tc.desc      校验遮罩滤波器域第 5 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0019 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_MASK_FILTER, MASK_FILTER_SCENE_04);
      logInfo('mask_filter#4 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_MASK_FILTER, MASK_FILTER_SCENE_04);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0019 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0020
         * @tc.name      testNdkRenderNodePixelSceneB0020
         * @tc.desc      校验遮罩滤波器域第 6 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0020 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_MASK_FILTER, MASK_FILTER_SCENE_05);
      logInfo('mask_filter#5 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_MASK_FILTER, MASK_FILTER_SCENE_05);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0020 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0021
         * @tc.name      testNdkRenderNodePixelSceneB0021
         * @tc.desc      校验遮罩滤波器域第 7 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0021 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_MASK_FILTER, MASK_FILTER_SCENE_06);
      logInfo('mask_filter#6 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_MASK_FILTER, MASK_FILTER_SCENE_06);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0021 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0022
         * @tc.name      testNdkRenderNodePixelSceneB0022
         * @tc.desc      校验遮罩滤波器域第 8 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0022 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_MASK_FILTER, MASK_FILTER_SCENE_07);
      logInfo('mask_filter#7 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_MASK_FILTER, MASK_FILTER_SCENE_07);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0022 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0023
         * @tc.name      testNdkRenderNodePixelSceneB0023
         * @tc.desc      校验图像滤波器域第 3 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0023 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_IMAGE_FILTER, IMAGE_FILTER_SCENE_02);
      logInfo('image_filter#2 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_IMAGE_FILTER, IMAGE_FILTER_SCENE_02);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0023 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0024
         * @tc.name      testNdkRenderNodePixelSceneB0024
         * @tc.desc      校验图像滤波器域第 4 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0024 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_IMAGE_FILTER, IMAGE_FILTER_SCENE_03);
      logInfo('image_filter#3 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_IMAGE_FILTER, IMAGE_FILTER_SCENE_03);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0024 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0025
         * @tc.name      testNdkRenderNodePixelSceneB0025
         * @tc.desc      校验图像滤波器域第 5 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0025 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_IMAGE_FILTER, IMAGE_FILTER_SCENE_04);
      logInfo('image_filter#4 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_IMAGE_FILTER, IMAGE_FILTER_SCENE_04);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0025 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0026
         * @tc.name      testNdkRenderNodePixelSceneB0026
         * @tc.desc      校验图像滤波器域第 6 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0026 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_IMAGE_FILTER, IMAGE_FILTER_SCENE_05);
      logInfo('image_filter#5 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_IMAGE_FILTER, IMAGE_FILTER_SCENE_05);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0026 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0027
         * @tc.name      testNdkRenderNodePixelSceneB0027
         * @tc.desc      校验图像滤波器域第 7 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0027 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_IMAGE_FILTER, IMAGE_FILTER_SCENE_06);
      logInfo('image_filter#6 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_IMAGE_FILTER, IMAGE_FILTER_SCENE_06);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0027 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0028
         * @tc.name      testNdkRenderNodePixelSceneB0028
         * @tc.desc      校验图像滤波器域第 8 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0028 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_IMAGE_FILTER, IMAGE_FILTER_SCENE_07);
      logInfo('image_filter#7 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_IMAGE_FILTER, IMAGE_FILTER_SCENE_07);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0028 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0029
         * @tc.name      testNdkRenderNodePixelSceneB0029
         * @tc.desc      校验图像滤波器域第 9 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0029 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_IMAGE_FILTER, IMAGE_FILTER_SCENE_08);
      logInfo('image_filter#8 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_IMAGE_FILTER, IMAGE_FILTER_SCENE_08);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0029 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0030
         * @tc.name      testNdkRenderNodePixelSceneB0030
         * @tc.desc      校验图像滤波器域第 10 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0030 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_IMAGE_FILTER, IMAGE_FILTER_SCENE_09);
      logInfo('image_filter#9 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_IMAGE_FILTER, IMAGE_FILTER_SCENE_09);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0030 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0031
         * @tc.name      testNdkRenderNodePixelSceneB0031
         * @tc.desc      校验位图域第 3 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0031 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_BITMAP, BITMAP_SCENE_02);
      logInfo('bitmap#2 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_BITMAP, BITMAP_SCENE_02);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0031 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0032
         * @tc.name      testNdkRenderNodePixelSceneB0032
         * @tc.desc      校验位图域第 4 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0032 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_BITMAP, BITMAP_SCENE_03);
      logInfo('bitmap#3 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_BITMAP, BITMAP_SCENE_03);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0032 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0033
         * @tc.name      testNdkRenderNodePixelSceneB0033
         * @tc.desc      校验位图域第 5 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0033 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_BITMAP, BITMAP_SCENE_04);
      logInfo('bitmap#4 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_BITMAP, BITMAP_SCENE_04);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0033 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0034
         * @tc.name      testNdkRenderNodePixelSceneB0034
         * @tc.desc      校验位图域第 6 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0034 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_BITMAP, BITMAP_SCENE_05);
      logInfo('bitmap#5 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_BITMAP, BITMAP_SCENE_05);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0034 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0035
         * @tc.name      testNdkRenderNodePixelSceneB0035
         * @tc.desc      校验位图域第 7 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0035 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_BITMAP, BITMAP_SCENE_06);
      logInfo('bitmap#6 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_BITMAP, BITMAP_SCENE_06);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0035 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0036
         * @tc.name      testNdkRenderNodePixelSceneB0036
         * @tc.desc      校验位图域第 8 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0036 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_BITMAP, BITMAP_SCENE_07);
      logInfo('bitmap#7 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_BITMAP, BITMAP_SCENE_07);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0036 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0037
         * @tc.name      testNdkRenderNodePixelSceneB0037
         * @tc.desc      校验位图域第 9 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0037 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_BITMAP, BITMAP_SCENE_08);
      logInfo('bitmap#8 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_BITMAP, BITMAP_SCENE_08);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0037 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0038
         * @tc.name      testNdkRenderNodePixelSceneB0038
         * @tc.desc      校验位图域第 10 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0038 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_BITMAP, BITMAP_SCENE_09);
      logInfo('bitmap#9 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_BITMAP, BITMAP_SCENE_09);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0038 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0039
         * @tc.name      testNdkRenderNodePixelSceneB0039
         * @tc.desc      校验像素图域第 3 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0039 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_PIXELMAP, PIXELMAP_SCENE_02);
      logInfo('pixelmap#2 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_PIXELMAP, PIXELMAP_SCENE_02);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0039 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0040
         * @tc.name      testNdkRenderNodePixelSceneB0040
         * @tc.desc      校验像素图域第 4 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0040 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_PIXELMAP, PIXELMAP_SCENE_03);
      logInfo('pixelmap#3 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_PIXELMAP, PIXELMAP_SCENE_03);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0040 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0041
         * @tc.name      testNdkRenderNodePixelSceneB0041
         * @tc.desc      校验像素图域第 5 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0041 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_PIXELMAP, PIXELMAP_SCENE_04);
      logInfo('pixelmap#4 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_PIXELMAP, PIXELMAP_SCENE_04);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0041 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0042
         * @tc.name      testNdkRenderNodePixelSceneB0042
         * @tc.desc      校验像素图域第 6 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0042 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_PIXELMAP, PIXELMAP_SCENE_05);
      logInfo('pixelmap#5 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_PIXELMAP, PIXELMAP_SCENE_05);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0042 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0043
         * @tc.name      testNdkRenderNodePixelSceneB0043
         * @tc.desc      校验像素图域第 7 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0043 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_PIXELMAP, PIXELMAP_SCENE_06);
      logInfo('pixelmap#6 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_PIXELMAP, PIXELMAP_SCENE_06);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0043 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0044
         * @tc.name      testNdkRenderNodePixelSceneB0044
         * @tc.desc      校验像素图域第 8 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0044 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_PIXELMAP, PIXELMAP_SCENE_07);
      logInfo('pixelmap#7 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_PIXELMAP, PIXELMAP_SCENE_07);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0044 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0045
         * @tc.name      testNdkRenderNodePixelSceneB0045
         * @tc.desc      校验像素图域第 9 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0045 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_PIXELMAP, PIXELMAP_SCENE_08);
      logInfo('pixelmap#8 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_PIXELMAP, PIXELMAP_SCENE_08);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0045 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0046
         * @tc.name      testNdkRenderNodePixelSceneB0046
         * @tc.desc      校验像素图域第 10 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0046 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_PIXELMAP, PIXELMAP_SCENE_09);
      logInfo('pixelmap#9 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_PIXELMAP, PIXELMAP_SCENE_09);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0046 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0047
         * @tc.name      testNdkRenderNodePixelSceneB0047
         * @tc.desc      校验像素图域第 11 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0047 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_PIXELMAP, PIXELMAP_SCENE_10);
      logInfo('pixelmap#10 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_PIXELMAP, PIXELMAP_SCENE_10);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0047 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_B_0048
         * @tc.name      testNdkRenderNodePixelSceneB0048
         * @tc.desc      校验像素图域第 12 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneB0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneB0048 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_PIXELMAP, PIXELMAP_SCENE_11);
      logInfo('pixelmap#11 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_PIXELMAP, PIXELMAP_SCENE_11);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneB0048 end');
    })

  })
}
