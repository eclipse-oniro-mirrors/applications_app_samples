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

import { componentSnapshot, UIContext } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { image } from '@kit.ImageKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { HARNESS, HARNESS_ID } from './PixelHarness';

const TAG: string = '[Sample_NdkRenderNodeProbe]';
const DOMAIN: number = 0xF811;

// 等待测试页挂载探针画布的上限，单次轮询 100 ms。
export const ATTACH_TIMEOUT_MS: number = 10000;
export const POLL_INTERVAL_MS: number = 100;
// 绘制后等待 ArkUI 完成一次合成，再取快照。
export const FRAME_SETTLE_MS: number = 120;
// 画布能力域编号与场景编号。
export const GROUP_CANVAS: number = 1;
export const CLEAR_SCENE: number = 0;
export const POINT_GRID_SCENE: number = 1;
// 两幅快照中允许存在的差异像素下限：真正绘制过的画面必然远超该值。
export const MIN_CHANGED_PIXELS: number = 64;

export function probeLog(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export function delay(duration: number): Promise<void> {
  return new Promise<void>((resolve: Function) => {
    setTimeout(() => {
      resolve();
    }, duration);
  });
}

// 回读探针组件的像素字节。
export async function capture(uiContext: UIContext): Promise<Uint8Array> {
  const options: componentSnapshot.SnapshotOptions = { waitUntilRenderFinished: true };
  try {
    const pixelMap: image.PixelMap = await uiContext.getComponentSnapshot().get(HARNESS_ID, options);
    const bytes: number = pixelMap.getPixelBytesNumber();
    const buffer: ArrayBuffer = new ArrayBuffer(bytes);
    pixelMap.readPixelsToBufferSync(buffer);
    pixelMap.release();
    return new Uint8Array(buffer);
  } catch (error) {
    probeLog('component snapshot failed, message=' + (error as BusinessError).message);
    throw new Error('component snapshot failed');
  }
}

// 等待测试页把 NodeContainer 建好并回传 UIContext。
export async function waitReady(): Promise<boolean> {
  const rounds: number = ATTACH_TIMEOUT_MS / POLL_INTERVAL_MS;
  for (let index = 0; index < rounds; index++) {
    if (HARNESS.isReady()) {
      return true;
    }
    await delay(POLL_INTERVAL_MS);
  }
  return HARNESS.isReady();
}

// 取探针 UIContext；未就绪时直接让用例失败。
export function readyUiContext(): UIContext {
  const ui: UIContext | null = HARNESS.uiContext();
  if (ui === null) {
    throw new Error('harness ui context is not ready');
  }
  return ui;
}

// 探针页被应用页面遮到后台时 ArkUI 不再回调 draw，这里用绘制计数确认探针确实在被调度。
export async function waitForRedraw(timeoutMs: number = ATTACH_TIMEOUT_MS): Promise<boolean> {
  const before: number = HARNESS.drawCount();
  const rounds: number = timeoutMs / POLL_INTERVAL_MS;
  for (let index = 0; index < rounds; index++) {
    await delay(POLL_INTERVAL_MS);
    if (HARNESS.drawCount() > before) {
      return true;
    }
  }
  return false;
}

// 把结果字节落到快照；两种重载统一在这里收口。
async function settleCapture(uiContext: UIContext): Promise<Uint8Array> {
  await delay(FRAME_SETTLE_MS);
  return capture(uiContext);
}

// 装载场景 -> 等一帧 -> 取快照。
export async function renderScene(uiContext: UIContext, group: number, scene: number,
  params: number[]): Promise<Uint8Array> {
  HARNESS.load(group, scene, params, true);
  return settleCapture(uiContext);
}

// 装载场景（可选传入 PixelMap）-> 等一帧 -> 取快照。
export async function renderSceneWithPixelMap(uiContext: UIContext, group: number, scene: number,
  params: number[], pixelMap: image.PixelMap | undefined): Promise<Uint8Array> {
  HARNESS.load(group, scene, params, true, pixelMap);
  return settleCapture(uiContext);
}

// 空白基线：探针不装载场景时绘制出的画面。
export async function captureBlank(uiContext: UIContext): Promise<Uint8Array> {
  HARNESS.clearScene();
  return settleCapture(uiContext);
}

// 统计两幅同尺寸快照中取值不同的像素个数。
export function changedPixels(before: Uint8Array, after: Uint8Array): number {
  if (before.length !== after.length) {
    return -1;
  }
  const bytesPerPixel: number = before.length > 0 ? 4 : 0;
  let changed: number = 0;
  for (let index = 0; index + bytesPerPixel <= before.length; index += bytesPerPixel) {
    if (before[index] !== after[index] || before[index + 1] !== after[index + 1] ||
      before[index + 2] !== after[index + 2] || before[index + 3] !== after[index + 3]) {
      changed++;
    }
  }
  return changed;
}

// FNV-1a 摘要，用于判定两幅画面是否完全一致。
export function digest(pixels: Uint8Array): string {
  let hash: number = 0x811C9DC5;
  for (let index = 0; index < pixels.length; index++) {
    hash = hash ^ pixels[index];
    hash = (hash * 0x01000193) % 0x100000000;
  }
  return hash.toString(16);
}
