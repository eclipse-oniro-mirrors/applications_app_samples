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

import { image } from '@kit.ImageKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_NdkRenderNodeTestPixelMap]';
const DOMAIN: number = 0xF811;
// 常态测试图边长；1 与 1024 分别用于极小与超界两种边界。
// 超界值只要显著大于画布（144x144）即可，取 1024 是 7 倍边长，同时把位图内存控制在 4 MB 量级：
// 边长 4096 需要 64 MB 缓冲加同尺寸 PixelMap，实测会因主线程长时间占住被判冻屏。
export const MAP_SIDE: number = 64;
export const MAP_SIDE_TINY: number = 1;
export const MAP_SIDE_OVERSIZE: number = 1024;
// 象限色：左右上下四块不同色，采样、旋转、裁剪等场景的变化才看得见。
const QUADRANT_COLORS: number[][] = [[240, 64, 64, 255], [64, 200, 96, 255], [64, 120, 240, 255], [248, 208, 64, 255]];

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

// 拼一条象限色整行：top 决定取上半行（象限 0/1）还是下半行（象限 2/3），列决定取左半还是右半色块。
function fillQuadrantRow(row: Uint8Array, side: number, top: boolean): void {
  const half: number = side / 2;
  for (let x = 0; x < side; x++) {
    const quadrant: number = (top ? 0 : 2) + (x < half ? 0 : 1);
    const offset: number = x * 4;
    row[offset] = QUADRANT_COLORS[quadrant][0];
    row[offset + 1] = QUADRANT_COLORS[quadrant][1];
    row[offset + 2] = QUADRANT_COLORS[quadrant][2];
    row[offset + 3] = QUADRANT_COLORS[quadrant][3];
  }
}

// 构造象限色 PixelMap：尺寸由调用方指定，失败时返回 undefined 由用例报错。
export async function createCheckerPixelMap(side: number): Promise<image.PixelMap | undefined> {
  const buffer: ArrayBuffer = new ArrayBuffer(side * side * 4);
  const pixels: Uint8Array = new Uint8Array(buffer);
  // 逐像素双重循环要写 side 的平方次，边长一大就会长时间占住主线程并触发冻屏；
  // 改为先拼上、下两条整行模板，再逐行整块拷贝，写入字节数不变，循环次数降到 side 次。
  const rowTop: Uint8Array = new Uint8Array(side * 4);
  const rowBottom: Uint8Array = new Uint8Array(side * 4);
  fillQuadrantRow(rowTop, side, true);
  fillQuadrantRow(rowBottom, side, false);
  const half: number = side / 2;
  for (let y = 0; y < side; y++) {
    pixels.set(y < half ? rowTop : rowBottom, y * side * 4);
  }
  const options: image.InitializationOptions = {
    size: { width: side, height: side },
    srcPixelFormat: image.PixelMapFormat.RGBA_8888,
    pixelFormat: image.PixelMapFormat.RGBA_8888,
    editable: true
  };
  try {
    const pixelMap: image.PixelMap = await image.createPixelMap(buffer, options);
    logInfo('create pixel map ' + side.toString() + 'x' + side.toString() + ' done');
    return pixelMap;
  } catch (error) {
    logInfo('create pixel map ' + side.toString() + ' failed, message=' + (error as BusinessError).message);
    return undefined;
  }
}

// 释放 PixelMap，重复释放不应影响用例。
export async function releasePixelMap(pixelMap: image.PixelMap | undefined): Promise<void> {
  if (pixelMap === undefined) {
    return;
  }
  try {
    await pixelMap.release();
  } catch (error) {
    logInfo('release pixel map failed, message=' + (error as BusinessError).message);
  }
}
