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

// 真实画布入参探针：给 HarnessRenderNode 注入可控的尺寸/编号，把 nativeRenderScene 的
// 入参校验分支在真机绘制回调里真实走一遍，再用组件快照与空白基线比对观测结果。
import { UIContext } from '@kit.ArkUI';
import { GroupSpec } from '../../../main/ets/core/SchemaTypes';
import { HARNESS, HarnessRenderNode } from './PixelHarness';
import { capture, captureBlank, changedPixels, delay, FRAME_SETTLE_MS, probeLog, waitForRedraw } from './PixelProbe';
import { defaultsOf, groupById } from './SceneDefaults';

// 合法对照：几何域第一个场景，画布边长与探针组件一致。
export const ARG_GROUP_OK: number = 2;
export const ARG_SCENE_OK: number = 0;
export const ARG_SIDE_OK: number = 96;
// 非法入参：负数宽度、零高度、编号 0、越界编号、越界场景。
export const ARG_WIDTH_NEGATIVE: number = -4;
export const ARG_HEIGHT_ZERO: number = 0;
export const ARG_GROUP_ZERO: number = 0;
export const ARG_GROUP_OVER: number = 99;
export const ARG_SCENE_OVER: number = 11;

// 一次入参注入的观测量：重绘是否发生、画面与空白基线的关系、帧尺寸、节点是否存活。
export class SceneArgObs {
  public redrawn: boolean = false;
  public draws: number = 0;
  public changed: number = -1;
  public bytes: number = 0;
  public blankBytes: number = 0;
  public alive: boolean = false;
  public sameAsBlank: boolean = false;
}

// 注入一组入参并采集观测值；width/height/groupArg/sceneArg 为 null 时该项用真实值。
export async function probeSceneArgs(uiContext: UIContext, group: number, scene: number, width: number | null,
  height: number | null, groupArg: number | null, sceneArg: number | null): Promise<SceneArgObs> {
  const observed: SceneArgObs = new SceneArgObs();
  const spec: GroupSpec | undefined = groupById(group);
  const params: number[] = spec === undefined ? [] : defaultsOf(spec, scene);
  // 空白基线会顺带复位覆写值，因此必须在装载入参之前取。
  const blank: Uint8Array = await captureBlank(uiContext);
  observed.blankBytes = blank.length;
  const drawsBefore: number = HARNESS.drawCount();
  HARNESS.loadArgs(group, scene, params, width, height, groupArg, sceneArg);
  observed.redrawn = await waitForRedraw();
  observed.draws = HARNESS.drawCount() - drawsBefore;
  await delay(FRAME_SETTLE_MS);
  const drawn: Uint8Array = await capture(uiContext);
  observed.bytes = drawn.length;
  observed.changed = changedPixels(blank, drawn);
  observed.sameAsBlank = observed.changed === 0;
  const node: HarnessRenderNode | null = HARNESS.node();
  observed.alive = node !== null && !node.isDisposed();
  probeLog('probeSceneArgs width=' + (width === null ? 'real' : width.toString()) +
    ' height=' + (height === null ? 'real' : height.toString()) +
    ' group=' + (groupArg === null ? 'real' : groupArg.toString()) +
    ' scene=' + (sceneArg === null ? 'real' : sceneArg.toString()) +
    ' draws=' + observed.draws.toString() + ' changed=' + observed.changed.toString());
  return observed;
}

// 用例收尾：复位覆写值并回到空白基线，保证下一个用例从干净状态开始。
export async function resetSceneArgs(uiContext: UIContext): Promise<void> {
  HARNESS.clearArgs();
  await captureBlank(uiContext);
  probeLog('resetSceneArgs done, draws=' + HARNESS.drawCount().toString());
}
