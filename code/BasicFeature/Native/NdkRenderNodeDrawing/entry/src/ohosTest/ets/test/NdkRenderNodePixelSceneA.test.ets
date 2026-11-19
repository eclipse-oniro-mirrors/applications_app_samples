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

// 四个能力域（画布至颜色）逐场景像素基线：32 个场景各一条，
// 断言「能重绘、画出了内容、帧尺寸不变、重复绘制逐字节一致」。
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { UIContext } from '@kit.ArkUI';
import {
  GROUP_CANVAS, GROUP_GEOMETRY, GROUP_PAINT, GROUP_COLOR
} from '../../../main/ets/core/SchemaTypes';
import { MIN_CHANGED_PIXELS, readyUiContext, waitReady } from './PixelProbe';
import { DrawFrame, drawFrame, RepeatObs, repeatPair } from './PixelCaseSupport';

const TAG: string = '[Sample_NdkRenderNodePixelSceneA]';
const DOMAIN: number = 0xF811;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

// 场景下标常量：每个场景一个具名常量，避免用例体退化成同一段数字。
const CANVAS_SCENE_02: number = 2;
const CANVAS_SCENE_03: number = 3;
const CANVAS_SCENE_04: number = 4;
const CANVAS_SCENE_05: number = 5;
const CANVAS_SCENE_06: number = 6;
const CANVAS_SCENE_07: number = 7;
const CANVAS_SCENE_08: number = 8;
const CANVAS_SCENE_09: number = 9;
const GEOMETRY_SCENE_02: number = 2;
const GEOMETRY_SCENE_03: number = 3;
const GEOMETRY_SCENE_04: number = 4;
const GEOMETRY_SCENE_05: number = 5;
const GEOMETRY_SCENE_06: number = 6;
const GEOMETRY_SCENE_07: number = 7;
const GEOMETRY_SCENE_08: number = 8;
const GEOMETRY_SCENE_09: number = 9;
const GEOMETRY_SCENE_10: number = 10;
const PAINT_SCENE_02: number = 2;
const PAINT_SCENE_03: number = 3;
const PAINT_SCENE_04: number = 4;
const PAINT_SCENE_05: number = 5;
const PAINT_SCENE_06: number = 6;
const PAINT_SCENE_07: number = 7;
const PAINT_SCENE_08: number = 8;
const PAINT_SCENE_09: number = 9;
const COLOR_SCENE_02: number = 2;
const COLOR_SCENE_03: number = 3;
const COLOR_SCENE_04: number = 4;
const COLOR_SCENE_05: number = 5;
const COLOR_SCENE_06: number = 6;
const COLOR_SCENE_07: number = 7;
const COLOR_SCENE_08: number = 8;

