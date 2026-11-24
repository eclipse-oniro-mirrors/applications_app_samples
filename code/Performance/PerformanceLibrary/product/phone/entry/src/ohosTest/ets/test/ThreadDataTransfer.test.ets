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

import { describe, expect, it } from '@ohos/hypium';
import image from '@ohos.multimedia.image';
import { pixelMapProcessByTaskPool } from '@ohos/ThreadDataTransfer';

const RESULT_TIMEOUT_MS: number = 15000;
const BYTES_PER_PIXEL: number = 4;

function rgbaBuffer(bytes: number[]): ArrayBuffer {
  const result = new ArrayBuffer(bytes.length);
  new Uint8Array(result).set(bytes);
  return result;
}

function assertBytes(buffer: ArrayBuffer, expected: number[], label: string): void {
  const actual = new Uint8Array(buffer);
  const observedValue1 = actual.length;
  expect(observedValue1).assertEqual(expected.length);
  for (let offset = 0; offset < expected.length; offset++) {
    if (actual[offset] !== expected[offset]) {
      throw new Error(`${label}: byte ${offset}: expected ${expected[offset]}, got ${actual[offset]}`);
    }
  }
}

// The returned Promise only covers submission; worker completion is signalled by the callback.
function awaitTaskOutput(pixelMap: image.PixelMap, previous: number, target: number, tasks: number,
  transfer: boolean): Promise<ArrayBuffer> {
  return new Promise<ArrayBuffer>((resolve, reject) => {
    const timer = setTimeout(() => reject(new Error(`No image task output: tasks=${tasks}, transfer=${transfer}`)),
      RESULT_TIMEOUT_MS);
    pixelMapProcessByTaskPool(pixelMap, previous, target, tasks, transfer, (result: ArrayBuffer) => {
      clearTimeout(timer);
      resolve(result);
    }).catch((error: Error) => {
      clearTimeout(timer);
      reject(error);
    });


  });
}

async function verifyImageTasks(input: number[], expected: number[], previous: number, target: number, tasks: number,
  transfer: boolean, width: number = input.length / BYTES_PER_PIXEL): Promise<void> {
  const pixelMap = await image.createPixelMap(rgbaBuffer(input), {
    size: { width: width, height: input.length / BYTES_PER_PIXEL / width },
    pixelFormat: image.PixelMapFormat.RGBA_8888,
    alphaType: image.AlphaType.UNPREMUL,
    editable: true
  });
  try {
    // Write RGBA bytes explicitly, independent of the platform's input format for createPixelMap.
    await pixelMap.writeBufferToPixels(rgbaBuffer(input));
    const before = new ArrayBuffer(pixelMap.getPixelBytesNumber());
    await pixelMap.readPixelsToBuffer(before);
    assertBytes(before, input, 'Source pixel map');
    const output = await awaitTaskOutput(pixelMap, previous, target, tasks, transfer);
    assertBytes(output, expected, 'Task group output');
    const after = new ArrayBuffer(pixelMap.getPixelBytesNumber());
    await pixelMap.readPixelsToBuffer(after);
    assertBytes(after, input, 'Original pixel map after task group');
  } finally {
    await pixelMap.release();
  }
}

async function createEditablePixelMap(input: number[]): Promise<image.PixelMap> {
  const pixelMap = await image.createPixelMap(rgbaBuffer(input), {
    size: { width: input.length / BYTES_PER_PIXEL, height: 1 },
    pixelFormat: image.PixelMapFormat.RGBA_8888,
    alphaType: image.AlphaType.UNPREMUL,
    editable: true
  });
  try {
    await pixelMap.writeBufferToPixels(rgbaBuffer(input));
    return pixelMap;
  } catch (error) {
    await pixelMap.release();
    throw error instanceof Error ? error : new Error(String(error));
  }
}

async function assertPixelMapBytes(pixelMap: image.PixelMap, expected: number[]): Promise<void> {
  const actual = new ArrayBuffer(pixelMap.getPixelBytesNumber());
  await pixelMap.readPixelsToBuffer(actual);
  assertBytes(actual, expected, 'Unchanged source PixelMap');
}

