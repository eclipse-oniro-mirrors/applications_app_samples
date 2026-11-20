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
import { image } from '@kit.ImageKit';
import { UIContext } from '@kit.ArkUI';
import { GroupSpec } from '../../../main/ets/core/SchemaTypes';
import { defaultsOf, groupById } from './SceneDefaults';
import { HARNESS } from './PixelHarness';
import {
  captureBlank, changedPixels, CLEAR_SCENE, digest, GROUP_CANVAS, MIN_CHANGED_PIXELS, readyUiContext,
  renderSceneWithPixelMap, waitReady
} from './PixelProbe';
import { createCheckerPixelMap, MAP_SIDE, MAP_SIDE_OVERSIZE, MAP_SIDE_TINY, releasePixelMap } from './TestPixelMap';

const TAG: string = '[Sample_NdkRenderNodePixelMapArgTest]';
const DOMAIN: number = 0xF811;
// 像素图能力域编号，与 native 侧 GROUP_PIXELMAP 一致。
const PIXELMAP_GROUP: number = 10;
// 场景编号，与 cap_pixelmap.cpp 的 PIXELMAP_* 枚举一致。
const SCENE_DRAW_RECT: number = 0;
const SCENE_SAMPLING_NEAREST: number = 1;
const SCENE_SAMPLING_LINEAR: number = 2;
const SCENE_SRC_CONSTRAINT: number = 3;
const SCENE_NINE_PATCH: number = 4;
const SCENE_MESH: number = 5;
const SCENE_ROTATE: number = 6;
const SCENE_TILE: number = 7;
const SCENE_ALPHA: number = 8;
const SCENE_SCALE: number = 9;
const SCENE_CLIP: number = 10;
const SCENE_FALLBACK: number = 11;
// 该域场景总数，越界场景应在 native 入口被拦截。
const SCENE_TOTAL: number = 12;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

// 贴图观测：同一场景在传入 PixelMap 与缺图降级两种形态下的画面差异量。
class SceneRenderObs {
  public scene: number = -1;
  public mapSide: number = 0;
  public expectedDiffers: boolean = false;
  public drawn: number = 0;
  public fallbackDrawn: number = 0;
  public diff: number = 0;
  public digestEqual: boolean = false;
}

// 采集同一场景在「传入 PixelMap」时的表现：是否出图、与缺图降级形态的差异是否符合预期。
async function observeSceneRenders(uiContext: UIContext, scene: number, pixelMap: image.PixelMap | undefined,
  differs: boolean, label: string, mapSide: number): Promise<SceneRenderObs> {
  const observed: SceneRenderObs = new SceneRenderObs();
  observed.scene = scene;
  observed.mapSide = mapSide;
  observed.expectedDiffers = differs;
  const spec: GroupSpec | undefined = groupById(PIXELMAP_GROUP);
  expect(spec !== undefined).assertTrue();
  if (spec === undefined) {
    return observed;
  }
  const params: number[] = defaultsOf(spec, scene);
  const blank: Uint8Array = await captureBlank(uiContext);
  const withMap: Uint8Array = await renderSceneWithPixelMap(uiContext, PIXELMAP_GROUP, scene, params, pixelMap);
  const fallback: Uint8Array = await renderSceneWithPixelMap(uiContext, PIXELMAP_GROUP, scene, params, undefined);
  observed.drawn = changedPixels(blank, withMap);
  observed.fallbackDrawn = changedPixels(blank, fallback);
  observed.diff = changedPixels(withMap, fallback);
  observed.digestEqual = digest(withMap) === digest(fallback);
  logInfo(label + ' drawn=' + observed.drawn.toString() + ' fallbackDrawn='
    + observed.fallbackDrawn.toString() + ' diff=' + observed.diff.toString());
  expect(observed.drawn).assertLarger(MIN_CHANGED_PIXELS);
  expect(observed.fallbackDrawn).assertLarger(MIN_CHANGED_PIXELS);
  if (differs) {
    // 真实贴图生效：画面必须与「缺少图片」的示意图不同。
    expect(observed.digestEqual).assertFalse();
    expect(observed.diff).assertLarger(MIN_CHANGED_PIXELS);
  } else {
    // 该场景本身就是降级示意，传入 PixelMap 也不应改变画面。
    expect(observed.digestEqual).assertTrue();
  }
  return observed;
}

