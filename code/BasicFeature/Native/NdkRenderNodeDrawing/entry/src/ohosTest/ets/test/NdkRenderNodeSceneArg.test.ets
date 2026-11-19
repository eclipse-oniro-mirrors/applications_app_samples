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

// 真实画布入参契约（探路批）：在 HarnessRenderNode 的绘制回调里把尺寸/编号换成非法值，
// 让 nativeRenderScene 的尺寸守卫与编号守卫在真机上真实执行，再用组件快照比对空白基线。
// 期望值来源：native_bridge.cpp 的 width<=0 / height<=0 早退、IsCapabilitySupported 越界拦截。
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { UIContext } from '@kit.ArkUI';
import { ARG_GROUP_OVER, ARG_GROUP_OK, ARG_GROUP_ZERO, ARG_HEIGHT_ZERO, ARG_SCENE_OK, ARG_SCENE_OVER,
  ARG_WIDTH_NEGATIVE, probeSceneArgs, resetSceneArgs, SceneArgObs } from './SceneArgProbe';
import { MIN_CHANGED_PIXELS, readyUiContext, waitReady } from './PixelProbe';

const TAG: string = '[Sample_NdkRenderNodeSceneArgTest]';
const DOMAIN: number = 0xF811;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function ndkRenderNodeSceneArgTest(): void {
  describe('NdkRenderNodeSceneArg', () => {
    /**
         * @tc.number    SUB_RENDER_NODE_SCENE_ARG_0001
         * @tc.name      testNdkRenderNodeSceneArg0001
         * @tc.desc      校验合法入参经绘制回调注入后真实出图，作为后续非法入参用例的有效性对照。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL1
         */
    it('testNdkRenderNodeSceneArg0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      logInfo('testNdkRenderNodeSceneArg0001 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      try {
        const observed: SceneArgObs = await probeSceneArgs(uiContext, ARG_GROUP_OK, ARG_SCENE_OK,
          null, null, null, null);
        logInfo('control changed=' + observed.changed.toString() + ' draws=' + observed.draws.toString());
        expect(observed.redrawn).assertTrue();
        expect(observed.draws).assertLarger(0);
        expect(observed.changed).assertLarger(MIN_CHANGED_PIXELS);
        expect(observed.bytes).assertEqual(observed.blankBytes);
        expect(observed.alive).assertTrue();
      } finally {
        await resetSceneArgs(uiContext);
      }
      logInfo('testNdkRenderNodeSceneArg0001 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SCENE_ARG_0002
         * @tc.name      testNdkRenderNodeSceneArg0002
         * @tc.desc      校验宽度为负时绘制被尺寸守卫拦截：重绘照常发生，画面与空白基线完全一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeSceneArg0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeSceneArg0002 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      try {
        const observed: SceneArgObs = await probeSceneArgs(uiContext, ARG_GROUP_OK, ARG_SCENE_OK,
          ARG_WIDTH_NEGATIVE, null, null, null);
        logInfo('negative width changed=' + observed.changed.toString() + ' draws=' + observed.draws.toString());
        expect(observed.redrawn).assertTrue();
        expect(observed.draws).assertLarger(0);
        expect(observed.changed).assertEqual(0);
        expect(observed.bytes).assertEqual(observed.blankBytes);
        expect(observed.alive).assertTrue();
      } finally {
        await resetSceneArgs(uiContext);
      }
      logInfo('testNdkRenderNodeSceneArg0002 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SCENE_ARG_0003
         * @tc.name      testNdkRenderNodeSceneArg0003
         * @tc.desc      校验高度为零时静默跳过绘制：布局未就绪的零尺寸帧不产生任何像素。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeSceneArg0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeSceneArg0003 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      try {
        const observed: SceneArgObs = await probeSceneArgs(uiContext, ARG_GROUP_OK, ARG_SCENE_OK,
          null, ARG_HEIGHT_ZERO, null, null);
        logInfo('zero height changed=' + observed.changed.toString() + ' draws=' + observed.draws.toString());
        expect(observed.redrawn).assertTrue();
        expect(observed.draws).assertLarger(0);
        expect(observed.changed).assertEqual(0);
        expect(observed.bytes).assertEqual(observed.blankBytes);
        expect(observed.alive).assertTrue();
      } finally {
        await resetSceneArgs(uiContext);
      }
      logInfo('testNdkRenderNodeSceneArg0003 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SCENE_ARG_0004
         * @tc.name      testNdkRenderNodeSceneArg0004
         * @tc.desc      校验能力域编号为 0 时被编号守卫拦截，画面与空白基线完全一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeSceneArg0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeSceneArg0004 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      try {
        const observed: SceneArgObs = await probeSceneArgs(uiContext, ARG_GROUP_OK, ARG_SCENE_OK,
          null, null, ARG_GROUP_ZERO, null);
        logInfo('group zero changed=' + observed.changed.toString() + ' draws=' + observed.draws.toString());
        expect(observed.redrawn).assertTrue();
        expect(observed.draws).assertLarger(0);
        expect(observed.changed).assertEqual(0);
        expect(observed.bytes).assertEqual(observed.blankBytes);
        expect(observed.alive).assertTrue();
      } finally {
        await resetSceneArgs(uiContext);
      }
      logInfo('testNdkRenderNodeSceneArg0004 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SCENE_ARG_0005
         * @tc.name      testNdkRenderNodeSceneArg0005
         * @tc.desc      校验能力域编号超出 19 时被编号守卫拦截，画面与空白基线完全一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeSceneArg0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeSceneArg0005 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      try {
        const observed: SceneArgObs = await probeSceneArgs(uiContext, ARG_GROUP_OK, ARG_SCENE_OK,
          null, null, ARG_GROUP_OVER, null);
        logInfo('group over changed=' + observed.changed.toString() + ' draws=' + observed.draws.toString());
        expect(observed.redrawn).assertTrue();
        expect(observed.draws).assertLarger(0);
        expect(observed.changed).assertEqual(0);
        expect(observed.bytes).assertEqual(observed.blankBytes);
        expect(observed.alive).assertTrue();
      } finally {
        await resetSceneArgs(uiContext);
      }
      logInfo('testNdkRenderNodeSceneArg0005 end');
    })

    /**
         * @tc.number    SUB_RENDER_NODE_SCENE_ARG_0006
         * @tc.name      testNdkRenderNodeSceneArg0006
         * @tc.desc      校验场景编号等于该域场景数时越界拦截，画面与空白基线完全一致。
         * @tc.type      FUNCTION
         * @tc.size      SMALLTEST
         * @tc.level     LEVEL2
         */
    it('testNdkRenderNodeSceneArg0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkRenderNodeSceneArg0006 begin');
      expect(await waitReady()).assertTrue();
      const uiContext: UIContext = readyUiContext();
      try {
        const observed: SceneArgObs = await probeSceneArgs(uiContext, ARG_GROUP_OK, ARG_SCENE_OK,
          null, null, null, ARG_SCENE_OVER);
        logInfo('scene over changed=' + observed.changed.toString() + ' draws=' + observed.draws.toString());
        expect(observed.redrawn).assertTrue();
        expect(observed.draws).assertLarger(0);
        expect(observed.changed).assertEqual(0);
        expect(observed.bytes).assertEqual(observed.blankBytes);
        expect(observed.alive).assertTrue();
      } finally {
        await resetSceneArgs(uiContext);
      }
      logInfo('testNdkRenderNodeSceneArg0006 end');
    })
  })
}
