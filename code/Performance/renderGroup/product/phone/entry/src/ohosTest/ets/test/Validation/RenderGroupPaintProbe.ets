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

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import image from '@ohos.multimedia.image';
import fileIo from '@ohos.file.fs';
import { expect } from '@ohos/hypium';
import { Rect } from '@ohos.UiTest';
import { countText, getDriver, visibleBounds, waitId, waitText } from '../Shared/SharedDriver';

export function hasPaintedText(bytes: Uint8Array): boolean {
  if (bytes.length === 0 || bytes.length % 4 !== 0) {
    return false;
  }
  let ink = 0;
  let background = 0;
  const pixels = bytes.length / 4;
  for (let offset = 0; offset < bytes.length; offset += 4) {
    const red = bytes[offset];
    const green = bytes[offset + 1];
    const blue = bytes[offset + 2];
    const alpha = bytes[offset + 3];
    if (alpha < 250) {
      continue;
    }
    if (blue < 160 && green > red && green - red <= 14 && blue - green >= 4 && blue - green <= 16) {
      ink++;
    }
    if (red >= 200 && red <= 245 && Math.abs(red - green) <= 8 && Math.abs(red - blue) <= 8) {
      background++;
    }
  }
  return ink >= Math.max(3, background * 0.002) && background >= pixels * 0.04;
}

async function captureGridText(filename: string, bounds: Rect[]): Promise<boolean> {
  const captured = await getDriver().screenCap(filename);
  expect(captured).assertTrue();
  const source = image.createImageSource(filename);
  try {
    const info = await source.getImageInfo();
    const display = await getDriver().getDisplaySize();
    expect(info.size.width).assertEqual(display.x);
    expect(info.size.height).assertEqual(display.y);
    for (const rect of bounds) {
      const left = Math.max(0, Math.ceil(rect.left));
      const top = Math.max(0, Math.ceil(rect.top));
      const width = Math.min(info.size.width, Math.floor(rect.right)) - left;
      const height = Math.min(info.size.height, Math.floor(rect.bottom)) - top;
      expect(width > 0 && height > 0).assertTrue();
      const pixels = await source.createPixelMap({
        desiredRegion: { x: left, y: top, size: { width: width, height: height } },
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888
      });
      try {
        const buffer = new ArrayBuffer(pixels.getPixelBytesNumber());
        await pixels.readPixelsToBuffer(buffer);
        const painted = hasPaintedText(new Uint8Array(buffer));
        if (!painted) {
          return false;
        }
      } finally {
        await pixels.release();
      }
    }
  } finally {
    await source.release();
  }
  return true;
}

export async function assertGridTextPainted(indices: number[] = [1, 3, 6, 7], checkLabelLayout: boolean = false): Promise<void> {
  if (indices.length === 0 || indices.some(index => !Number.isInteger(index) || index < 1 || index > 60)) {
    throw new Error('Paint targets must be nonempty item indices between 1 and 60');
  }
  const bounds: Rect[] = [];
  for (const index of indices) {
    const label = `item${index}`;
    const node = await waitText(label);
    const actual = await node.getText();
    expect(actual).assertEqual(label);
    if (checkLabelLayout) {
      expect(await countText(label)).assertEqual(1);
      await visibleBounds(node);
    }
    const cell = await waitId(`rendergroup-cell-${label}`);
    bounds.push(await visibleBounds(cell));
  }
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const entry = await delegator.getCurrentTopAbility();
  const filename = `${entry.context.cacheDir}/rendergroup-paint-${Date.now()}.png`;
  const deadline = Date.now() + 2500;
  let painted = false;
  while (Date.now() < deadline) {
    painted = await captureGridText(filename, bounds);
    if (painted) {
      break;
    }
    await getDriver().delayMs(80);
  }
  if (!painted) {
    throw new Error(`Grid text was not painted; inspect screenshot ${filename}`);
  }
  fileIo.unlinkSync(filename);
}