// 连续绘制两次并返回两幅画面是否完全一致。
async function repeatWithMapIsStable(uiContext: UIContext, scene: number,
  pixelMap: image.PixelMap | undefined): Promise<boolean> {
  const spec: GroupSpec | undefined = groupById(PIXELMAP_GROUP);
  if (spec === undefined) {
    return false;
  }
  const params: number[] = defaultsOf(spec, scene);
  const first: Uint8Array = await renderSceneWithPixelMap(uiContext, PIXELMAP_GROUP, scene, params, pixelMap);
  const second: Uint8Array = await renderSceneWithPixelMap(uiContext, PIXELMAP_GROUP, scene, params, pixelMap);
  return digest(first) === digest(second);
}

export default function ndkRenderNodePixelMapArgTest(): void {
  describe('NdkRenderNodePixelMapArg', () => {
    /**
     * @tc.number    SUB_RENDER_NODE_PIXELMAP_ARG_0001
     * @tc.name      testNdkRenderNodePixelMapArg0001
     * @tc.desc      校验像素图域整幅绘制场景在传入合法 PixelMap 后走真实贴图，画面与缺图示意图不同。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkRenderNodePixelMapArg0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkRenderNodePixelMapArg0001 begin');
      expect(await waitReady()).assertTrue();
      const pixelMap: image.PixelMap | undefined = await createCheckerPixelMap(MAP_SIDE);
      expect(pixelMap !== undefined).assertTrue();
      const observed: SceneRenderObs = await observeSceneRenders(
        readyUiContext(), SCENE_DRAW_RECT, pixelMap, true, 'drawRect', MAP_SIDE);
      expect(observed.scene).assertEqual(SCENE_DRAW_RECT);
      expect(observed.mapSide).assertEqual(MAP_SIDE);
      expect(observed.expectedDiffers).assertTrue();
      expect(observed.drawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.fallbackDrawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.digestEqual).assertFalse();
      expect(observed.diff).assertLarger(MIN_CHANGED_PIXELS);
      await releasePixelMap(pixelMap);
      HARNESS.clearScene();
      logInfo('testNdkRenderNodePixelMapArg0001 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PIXELMAP_ARG_0002
     * @tc.name      testNdkRenderNodePixelMapArg0002
     * @tc.desc      校验最近邻采样场景在传入合法 PixelMap 后与降级示意图不同，采样路径确实读取了图片。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodePixelMapArg0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelMapArg0002 begin');
      expect(await waitReady()).assertTrue();
      const pixelMap: image.PixelMap | undefined = await createCheckerPixelMap(MAP_SIDE);
      expect(pixelMap !== undefined).assertTrue();
      const observed: SceneRenderObs = await observeSceneRenders(
        readyUiContext(), SCENE_SAMPLING_NEAREST, pixelMap, true, 'samplingNearest', MAP_SIDE);
      expect(observed.scene).assertEqual(SCENE_SAMPLING_NEAREST);
      expect(observed.mapSide).assertEqual(MAP_SIDE);
      expect(observed.expectedDiffers).assertTrue();
      expect(observed.drawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.fallbackDrawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.digestEqual).assertFalse();
      expect(observed.diff).assertLarger(MIN_CHANGED_PIXELS);
      await releasePixelMap(pixelMap);
      HARNESS.clearScene();
      logInfo('testNdkRenderNodePixelMapArg0002 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PIXELMAP_ARG_0003
     * @tc.name      testNdkRenderNodePixelMapArg0003
     * @tc.desc      校验线性采样场景在传入合法 PixelMap 后出图，且与最近邻采样画面不同。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodePixelMapArg0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelMapArg0003 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const pixelMap: image.PixelMap | undefined = await createCheckerPixelMap(MAP_SIDE);
      expect(pixelMap !== undefined).assertTrue();
      const observed: SceneRenderObs = await observeSceneRenders(
        uiContext, SCENE_SAMPLING_LINEAR, pixelMap, true, 'samplingLinear', MAP_SIDE);
      expect(observed.scene).assertEqual(SCENE_SAMPLING_LINEAR);
      expect(observed.mapSide).assertEqual(MAP_SIDE);
      expect(observed.expectedDiffers).assertTrue();
      expect(observed.drawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.fallbackDrawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.digestEqual).assertFalse();
      expect(observed.diff).assertLarger(MIN_CHANGED_PIXELS);
      const spec: GroupSpec | undefined = groupById(PIXELMAP_GROUP);
      expect(spec !== undefined).assertTrue();
      if (spec !== undefined) {
        const nearest: Uint8Array = await renderSceneWithPixelMap(uiContext, PIXELMAP_GROUP, SCENE_SAMPLING_NEAREST,
          defaultsOf(spec, SCENE_SAMPLING_NEAREST), pixelMap);
        const linear: Uint8Array = await renderSceneWithPixelMap(uiContext, PIXELMAP_GROUP, SCENE_SAMPLING_LINEAR,
          defaultsOf(spec, SCENE_SAMPLING_LINEAR), pixelMap);
        logInfo('sampling diff pixels = ' + changedPixels(nearest, linear).toString());
        expect(digest(nearest) !== digest(linear)).assertTrue();
      }
      await releasePixelMap(pixelMap);
      HARNESS.clearScene();
      logInfo('testNdkRenderNodePixelMapArg0003 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PIXELMAP_ARG_0004
     * @tc.name      testNdkRenderNodePixelMapArg0004
     * @tc.desc      校验源矩形约束场景在传入合法 PixelMap 后出图，约束绘制接口返回成功。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodePixelMapArg0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelMapArg0004 begin');
      expect(await waitReady()).assertTrue();
      const pixelMap: image.PixelMap | undefined = await createCheckerPixelMap(MAP_SIDE);
      expect(pixelMap !== undefined).assertTrue();
      const observed: SceneRenderObs = await observeSceneRenders(
        readyUiContext(), SCENE_SRC_CONSTRAINT, pixelMap, true, 'srcConstraint', MAP_SIDE);
      expect(observed.scene).assertEqual(SCENE_SRC_CONSTRAINT);
      expect(observed.mapSide).assertEqual(MAP_SIDE);
      expect(observed.expectedDiffers).assertTrue();
      expect(observed.drawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.fallbackDrawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.digestEqual).assertFalse();
      expect(observed.diff).assertLarger(MIN_CHANGED_PIXELS);
      await releasePixelMap(pixelMap);
      HARNESS.clearScene();
      logInfo('testNdkRenderNodePixelMapArg0004 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PIXELMAP_ARG_0005
     * @tc.name      testNdkRenderNodePixelMapArg0005
     * @tc.desc      校验九宫格缩放场景在传入合法 PixelMap 后出图，九宫格分割口径有效。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodePixelMapArg0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelMapArg0005 begin');
      expect(await waitReady()).assertTrue();
      const pixelMap: image.PixelMap | undefined = await createCheckerPixelMap(MAP_SIDE);
      expect(pixelMap !== undefined).assertTrue();
      const observed: SceneRenderObs = await observeSceneRenders(
        readyUiContext(), SCENE_NINE_PATCH, pixelMap, true, 'ninePatch', MAP_SIDE);
      expect(observed.scene).assertEqual(SCENE_NINE_PATCH);
      expect(observed.mapSide).assertEqual(MAP_SIDE);
      expect(observed.expectedDiffers).assertTrue();
      expect(observed.drawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.fallbackDrawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.digestEqual).assertFalse();
      expect(observed.diff).assertLarger(MIN_CHANGED_PIXELS);
      await releasePixelMap(pixelMap);
      HARNESS.clearScene();
      logInfo('testNdkRenderNodePixelMapArg0005 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PIXELMAP_ARG_0006
     * @tc.name      testNdkRenderNodePixelMapArg0006
     * @tc.desc      校验网格变形场景在传入合法 PixelMap 后出图，顶点网格绘制有效。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodePixelMapArg0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodePixelMapArg0006 begin');
      expect(await waitReady()).assertTrue();
      const pixelMap: image.PixelMap | undefined = await createCheckerPixelMap(MAP_SIDE);
      expect(pixelMap !== undefined).assertTrue();
      const observed: SceneRenderObs = await observeSceneRenders(
        readyUiContext(), SCENE_MESH, pixelMap, true, 'mesh', MAP_SIDE);
      expect(observed.scene).assertEqual(SCENE_MESH);
      expect(observed.mapSide).assertEqual(MAP_SIDE);
      expect(observed.expectedDiffers).assertTrue();
      expect(observed.drawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.fallbackDrawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.digestEqual).assertFalse();
      expect(observed.diff).assertLarger(MIN_CHANGED_PIXELS);
      await releasePixelMap(pixelMap);
      HARNESS.clearScene();
      logInfo('testNdkRenderNodePixelMapArg0006 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PIXELMAP_ARG_0007
     * @tc.name      testNdkRenderNodePixelMapArg0007
     * @tc.desc      校验旋转绘制场景在传入合法 PixelMap 后出图，画布变换前后状态配平。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodePixelMapArg0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelMapArg0007 begin');
      expect(await waitReady()).assertTrue();
      const pixelMap: image.PixelMap | undefined = await createCheckerPixelMap(MAP_SIDE);
      expect(pixelMap !== undefined).assertTrue();
      const observed: SceneRenderObs = await observeSceneRenders(
        readyUiContext(), SCENE_ROTATE, pixelMap, true, 'rotate', MAP_SIDE);
      expect(observed.scene).assertEqual(SCENE_ROTATE);
      expect(observed.mapSide).assertEqual(MAP_SIDE);
      expect(observed.expectedDiffers).assertTrue();
      expect(observed.drawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.fallbackDrawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.digestEqual).assertFalse();
      expect(observed.diff).assertLarger(MIN_CHANGED_PIXELS);
      await releasePixelMap(pixelMap);
      HARNESS.clearScene();
      logInfo('testNdkRenderNodePixelMapArg0007 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PIXELMAP_ARG_0008
     * @tc.name      testNdkRenderNodePixelMapArg0008
     * @tc.desc      校验平铺场景在传入合法 PixelMap 后出图，重复贴图不会退化为示意图。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodePixelMapArg0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelMapArg0008 begin');
      expect(await waitReady()).assertTrue();
      const pixelMap: image.PixelMap | undefined = await createCheckerPixelMap(MAP_SIDE);
      expect(pixelMap !== undefined).assertTrue();
      const observed: SceneRenderObs = await observeSceneRenders(
        readyUiContext(), SCENE_TILE, pixelMap, true, 'tile', MAP_SIDE);
      expect(observed.scene).assertEqual(SCENE_TILE);
      expect(observed.mapSide).assertEqual(MAP_SIDE);
      expect(observed.expectedDiffers).assertTrue();
      expect(observed.drawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.fallbackDrawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.digestEqual).assertFalse();
      expect(observed.diff).assertLarger(MIN_CHANGED_PIXELS);
      await releasePixelMap(pixelMap);
      HARNESS.clearScene();
      logInfo('testNdkRenderNodePixelMapArg0008 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PIXELMAP_ARG_0009
     * @tc.name      testNdkRenderNodePixelMapArg0009
     * @tc.desc      校验整体透明度场景在传入合法 PixelMap 后出图，图层叠加参数生效。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodePixelMapArg0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodePixelMapArg0009 begin');
      expect(await waitReady()).assertTrue();
      const pixelMap: image.PixelMap | undefined = await createCheckerPixelMap(MAP_SIDE);
      expect(pixelMap !== undefined).assertTrue();
      const observed: SceneRenderObs = await observeSceneRenders(
        readyUiContext(), SCENE_ALPHA, pixelMap, true, 'alpha', MAP_SIDE);
      expect(observed.scene).assertEqual(SCENE_ALPHA);
      expect(observed.mapSide).assertEqual(MAP_SIDE);
      expect(observed.expectedDiffers).assertTrue();
      expect(observed.drawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.fallbackDrawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.digestEqual).assertFalse();
      expect(observed.diff).assertLarger(MIN_CHANGED_PIXELS);
      await releasePixelMap(pixelMap);
      HARNESS.clearScene();
      logInfo('testNdkRenderNodePixelMapArg0009 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PIXELMAP_ARG_0010
     * @tc.name      testNdkRenderNodePixelMapArg0010
     * @tc.desc      校验缩放绘制场景在传入合法 PixelMap 后出图，目标矩形随参数放大。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodePixelMapArg0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelMapArg0010 begin');
      expect(await waitReady()).assertTrue();
      const pixelMap: image.PixelMap | undefined = await createCheckerPixelMap(MAP_SIDE);
      expect(pixelMap !== undefined).assertTrue();
      const observed: SceneRenderObs = await observeSceneRenders(
        readyUiContext(), SCENE_SCALE, pixelMap, true, 'scale', MAP_SIDE);
      expect(observed.scene).assertEqual(SCENE_SCALE);
      expect(observed.mapSide).assertEqual(MAP_SIDE);
      expect(observed.expectedDiffers).assertTrue();
      expect(observed.drawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.fallbackDrawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.digestEqual).assertFalse();
      expect(observed.diff).assertLarger(MIN_CHANGED_PIXELS);
      await releasePixelMap(pixelMap);
      HARNESS.clearScene();
      logInfo('testNdkRenderNodePixelMapArg0010 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PIXELMAP_ARG_0011
     * @tc.name      testNdkRenderNodePixelMapArg0011
     * @tc.desc      校验圆角裁剪场景在传入合法 PixelMap 后出图，裁剪与贴图顺序正确。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodePixelMapArg0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodePixelMapArg0011 begin');
      expect(await waitReady()).assertTrue();
      const pixelMap: image.PixelMap | undefined = await createCheckerPixelMap(MAP_SIDE);
      expect(pixelMap !== undefined).assertTrue();
      const observed: SceneRenderObs = await observeSceneRenders(
        readyUiContext(), SCENE_CLIP, pixelMap, true, 'clip', MAP_SIDE);
      expect(observed.scene).assertEqual(SCENE_CLIP);
      expect(observed.mapSide).assertEqual(MAP_SIDE);
      expect(observed.expectedDiffers).assertTrue();
      expect(observed.drawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.fallbackDrawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.digestEqual).assertFalse();
      expect(observed.diff).assertLarger(MIN_CHANGED_PIXELS);
      await releasePixelMap(pixelMap);
      HARNESS.clearScene();
      logInfo('testNdkRenderNodePixelMapArg0011 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PIXELMAP_ARG_0012
     * @tc.name      testNdkRenderNodePixelMapArg0012
     * @tc.desc      校验降级示意图场景即使传入合法 PixelMap 也保持示意图，与缺图画面完全一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodePixelMapArg0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelMapArg0012 begin');
      expect(await waitReady()).assertTrue();
      const pixelMap: image.PixelMap | undefined = await createCheckerPixelMap(MAP_SIDE);
      expect(pixelMap !== undefined).assertTrue();
      const observed: SceneRenderObs = await observeSceneRenders(
        readyUiContext(), SCENE_FALLBACK, pixelMap, false, 'fallback', MAP_SIDE);
      expect(observed.scene).assertEqual(SCENE_FALLBACK);
      expect(observed.mapSide).assertEqual(MAP_SIDE);
      expect(observed.expectedDiffers).assertFalse();
      expect(observed.digestEqual).assertTrue();
      expect(observed.diff < MIN_CHANGED_PIXELS).assertTrue();
      await releasePixelMap(pixelMap);
      HARNESS.clearScene();
      logInfo('testNdkRenderNodePixelMapArg0012 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PIXELMAP_ARG_0013
     * @tc.name      testNdkRenderNodePixelMapArg0013
     * @tc.desc      校验 1x1 极小 PixelMap 在整幅绘制场景下不崩溃，仍走真实贴图而非降级。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodePixelMapArg0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodePixelMapArg0013 begin');
      expect(await waitReady()).assertTrue();
      const pixelMap: image.PixelMap | undefined = await createCheckerPixelMap(MAP_SIDE_TINY);
      expect(pixelMap !== undefined).assertTrue();
      const observed: SceneRenderObs = await observeSceneRenders(
        readyUiContext(), SCENE_DRAW_RECT, pixelMap, true, 'tiny#drawRect', MAP_SIDE_TINY);
      expect(observed.scene).assertEqual(SCENE_DRAW_RECT);
      expect(observed.mapSide).assertEqual(MAP_SIDE_TINY);
      expect(observed.expectedDiffers).assertTrue();
      expect(observed.drawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.fallbackDrawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.digestEqual).assertFalse();
      expect(observed.diff).assertLarger(MIN_CHANGED_PIXELS);
      await releasePixelMap(pixelMap);
      HARNESS.clearScene();
      logInfo('testNdkRenderNodePixelMapArg0013 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PIXELMAP_ARG_0014
     * @tc.name      testNdkRenderNodePixelMapArg0014
     * @tc.desc      校验 1x1 极小 PixelMap 在九宫格缩放场景下不崩溃，中心矩形不小于目标区域时不越界。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodePixelMapArg0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodePixelMapArg0014 begin');
      expect(await waitReady()).assertTrue();
      const pixelMap: image.PixelMap | undefined = await createCheckerPixelMap(MAP_SIDE_TINY);
      expect(pixelMap !== undefined).assertTrue();
      const observed: SceneRenderObs = await observeSceneRenders(
        readyUiContext(), SCENE_NINE_PATCH, pixelMap, true, 'tiny#ninePatch', MAP_SIDE_TINY);
      expect(observed.scene).assertEqual(SCENE_NINE_PATCH);
      expect(observed.mapSide).assertEqual(MAP_SIDE_TINY);
      expect(observed.expectedDiffers).assertTrue();
      expect(observed.drawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.fallbackDrawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.digestEqual).assertFalse();
      expect(observed.diff).assertLarger(MIN_CHANGED_PIXELS);
      await releasePixelMap(pixelMap);
      HARNESS.clearScene();
      logInfo('testNdkRenderNodePixelMapArg0014 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PIXELMAP_ARG_0015
     * @tc.name      testNdkRenderNodePixelMapArg0015
     * @tc.desc      校验 1x1 极小 PixelMap 在平铺场景下不崩溃，多次重复贴图仍然出图。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodePixelMapArg0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodePixelMapArg0015 begin');
      expect(await waitReady()).assertTrue();
      const pixelMap: image.PixelMap | undefined = await createCheckerPixelMap(MAP_SIDE_TINY);
      expect(pixelMap !== undefined).assertTrue();
      const observed: SceneRenderObs = await observeSceneRenders(
        readyUiContext(), SCENE_TILE, pixelMap, true, 'tiny#tile', MAP_SIDE_TINY);
      expect(observed.scene).assertEqual(SCENE_TILE);
      expect(observed.mapSide).assertEqual(MAP_SIDE_TINY);
      expect(observed.expectedDiffers).assertTrue();
      expect(observed.drawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.fallbackDrawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.digestEqual).assertFalse();
      expect(observed.diff).assertLarger(MIN_CHANGED_PIXELS);
      await releasePixelMap(pixelMap);
      HARNESS.clearScene();
      logInfo('testNdkRenderNodePixelMapArg0015 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PIXELMAP_ARG_0016
     * @tc.name      testNdkRenderNodePixelMapArg0016
     * @tc.desc      校验 1x1 极小 PixelMap 在圆角裁剪场景下不崩溃，源矩形大于图片时不越界。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodePixelMapArg0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodePixelMapArg0016 begin');
      expect(await waitReady()).assertTrue();
      const pixelMap: image.PixelMap | undefined = await createCheckerPixelMap(MAP_SIDE_TINY);
      expect(pixelMap !== undefined).assertTrue();
      const observed: SceneRenderObs = await observeSceneRenders(
        readyUiContext(), SCENE_CLIP, pixelMap, true, 'tiny#clip', MAP_SIDE_TINY);
      expect(observed.scene).assertEqual(SCENE_CLIP);
      expect(observed.mapSide).assertEqual(MAP_SIDE_TINY);
      expect(observed.expectedDiffers).assertTrue();
      expect(observed.drawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.fallbackDrawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.digestEqual).assertFalse();
      expect(observed.diff).assertLarger(MIN_CHANGED_PIXELS);
      await releasePixelMap(pixelMap);
      HARNESS.clearScene();
      logInfo('testNdkRenderNodePixelMapArg0016 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PIXELMAP_ARG_0017
     * @tc.name      testNdkRenderNodePixelMapArg0017
     * @tc.desc      校验 1024x1024 超界 PixelMap 在整幅绘制场景下不崩溃，缩放到画布后仍出图。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodePixelMapArg0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodePixelMapArg0017 begin');
      expect(await waitReady()).assertTrue();
      // 该用例会临时占用约 4 MB 位图内存，用完立即释放。
      const pixelMap: image.PixelMap | undefined = await createCheckerPixelMap(MAP_SIDE_OVERSIZE);
      expect(pixelMap !== undefined).assertTrue();
      const observed: SceneRenderObs = await observeSceneRenders(
        readyUiContext(), SCENE_DRAW_RECT, pixelMap, true, 'oversize#drawRect', MAP_SIDE_OVERSIZE);
      expect(observed.scene).assertEqual(SCENE_DRAW_RECT);
      expect(observed.mapSide).assertEqual(MAP_SIDE_OVERSIZE);
      expect(observed.expectedDiffers).assertTrue();
      expect(observed.drawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.fallbackDrawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.digestEqual).assertFalse();
      expect(observed.diff).assertLarger(MIN_CHANGED_PIXELS);
      await releasePixelMap(pixelMap);
      HARNESS.clearScene();
      logInfo('testNdkRenderNodePixelMapArg0017 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PIXELMAP_ARG_0018
     * @tc.name      testNdkRenderNodePixelMapArg0018
     * @tc.desc      校验 1024x1024 超界 PixelMap 在平铺场景下不崩溃，分格贴图不会撑破画布。
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodePixelMapArg0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodePixelMapArg0018 begin');
      expect(await waitReady()).assertTrue();
      // 该用例会临时占用约 4 MB 位图内存，用完立即释放。
      const pixelMap: image.PixelMap | undefined = await createCheckerPixelMap(MAP_SIDE_OVERSIZE);
      expect(pixelMap !== undefined).assertTrue();
      const observed: SceneRenderObs = await observeSceneRenders(
        readyUiContext(), SCENE_TILE, pixelMap, true, 'oversize#tile', MAP_SIDE_OVERSIZE);
      expect(observed.scene).assertEqual(SCENE_TILE);
      expect(observed.mapSide).assertEqual(MAP_SIDE_OVERSIZE);
      expect(observed.expectedDiffers).assertTrue();
      expect(observed.drawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.fallbackDrawn).assertLarger(MIN_CHANGED_PIXELS);
      expect(observed.digestEqual).assertFalse();
      expect(observed.diff).assertLarger(MIN_CHANGED_PIXELS);
      await releasePixelMap(pixelMap);
      HARNESS.clearScene();
      logInfo('testNdkRenderNodePixelMapArg0018 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PIXELMAP_ARG_0019
     * @tc.name      testNdkRenderNodePixelMapArg0019
     * @tc.desc      校验已释放的 PixelMap 传入后绘制不崩溃，画面降级为缺图示意图。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkRenderNodePixelMapArg0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodePixelMapArg0019 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const spec: GroupSpec | undefined = groupById(PIXELMAP_GROUP);
      expect(spec !== undefined).assertTrue();
      if (spec === undefined) {
        return;
      }
      const params: number[] = defaultsOf(spec, SCENE_DRAW_RECT);
      const pixelMap: image.PixelMap | undefined = await createCheckerPixelMap(MAP_SIDE);
      expect(pixelMap !== undefined).assertTrue();
      // 先确认合法图片可绘制，再释放，确保下面的断言比较的是「释放后」的行为。
      const blank: Uint8Array = await captureBlank(uiContext);
      const before: Uint8Array = await renderSceneWithPixelMap(uiContext, PIXELMAP_GROUP, SCENE_DRAW_RECT, params,
        pixelMap);
      expect(changedPixels(blank, before)).assertLarger(MIN_CHANGED_PIXELS);
      await releasePixelMap(pixelMap);
      logInfo('pixel map released, isReleased=' + (pixelMap === undefined ? 'n/a' : pixelMap.isReleased().toString()));
      // 释放后的句柄读不到图像信息，native 侧应先校验可读性再降级，画面与缺图示意图必须完全一致。
      const after: Uint8Array = await renderSceneWithPixelMap(uiContext, PIXELMAP_GROUP, SCENE_DRAW_RECT, params,
        pixelMap);
      const fallback: Uint8Array = await renderSceneWithPixelMap(uiContext, PIXELMAP_GROUP, SCENE_DRAW_RECT, params,
        undefined);
      logInfo('afterRelease drawn=' + changedPixels(blank, after).toString() + ' fallbackDrawn='
        + changedPixels(blank, fallback).toString());
      expect(changedPixels(blank, after)).assertLarger(MIN_CHANGED_PIXELS);
      expect(changedPixels(blank, fallback)).assertLarger(MIN_CHANGED_PIXELS);
      expect(digest(after) === digest(fallback)).assertTrue();
      expect(changedPixels(after, fallback)).assertEqual(0);
      HARNESS.clearScene();
      logInfo('testNdkRenderNodePixelMapArg0019 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PIXELMAP_ARG_0020
     * @tc.name      testNdkRenderNodePixelMapArg0020
     * @tc.desc      校验非像素图能力域收到 PixelMap 时忽略该入参，画面与不传时完全一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodePixelMapArg0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelMapArg0020 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const spec: GroupSpec | undefined = groupById(GROUP_CANVAS);
      expect(spec !== undefined).assertTrue();
      const pixelMap: image.PixelMap | undefined = await createCheckerPixelMap(MAP_SIDE);
      expect(pixelMap !== undefined).assertTrue();
      if (spec !== undefined) {
        const params: number[] = defaultsOf(spec, CLEAR_SCENE);
        const withMap: Uint8Array = await renderSceneWithPixelMap(uiContext, GROUP_CANVAS, CLEAR_SCENE, params,
          pixelMap);
        const withoutMap: Uint8Array = await renderSceneWithPixelMap(uiContext, GROUP_CANVAS, CLEAR_SCENE, params,
          undefined);
        logInfo('canvas group map diff = ' + changedPixels(withMap, withoutMap).toString());
        expect(digest(withMap)).assertEqual(digest(withoutMap));
      }
      await releasePixelMap(pixelMap);
      HARNESS.clearScene();
      logInfo('testNdkRenderNodePixelMapArg0020 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PIXELMAP_ARG_0021
     * @tc.name      testNdkRenderNodePixelMapArg0021
     * @tc.desc      校验同一 PixelMap 连续两次绘制得到完全一致的画面，贴图链路没有状态残留。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodePixelMapArg0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelMapArg0021 begin');
      expect(await waitReady()).assertTrue();
      const pixelMap: image.PixelMap | undefined = await createCheckerPixelMap(MAP_SIDE);
      expect(pixelMap !== undefined).assertTrue();
      const stable: boolean = await repeatWithMapIsStable(readyUiContext(), SCENE_DRAW_RECT, pixelMap);
      logInfo('repeat with map stable = ' + stable.toString());
      expect(stable).assertTrue();
      await releasePixelMap(pixelMap);
      HARNESS.clearScene();
      logInfo('testNdkRenderNodePixelMapArg0021 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PIXELMAP_ARG_0022
     * @tc.name      testNdkRenderNodePixelMapArg0022
     * @tc.desc      校验释放后重新创建的 PixelMap 能再次绘制，画面与第一次完全一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodePixelMapArg0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelMapArg0022 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const spec: GroupSpec | undefined = groupById(PIXELMAP_GROUP);
      expect(spec !== undefined).assertTrue();
      if (spec === undefined) {
        return;
      }
      const params: number[] = defaultsOf(spec, SCENE_DRAW_RECT);
      const firstMap: image.PixelMap | undefined = await createCheckerPixelMap(MAP_SIDE);
      expect(firstMap !== undefined).assertTrue();
      const first: Uint8Array = await renderSceneWithPixelMap(uiContext, PIXELMAP_GROUP, SCENE_DRAW_RECT, params,
        firstMap);
      await releasePixelMap(firstMap);
      const secondMap: image.PixelMap | undefined = await createCheckerPixelMap(MAP_SIDE);
      expect(secondMap !== undefined).assertTrue();
      const second: Uint8Array = await renderSceneWithPixelMap(uiContext, PIXELMAP_GROUP, SCENE_DRAW_RECT, params,
        secondMap);
      logInfo('recreated map diff = ' + changedPixels(first, second).toString());
      expect(digest(first)).assertEqual(digest(second));
      await releasePixelMap(secondMap);
      HARNESS.clearScene();
      logInfo('testNdkRenderNodePixelMapArg0022 end');
    })

    /**
     * @tc.number    SUB_RENDER_NODE_PIXELMAP_ARG_0023
     * @tc.name      testNdkRenderNodePixelMapArg0023
     * @tc.desc      校验像素图域场景编号越界时即使传入合法 PixelMap 也被拦截，画面与空白基线一致。
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testNdkRenderNodePixelMapArg0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodePixelMapArg0023 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      const pixelMap: image.PixelMap | undefined = await createCheckerPixelMap(MAP_SIDE);
      expect(pixelMap !== undefined).assertTrue();
      const blank: Uint8Array = await captureBlank(uiContext);
      const rejected: Uint8Array = await renderSceneWithPixelMap(uiContext, PIXELMAP_GROUP, SCENE_TOTAL, [], pixelMap);
      const changed: number = changedPixels(blank, rejected);
      logInfo('out of range scene changed = ' + changed.toString());
      expect(changed).assertEqual(0);
      await releasePixelMap(pixelMap);
      HARNESS.clearScene();
      logInfo('testNdkRenderNodePixelMapArg0023 end');
    })
  })
}
