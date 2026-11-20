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

// 九个能力域（图片编解码至错误码）逐场景像素基线：70 个场景各一条，
// 断言「能重绘、画出了内容、帧尺寸不变、重复绘制逐字节一致」。
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { UIContext } from '@kit.ArkUI';
import {
  GROUP_IMAGE_IO, GROUP_FONT, GROUP_TEXTBLOB, GROUP_TYPOGRAPHY, GROUP_SHADOW, GROUP_MATRIX, GROUP_RECORD,
  GROUP_OFFSCREEN, GROUP_ERROR
} from '../../../main/ets/core/SchemaTypes';
import { MIN_CHANGED_PIXELS, readyUiContext, waitReady } from './PixelProbe';
import { DrawFrame, drawFrame, RepeatObs, repeatPair } from './PixelCaseSupport';

const TAG: string = '[Sample_NdkRenderNodePixelSceneC]';
const DOMAIN: number = 0xF811;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

// 场景下标常量：每个场景一个具名常量，避免用例体退化成同一段数字。
const IMAGE_IO_SCENE_02: number = 2;
const IMAGE_IO_SCENE_03: number = 3;
const IMAGE_IO_SCENE_04: number = 4;
const IMAGE_IO_SCENE_05: number = 5;
const IMAGE_IO_SCENE_06: number = 6;
const IMAGE_IO_SCENE_07: number = 7;
const IMAGE_IO_SCENE_08: number = 8;
const IMAGE_IO_SCENE_09: number = 9;
const FONT_SCENE_02: number = 2;
const FONT_SCENE_03: number = 3;
const FONT_SCENE_04: number = 4;
const FONT_SCENE_05: number = 5;
const FONT_SCENE_06: number = 6;
const FONT_SCENE_07: number = 7;
const FONT_SCENE_08: number = 8;
const FONT_SCENE_09: number = 9;
const FONT_SCENE_10: number = 10;
const FONT_SCENE_11: number = 11;
const TEXTBLOB_SCENE_02: number = 2;
const TEXTBLOB_SCENE_03: number = 3;
const TEXTBLOB_SCENE_04: number = 4;
const TEXTBLOB_SCENE_05: number = 5;
const TEXTBLOB_SCENE_06: number = 6;
const TEXTBLOB_SCENE_07: number = 7;
const TYPOGRAPHY_SCENE_02: number = 2;
const TYPOGRAPHY_SCENE_03: number = 3;
const TYPOGRAPHY_SCENE_04: number = 4;
const TYPOGRAPHY_SCENE_05: number = 5;
const TYPOGRAPHY_SCENE_06: number = 6;
const TYPOGRAPHY_SCENE_07: number = 7;
const TYPOGRAPHY_SCENE_08: number = 8;
const TYPOGRAPHY_SCENE_09: number = 9;
const TYPOGRAPHY_SCENE_10: number = 10;
const TYPOGRAPHY_SCENE_11: number = 11;
const TYPOGRAPHY_SCENE_12: number = 12;
const TYPOGRAPHY_SCENE_13: number = 13;
const SHADOW_SCENE_02: number = 2;
const SHADOW_SCENE_03: number = 3;
const SHADOW_SCENE_04: number = 4;
const SHADOW_SCENE_05: number = 5;
const SHADOW_SCENE_06: number = 6;
const SHADOW_SCENE_07: number = 7;
const MATRIX_SCENE_02: number = 2;
const MATRIX_SCENE_03: number = 3;
const MATRIX_SCENE_04: number = 4;
const MATRIX_SCENE_05: number = 5;
const MATRIX_SCENE_06: number = 6;
const MATRIX_SCENE_07: number = 7;
const MATRIX_SCENE_08: number = 8;
const MATRIX_SCENE_09: number = 9;
const RECORD_SCENE_02: number = 2;
const RECORD_SCENE_03: number = 3;
const RECORD_SCENE_04: number = 4;
const RECORD_SCENE_05: number = 5;
const RECORD_SCENE_06: number = 6;
const RECORD_SCENE_07: number = 7;
const OFFSCREEN_SCENE_02: number = 2;
const OFFSCREEN_SCENE_03: number = 3;
const OFFSCREEN_SCENE_04: number = 4;
const OFFSCREEN_SCENE_05: number = 5;
const OFFSCREEN_SCENE_06: number = 6;
const OFFSCREEN_SCENE_07: number = 7;
const ERROR_SCENE_02: number = 2;
const ERROR_SCENE_03: number = 3;
const ERROR_SCENE_04: number = 4;
const ERROR_SCENE_05: number = 5;
const ERROR_SCENE_06: number = 6;
const ERROR_SCENE_07: number = 7;
const ERROR_SCENE_08: number = 8;
const ERROR_SCENE_09: number = 9;

