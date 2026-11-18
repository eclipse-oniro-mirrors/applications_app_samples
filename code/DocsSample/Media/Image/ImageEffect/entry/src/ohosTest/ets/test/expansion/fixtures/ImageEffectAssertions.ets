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
import { expect } from '@ohos/hypium';
import { PixelSnapshot } from './ImageEffectFixture';

export function assertSize(snapshot: PixelSnapshot, width: number, height: number): void {
  expect(snapshot.width).assertEqual(width);
  expect(snapshot.height).assertEqual(height);
  expect(snapshot.rgba.length).assertEqual(width * height * 4);
}
export function meanRgb(snapshot: PixelSnapshot): number {
  let sum: number = 0;
  for (let offset = 0; offset < snapshot.rgba.length; offset += 4) {
    sum += snapshot.rgba[offset] + snapshot.rgba[offset + 1] + snapshot.rgba[offset + 2];
  }
  return sum / (snapshot.width * snapshot.height * 3);
}
export function meanDifference(actual: PixelSnapshot, reference: PixelSnapshot): number {
  assertSize(actual, reference.width, reference.height);
  let sum: number = 0;
  for (let offset = 0; offset < actual.rgba.length; offset += 4) {
    for (let c = 0; c < 3; c++) {
      sum += Math.abs(actual.rgba[offset + c] - reference.rgba[offset + c]);
    }
  }
  return sum / (actual.width * actual.height * 3);
}
export function assertPixelsClose(actual: PixelSnapshot, reference: PixelSnapshot, tolerance: number): void {
  assertSize(actual, reference.width, reference.height);
  let maxDelta: number = 0;
  for (let i = 0; i < actual.rgba.length; i++) {
    maxDelta = Math.max(maxDelta, Math.abs(actual.rgba[i] - reference.rgba[i]));
  }
  expect(maxDelta <= tolerance).assertTrue();
}
function yieldPixelComparison(): Promise<void> {
  return new Promise<void>((resolve: () => void): void => {
    setTimeout(resolve, 5);
  });
}

// Compare every byte. One aligned word represents one complete RGBA pixel;
// exact word equality checks all four channels with no change in the oracle.
export async function assertPixelsCloseYielding(actual: PixelSnapshot, reference: PixelSnapshot,
  tolerance: number): Promise<void> {
  assertSize(actual, reference.width, reference.height);
  const actualBytes = actual.rgba;
  const referenceBytes = reference.rgba;
  const chunkBytes: number = 256 * 1024;
  if (tolerance === 0 && actualBytes.byteOffset % 4 === 0 && referenceBytes.byteOffset % 4 === 0) {
    const words: number = actualBytes.byteLength / 4;
    const actualWords = new Uint32Array(actualBytes.buffer, actualBytes.byteOffset, words);
    const referenceWords = new Uint32Array(referenceBytes.buffer, referenceBytes.byteOffset, words);
    const chunkWords: number = chunkBytes / 4;
    let equal: boolean = true;
    for (let start = 0; start < words; start += chunkWords) {
      const end = Math.min(start + chunkWords, words);
      for (let i = start; i < end; i++) {
        if (actualWords[i] !== referenceWords[i]) {
          equal = false;
        }
      }
      if (end < words) {
        await yieldPixelComparison();
      }
    }
    expect(equal).assertTrue();
    return;
  }
  let maxDelta: number = 0;
  for (let start = 0; start < actualBytes.length; start += chunkBytes) {
    const end = Math.min(start + chunkBytes, actualBytes.length);
    for (let i = start; i < end; i++) {
      maxDelta = Math.max(maxDelta, Math.abs(actualBytes[i] - referenceBytes[i]));
    }
    if (end < actualBytes.length) {
      await yieldPixelComparison();
    }
  }
  expect(maxDelta <= tolerance).assertTrue();
}
export function assertRgbAt(snapshot: PixelSnapshot, x: number, y: number, expected: number[],
  tolerance: number): void {
  expect(x >= 0 && x < snapshot.width && y >= 0 && y < snapshot.height).assertTrue();
  const offset = (y * snapshot.width + x) * 4;
  for (let c = 0; c < 3; c++) {
    expect(Math.abs(snapshot.rgba[offset + c] - expected[c]) <= tolerance).assertTrue();
  }
  expect(snapshot.rgba[offset + 3]).assertEqual(255);
}
export function assertCenterRgb(snapshot: PixelSnapshot, expected: number[], tolerance: number): void {
  const x = Math.floor(snapshot.width / 2);
  const y = Math.floor(snapshot.height / 2);
  for (let dy = -1; dy <= 1; dy++) {
    for (let dx = -1; dx <= 1; dx++) {
      assertRgbAt(snapshot, x + dx, y + dy, expected, tolerance);
    }
  }
}
export function assertFilterInfo(value: string, name: string): void {
  expect(typeof value).assertEqual('string');
  const prefix = 'name:' + name + ', supportedBufferType: {';
  expect(value.indexOf(prefix)).assertEqual(0);
  const separator = '}supportedFormat: {';
  const split = value.indexOf(separator);
  expect(split > prefix.length).assertTrue();
  expect(value.endsWith('}')).assertTrue();
  const buffers = value.substring(prefix.length, split).trim().split(' ');
  const formats = value.substring(split + separator.length, value.length - 1).trim().split(' ');
  expect(buffers.length > 0 && formats.length > 0).assertTrue();
  for (let buffer of buffers) {
    expect(buffer.length > 0).assertTrue();
  }
  for (let format of formats) {
    expect(format.length > 0).assertTrue();
  }
}
export function assertFilterList(value: string, customSupported: boolean): void {
  expect(typeof value).assertEqual('string');
  expect(/^size: [0-9]+, name: /.test(value)).assertTrue();
  const separator = value.indexOf(', name: ');
  const count = Number(value.substring(6, separator));
  const suffix = value.substring(separator + 8);
  const names: string[] = suffix.length === 0 ? [] : suffix.split(' | ');
  expect(names.length).assertEqual(count);
  for (let i = 0; i < names.length; i++) {
    expect(names[i].length > 0).assertTrue();
    expect(names.indexOf(names[i])).assertEqual(i);
  }
  expect(names.indexOf('CustomBrightness') >= 0).assertEqual(customSupported);
  expect(names.indexOf('CustomCrop') >= 0).assertEqual(customSupported);
}
