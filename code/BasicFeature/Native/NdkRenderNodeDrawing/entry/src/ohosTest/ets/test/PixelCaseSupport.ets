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

import { UIContext } from '@kit.ArkUI';
import { GroupSpec } from '../../../main/ets/core/SchemaTypes';
import { HARNESS } from './PixelHarness';
import {
  captureBlank, changedPixels, digest, MIN_CHANGED_PIXELS, probeLog, renderScene
} from './PixelProbe';
import { defaultsOf, firstRangeIndex, groupById, pushedParams } from './SceneDefaults';

// 像素层用例的统一观测值：一次绘制换来四个互不相同的断言维度
// （重绘次数、变化像素数、绘制帧字节数、空白基线字节数）。
export class DrawFrame {
  public scene: number = -1;
  public draws: number = 0;
  public changed: number = 0;
  public bytes: number = 0;
  public blankBytes: number = 0;
}

// 两个场景的对照观测值：差异标志、差异像素数、两帧字节数与摘要。
export class ScenePairObs {
  public differ: boolean = false;
  public changed: number = 0;
  public firstBytes: number = 0;
  public secondBytes: number = 0;
  public firstDigest: string = '';
  public secondDigest: string = '';
}

// 同一场景重复绘制的观测值：是否逐字节一致以及帧尺寸。
export class RepeatObs {
  public stable: boolean = false;
  public bytes: number = 0;
  public firstDigest: string = '';
  public secondDigest: string = '';
}

// 参数推动的观测值：被推动的参数下标、变化像素数与整帧字节数。
export class ParamDelta {
  public index: number = -1;
  public changed: number = 0;
  public bytes: number = 0;
}

// 取目标下标的场景编号；场景数量不足时退回最后一个场景，避免数组越界。
export function sceneSlotOf(spec: GroupSpec, target: number): number {
  if (spec.scenes.length === 0) {
    return -1;
  }
  return target < spec.scenes.length ? target : spec.scenes.length - 1;
}

// 绘制指定场景并与空白基线对照，返回观测值而不是直接下断言。
export async function drawFrame(uiContext: UIContext, group: number, scene: number): Promise<DrawFrame> {
  const frame: DrawFrame = new DrawFrame();
  frame.scene = scene;
  const spec: GroupSpec | undefined = groupById(group);
  if (spec === undefined || scene < 0 || scene >= spec.scenes.length) {
    probeLog('drawFrame invalid target group=' + group.toString() + ' scene=' + scene.toString());
    return frame;
  }
  const drawsBefore: number = HARNESS.drawCount();
  const blank: Uint8Array = await captureBlank(uiContext);
  const drawn: Uint8Array = await renderScene(uiContext, group, scene, defaultsOf(spec, scene));
  frame.draws = HARNESS.drawCount() - drawsBefore;
  frame.changed = changedPixels(blank, drawn);
  frame.bytes = drawn.length;
  frame.blankBytes = blank.length;
  probeLog('drawFrame group=' + group.toString() + '#' + scene.toString() + ' changed=' +
    frame.changed.toString() + ' draws=' + frame.draws.toString());
  return frame;
}

// 按场景下标取场景后绘制；下标越界时退回该域最后一个场景。
export async function drawFrameAt(uiContext: UIContext, group: number, target: number): Promise<DrawFrame> {
  const spec: GroupSpec | undefined = groupById(group);
  if (spec === undefined) {
    const frame: DrawFrame = new DrawFrame();
    probeLog('drawFrameAt unknown group=' + group.toString());
    return frame;
  }
  const slot: number = sceneSlotOf(spec, target);
  if (slot < 0) {
    const frame: DrawFrame = new DrawFrame();
    probeLog('drawFrameAt empty group=' + group.toString());
    return frame;
  }
  return drawFrame(uiContext, group, slot);
}

