/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { abilityDelegatorRegistry, Driver } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { image } from '@kit.ImageKit';
import { common2D } from '@kit.ArkGraphics2D';
import { point } from '../../../main/ets/drawing/DrawingTypes';

export const DRAWING_TAG: string = 'Sample_DrawingAPI';
export const BUNDLE_NAME: string = 'com.samples.ndktsdrawing';
export const ABILITY_NAME: string = 'EntryAbility';
export const ABILITY_MODULE: string = 'entry';
export const UI_WAIT_MS: number = 1500;

let cachedDriver: Driver | null = null;

/**
 * Run one test body and always finish the async case.
 *
 * @param { string } name - Name of the test case.
 * @param { Function } body - Async test body.
 * @param { Function } done - Callback provided by hypium.
 */
export async function runCase(name: string, body: () => Promise<void>, done: Function): Promise<void> {
  try {
    await body();
    console.info(DRAWING_TAG, `${name} passed`);
  } catch (error) {
    const failure: BusinessError = error as BusinessError;
    console.error(DRAWING_TAG, `${name} failed, code: ${failure.code}, message: ${failure.message}`);
    console.error(DRAWING_TAG, `${name} trace: ${failure.stack ?? ''}`);
    expect().assertFail();
  } finally {
    done();
  }
}

/**
 * Start the sample ability and return a driver bound to the page.
 *
 * @param { number } delayMs - Delay used to wait for the first frame.
 * @returns { Promise<Driver> } Driver instance.
 */
export async function launchIndexPage(delayMs: number): Promise<Driver> {
  if (cachedDriver === null) {
    const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    await delegator.startAbility({
      bundleName: BUNDLE_NAME,
      moduleName: ABILITY_MODULE,
      abilityName: ABILITY_NAME
    });
    cachedDriver = Driver.create();
  }
  await cachedDriver.delayMs(delayMs);
  return cachedDriver;
}

/**
 * Copy every pixel of the offscreen bitmap into a raw RGBA buffer.
 *
 * @param { image.PixelMap } pixelMap - Offscreen bitmap bound to a canvas.
 * @returns { Promise<ArrayBuffer> } Raw RGBA_8888 buffer.
 */
export async function readPixelBuffer(pixelMap: image.PixelMap): Promise<ArrayBuffer> {
  const info: image.ImageInfo = pixelMap.getImageInfoSync();
  const buffer: ArrayBuffer = new ArrayBuffer(info.size.width * info.size.height * 4);
  await pixelMap.readPixelsToBuffer(buffer);
  return buffer;
}

/**
 * Count the pixels that carry a non zero alpha channel.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @returns { number } Number of pixels painted by the canvas.
 */
export function countInkedPixels(buffer: ArrayBuffer): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let count: number = 0;
  for (let index: number = 3; index < bytes.length; index += 4) {
    if (bytes[index] > 0) {
      count++;
    }
  }
  return count;
}

/**
 * Read the largest value of one channel over the whole bitmap.
 *
 * @param { ArrayBuffer } buffer - Raw RGBA_8888 buffer.
 * @param { number } channel - 0 red, 1 green, 2 blue, 3 alpha.
 * @returns { number } Largest channel value, 0 when the channel is never painted.
 */
export function maxChannel(buffer: ArrayBuffer, channel: number): number {
  const bytes: Uint8Array = new Uint8Array(buffer);
  let largest: number = 0;
  for (let index: number = channel; index < bytes.length; index += 4) {
    if (bytes[index] > largest) {
      largest = bytes[index];
    }
  }
  return largest;
}

/**
 * Run one action that the drawing API is expected to reject.
 *
 * @param { Function } action - Action expected to throw.
 * @returns { boolean } Whether the action threw.
 */
export function throwsOn(action: () => void): boolean {
  try {
    action();
    return false;
  } catch (error) {
    const failure: BusinessError = error as BusinessError;
    console.info(DRAWING_TAG, `rejected as expected: ${failure.message}`);
    return true;
  }
}

/**
 * Compare two numbers with a slack for rasterisation rounding.
 *
 * @param { number } value - Measured value.
 * @param { number } expected - Expected value.
 * @param { number } slack - Allowed absolute difference.
 * @returns { boolean } Whether both numbers stay inside the slack.
 */
export function near(value: number, expected: number, slack: number): boolean {
  return Math.abs(value - expected) <= slack;
}

/**
 * Build the point array a path iterator step writes into. The drawing API requires at least four slots.
 *
 * @returns { common2D.Point[] } Array with four empty points.
 */
export function iteratorPoints(): common2D.Point[] {
  const points: common2D.Point[] = [];
  for (let index: number = 0; index < 4; index++) {
    points.push(point(0, 0));
  }
  return points;
}
