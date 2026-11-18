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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { UIContext } from '@kit.ArkUI';
import {
  GroupSpec, GROUP_BITMAP, GROUP_CANVAS, GROUP_COLOR, GROUP_COLOR_FILTER, GROUP_ERROR, GROUP_FONT, GROUP_GEOMETRY,
  GROUP_IMAGE_FILTER, GROUP_IMAGE_IO, GROUP_MASK_FILTER, GROUP_MATRIX, GROUP_PAINT, GROUP_PIXELMAP, GROUP_RECORD,
  GROUP_SHADER, GROUP_SHADOW, GROUP_OFFSCREEN, GROUP_TEXTBLOB, GROUP_TYPOGRAPHY
} from '../../../main/ets/core/SchemaTypes';
import { HARNESS, HARNESS_SIZE } from './PixelHarness';
import {
  captureBlank, changedPixels, CLEAR_SCENE, digest, MIN_CHANGED_PIXELS, POINT_GRID_SCENE, readyUiContext, renderScene,
  waitForRedraw, waitReady
} from './PixelProbe';
import { defaultsOf, groupById } from './SceneDefaults';
import {
  DrawFrame, drawFrame, drawFrameAt, expectBlank, ParamDelta, paramDelta, RepeatObs, repeatPair, ScenePairObs, scenePair
} from './PixelCaseSupport';