export default function ndkRenderNodePixelSceneC(): void {
  describe('NdkRenderNodePixelSceneC', () => {
    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0001
         * @tc.name      testNdkRenderNodePixelSceneC0001
         * @tc.desc      校验图片编解码域第 3 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0001 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_IMAGE_IO, IMAGE_IO_SCENE_02);
      logInfo('image_io#2 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_IMAGE_IO, IMAGE_IO_SCENE_02);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0001 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0002
         * @tc.name      testNdkRenderNodePixelSceneC0002
         * @tc.desc      校验图片编解码域第 4 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0002 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_IMAGE_IO, IMAGE_IO_SCENE_03);
      logInfo('image_io#3 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_IMAGE_IO, IMAGE_IO_SCENE_03);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0002 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0003
         * @tc.name      testNdkRenderNodePixelSceneC0003
         * @tc.desc      校验图片编解码域第 5 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0003 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_IMAGE_IO, IMAGE_IO_SCENE_04);
      logInfo('image_io#4 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_IMAGE_IO, IMAGE_IO_SCENE_04);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0003 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0004
         * @tc.name      testNdkRenderNodePixelSceneC0004
         * @tc.desc      校验图片编解码域第 6 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0004 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_IMAGE_IO, IMAGE_IO_SCENE_05);
      logInfo('image_io#5 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_IMAGE_IO, IMAGE_IO_SCENE_05);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0004 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0005
         * @tc.name      testNdkRenderNodePixelSceneC0005
         * @tc.desc      校验图片编解码域第 7 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0005 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_IMAGE_IO, IMAGE_IO_SCENE_06);
      logInfo('image_io#6 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_IMAGE_IO, IMAGE_IO_SCENE_06);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0005 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0006
         * @tc.name      testNdkRenderNodePixelSceneC0006
         * @tc.desc      校验图片编解码域第 8 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0006 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_IMAGE_IO, IMAGE_IO_SCENE_07);
      logInfo('image_io#7 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_IMAGE_IO, IMAGE_IO_SCENE_07);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0006 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0007
         * @tc.name      testNdkRenderNodePixelSceneC0007
         * @tc.desc      校验图片编解码域第 9 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0007 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_IMAGE_IO, IMAGE_IO_SCENE_08);
      logInfo('image_io#8 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_IMAGE_IO, IMAGE_IO_SCENE_08);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0007 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0008
         * @tc.name      testNdkRenderNodePixelSceneC0008
         * @tc.desc      校验图片编解码域第 10 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0008 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_IMAGE_IO, IMAGE_IO_SCENE_09);
      logInfo('image_io#9 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_IMAGE_IO, IMAGE_IO_SCENE_09);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0008 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0009
         * @tc.name      testNdkRenderNodePixelSceneC0009
         * @tc.desc      校验字体域第 3 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0009 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_FONT, FONT_SCENE_02);
      logInfo('font#2 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_FONT, FONT_SCENE_02);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0009 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0010
         * @tc.name      testNdkRenderNodePixelSceneC0010
         * @tc.desc      校验字体域第 4 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0010 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_FONT, FONT_SCENE_03);
      logInfo('font#3 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_FONT, FONT_SCENE_03);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0010 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0011
         * @tc.name      testNdkRenderNodePixelSceneC0011
         * @tc.desc      校验字体域第 5 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0011 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_FONT, FONT_SCENE_04);
      logInfo('font#4 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_FONT, FONT_SCENE_04);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0011 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0012
         * @tc.name      testNdkRenderNodePixelSceneC0012
         * @tc.desc      校验字体域第 6 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0012 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_FONT, FONT_SCENE_05);
      logInfo('font#5 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_FONT, FONT_SCENE_05);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0012 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0013
         * @tc.name      testNdkRenderNodePixelSceneC0013
         * @tc.desc      校验字体域第 7 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0013 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_FONT, FONT_SCENE_06);
      logInfo('font#6 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_FONT, FONT_SCENE_06);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0013 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0014
         * @tc.name      testNdkRenderNodePixelSceneC0014
         * @tc.desc      校验字体域第 8 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0014 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_FONT, FONT_SCENE_07);
      logInfo('font#7 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_FONT, FONT_SCENE_07);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0014 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0015
         * @tc.name      testNdkRenderNodePixelSceneC0015
         * @tc.desc      校验字体域第 9 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0015 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_FONT, FONT_SCENE_08);
      logInfo('font#8 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_FONT, FONT_SCENE_08);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0015 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0016
         * @tc.name      testNdkRenderNodePixelSceneC0016
         * @tc.desc      校验字体域第 10 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0016 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_FONT, FONT_SCENE_09);
      logInfo('font#9 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_FONT, FONT_SCENE_09);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0016 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0017
         * @tc.name      testNdkRenderNodePixelSceneC0017
         * @tc.desc      校验字体域第 11 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0017 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_FONT, FONT_SCENE_10);
      logInfo('font#10 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_FONT, FONT_SCENE_10);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0017 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0018
         * @tc.name      testNdkRenderNodePixelSceneC0018
         * @tc.desc      校验字体域第 12 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0018 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_FONT, FONT_SCENE_11);
      logInfo('font#11 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_FONT, FONT_SCENE_11);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0018 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0019
         * @tc.name      testNdkRenderNodePixelSceneC0019
         * @tc.desc      校验文本块域第 3 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0019 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_TEXTBLOB, TEXTBLOB_SCENE_02);
      logInfo('textblob#2 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_TEXTBLOB, TEXTBLOB_SCENE_02);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0019 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0020
         * @tc.name      testNdkRenderNodePixelSceneC0020
         * @tc.desc      校验文本块域第 4 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0020 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_TEXTBLOB, TEXTBLOB_SCENE_03);
      logInfo('textblob#3 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_TEXTBLOB, TEXTBLOB_SCENE_03);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0020 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0021
         * @tc.name      testNdkRenderNodePixelSceneC0021
         * @tc.desc      校验文本块域第 5 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0021 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_TEXTBLOB, TEXTBLOB_SCENE_04);
      logInfo('textblob#4 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_TEXTBLOB, TEXTBLOB_SCENE_04);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0021 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0022
         * @tc.name      testNdkRenderNodePixelSceneC0022
         * @tc.desc      校验文本块域第 6 个场景在真实画布上出图、不改变帧尺寸，且重复绘制因唯一编号变化而必然不同。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0022 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_TEXTBLOB, TEXTBLOB_SCENE_05);
      logInfo('textblob#5 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_TEXTBLOB, TEXTBLOB_SCENE_05);
      // 该场景把两次 TextBlob 的 UniqueID 低位画成编号条，每次创建都拿到新编号，重复绘制必然不同。
      expect(repeat.stable).assertFalse();
      expect(repeat.firstDigest === repeat.secondDigest).assertFalse();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0022 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0023
         * @tc.name      testNdkRenderNodePixelSceneC0023
         * @tc.desc      校验文本块域第 7 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0023 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_TEXTBLOB, TEXTBLOB_SCENE_06);
      logInfo('textblob#6 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_TEXTBLOB, TEXTBLOB_SCENE_06);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0023 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0024
         * @tc.name      testNdkRenderNodePixelSceneC0024
         * @tc.desc      校验文本块域第 8 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0024 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_TEXTBLOB, TEXTBLOB_SCENE_07);
      logInfo('textblob#7 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_TEXTBLOB, TEXTBLOB_SCENE_07);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0024 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0025
         * @tc.name      testNdkRenderNodePixelSceneC0025
         * @tc.desc      校验排版域第 3 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0025 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_TYPOGRAPHY, TYPOGRAPHY_SCENE_02);
      logInfo('typography#2 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_TYPOGRAPHY, TYPOGRAPHY_SCENE_02);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0025 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0026
         * @tc.name      testNdkRenderNodePixelSceneC0026
         * @tc.desc      校验排版域第 4 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0026 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_TYPOGRAPHY, TYPOGRAPHY_SCENE_03);
      logInfo('typography#3 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_TYPOGRAPHY, TYPOGRAPHY_SCENE_03);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0026 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0027
         * @tc.name      testNdkRenderNodePixelSceneC0027
         * @tc.desc      校验排版域第 5 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0027 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_TYPOGRAPHY, TYPOGRAPHY_SCENE_04);
      logInfo('typography#4 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_TYPOGRAPHY, TYPOGRAPHY_SCENE_04);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0027 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0028
         * @tc.name      testNdkRenderNodePixelSceneC0028
         * @tc.desc      校验排版域第 6 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0028 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_TYPOGRAPHY, TYPOGRAPHY_SCENE_05);
      logInfo('typography#5 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_TYPOGRAPHY, TYPOGRAPHY_SCENE_05);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0028 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0029
         * @tc.name      testNdkRenderNodePixelSceneC0029
         * @tc.desc      校验排版域第 7 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0029 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_TYPOGRAPHY, TYPOGRAPHY_SCENE_06);
      logInfo('typography#6 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_TYPOGRAPHY, TYPOGRAPHY_SCENE_06);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0029 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0030
         * @tc.name      testNdkRenderNodePixelSceneC0030
         * @tc.desc      校验排版域第 8 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0030 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_TYPOGRAPHY, TYPOGRAPHY_SCENE_07);
      logInfo('typography#7 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_TYPOGRAPHY, TYPOGRAPHY_SCENE_07);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0030 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0031
         * @tc.name      testNdkRenderNodePixelSceneC0031
         * @tc.desc      校验排版域第 9 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0031 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_TYPOGRAPHY, TYPOGRAPHY_SCENE_08);
      logInfo('typography#8 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_TYPOGRAPHY, TYPOGRAPHY_SCENE_08);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0031 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0032
         * @tc.name      testNdkRenderNodePixelSceneC0032
         * @tc.desc      校验排版域第 10 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0032 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_TYPOGRAPHY, TYPOGRAPHY_SCENE_09);
      logInfo('typography#9 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_TYPOGRAPHY, TYPOGRAPHY_SCENE_09);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0032 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0033
         * @tc.name      testNdkRenderNodePixelSceneC0033
         * @tc.desc      校验排版域第 11 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0033 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_TYPOGRAPHY, TYPOGRAPHY_SCENE_10);
      logInfo('typography#10 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_TYPOGRAPHY, TYPOGRAPHY_SCENE_10);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0033 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0034
         * @tc.name      testNdkRenderNodePixelSceneC0034
         * @tc.desc      校验排版域第 12 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0034 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_TYPOGRAPHY, TYPOGRAPHY_SCENE_11);
      logInfo('typography#11 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_TYPOGRAPHY, TYPOGRAPHY_SCENE_11);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0034 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0035
         * @tc.name      testNdkRenderNodePixelSceneC0035
         * @tc.desc      校验排版域第 13 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0035 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_TYPOGRAPHY, TYPOGRAPHY_SCENE_12);
      logInfo('typography#12 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_TYPOGRAPHY, TYPOGRAPHY_SCENE_12);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0035 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0036
         * @tc.name      testNdkRenderNodePixelSceneC0036
         * @tc.desc      校验排版域第 14 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0036 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_TYPOGRAPHY, TYPOGRAPHY_SCENE_13);
      logInfo('typography#13 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_TYPOGRAPHY, TYPOGRAPHY_SCENE_13);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0036 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0037
         * @tc.name      testNdkRenderNodePixelSceneC0037
         * @tc.desc      校验阴影域第 3 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0037 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_SHADOW, SHADOW_SCENE_02);
      logInfo('shadow#2 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_SHADOW, SHADOW_SCENE_02);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0037 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0038
         * @tc.name      testNdkRenderNodePixelSceneC0038
         * @tc.desc      校验阴影域第 4 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0038 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_SHADOW, SHADOW_SCENE_03);
      logInfo('shadow#3 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_SHADOW, SHADOW_SCENE_03);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0038 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0039
         * @tc.name      testNdkRenderNodePixelSceneC0039
         * @tc.desc      校验阴影域第 5 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0039 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_SHADOW, SHADOW_SCENE_04);
      logInfo('shadow#4 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_SHADOW, SHADOW_SCENE_04);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0039 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0040
         * @tc.name      testNdkRenderNodePixelSceneC0040
         * @tc.desc      校验阴影域第 6 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0040 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_SHADOW, SHADOW_SCENE_05);
      logInfo('shadow#5 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_SHADOW, SHADOW_SCENE_05);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0040 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0041
         * @tc.name      testNdkRenderNodePixelSceneC0041
         * @tc.desc      校验阴影域第 7 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0041 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_SHADOW, SHADOW_SCENE_06);
      logInfo('shadow#6 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_SHADOW, SHADOW_SCENE_06);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0041 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0042
         * @tc.name      testNdkRenderNodePixelSceneC0042
         * @tc.desc      校验阴影域第 8 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0042 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_SHADOW, SHADOW_SCENE_07);
      logInfo('shadow#7 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_SHADOW, SHADOW_SCENE_07);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0042 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0043
         * @tc.name      testNdkRenderNodePixelSceneC0043
         * @tc.desc      校验矩阵域第 3 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0043 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_MATRIX, MATRIX_SCENE_02);
      logInfo('matrix#2 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_MATRIX, MATRIX_SCENE_02);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0043 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0044
         * @tc.name      testNdkRenderNodePixelSceneC0044
         * @tc.desc      校验矩阵域第 4 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0044 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_MATRIX, MATRIX_SCENE_03);
      logInfo('matrix#3 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_MATRIX, MATRIX_SCENE_03);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0044 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0045
         * @tc.name      testNdkRenderNodePixelSceneC0045
         * @tc.desc      校验矩阵域第 5 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0045 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_MATRIX, MATRIX_SCENE_04);
      logInfo('matrix#4 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_MATRIX, MATRIX_SCENE_04);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0045 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0046
         * @tc.name      testNdkRenderNodePixelSceneC0046
         * @tc.desc      校验矩阵域第 6 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0046 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_MATRIX, MATRIX_SCENE_05);
      logInfo('matrix#5 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_MATRIX, MATRIX_SCENE_05);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0046 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0047
         * @tc.name      testNdkRenderNodePixelSceneC0047
         * @tc.desc      校验矩阵域第 7 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0047 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_MATRIX, MATRIX_SCENE_06);
      logInfo('matrix#6 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_MATRIX, MATRIX_SCENE_06);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0047 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0048
         * @tc.name      testNdkRenderNodePixelSceneC0048
         * @tc.desc      校验矩阵域第 8 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0048 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_MATRIX, MATRIX_SCENE_07);
      logInfo('matrix#7 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_MATRIX, MATRIX_SCENE_07);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0048 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0049
         * @tc.name      testNdkRenderNodePixelSceneC0049
         * @tc.desc      校验矩阵域第 9 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0049 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_MATRIX, MATRIX_SCENE_08);
      logInfo('matrix#8 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_MATRIX, MATRIX_SCENE_08);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0049 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0050
         * @tc.name      testNdkRenderNodePixelSceneC0050
         * @tc.desc      校验矩阵域第 10 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0050 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_MATRIX, MATRIX_SCENE_09);
      logInfo('matrix#9 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_MATRIX, MATRIX_SCENE_09);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0050 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0051
         * @tc.name      testNdkRenderNodePixelSceneC0051
         * @tc.desc      校验录制指令域第 3 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0051 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_RECORD, RECORD_SCENE_02);
      logInfo('record#2 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_RECORD, RECORD_SCENE_02);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0051 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0052
         * @tc.name      testNdkRenderNodePixelSceneC0052
         * @tc.desc      校验录制指令域第 4 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0052 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_RECORD, RECORD_SCENE_03);
      logInfo('record#3 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_RECORD, RECORD_SCENE_03);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0052 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0053
         * @tc.name      testNdkRenderNodePixelSceneC0053
         * @tc.desc      校验录制指令域第 5 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0053 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_RECORD, RECORD_SCENE_04);
      logInfo('record#4 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_RECORD, RECORD_SCENE_04);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0053 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0054
         * @tc.name      testNdkRenderNodePixelSceneC0054
         * @tc.desc      校验录制指令域第 6 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0054 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_RECORD, RECORD_SCENE_05);
      logInfo('record#5 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_RECORD, RECORD_SCENE_05);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0054 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0055
         * @tc.name      testNdkRenderNodePixelSceneC0055
         * @tc.desc      校验录制指令域第 7 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0055 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_RECORD, RECORD_SCENE_06);
      logInfo('record#6 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_RECORD, RECORD_SCENE_06);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0055 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0056
         * @tc.name      testNdkRenderNodePixelSceneC0056
         * @tc.desc      校验录制指令域第 8 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0056 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_RECORD, RECORD_SCENE_07);
      logInfo('record#7 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_RECORD, RECORD_SCENE_07);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0056 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0057
         * @tc.name      testNdkRenderNodePixelSceneC0057
         * @tc.desc      校验离屏绘制域第 3 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0057 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_OFFSCREEN, OFFSCREEN_SCENE_02);
      logInfo('offscreen#2 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_OFFSCREEN, OFFSCREEN_SCENE_02);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0057 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0058
         * @tc.name      testNdkRenderNodePixelSceneC0058
         * @tc.desc      校验离屏绘制域第 4 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0058 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_OFFSCREEN, OFFSCREEN_SCENE_03);
      logInfo('offscreen#3 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_OFFSCREEN, OFFSCREEN_SCENE_03);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0058 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0059
         * @tc.name      testNdkRenderNodePixelSceneC0059
         * @tc.desc      校验离屏绘制域第 5 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0059 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_OFFSCREEN, OFFSCREEN_SCENE_04);
      logInfo('offscreen#4 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_OFFSCREEN, OFFSCREEN_SCENE_04);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0059 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0060
         * @tc.name      testNdkRenderNodePixelSceneC0060
         * @tc.desc      校验离屏绘制域第 6 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0060 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_OFFSCREEN, OFFSCREEN_SCENE_05);
      logInfo('offscreen#5 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_OFFSCREEN, OFFSCREEN_SCENE_05);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0060 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0061
         * @tc.name      testNdkRenderNodePixelSceneC0061
         * @tc.desc      校验离屏绘制域第 7 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0061 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_OFFSCREEN, OFFSCREEN_SCENE_06);
      logInfo('offscreen#6 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_OFFSCREEN, OFFSCREEN_SCENE_06);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0061 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0062
         * @tc.name      testNdkRenderNodePixelSceneC0062
         * @tc.desc      校验离屏绘制域第 8 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0062 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_OFFSCREEN, OFFSCREEN_SCENE_07);
      logInfo('offscreen#7 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_OFFSCREEN, OFFSCREEN_SCENE_07);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0062 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0063
         * @tc.name      testNdkRenderNodePixelSceneC0063
         * @tc.desc      校验错误码域第 3 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0063 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_ERROR, ERROR_SCENE_02);
      logInfo('error#2 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_ERROR, ERROR_SCENE_02);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0063 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0064
         * @tc.name      testNdkRenderNodePixelSceneC0064
         * @tc.desc      校验错误码域第 4 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0064 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_ERROR, ERROR_SCENE_03);
      logInfo('error#3 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_ERROR, ERROR_SCENE_03);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0064 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0065
         * @tc.name      testNdkRenderNodePixelSceneC0065
         * @tc.desc      校验错误码域第 5 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0065 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_ERROR, ERROR_SCENE_04);
      logInfo('error#4 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_ERROR, ERROR_SCENE_04);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0065 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0066
         * @tc.name      testNdkRenderNodePixelSceneC0066
         * @tc.desc      校验错误码域第 6 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0066 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_ERROR, ERROR_SCENE_05);
      logInfo('error#5 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_ERROR, ERROR_SCENE_05);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0066 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0067
         * @tc.name      testNdkRenderNodePixelSceneC0067
         * @tc.desc      校验错误码域第 7 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0067 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_ERROR, ERROR_SCENE_06);
      logInfo('error#6 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_ERROR, ERROR_SCENE_06);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0067 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0068
         * @tc.name      testNdkRenderNodePixelSceneC0068
         * @tc.desc      校验错误码域第 8 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0068 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_ERROR, ERROR_SCENE_07);
      logInfo('error#7 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_ERROR, ERROR_SCENE_07);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0068 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0069
         * @tc.name      testNdkRenderNodePixelSceneC0069
         * @tc.desc      校验错误码域第 9 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0069 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_ERROR, ERROR_SCENE_08);
      logInfo('error#8 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_ERROR, ERROR_SCENE_08);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0069 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_C_0070
         * @tc.name      testNdkRenderNodePixelSceneC0070
         * @tc.desc      校验错误码域第 10 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneC0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneC0070 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_ERROR, ERROR_SCENE_09);
      logInfo('error#9 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_ERROR, ERROR_SCENE_09);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneC0070 end');
    })

  })
}