function primaryRow(pixels: number): number[] {
  const bytes: number[] = [];
  for (let index = 0; index < pixels; index++) {
    const sector = index % 3;
    bytes.push(sector === 0 ? 255 : 0, sector === 1 ? 255 : 0, sector === 2 ? 255 : 0, 255);
  }
  return bytes;
}

export default function threadDataTransferTest(): void {
  describe('PerformanceThreadDataTransfer', () => {
    // @tc.number SUB_PERFORMANCE_THREADTRANSFER_0100
    // @tc.name singleClonedTaskPreservesNeutralPixelAndDesaturatesRed
    // @tc.desc Verify pixelMapProcessByTaskPool with one cloned task, a primary and a white pixel.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('singleClonedTaskPreservesNeutralPixelAndDesaturatesRed', 0, async () => {
      await verifyImageTasks([255, 0, 0, 255, 255, 255, 255, 255],
        [255, 128, 128, 255, 255, 255, 255, 255], 100, 50, 1, false);
    });

    // @tc.number SUB_PERFORMANCE_THREADTRANSFER_0200
    // @tc.name transferredTaskGroupKeepsChunksInSourceOrder
    // @tc.desc Verify pixelMapProcessByTaskPool concatenates four transferred chunks in original order.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('transferredTaskGroupKeepsChunksInSourceOrder', 0, async () => {
      await verifyImageTasks([255, 0, 0, 255, 0, 255, 0, 255, 0, 0, 255, 255, 255, 255, 0, 255],
        [255, 128, 128, 255, 128, 255, 128, 255, 128, 128, 255, 255, 255, 255, 128, 255],
        100, 50, 4, true);
    });

    // @tc.number SUB_PERFORMANCE_THREADTRANSFER_0300
    // @tc.name clonedGroupPreservesTwoPixelsPerChunkAndDoesNotLoopChannels
    // @tc.desc Verify pixelMapProcessByTaskPool keeps both pixels in each cloned chunk at saturation 25.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('clonedGroupPreservesTwoPixelsPerChunkAndDoesNotLoopChannels', 0, async () => {
      await verifyImageTasks([0, 255, 255, 255, 255, 0, 255, 255, 255, 255, 0, 255, 0, 0, 255, 255],
        [191, 255, 255, 255, 255, 191, 255, 255, 255, 255, 191, 255, 191, 191, 255, 255],
        100, 25, 2, false);
    });

    // @tc.number SUB_PERFORMANCE_THREADTRANSFER_0400
    // @tc.name maximumTaskCountKeepsEveryPixelAtUnchangedSaturation
    // @tc.desc Verify pixelMapProcessByTaskPool does not lose chunks with 20 transferred tasks at identity ratio.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('maximumTaskCountKeepsEveryPixelAtUnchangedSaturation', 0, async () => {
      const original = primaryRow(20);
      await verifyImageTasks(original, original, 100, 100, 20, true);
    });

    // @tc.number SUB_PERFORMANCE_THREADTRANSFER_0500
    // @tc.name transferredTaskOutputUsesRatioAgainstPreviousSaturation
    // @tc.desc Verify pixelMapProcessByTaskPool applies a one-half ratio when moving from 80 to 40.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('transferredTaskOutputUsesRatioAgainstPreviousSaturation', 0, async () => {
      await verifyImageTasks([0, 255, 0, 255, 0, 0, 0, 255], [128, 255, 128, 255, 0, 0, 0, 255], 80, 40, 2, true);
    });

    // @tc.number SUB_PERFORMANCE_THREADTRANSFER_0600
    // @tc.name unevenPixelCountDoesNotSplitColorChannelsAcrossTasks
    // @tc.desc Verify pixelMapProcessByTaskPool partitions three pixels between two transferred tasks.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('unevenPixelCountDoesNotSplitColorChannelsAcrossTasks', 0, async () => {
      await verifyImageTasks(primaryRow(3), [255, 128, 128, 255, 128, 255, 128, 255, 128, 128, 255, 255],
        100, 50, 2, true);
    });

    // @tc.number SUB_PERFORMANCE_THREADTRANSFER_0700
    // @tc.name requestingMoreTasksThanPixelsStillReturnsEveryPixel
    // @tc.desc Verify pixelMapProcessByTaskPool returns both pixels with twenty requested cloned tasks.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('requestingMoreTasksThanPixelsStillReturnsEveryPixel', 0, async () => {
      await verifyImageTasks(primaryRow(2), [255, 191, 191, 255, 191, 255, 191, 255], 100, 25, 20, false);
    });

    // @tc.number SUB_PERFORMANCE_THREADTRANSFER_0800
    // @tc.name failedImageRequestCanBeRetriedOnTheSamePixelMap
    // @tc.desc Verify pixelMapProcessByTaskPool rejects zero tasks without consuming the map or firing its callback.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('failedImageRequestCanBeRetriedOnTheSamePixelMap', 0, async () => {
      const original = primaryRow(1);
      const pixelMap = await image.createPixelMap(rgbaBuffer(original), {
        size: { width: 1, height: 1 },
        pixelFormat: image.PixelMapFormat.RGBA_8888,
        editable: true
      });
      try {
        await pixelMap.writeBufferToPixels(rgbaBuffer(original));
        let callbacks = 0;
        const rejected = await pixelMapProcessByTaskPool(pixelMap, 100, 50, 0, false,
          () => { callbacks++; }).then(() => false, (error: Error) => error instanceof RangeError);
        expect(rejected).assertTrue();
        const result = await awaitTaskOutput(pixelMap, 100, 50, 1, false);
        assertBytes(result, [255, 128, 128, 255], 'Retry output');
        expect(callbacks).assertEqual(0);
      } finally {
        await pixelMap.release();
      }
    });

    // @tc.number SUB_PERFORMANCE_THREADTRANSFER_0900
    // @tc.name clonedTasksPreserveRowMajorOrderAcrossTwoDimensionalImageRows
    // @tc.desc Verify cloned tasks preserve row order when a two-row image is split across four uneven chunks.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('clonedTasksPreserveRowMajorOrderAcrossTwoDimensionalImageRows', 0, async () => {
      await verifyImageTasks(primaryRow(6), [255, 128, 128, 255, 128, 255, 128, 255, 128, 128, 255, 255,
        255, 128, 128, 255, 128, 255, 128, 255, 128, 128, 255, 255], 100, 50, 4, false, 3);
    });

    // @tc.number SUB_PERFORMANCE_THREADTRANSFER_1000
    // @tc.name transferredTasksPreserveRowMajorOrderAcrossTwoDimensionalImageRows
    // @tc.desc Verify transferred tasks retain two-dimensional row order across uneven chunk boundaries.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('transferredTasksPreserveRowMajorOrderAcrossTwoDimensionalImageRows', 0, async () => {
      await verifyImageTasks(primaryRow(6), [255, 128, 128, 255, 128, 255, 128, 255, 128, 128, 255, 255,
        255, 128, 128, 255, 128, 255, 128, 255, 128, 128, 255, 255], 100, 50, 4, true, 3);
    });

    // @tc.number SUB_PERFORMANCE_THREADTRANSFER_1100
    // @tc.name clonedImageTasksPreserveTransparentAndTranslucentAlpha
    // @tc.desc Verify cloned task output changes RGB while retaining transparent, translucent and opaque alpha bytes.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('clonedImageTasksPreserveTransparentAndTranslucentAlpha', 0, async () => {
      await verifyImageTasks([255, 0, 0, 0, 0, 255, 0, 127, 0, 0, 255, 255],
        [255, 128, 128, 0, 128, 255, 128, 127, 128, 128, 255, 255], 100, 50, 2, false);
    });

    // @tc.number SUB_PERFORMANCE_THREADTRANSFER_1200
    // @tc.name transferredImageTasksPreserveTransparentAndTranslucentAlpha
    // @tc.desc Verify transferred task output retains alpha values independently of transformed RGB channels.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('transferredImageTasksPreserveTransparentAndTranslucentAlpha', 0, async () => {
      await verifyImageTasks([255, 0, 0, 0, 0, 255, 0, 127, 0, 0, 255, 255],
        [255, 128, 128, 0, 128, 255, 128, 127, 128, 128, 255, 255], 100, 50, 2, true);
    });

    // @tc.number SUB_PERFORMANCE_THREADTRANSFER_1300
    // @tc.name oneTransferredTaskCompletesWithoutDetachingThePixelMap
    // @tc.desc Verify the single-task transfer path returns transformed bytes and leaves the source PixelMap readable.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('oneTransferredTaskCompletesWithoutDetachingThePixelMap', 0, async () => {
      await verifyImageTasks([255, 0, 255, 255], [255, 64, 255, 255], 100, 75, 1, true);
    });

    // @tc.number SUB_PERFORMANCE_THREADTRANSFER_1400
    // @tc.name clonedUnevenTaskGroupRetainsTheFinalPixel
    // @tc.desc Verify five pixels divided into three cloned tasks retain the uneven final chunk.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('clonedUnevenTaskGroupRetainsTheFinalPixel', 0, async () => {
      await verifyImageTasks(primaryRow(5), [255, 191, 191, 255, 191, 255, 191, 255, 191, 191, 255, 255,
        255, 191, 191, 255, 191, 255, 191, 255], 100, 25, 3, false);
    });

    // @tc.number SUB_PERFORMANCE_THREADTRANSFER_1500
    // @tc.name transferredExcessTasksAreCappedAtTheNumberOfPixels
    // @tc.desc Verify excess transferred task requests do not schedule empty chunks or omit output.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('transferredExcessTasksAreCappedAtTheNumberOfPixels', 0, async () => {
      await verifyImageTasks(primaryRow(2), [255, 64, 64, 255, 64, 255, 64, 255], 100, 75, 20, true);
    });

    // @tc.number SUB_PERFORMANCE_THREADTRANSFER_1600
    // @tc.name identityCloneGroupRetainsEveryPixelWithoutSaturationChange
    // @tc.desc Verify identity processing through cloned tasks preserves all original pixel bytes.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('identityCloneGroupRetainsEveryPixelWithoutSaturationChange', 0, async () => {
      const input = primaryRow(7);
      await verifyImageTasks(input, input, 80, 80, 3, false);
    });

    // @tc.number SUB_PERFORMANCE_THREADTRANSFER_1700
    // @tc.name zeroSaturationClonedTaskGroupReturnsNeutralPixels
    // @tc.desc Verify the cloned task path reaches zero saturation for primary and secondary hues.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('zeroSaturationClonedTaskGroupReturnsNeutralPixels', 0, async () => {
      await verifyImageTasks([255, 0, 0, 255, 0, 255, 255, 255],
        [255, 255, 255, 255, 255, 255, 255, 255], 60, 0, 2, false);
    });

    // @tc.number SUB_PERFORMANCE_THREADTRANSFER_1800
    // @tc.name zeroSaturationTransferredTaskGroupReturnsNeutralPixels
    // @tc.desc Verify the transferred task path reaches zero saturation without losing alpha or chunks.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('zeroSaturationTransferredTaskGroupReturnsNeutralPixels', 0, async () => {
      await verifyImageTasks([255, 0, 0, 255, 0, 255, 255, 255],
        [255, 255, 255, 255, 255, 255, 255, 255], 60, 0, 2, true);
    });

    // @tc.number SUB_PERFORMANCE_THREADTRANSFER_1900
    // @tc.name clonedTasksCanIncreaseExistingSaturation
    // @tc.desc Verify cloned tasks use the previous saturation value when restoring partly saturated colors.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('clonedTasksCanIncreaseExistingSaturation', 0, async () => {
      await verifyImageTasks([128, 255, 128, 255, 255, 128, 255, 255],
        [0, 255, 0, 255, 255, 0, 255, 255], 50, 100, 2, false);
    });

    // @tc.number SUB_PERFORMANCE_THREADTRANSFER_2000
    // @tc.name transferredTasksCanIncreaseExistingSaturation
    // @tc.desc Verify transferred tasks correctly restore partly saturated colors instead of always decreasing chroma.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('transferredTasksCanIncreaseExistingSaturation', 0, async () => {
      await verifyImageTasks([128, 255, 128, 255, 255, 128, 255, 255],
        [0, 255, 0, 255, 255, 0, 255, 255], 50, 100, 2, true);
    });

    // @tc.number SUB_PERFORMANCE_THREADTRANSFER_2100
    // @tc.name samePixelMapSupportsSuccessiveCloneAndTransferRequests
    // @tc.desc Verify one PixelMap can be reused with different modes and target saturation without retaining task output.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('samePixelMapSupportsSuccessiveCloneAndTransferRequests', 0, async () => {
      const original = primaryRow(3);
      const pixelMap = await createEditablePixelMap(original);
      try {
        const first = await awaitTaskOutput(pixelMap, 100, 50, 2, false);
        assertBytes(first, [255, 128, 128, 255, 128, 255, 128, 255, 128, 128, 255, 255], 'Cloned result');
        const second = await awaitTaskOutput(pixelMap, 100, 25, 3, true);
        assertBytes(second, [255, 191, 191, 255, 191, 255, 191, 255, 191, 191, 255, 255], 'Transferred result');
        await assertPixelMapBytes(pixelMap, original);
      } finally { await pixelMap.release(); }
    });

    // @tc.number SUB_PERFORMANCE_THREADTRANSFER_2200
    // @tc.name concurrentRequestsOnOnePixelMapKeepSeparateResults
    // @tc.desc Verify simultaneous cloned and transferred requests on the same PixelMap return their own saturation results.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('concurrentRequestsOnOnePixelMapKeepSeparateResults', 0, async () => {
      const original = primaryRow(3);
      const pixelMap = await createEditablePixelMap(original);
      try {
        const results = await Promise.all([awaitTaskOutput(pixelMap, 100, 50, 2, false),
          awaitTaskOutput(pixelMap, 100, 75, 3, true)]);
        assertBytes(results[0], [255, 128, 128, 255, 128, 255, 128, 255, 128, 128, 255, 255], 'Concurrent clone');
        assertBytes(results[1], [255, 64, 64, 255, 64, 255, 64, 255, 64, 64, 255, 255], 'Concurrent transfer');
        await assertPixelMapBytes(pixelMap, original);
      } finally { await pixelMap.release(); }
    });

    // @tc.number SUB_PERFORMANCE_THREADTRANSFER_2300
    // @tc.name concurrentDifferentPixelMapsCannotExchangeTheirCallbackResults
    // @tc.desc Verify concurrent requests for different images retain their own source data and callback results.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('concurrentDifferentPixelMapsCannotExchangeTheirCallbackResults', 0, async () => {
      const red = await createEditablePixelMap([255, 0, 0, 255]);
      let green: image.PixelMap | undefined;
      try {
        green = await createEditablePixelMap([0, 255, 0, 255]);
        const results = await Promise.all([awaitTaskOutput(red, 100, 50, 1, true),
          awaitTaskOutput(green, 100, 25, 1, false)]);
        assertBytes(results[0], [255, 128, 128, 255], 'Red request');
        assertBytes(results[1], [191, 255, 191, 255], 'Green request');
        await assertPixelMapBytes(red, [255, 0, 0, 255]);
        await assertPixelMapBytes(green, [0, 255, 0, 255]);
      } finally {
        await red.release();
        if (green !== undefined) { await green.release(); }
      }
    });

    // @tc.number SUB_PERFORMANCE_THREADTRANSFER_2400
    // @tc.name invalidTaskRequestsPreserveThePixelMapAndAllowASubsequentRetry
    // @tc.desc Verify invalid task counts reject before callback delivery and leave the same PixelMap usable in both modes.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('invalidTaskRequestsPreserveThePixelMapAndAllowASubsequentRetry', 0, async () => {
      const original = [0, 0, 255, 255];
      const pixelMap = await createEditablePixelMap(original);
      try {
        let callbacks = 0;
        for (const transfer of [false, true]) {
          for (const tasks of [-1, 1.5, Number.POSITIVE_INFINITY]) {
            const result = await pixelMapProcessByTaskPool(pixelMap, 100, 50, tasks, transfer,
              () => { callbacks++; }).then(() => 'unexpected success', (error: Error) => error.name);
            expect(result).assertEqual('RangeError');
          }
        }
        expect(callbacks).assertEqual(0);
        await assertPixelMapBytes(pixelMap, original);
        const recovered = await awaitTaskOutput(pixelMap, 100, 50, 1, true);
        assertBytes(recovered, [128, 128, 255, 255], 'Recovered result');
        await assertPixelMapBytes(pixelMap, original);
      } finally { await pixelMap.release(); }
    });
  });
}