const TAG: string = '[Sample_NdkRenderNodePixelTest]';
const DOMAIN: number = 0xF811;
// 能力域内的场景下标：第一条与第二条，十九个域逐个取用，避免用例体退化成同一段数字。
const SCENE_FIRST: number = 0;
const SCENE_SECOND: number = 1;
// 深层场景下标：第三、第四、第六、第八与第十个场景，按能力域分别命名以区分用例。
const GEOMETRY_SCENE_THIRD: number = 2;
const CANVAS_SCENE_FOURTH: number = 3;
const CANVAS_SCENE_SIXTH: number = 5;
const CANVAS_SCENE_EIGHTH: number = 7;
const GEOMETRY_SCENE_SIXTH: number = 5;
const GEOMETRY_SCENE_TENTH: number = 9;
// 非法分组编号：native 侧只认 1..29，其余编号必须被整段丢弃。
const INVALID_GROUP: number = 0;
// 专题分组编号：20..29 在像素层不出图，装载后画面必须与空白基线一致。
const TOPIC_NODE_TREE: number = 20;
const TOPIC_HIT_TEST: number = 24;
const TOPIC_ANIMATION: number = 25;
const TOPIC_FRAME_TICK: number = 29;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function ndkRenderNodePixelTest(): void {
  describe('NdkRenderNodePixel', () => {
    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0001
         * @tc.name      testNdkRenderNodePixel0001
         * @tc.desc      校验测试页已挂载像素探针并被 ArkUI 调度重绘，且能通过组件快照取到非空像素数据。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL0
         */
    it('testNdkRenderNodePixel0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodePixel0001 begin');
      const ready: boolean = await waitReady();
      expect(ready).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const pixels: Uint8Array = await captureBlank(uiContext);
      logInfo('snapshot bytes = ' + pixels.length.toString());
      expect(pixels.length > 0).assertTrue();
      expect(pixels.length % 4).assertEqual(0);
      // 探针页不在前台时快照仍可拿到非空数据，但页面永远不会重绘，后续用例会全部误判为空白。
      HARNESS.load(GROUP_CANVAS, CLEAR_SCENE, [1, 100], true);
      const redrawn: boolean = await waitForRedraw();
      logInfo('probe redraw = ' + redrawn.toString() + ' draws=' + HARNESS.drawCount().toString());
      expect(redrawn).assertTrue();
      HARNESS.clearScene();
      logInfo('testNdkRenderNodePixel0001 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0002
         * @tc.name      testNdkRenderNodePixel0002
         * @tc.desc      校验 nativeRenderScene 能把清屏场景真正画到 ArkUI 提供的画布上。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL0
         */
    it('testNdkRenderNodePixel0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const blank: Uint8Array = await captureBlank(uiContext);
      const drawn: Uint8Array = await renderScene(uiContext, GROUP_CANVAS, CLEAR_SCENE, [1, 100]);
      const changed: number = changedPixels(blank, drawn);
      logInfo('clear scene changed pixels = ' + changed.toString());
      expect(changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.length).assertEqual(blank.length);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0003
         * @tc.name      testNdkRenderNodePixel0003
         * @tc.desc      校验同一场景同一参数重复绘制得到完全一致的画面，绘制过程无随机性。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixel0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const first: Uint8Array = await renderScene(uiContext, GROUP_CANVAS, CLEAR_SCENE, [1, 100]);
      const second: Uint8Array = await renderScene(uiContext, GROUP_CANVAS, CLEAR_SCENE, [1, 100]);
      const firstDigest: string = digest(first);
      const secondDigest: string = digest(second);
      logInfo('digest first=' + firstDigest + ' second=' + secondDigest);
      expect(firstDigest).assertEqual(secondDigest);
      expect(first.length).assertEqual(second.length);
      expect(first.length % 4).assertEqual(0);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0004
         * @tc.name      testNdkRenderNodePixel0004
         * @tc.desc      校验同一能力域内不同场景绘制出不同画面，场景编号确实参与了分派。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixel0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const clear: Uint8Array = await renderScene(uiContext, GROUP_CANVAS, CLEAR_SCENE, [1, 100]);
      const grid: Uint8Array = await renderScene(uiContext, GROUP_CANVAS, POINT_GRID_SCENE, [24, 3]);
      const clearDigest: string = digest(clear);
      const gridDigest: string = digest(grid);
      expect(clearDigest === gridDigest).assertFalse();
      expect(clear.length).assertEqual(grid.length);
      expect(changedPixels(clear, grid)).assertLarger(MIN_CHANGED_PIXELS);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0005
         * @tc.name      testNdkRenderNodePixel0005
         * @tc.desc      校验越界能力域编号被拦截，画面与空白基线完全一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const blank: Uint8Array = await captureBlank(uiContext);
      const rejected: Uint8Array = await renderScene(uiContext, INVALID_GROUP, CLEAR_SCENE, [1, 100]);
      const changed: number = changedPixels(blank, rejected);
      expect(changed).assertEqual(0);
      expect(rejected.length).assertEqual(blank.length);
      expect(rejected.length % 4).assertEqual(0);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0006
         * @tc.name      testNdkRenderNodePixel0006
         * @tc.desc      校验画布域场景在 ArkUI 画布上真实出图，与空白基线存在明显差异。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixel0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_CANVAS, SCENE_FIRST);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0007
         * @tc.name      testNdkRenderNodePixel0007
         * @tc.desc      校验几何域场景在真实画布上出图，路径与图元绘制链路有效。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixel0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_GEOMETRY, SCENE_FIRST);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0008
         * @tc.name      testNdkRenderNodePixel0008
         * @tc.desc      校验画笔域场景在真实画布上出图，笔宽与线型效果可见。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixel0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_PAINT, SCENE_FIRST);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0009
         * @tc.name      testNdkRenderNodePixel0009
         * @tc.desc      校验颜色域场景在真实画布上出图，颜色矩阵与混合模式生效。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixel0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_COLOR, SCENE_FIRST);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0010
         * @tc.name      testNdkRenderNodePixel0010
         * @tc.desc      校验颜色滤波器域场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_COLOR_FILTER, SCENE_FIRST);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0011
         * @tc.name      testNdkRenderNodePixel0011
         * @tc.desc      校验着色器域场景在真实画布上出图，渐变灌涂可见。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixel0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_SHADER, SCENE_FIRST);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0012
         * @tc.name      testNdkRenderNodePixel0012
         * @tc.desc      校验遮罩滤波器域场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_MASK_FILTER, SCENE_FIRST);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0013
         * @tc.name      testNdkRenderNodePixel0013
         * @tc.desc      校验图像滤波器域场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_IMAGE_FILTER, SCENE_FIRST);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0014
         * @tc.name      testNdkRenderNodePixel0014
         * @tc.desc      校验位图域场景在真实画布上出图，位图绘制与读回有效。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixel0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_BITMAP, SCENE_FIRST);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0015
         * @tc.name      testNdkRenderNodePixel0015
         * @tc.desc      校验无 PixelMap 时像素图域场景降级为示意图形，仍然出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixel0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_PIXELMAP, SCENE_FIRST);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0016
         * @tc.name      testNdkRenderNodePixel0016
         * @tc.desc      校验图片与流域场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_IMAGE_IO, SCENE_FIRST);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0017
         * @tc.name      testNdkRenderNodePixel0017
         * @tc.desc      校验字体域场景在真实画布上出图，字形度量链路有效。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixel0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_FONT, SCENE_FIRST);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0018
         * @tc.name      testNdkRenderNodePixel0018
         * @tc.desc      校验文本块域场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixel0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_TEXTBLOB, SCENE_FIRST);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0019
         * @tc.name      testNdkRenderNodePixel0019
         * @tc.desc      校验排版域场景在真实画布上出图，多行文本排版可见。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixel0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_TYPOGRAPHY, SCENE_FIRST);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0020
         * @tc.name      testNdkRenderNodePixel0020
         * @tc.desc      校验阴影域场景在真实画布上出图，阴影层叠加可见。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixel0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_SHADOW, SCENE_FIRST);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0021
         * @tc.name      testNdkRenderNodePixel0021
         * @tc.desc      校验矩阵域场景在真实画布上出图，矩阵变换生效。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixel0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_MATRIX, SCENE_FIRST);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0022
         * @tc.name      testNdkRenderNodePixel0022
         * @tc.desc      校验录制指令域场景在真实画布上出图，回放结果可见。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_RECORD, SCENE_FIRST);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0023
         * @tc.name      testNdkRenderNodePixel0023
         * @tc.desc      校验离屏绘制域场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_OFFSCREEN, SCENE_FIRST);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0024
         * @tc.name      testNdkRenderNodePixel0024
         * @tc.desc      校验错误码域场景在真实画布上出图，失败路径也能画出提示图形。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_ERROR, SCENE_FIRST);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0025
         * @tc.name      testNdkRenderNodePixel0025
         * @tc.desc      校验画布域第一个滑杆参数从默认值推到上限后画面发生变化。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixel0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(await waitReady()).assertTrue();
      const delta: ParamDelta = await paramDelta(readyUiContext(), GROUP_CANVAS, SCENE_FIRST);
      expect(delta.index).assertLarger(-1);
      expect(delta.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(delta.changed).assertLess(delta.bytes / 4 + 1);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0026
         * @tc.name      testNdkRenderNodePixel0026
         * @tc.desc      校验几何域第一个滑杆参数变化会改变绘制结果，参数确实被 native 消费。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixel0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(await waitReady()).assertTrue();
      const delta: ParamDelta = await paramDelta(readyUiContext(), GROUP_GEOMETRY, SCENE_FIRST);
      expect(delta.index).assertLarger(-1);
      expect(delta.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(delta.changed).assertLess(delta.bytes / 4 + 1);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0027
         * @tc.name      testNdkRenderNodePixel0027
         * @tc.desc      校验画笔域第一个滑杆参数变化会改变线型与宽度呈现。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixel0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(await waitReady()).assertTrue();
      const delta: ParamDelta = await paramDelta(readyUiContext(), GROUP_PAINT, SCENE_FIRST);
      expect(delta.index).assertLarger(-1);
      expect(delta.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(delta.changed).assertLess(delta.bytes / 4 + 1);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0028
         * @tc.name      testNdkRenderNodePixel0028
         * @tc.desc      校验着色器域第一个滑杆参数变化会改变渐变着色结果。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const delta: ParamDelta = await paramDelta(readyUiContext(), GROUP_SHADER, SCENE_FIRST);
      expect(delta.index).assertLarger(-1);
      expect(delta.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(delta.changed).assertLess(delta.bytes / 4 + 1);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0029
         * @tc.name      testNdkRenderNodePixel0029
         * @tc.desc      校验位图尺寸参数变化会改变回贴区域，位图尺寸确实被 native 消费。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const delta: ParamDelta = await paramDelta(readyUiContext(), GROUP_BITMAP, SCENE_FIRST);
      expect(delta.index).assertLarger(-1);
      expect(delta.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(delta.changed).assertLess(delta.bytes / 4 + 1);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0030
         * @tc.name      testNdkRenderNodePixel0030
         * @tc.desc      校验矩阵缩放参数变化会改变变换后的图形尺寸，缩放确实生效。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const delta: ParamDelta = await paramDelta(readyUiContext(), GROUP_MATRIX, 2);
      expect(delta.index).assertLarger(-1);
      expect(delta.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(delta.changed).assertLess(delta.bytes / 4 + 1);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0031
         * @tc.name      testNdkRenderNodePixel0031
         * @tc.desc      校验排版域第一个滑杆参数变化会改变文本块布局。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const delta: ParamDelta = await paramDelta(readyUiContext(), GROUP_TYPOGRAPHY, SCENE_FIRST);
      expect(delta.index).assertLarger(-1);
      expect(delta.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(delta.changed).assertLess(delta.bytes / 4 + 1);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0032
         * @tc.name      testNdkRenderNodePixel0032
         * @tc.desc      校验颜色域第一个滑杆参数变化会改变颜色矩阵运算结果。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const delta: ParamDelta = await paramDelta(readyUiContext(), GROUP_COLOR, SCENE_FIRST);
      expect(delta.index).assertLarger(-1);
      expect(delta.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(delta.changed).assertLess(delta.bytes / 4 + 1);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0033
         * @tc.name      testNdkRenderNodePixel0033
         * @tc.desc      校验字体域第一个滑杆参数变化会改变字符呈现尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const delta: ParamDelta = await paramDelta(readyUiContext(), GROUP_FONT, SCENE_FIRST);
      expect(delta.index).assertLarger(-1);
      expect(delta.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(delta.changed).assertLess(delta.bytes / 4 + 1);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0034
         * @tc.name      testNdkRenderNodePixel0034
         * @tc.desc      校验专题分组编号已超出 native 能力域范围，入口不绘制任何内容，画面与空白基线一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixel0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const blank: Uint8Array = await captureBlank(uiContext);
      const topicFirst: Uint8Array = await renderScene(uiContext, TOPIC_NODE_TREE, CLEAR_SCENE, []);
      const topicLast: Uint8Array = await renderScene(uiContext, TOPIC_FRAME_TICK, CLEAR_SCENE, []);
      expect(changedPixels(blank, topicFirst)).assertEqual(0);
      expect(changedPixels(blank, topicLast)).assertEqual(0);
      expect(topicFirst.length).assertEqual(topicLast.length);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0035
         * @tc.name      testNdkRenderNodePixel0035
         * @tc.desc      校验画布域第二个场景（点阵）在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_CANVAS, SCENE_SECOND);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0036
         * @tc.name      testNdkRenderNodePixel0036
         * @tc.desc      校验几何域第二个场景（圆角矩形）在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_GEOMETRY, SCENE_SECOND);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0037
         * @tc.name      testNdkRenderNodePixel0037
         * @tc.desc      校验画笔域第二个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_PAINT, SCENE_SECOND);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0038
         * @tc.name      testNdkRenderNodePixel0038
         * @tc.desc      校验颜色域第二个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_COLOR, SCENE_SECOND);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0039
         * @tc.name      testNdkRenderNodePixel0039
         * @tc.desc      校验颜色滤波器域第二个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_COLOR_FILTER, SCENE_SECOND);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0040
         * @tc.name      testNdkRenderNodePixel0040
         * @tc.desc      校验着色器域第二个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_SHADER, SCENE_SECOND);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0041
         * @tc.name      testNdkRenderNodePixel0041
         * @tc.desc      校验遮罩滤波器域第二个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_MASK_FILTER, SCENE_SECOND);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0042
         * @tc.name      testNdkRenderNodePixel0042
         * @tc.desc      校验图像滤波器域第二个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_IMAGE_FILTER, SCENE_SECOND);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0043
         * @tc.name      testNdkRenderNodePixel0043
         * @tc.desc      校验位图域第二个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_BITMAP, SCENE_SECOND);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0044
         * @tc.name      testNdkRenderNodePixel0044
         * @tc.desc      校验像素图域第二个场景无 PixelMap 时降级后仍出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_PIXELMAP, SCENE_SECOND);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0045
         * @tc.name      testNdkRenderNodePixel0045
         * @tc.desc      校验图片与流域第二个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_IMAGE_IO, SCENE_SECOND);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0046
         * @tc.name      testNdkRenderNodePixel0046
         * @tc.desc      校验字体域第二个场景（字号梯度）在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_FONT, SCENE_SECOND);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0047
         * @tc.name      testNdkRenderNodePixel0047
         * @tc.desc      校验文本块域第二个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_TEXTBLOB, SCENE_SECOND);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0048
         * @tc.name      testNdkRenderNodePixel0048
         * @tc.desc      校验排版域第二个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_TYPOGRAPHY, SCENE_SECOND);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0049
         * @tc.name      testNdkRenderNodePixel0049
         * @tc.desc      校验阴影域第二个场景（偏置）在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_SHADOW, SCENE_SECOND);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0050
         * @tc.name      testNdkRenderNodePixel0050
         * @tc.desc      校验矩阵域第二个场景（平移）在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_MATRIX, SCENE_SECOND);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0051
         * @tc.name      testNdkRenderNodePixel0051
         * @tc.desc      校验录制指令域第二个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_RECORD, SCENE_SECOND);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0052
         * @tc.name      testNdkRenderNodePixel0052
         * @tc.desc      校验离屏绘制域第二个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_OFFSCREEN, SCENE_SECOND);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0053
         * @tc.name      testNdkRenderNodePixel0053
         * @tc.desc      校验错误码域第二个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_ERROR, SCENE_SECOND);
      expect(drawn.draws).assertLarger(0);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0054
         * @tc.name      testNdkRenderNodePixel0054
         * @tc.desc      校验几何域前两个场景（矩形与圆角矩形）画面不同。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const pair: ScenePairObs = await scenePair(readyUiContext(), GROUP_GEOMETRY, SCENE_FIRST, SCENE_SECOND);
      expect(pair.differ).assertTrue();
      expect(pair.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(pair.firstBytes).assertEqual(pair.secondBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0055
         * @tc.name      testNdkRenderNodePixel0055
         * @tc.desc      校验画笔域前两个场景画面不同，种类编号参与分派。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const pair: ScenePairObs = await scenePair(readyUiContext(), GROUP_PAINT, SCENE_FIRST, SCENE_SECOND);
      expect(pair.differ).assertTrue();
      expect(pair.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(pair.firstBytes).assertEqual(pair.secondBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0056
         * @tc.name      testNdkRenderNodePixel0056
         * @tc.desc      校验着色器域前两个场景画面不同。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const pair: ScenePairObs = await scenePair(readyUiContext(), GROUP_SHADER, SCENE_FIRST, SCENE_SECOND);
      expect(pair.differ).assertTrue();
      expect(pair.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(pair.firstBytes).assertEqual(pair.secondBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0057
         * @tc.name      testNdkRenderNodePixel0057
         * @tc.desc      校验位图域前两个场景画面不同。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const pair: ScenePairObs = await scenePair(readyUiContext(), GROUP_BITMAP, SCENE_FIRST, SCENE_SECOND);
      expect(pair.differ).assertTrue();
      expect(pair.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(pair.firstBytes).assertEqual(pair.secondBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0058
         * @tc.name      testNdkRenderNodePixel0058
         * @tc.desc      校验字体域前两个场景画面不同。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const pair: ScenePairObs = await scenePair(readyUiContext(), GROUP_FONT, SCENE_FIRST, SCENE_SECOND);
      expect(pair.differ).assertTrue();
      expect(pair.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(pair.firstBytes).assertEqual(pair.secondBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0059
         * @tc.name      testNdkRenderNodePixel0059
         * @tc.desc      校验排版域前两个场景画面不同。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const pair: ScenePairObs = await scenePair(readyUiContext(), GROUP_TYPOGRAPHY, SCENE_FIRST, SCENE_SECOND);
      expect(pair.differ).assertTrue();
      expect(pair.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(pair.firstBytes).assertEqual(pair.secondBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0060
         * @tc.name      testNdkRenderNodePixel0060
         * @tc.desc      校验矩阵域平移与缩放两个场景画面不同。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const pair: ScenePairObs = await scenePair(readyUiContext(), GROUP_MATRIX, SCENE_SECOND, 2);
      expect(pair.differ).assertTrue();
      expect(pair.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(pair.firstBytes).assertEqual(pair.secondBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0061
         * @tc.name      testNdkRenderNodePixel0061
         * @tc.desc      校验离屏绘制域与录制域画面不同，不同能力域没有串图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const scenePixels: Uint8Array = await renderScene(uiContext, GROUP_OFFSCREEN, CLEAR_SCENE,
        defaultsOf(groupById(GROUP_OFFSCREEN) as GroupSpec, CLEAR_SCENE));
      const record: Uint8Array = await renderScene(uiContext, GROUP_RECORD, CLEAR_SCENE,
        defaultsOf(groupById(GROUP_RECORD) as GroupSpec, CLEAR_SCENE));
      expect(digest(scenePixels) === digest(record)).assertFalse();
      expect(scenePixels.length).assertEqual(record.length);
      expect(changedPixels(scenePixels, record)).assertLarger(MIN_CHANGED_PIXELS);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0062
         * @tc.name      testNdkRenderNodePixel0062
         * @tc.desc      校验几何域默认场景连续两次绘制完全一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const repeat: RepeatObs = await repeatPair(readyUiContext(), GROUP_GEOMETRY, SCENE_FIRST);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertLarger(0);
      expect(repeat.bytes % 4).assertEqual(0);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0063
         * @tc.name      testNdkRenderNodePixel0063
         * @tc.desc      校验着色器域默认场景连续两次绘制完全一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const repeat: RepeatObs = await repeatPair(readyUiContext(), GROUP_SHADER, SCENE_FIRST);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertLarger(0);
      expect(repeat.bytes % 4).assertEqual(0);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0064
         * @tc.name      testNdkRenderNodePixel0064
         * @tc.desc      校验字体域默认场景连续两次绘制完全一致，字形缓存不造成差异。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const repeat: RepeatObs = await repeatPair(readyUiContext(), GROUP_FONT, SCENE_FIRST);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertLarger(0);
      expect(repeat.bytes % 4).assertEqual(0);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0065
         * @tc.name      testNdkRenderNodePixel0065
         * @tc.desc      校验排版域默认场景连续两次绘制完全一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const repeat: RepeatObs = await repeatPair(readyUiContext(), GROUP_TYPOGRAPHY, SCENE_FIRST);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertLarger(0);
      expect(repeat.bytes % 4).assertEqual(0);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0066
         * @tc.name      testNdkRenderNodePixel0066
         * @tc.desc      校验位图域默认场景连续两次绘制完全一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const repeat: RepeatObs = await repeatPair(readyUiContext(), GROUP_BITMAP, SCENE_FIRST);
      expect(repeat.stable).assertTrue();
      expect(repeat.bytes).assertLarger(0);
      expect(repeat.bytes % 4).assertEqual(0);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0067
         * @tc.name      testNdkRenderNodePixel0067
         * @tc.desc      校验场景编号等于该域场景数时越界，画面与空白基线一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixel0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const spec: GroupSpec | undefined = groupById(GROUP_GEOMETRY);
      expect(spec !== undefined).assertTrue();
      if (spec === undefined) {
        return;
      }
      const blank: Uint8Array = await captureBlank(uiContext);
      const rejected: Uint8Array = await renderScene(uiContext, GROUP_GEOMETRY, spec.scenes.length,
        defaultsOf(spec, CLEAR_SCENE));
      expect(changedPixels(blank, rejected)).assertEqual(0);
      expect(rejected.length).assertEqual(blank.length);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0068
         * @tc.name      testNdkRenderNodePixel0068
         * @tc.desc      校验能力域编号为 0 时被拦截，画面保持空白。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixel0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const blank: Uint8Array = await captureBlank(uiContext);
      const rejected: Uint8Array = await renderScene(uiContext, INVALID_GROUP, CLEAR_SCENE, [1, 100]);
      expect(changedPixels(blank, rejected)).assertEqual(0);
      expect(rejected.length).assertEqual(blank.length);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0069
         * @tc.name      testNdkRenderNodePixel0069
         * @tc.desc      校验参数数组超过八项时只取前八项，多出的参数不影响画面。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixel0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const normal: Uint8Array = await renderScene(uiContext, GROUP_CANVAS, CLEAR_SCENE, [1, 100]);
      const overflow: Uint8Array = await renderScene(uiContext, GROUP_CANVAS, CLEAR_SCENE,
        [1, 100, 200, 300, 400, 500, 600, 700, 800, 900]);
      expect(digest(normal)).assertEqual(digest(overflow));
      expect(normal.length).assertEqual(overflow.length);
      expect(normal.length).assertLarger(0);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0070
         * @tc.name      testNdkRenderNodePixel0070
         * @tc.desc      校验参数数组为空时按各参数上限默认渲染，仍然能画出内容。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixel0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const blank: Uint8Array = await captureBlank(uiContext);
      const drawn: Uint8Array = await renderScene(uiContext, GROUP_CANVAS, CLEAR_SCENE, []);
      expect(changedPixels(blank, drawn)).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.length).assertEqual(blank.length);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0071
         * @tc.name      testNdkRenderNodePixel0071
         * @tc.desc      校验参数少于声明数量时剩余参数取默认值，绘制不中断。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixel0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const blank: Uint8Array = await captureBlank(uiContext);
      const drawn: Uint8Array = await renderScene(uiContext, GROUP_GEOMETRY, CLEAR_SCENE, [45]);
      expect(changedPixels(blank, drawn)).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.length).assertEqual(blank.length);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0072
         * @tc.name      testNdkRenderNodePixel0072
         * @tc.desc      校验画布域最后一个场景（图层）在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const spec: GroupSpec | undefined = groupById(GROUP_CANVAS);
      expect(spec !== undefined).assertTrue();
      if (spec === undefined) {
        return;
      }
      const drawn: DrawFrame = await drawFrame(readyUiContext(), GROUP_CANVAS, spec.scenes.length - 1);
      expect(drawn.scene).assertEqual(spec.scenes.length - 1);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0073
         * @tc.name      testNdkRenderNodePixel0073
         * @tc.desc      校验专题分组 20 至 24 不经 native 分派，逐个装载后画面均保持空白。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixel0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      for (let group = TOPIC_NODE_TREE; group <= TOPIC_HIT_TEST; group++) {
        await expectBlank(uiContext, group, CLEAR_SCENE, 'topic' + group.toString());
      }
      expect(HARNESS.drawCount()).assertLarger(0);
      expect(HARNESS.frameWidth()).assertEqual(HARNESS_SIZE);
      expect(HARNESS.frameHeight()).assertEqual(HARNESS_SIZE);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0074
         * @tc.name      testNdkRenderNodePixel0074
         * @tc.desc      校验专题分组 25 至 29 不经 native 分派，逐个装载后画面均保持空白。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixel0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      for (let group = TOPIC_ANIMATION; group <= TOPIC_FRAME_TICK; group++) {
        await expectBlank(uiContext, group, CLEAR_SCENE, 'topic' + group.toString());
      }
      expect(HARNESS.drawCount()).assertLarger(0);
      expect(HARNESS.frameWidth()).assertEqual(HARNESS_SIZE);
      expect(HARNESS.frameHeight()).assertEqual(HARNESS_SIZE);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0075
         * @tc.name      testNdkRenderNodePixel0075
         * @tc.desc      校验未装载场景时两次取样的空白基线完全一致，背景无闪烁。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const first: Uint8Array = await captureBlank(uiContext);
      const second: Uint8Array = await captureBlank(uiContext);
      expect(digest(first)).assertEqual(digest(second));
      expect(first.length).assertEqual(second.length);
      expect(first.length % 4).assertEqual(0);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0076
         * @tc.name      testNdkRenderNodePixel0076
         * @tc.desc      校验出图前后快照字节数完全相同，绘制不会改变探针组件尺寸。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const blank: Uint8Array = await captureBlank(uiContext);
      const drawn: Uint8Array = await renderScene(uiContext, GROUP_CANVAS, POINT_GRID_SCENE, [24, 3]);
      expect(blank.length).assertEqual(drawn.length);
      expect(blank.length % 4).assertEqual(0);
      expect(changedPixels(blank, drawn)).assertLarger(MIN_CHANGED_PIXELS);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0077
         * @tc.name      testNdkRenderNodePixel0077
         * @tc.desc      校验先绘制另一域再清屏后重绘，结果与直接绘制一致，画布无状态残留。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixel0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const geometry: GroupSpec | undefined = groupById(GROUP_GEOMETRY);
      expect(geometry !== undefined).assertTrue();
      if (geometry === undefined) {
        return;
      }
      const params: number[] = defaultsOf(geometry, CLEAR_SCENE);
      const direct: Uint8Array = await renderScene(uiContext, GROUP_GEOMETRY, CLEAR_SCENE, params);
      await renderScene(uiContext, GROUP_CANVAS, POINT_GRID_SCENE, [24, 3]);
      await captureBlank(uiContext);
      const again: Uint8Array = await renderScene(uiContext, GROUP_GEOMETRY, CLEAR_SCENE, params);
      expect(digest(direct)).assertEqual(digest(again));
      expect(direct.length).assertEqual(again.length);
      expect(direct.length).assertLarger(0);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0078
         * @tc.name      testNdkRenderNodePixel0078
         * @tc.desc      校验 A 域到 B 域再到 A 域后画面回到第一次结果，绘制之间互不影响。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixel0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const geometry: GroupSpec | undefined = groupById(GROUP_GEOMETRY);
      expect(geometry !== undefined).assertTrue();
      if (geometry === undefined) {
        return;
      }
      const first: Uint8Array = await renderScene(uiContext, GROUP_CANVAS, POINT_GRID_SCENE, [24, 3]);
      await renderScene(uiContext, GROUP_GEOMETRY, CLEAR_SCENE, defaultsOf(geometry, CLEAR_SCENE));
      const third: Uint8Array = await renderScene(uiContext, GROUP_CANVAS, POINT_GRID_SCENE, [24, 3]);
      expect(digest(first)).assertEqual(digest(third));
      expect(first.length).assertEqual(third.length);
      expect(first.length).assertLarger(0);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0079
         * @tc.name      testNdkRenderNodePixel0079
         * @tc.desc      校验连续两次清屏后的画面与第一次空白基线完全一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const baseline: Uint8Array = await captureBlank(uiContext);
      await renderScene(uiContext, GROUP_PAINT, CLEAR_SCENE, [1, 100]);
      const first: Uint8Array = await captureBlank(uiContext);
      const second: Uint8Array = await captureBlank(uiContext);
      expect(digest(first)).assertEqual(digest(baseline));
      expect(digest(second)).assertEqual(digest(baseline));
      expect(first.length).assertEqual(second.length);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0080
         * @tc.name      testNdkRenderNodePixel0080
         * @tc.desc      校验几何域第三个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrameAt(readyUiContext(), GROUP_GEOMETRY, GEOMETRY_SCENE_THIRD);
      expect(drawn.scene).assertEqual(GEOMETRY_SCENE_THIRD);
      expect(drawn.bytes).assertLarger(0);
      expect(drawn.blankBytes).assertEqual(drawn.bytes);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0081
         * @tc.name      testNdkRenderNodePixel0081
         * @tc.desc      校验绘制属性域第三个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrameAt(readyUiContext(), GROUP_PAINT, 2);
      expect(drawn.scene).assertLarger(-1);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0082
         * @tc.name      testNdkRenderNodePixel0082
         * @tc.desc      校验颜色域第三个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrameAt(readyUiContext(), GROUP_COLOR, 2);
      expect(drawn.scene).assertLarger(-1);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0083
         * @tc.name      testNdkRenderNodePixel0083
         * @tc.desc      校验位图域第三个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrameAt(readyUiContext(), GROUP_BITMAP, 2);
      expect(drawn.scene).assertLarger(-1);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0084
         * @tc.name      testNdkRenderNodePixel0084
         * @tc.desc      校验矩阵域第三个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrameAt(readyUiContext(), GROUP_MATRIX, 2);
      expect(drawn.scene).assertLarger(-1);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0085
         * @tc.name      testNdkRenderNodePixel0085
         * @tc.desc      校验排版域第三个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrameAt(readyUiContext(), GROUP_TYPOGRAPHY, 2);
      expect(drawn.scene).assertLarger(-1);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0086
         * @tc.name      testNdkRenderNodePixel0086
         * @tc.desc      校验着色器域第三个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrameAt(readyUiContext(), GROUP_SHADER, 2);
      expect(drawn.scene).assertLarger(-1);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0087
         * @tc.name      testNdkRenderNodePixel0087
         * @tc.desc      校验字体域第三个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrameAt(readyUiContext(), GROUP_FONT, 2);
      expect(drawn.scene).assertLarger(-1);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0088
         * @tc.name      testNdkRenderNodePixel0088
         * @tc.desc      校验文本块域第三个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrameAt(readyUiContext(), GROUP_TEXTBLOB, 2);
      expect(drawn.scene).assertLarger(-1);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0089
         * @tc.name      testNdkRenderNodePixel0089
         * @tc.desc      校验像素图域第三个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrameAt(readyUiContext(), GROUP_PIXELMAP, 2);
      expect(drawn.scene).assertLarger(-1);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0090
         * @tc.name      testNdkRenderNodePixel0090
         * @tc.desc      校验图像滤镜域第三个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrameAt(readyUiContext(), GROUP_IMAGE_FILTER, 2);
      expect(drawn.scene).assertLarger(-1);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0091
         * @tc.name      testNdkRenderNodePixel0091
         * @tc.desc      校验颜色滤镜域第三个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrameAt(readyUiContext(), GROUP_COLOR_FILTER, 2);
      expect(drawn.scene).assertLarger(-1);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0092
         * @tc.name      testNdkRenderNodePixel0092
         * @tc.desc      校验遮罩滤镜域第三个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrameAt(readyUiContext(), GROUP_MASK_FILTER, 2);
      expect(drawn.scene).assertLarger(-1);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0093
         * @tc.name      testNdkRenderNodePixel0093
         * @tc.desc      校验错误码域第三个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrameAt(readyUiContext(), GROUP_ERROR, 2);
      expect(drawn.scene).assertLarger(-1);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0094
         * @tc.name      testNdkRenderNodePixel0094
         * @tc.desc      校验图片编解码域第三个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrameAt(readyUiContext(), GROUP_IMAGE_IO, 2);
      expect(drawn.scene).assertLarger(-1);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
      expect(drawn.bytes).assertEqual(drawn.blankBytes);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0095
         * @tc.name      testNdkRenderNodePixel0095
         * @tc.desc      校验画布域第四个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrameAt(readyUiContext(), GROUP_CANVAS, CANVAS_SCENE_FOURTH);
      expect(drawn.scene).assertEqual(CANVAS_SCENE_FOURTH);
      expect(drawn.bytes).assertLarger(0);
      expect(drawn.blankBytes).assertEqual(drawn.bytes);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0096
         * @tc.name      testNdkRenderNodePixel0096
         * @tc.desc      校验画布域第六个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrameAt(readyUiContext(), GROUP_CANVAS, CANVAS_SCENE_SIXTH);
      expect(drawn.scene).assertEqual(CANVAS_SCENE_SIXTH);
      expect(drawn.bytes).assertLarger(0);
      expect(drawn.blankBytes).assertEqual(drawn.bytes);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0097
         * @tc.name      testNdkRenderNodePixel0097
         * @tc.desc      校验画布域第八个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrameAt(readyUiContext(), GROUP_CANVAS, CANVAS_SCENE_EIGHTH);
      expect(drawn.scene).assertEqual(CANVAS_SCENE_EIGHTH);
      expect(drawn.bytes).assertLarger(0);
      expect(drawn.blankBytes).assertEqual(drawn.bytes);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0098
         * @tc.name      testNdkRenderNodePixel0098
         * @tc.desc      校验几何域第六个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrameAt(readyUiContext(), GROUP_GEOMETRY, GEOMETRY_SCENE_SIXTH);
      expect(drawn.scene).assertEqual(GEOMETRY_SCENE_SIXTH);
      expect(drawn.bytes).assertLarger(0);
      expect(drawn.blankBytes).assertEqual(drawn.bytes);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0099
         * @tc.name      testNdkRenderNodePixel0099
         * @tc.desc      校验几何域第十个场景在真实画布上出图。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodePixel0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      expect(await waitReady()).assertTrue();
      const drawn: DrawFrame = await drawFrameAt(readyUiContext(), GROUP_GEOMETRY, GEOMETRY_SCENE_TENTH);
      expect(drawn.scene).assertEqual(GEOMETRY_SCENE_TENTH);
      expect(drawn.bytes).assertLarger(0);
      expect(drawn.blankBytes).assertEqual(drawn.bytes);
      expect(drawn.changed).assertLarger(MIN_CHANGED_PIXELS);
    })

    /**
         * @tc.number    SUB_RENDER_NODE_PIXEL_0100
         * @tc.name      testNdkRenderNodePixel0100
         * @tc.desc      校验同一场景相同参数画面一致、不同参数画面不同，参数确实参与绘制。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodePixel0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const first: Uint8Array = await renderScene(uiContext, GROUP_CANVAS, POINT_GRID_SCENE, [24, 3]);
      const same: Uint8Array = await renderScene(uiContext, GROUP_CANVAS, POINT_GRID_SCENE, [24, 3]);
      const other: Uint8Array = await renderScene(uiContext, GROUP_CANVAS, POINT_GRID_SCENE, [40, 5]);
      expect(digest(first)).assertEqual(digest(same));
      expect(digest(first) === digest(other)).assertFalse();
      expect(changedPixels(first, other)).assertLarger(MIN_CHANGED_PIXELS);
    })

  })
}