// 同一能力域内两个场景各画一次，返回对照观测值。
export async function scenePair(uiContext: UIContext, group: number, sceneA: number,
  sceneB: number): Promise<ScenePairObs> {
  const pair: ScenePairObs = new ScenePairObs();
  const spec: GroupSpec | undefined = groupById(group);
  if (spec === undefined) {
    return pair;
  }
  const first: Uint8Array = await renderScene(uiContext, group, sceneA, defaultsOf(spec, sceneA));
  const second: Uint8Array = await renderScene(uiContext, group, sceneB, defaultsOf(spec, sceneB));
  pair.firstDigest = digest(first);
  pair.secondDigest = digest(second);
  pair.firstBytes = first.length;
  pair.secondBytes = second.length;
  pair.differ = pair.firstDigest !== pair.secondDigest;
  pair.changed = changedPixels(first, second);
  probeLog('scenePair group=' + group.toString() + ' differ=' + pair.differ.toString() +
    ' changed=' + pair.changed.toString());
  return pair;
}

// 同一场景同一参数连续绘制两次，返回稳定性观测值。
export async function repeatPair(uiContext: UIContext, group: number, scene: number): Promise<RepeatObs> {
  const repeat: RepeatObs = new RepeatObs();
  const spec: GroupSpec | undefined = groupById(group);
  if (spec === undefined) {
    return repeat;
  }
  const params: number[] = defaultsOf(spec, scene);
  const first: Uint8Array = await renderScene(uiContext, group, scene, params);
  const second: Uint8Array = await renderScene(uiContext, group, scene, params);
  repeat.firstDigest = digest(first);
  repeat.secondDigest = digest(second);
  repeat.bytes = first.length;
  repeat.stable = repeat.firstDigest === repeat.secondDigest;
  probeLog('repeatPair group=' + group.toString() + '#' + scene.toString() + ' stable=' +
    repeat.stable.toString());
  return repeat;
}

// 把第一个滑杆参数推到另一端，返回被推动的下标与差异像素数。
export async function paramDelta(uiContext: UIContext, group: number, scene: number): Promise<ParamDelta> {
  const delta: ParamDelta = new ParamDelta();
  const spec: GroupSpec | undefined = groupById(group);
  if (spec === undefined) {
    return delta;
  }
  const index: number = firstRangeIndex(spec, scene);
  if (index < 0) {
    return delta;
  }
  delta.index = index;
  const values: number[] = defaultsOf(spec, scene);
  // 默认值已在上限时必须推向另一个方向，否则对照画面与默认完全相同。
  const toMax: boolean = values[index] < spec.scenes[scene].params[index].max;
  const before: Uint8Array = await renderScene(uiContext, group, scene, values);
  const after: Uint8Array = await renderScene(uiContext, group, scene, pushedParams(spec, scene, index, toMax));
  delta.changed = changedPixels(before, after);
  delta.bytes = before.length;
  probeLog('paramDelta group=' + group.toString() + '#' + scene.toString() + ' index=' +
    delta.index.toString() + ' changed=' + delta.changed.toString());
  return delta;
}

// 断言某个能力域的场景在真实画布上确实画出了内容（供需要循环装载的用例复用）。
export async function expectDrawn(uiContext: UIContext, group: number, scene: number, label: string): Promise<void> {
  const frame: DrawFrame = await drawFrame(uiContext, group, scene);
  probeLog(label + ' changed pixels = ' + frame.changed.toString());
  if (frame.changed <= MIN_CHANGED_PIXELS) {
    throw new Error(label + ' scene did not draw, changed=' + frame.changed.toString());
  }
}

// 断言某个能力域的场景被拦截，画面与空白基线完全一致。
export async function expectBlank(uiContext: UIContext, group: number, scene: number, label: string): Promise<void> {
  const blank: Uint8Array = await captureBlank(uiContext);
  const rejected: Uint8Array = await renderScene(uiContext, group, scene, [1, 100]);
  const changed: number = changedPixels(blank, rejected);
  probeLog(label + ' changed pixels = ' + changed.toString());
  if (changed !== 0) {
    throw new Error(label + ' scene was not rejected, changed=' + changed.toString());
  }
}
