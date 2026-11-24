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
import { splitRgbaShards } from '@ohos/ThreadDataTransfer';

const RGBA_BYTES: number = 4;

function createSamples(pixelCount: number): ArrayBuffer {
  const buffer = new ArrayBuffer(pixelCount * RGBA_BYTES);
  const bytes = new Uint8Array(buffer);
  for (let pixel = 0; pixel < pixelCount; pixel++) {
    const offset = pixel * RGBA_BYTES;
    bytes[offset] = pixel % 256;
    bytes[offset + 1] = (pixel * 3 + 17) % 256;
    bytes[offset + 2] = (pixel * 7 + 91) % 256;
    bytes[offset + 3] = 255 - pixel % 256;
  }
  return buffer;
}

function widths(shards: ArrayBuffer[]): string {
  return shards.map(shard => shard.byteLength / RGBA_BYTES).join(',');
}

function verifyPartition(pixelCount: number, tasks: number): void {
  const buffer = createSamples(pixelCount);
  const expectedBytes = new Uint8Array(buffer);
  const shards = splitRgbaShards(buffer, tasks);
  const expectedCount = Math.min(pixelCount, tasks);
  if (shards.length !== expectedCount) {
    throw new Error(`Expected ${expectedCount} shards for ${pixelCount} pixels and ${tasks} tasks`);
  }
  let cursor = 0;
  let min = Number.POSITIVE_INFINITY;
  let max = 0;
  for (const shard of shards) {
    const bytes = new Uint8Array(shard);
    if (bytes.length === 0 || bytes.length % RGBA_BYTES !== 0) {
      throw new Error(`Invalid shard length ${bytes.length} for ${pixelCount} pixels and ${tasks} tasks`);
    }
    min = Math.min(min, bytes.length);
    max = Math.max(max, bytes.length);
    for (const actual of bytes) {
      if (actual !== expectedBytes[cursor]) {
        throw new Error(`Unexpected byte at ${cursor} for ${pixelCount} pixels and ${tasks} tasks`);
      }
      cursor++;
    }
  }
  expect(cursor).assertEqual(expectedBytes.length);
  if (shards.length > 0) {
    const balanced = max - min <= RGBA_BYTES;
    expect(balanced).assertTrue();
  }
}

function rangeErrorMessage(buffer: ArrayBuffer, tasks: number): string {
  try {
    splitRgbaShards(buffer, tasks);
  } catch (error) {
    if (error instanceof RangeError) {
      return error.message;
    }
    throw new Error(`Unexpected error: ${String(error)}`);
  }
  throw new Error(`Expected RangeError for ${buffer.byteLength} bytes and ${tasks} tasks`);
}

export default function rgbaShardsTest(): void {
  describe('PerformanceRgbaShards', () => {
    // @tc.number SUB_PERFORMANCE_RGBASHARDS_0100
    // @tc.name shardLayoutKeepsAnOddTailPixelIntact
    // @tc.desc Verify splitRgbaShards distributes five pixels without cutting the trailing pixel.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('shardLayoutKeepsAnOddTailPixelIntact', 0, () => {
      const actual = widths(splitRgbaShards(createSamples(5), 2));
      expect(actual).assertEqual('2,3');
      verifyPartition(5, 2);
    });

    // @tc.number SUB_PERFORMANCE_RGBASHARDS_0200
    // @tc.name excessShardRequestsDoNotCreateEmptyTasks
    // @tc.desc Verify splitRgbaShards caps task count at the number of available pixels.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('excessShardRequestsDoNotCreateEmptyTasks', 0, () => {
      const actual = widths(splitRgbaShards(createSamples(2), 20));
      expect(actual).assertEqual('1,1');
      verifyPartition(2, 20);
    });

    // @tc.number SUB_PERFORMANCE_RGBASHARDS_0300
    // @tc.name emptyRgbaInputDoesNotScheduleAnyTask
    // @tc.desc Verify splitRgbaShards returns zero shards when there are zero pixels to process.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('emptyRgbaInputDoesNotScheduleAnyTask', 0, () => {
      const shards = splitRgbaShards(new ArrayBuffer(0), 20);
      const count = shards.length;
      expect(count).assertEqual(0);
    });

    // @tc.number SUB_PERFORMANCE_RGBASHARDS_0400
    // @tc.name shardMutationDoesNotChangeInputOrAnotherShard
    // @tc.desc Verify splitRgbaShards returns independent buffers suitable for transfer to separate tasks.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('shardMutationDoesNotChangeInputOrAnotherShard', 0, () => {
      const source = createSamples(3);
      const shards = splitRgbaShards(source, 3);
      const first = new Uint8Array(shards[0]);
      const second = new Uint8Array(shards[1]);
      first[0] = 231;
      new Uint8Array(source)[4] = 193;
      const sourceFirst = new Uint8Array(source)[0];
      const secondFirst = second[0];
      expect(sourceFirst).assertEqual(0);
      expect(secondFirst).assertEqual(1);
    });

    // @tc.number SUB_PERFORMANCE_RGBASHARDS_0500
    // @tc.name invalidTaskCountsRejectBeforePartitioning
    // @tc.desc Verify splitRgbaShards rejects nonpositive, fractional and nonfinite task counts.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('invalidTaskCountsRejectBeforePartitioning', 0, () => {
      const source = createSamples(3);
      const invalidCounts: number[] = [0, -1, 1.5, NaN, Number.POSITIVE_INFINITY];
      for (const invalidCount of invalidCounts) {
        const message = rangeErrorMessage(source, invalidCount);
        expect(message).assertEqual('Task count must be a positive integer');
      }
      verifyPartition(3, 2);
    });

    // @tc.number SUB_PERFORMANCE_RGBASHARDS_0600
    // @tc.name incompleteRgbaTailRejectsInsteadOfDroppingBytes
    // @tc.desc Verify splitRgbaShards rejects buffers ending with one, two or three incomplete pixel channels.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('incompleteRgbaTailRejectsInsteadOfDroppingBytes', 0, () => {
      for (let bytes = 5; bytes <= 7; bytes++) {
        const message = rangeErrorMessage(new ArrayBuffer(bytes), 2);
        expect(message).assertEqual('RGBA input must contain complete pixels');
      }
    });

    // @tc.number SUB_PERFORMANCE_RGBASHARDS_0700
    // @tc.name everySupportedTaskCountBalancesSmallRgbaImages
    // @tc.desc Verify splitRgbaShards preserves all channels and order across the 1-to-20 task slider domain.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('everySupportedTaskCountBalancesSmallRgbaImages', 0, () => {
      for (let pixels = 1; pixels <= 32; pixels++) {
        for (let tasks = 1; tasks <= 20; tasks++) {
          verifyPartition(pixels, tasks);
        }
      }
    });

    // @tc.number SUB_PERFORMANCE_RGBASHARDS_0800
    // @tc.name shardOffsetsRemainCorrectAcrossTheFirstFullByteRange
    // @tc.desc Verify splitRgbaShards preserves larger image offsets for uneven partitions and one-task processing.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('shardOffsetsRemainCorrectAcrossTheFirstFullByteRange', 0, () => {
      verifyPartition(257, 1);
      verifyPartition(257, 13);
      verifyPartition(257, 20);
    });
  });
}