export default function ndkRenderNodePixelSceneA(): void {
  describe('NdkRenderNodePixelSceneA', () => {
    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0001
         * @tc.name      testNdkRenderNodePixelSceneA0001
         * @tc.desc      校验画布域第 3 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0001 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_CANVAS, CANVAS_SCENE_02);
      logInfo('canvas#2 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_CANVAS, CANVAS_SCENE_02);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0001 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0002
         * @tc.name      testNdkRenderNodePixelSceneA0002
         * @tc.desc      校验画布域第 4 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0002 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_CANVAS, CANVAS_SCENE_03);
      logInfo('canvas#3 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_CANVAS, CANVAS_SCENE_03);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0002 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0003
         * @tc.name      testNdkRenderNodePixelSceneA0003
         * @tc.desc      校验画布域第 5 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0003 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_CANVAS, CANVAS_SCENE_04);
      logInfo('canvas#4 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_CANVAS, CANVAS_SCENE_04);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0003 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0004
         * @tc.name      testNdkRenderNodePixelSceneA0004
         * @tc.desc      校验画布域第 6 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0004 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_CANVAS, CANVAS_SCENE_05);
      logInfo('canvas#5 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_CANVAS, CANVAS_SCENE_05);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0004 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0005
         * @tc.name      testNdkRenderNodePixelSceneA0005
         * @tc.desc      校验画布域第 7 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0005 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_CANVAS, CANVAS_SCENE_06);
      logInfo('canvas#6 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_CANVAS, CANVAS_SCENE_06);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0005 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0006
         * @tc.name      testNdkRenderNodePixelSceneA0006
         * @tc.desc      校验画布域第 8 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0006 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_CANVAS, CANVAS_SCENE_07);
      logInfo('canvas#7 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_CANVAS, CANVAS_SCENE_07);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0006 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0007
         * @tc.name      testNdkRenderNodePixelSceneA0007
         * @tc.desc      校验画布域第 9 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0007 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_CANVAS, CANVAS_SCENE_08);
      logInfo('canvas#8 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_CANVAS, CANVAS_SCENE_08);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0007 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0008
         * @tc.name      testNdkRenderNodePixelSceneA0008
         * @tc.desc      校验画布域第 10 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0008 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_CANVAS, CANVAS_SCENE_09);
      logInfo('canvas#9 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_CANVAS, CANVAS_SCENE_09);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0008 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0009
         * @tc.name      testNdkRenderNodePixelSceneA0009
         * @tc.desc      校验几何域第 3 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0009 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_GEOMETRY, GEOMETRY_SCENE_02);
      logInfo('geometry#2 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_GEOMETRY, GEOMETRY_SCENE_02);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0009 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0010
         * @tc.name      testNdkRenderNodePixelSceneA0010
         * @tc.desc      校验几何域第 4 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0010 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_GEOMETRY, GEOMETRY_SCENE_03);
      logInfo('geometry#3 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_GEOMETRY, GEOMETRY_SCENE_03);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0010 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0011
         * @tc.name      testNdkRenderNodePixelSceneA0011
         * @tc.desc      校验几何域第 5 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0011 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_GEOMETRY, GEOMETRY_SCENE_04);
      logInfo('geometry#4 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_GEOMETRY, GEOMETRY_SCENE_04);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0011 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0012
         * @tc.name      testNdkRenderNodePixelSceneA0012
         * @tc.desc      校验几何域第 6 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0012 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_GEOMETRY, GEOMETRY_SCENE_05);
      logInfo('geometry#5 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_GEOMETRY, GEOMETRY_SCENE_05);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0012 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0013
         * @tc.name      testNdkRenderNodePixelSceneA0013
         * @tc.desc      校验几何域第 7 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0013 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_GEOMETRY, GEOMETRY_SCENE_06);
      logInfo('geometry#6 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_GEOMETRY, GEOMETRY_SCENE_06);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0013 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0014
         * @tc.name      testNdkRenderNodePixelSceneA0014
         * @tc.desc      校验几何域第 8 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0014 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_GEOMETRY, GEOMETRY_SCENE_07);
      logInfo('geometry#7 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_GEOMETRY, GEOMETRY_SCENE_07);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0014 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0015
         * @tc.name      testNdkRenderNodePixelSceneA0015
         * @tc.desc      校验几何域第 9 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0015 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_GEOMETRY, GEOMETRY_SCENE_08);
      logInfo('geometry#8 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_GEOMETRY, GEOMETRY_SCENE_08);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0015 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0016
         * @tc.name      testNdkRenderNodePixelSceneA0016
         * @tc.desc      校验几何域第 10 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0016 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_GEOMETRY, GEOMETRY_SCENE_09);
      logInfo('geometry#9 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_GEOMETRY, GEOMETRY_SCENE_09);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0016 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0017
         * @tc.name      testNdkRenderNodePixelSceneA0017
         * @tc.desc      校验几何域第 11 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0017 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_GEOMETRY, GEOMETRY_SCENE_10);
      logInfo('geometry#10 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_GEOMETRY, GEOMETRY_SCENE_10);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0017 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0018
         * @tc.name      testNdkRenderNodePixelSceneA0018
         * @tc.desc      校验画笔域第 3 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0018 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_PAINT, PAINT_SCENE_02);
      logInfo('paint#2 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_PAINT, PAINT_SCENE_02);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0018 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0019
         * @tc.name      testNdkRenderNodePixelSceneA0019
         * @tc.desc      校验画笔域第 4 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0019 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_PAINT, PAINT_SCENE_03);
      logInfo('paint#3 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_PAINT, PAINT_SCENE_03);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0019 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0020
         * @tc.name      testNdkRenderNodePixelSceneA0020
         * @tc.desc      校验画笔域第 5 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0020 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_PAINT, PAINT_SCENE_04);
      logInfo('paint#4 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_PAINT, PAINT_SCENE_04);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0020 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0021
         * @tc.name      testNdkRenderNodePixelSceneA0021
         * @tc.desc      校验画笔域第 6 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0021 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_PAINT, PAINT_SCENE_05);
      logInfo('paint#5 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_PAINT, PAINT_SCENE_05);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0021 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0022
         * @tc.name      testNdkRenderNodePixelSceneA0022
         * @tc.desc      校验画笔域第 7 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0022 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_PAINT, PAINT_SCENE_06);
      logInfo('paint#6 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_PAINT, PAINT_SCENE_06);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0022 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0023
         * @tc.name      testNdkRenderNodePixelSceneA0023
         * @tc.desc      校验画笔域第 8 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0023 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_PAINT, PAINT_SCENE_07);
      logInfo('paint#7 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_PAINT, PAINT_SCENE_07);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0023 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0024
         * @tc.name      testNdkRenderNodePixelSceneA0024
         * @tc.desc      校验画笔域第 9 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0024 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_PAINT, PAINT_SCENE_08);
      logInfo('paint#8 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_PAINT, PAINT_SCENE_08);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0024 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0025
         * @tc.name      testNdkRenderNodePixelSceneA0025
         * @tc.desc      校验画笔域第 10 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0025 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_PAINT, PAINT_SCENE_09);
      logInfo('paint#9 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_PAINT, PAINT_SCENE_09);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0025 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0026
         * @tc.name      testNdkRenderNodePixelSceneA0026
         * @tc.desc      校验颜色域第 3 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0026 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_COLOR, COLOR_SCENE_02);
      logInfo('color#2 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_COLOR, COLOR_SCENE_02);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0026 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0027
         * @tc.name      testNdkRenderNodePixelSceneA0027
         * @tc.desc      校验颜色域第 4 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0027 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_COLOR, COLOR_SCENE_03);
      logInfo('color#3 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_COLOR, COLOR_SCENE_03);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0027 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0028
         * @tc.name      testNdkRenderNodePixelSceneA0028
         * @tc.desc      校验颜色域第 5 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0028 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_COLOR, COLOR_SCENE_04);
      logInfo('color#4 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_COLOR, COLOR_SCENE_04);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0028 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0029
         * @tc.name      testNdkRenderNodePixelSceneA0029
         * @tc.desc      校验颜色域第 6 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0029 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_COLOR, COLOR_SCENE_05);
      logInfo('color#5 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_COLOR, COLOR_SCENE_05);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0029 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0030
         * @tc.name      testNdkRenderNodePixelSceneA0030
         * @tc.desc      校验颜色域第 7 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0030 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_COLOR, COLOR_SCENE_06);
      logInfo('color#6 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_COLOR, COLOR_SCENE_06);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0030 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0031
         * @tc.name      testNdkRenderNodePixelSceneA0031
         * @tc.desc      校验颜色域第 8 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0031 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_COLOR, COLOR_SCENE_07);
      logInfo('color#7 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_COLOR, COLOR_SCENE_07);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0031 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_SCENE_A_0032
         * @tc.name      testNdkRenderNodePixelSceneA0032
         * @tc.desc      校验颜色域第 9 个场景在真实画布上出图、重复绘制逐字节一致，且不改变帧尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixelSceneA0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelSceneA0032 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const drawn: DrawFrame = await drawFrame(uiContext, GROUP_COLOR, COLOR_SCENE_08);
      logInfo('color#8 changed=' + drawn.changed.toString() +
        ' draws=' + drawn.draws.toString());
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
      const repeat: RepeatObs = await repeatPair(uiContext, GROUP_COLOR, COLOR_SCENE_08);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertEqual(drawn.bytes);
      logInfo('testNdkRenderNodePixelSceneA0032 end');
    })

  })
}
