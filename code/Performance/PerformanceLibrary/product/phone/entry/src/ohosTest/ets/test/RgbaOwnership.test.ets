/*
 * Copyright (c) 2023-2024 Huawei Device Co., Ltd.
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

function sampleBuffer(pixels: number): ArrayBuffer {
  const bytes = new Uint8Array(pixels * 4);
  for (let offset = 0; offset < bytes.length; offset++) {
    bytes[offset] = (offset * 37 + 11) % 256;
  }
  return bytes.buffer;
}

function joinedBytes(buffers: ArrayBuffer[]): string {
  const output: number[] = [];
  for (const buffer of buffers) {
    for (const byte of new Uint8Array(buffer)) { output.push(byte); }
  }
  return output.join(',');
}

function assertBuffers(buffers: ArrayBuffer[], expected: string): void {
  const actual = joinedBytes(buffers);
  expect(actual).assertEqual(expected);
}

function rejectionMessage(buffer: ArrayBuffer, tasks: number): string {
  try {
    splitRgbaShards(buffer, tasks);
  } catch (error) {
    const caught = error as Error;
    const name = caught.name;
    expect(name).assertEqual('RangeError');
    return caught.message;
  }
  throw new Error('Expected splitRgbaShards to reject invalid input');
}

export default function rgbaOwnershipTest(): void {
  describe('PerformanceRgbaOwnership', () => {
    // @tc.number SUB_PERFORMANCE_RGBAOWNERSHIP_0001
    // @tc.name separatePartitionsOfOneSourceOwnDifferentStorage
    // @tc.desc Verify repeated partitions share neither shard storage nor modified bytes with earlier results.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('separatePartitionsOfOneSourceOwnDifferentStorage', 0, () => {
      const source = sampleBuffer(5);
      const expected = joinedBytes([source]);
      const first = splitRgbaShards(source, 2);
      const second = splitRgbaShards(source, 2);
      new Uint8Array(first[0]).fill(0);
      new Uint8Array(first[1]).fill(255);
      assertBuffers(second, expected);
      assertBuffers([source], expected);
      const sharedFirst = first[0] === second[0];
      expect(sharedFirst).assertFalse();
    });

    // @tc.number SUB_PERFORMANCE_RGBAOWNERSHIP_0002
    // @tc.name laterSourceWritesOnlyAffectPartitionsCreatedAfterTheWrite
    // @tc.desc Verify a completed partition is an immutable snapshot with respect to later source writes.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('laterSourceWritesOnlyAffectPartitionsCreatedAfterTheWrite', 0, () => {
      const source = sampleBuffer(5);
      const before = joinedBytes([source]);
      const first = splitRgbaShards(source, 3);
      new Uint8Array(source).fill(97);
      const second = splitRgbaShards(source, 3);
      const after = joinedBytes([source]);
      assertBuffers(first, before);
      assertBuffers(second, after);
      const changed = before !== after;
      expect(changed).assertTrue();
    });

    // @tc.number SUB_PERFORMANCE_RGBAOWNERSHIP_0003
    // @tc.name allShardsRemainPairwiseIndependentAfterEveryShardIsWritten
    // @tc.desc Verify each returned shard can be mutated without changing any of its sibling buffers.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('allShardsRemainPairwiseIndependentAfterEveryShardIsWritten', 0, () => {
      const source = sampleBuffer(17);
      const expected = joinedBytes([source]);
      const shards = splitRgbaShards(source, 5);
      const snapshots = shards.map(buffer => joinedBytes([buffer]));
      for (let changed = 0; changed < shards.length; changed++) {
        const saved = new Uint8Array(shards[changed]).slice();
        new Uint8Array(shards[changed]).fill(0);
        for (let other = 0; other < shards.length; other++) {
          if (other !== changed) { assertBuffers([shards[other]], snapshots[other]); }
        }
        new Uint8Array(shards[changed]).set(saved);
      }
      assertBuffers([source], expected);
      assertBuffers(shards, expected);
    });

    // @tc.number SUB_PERFORMANCE_RGBAOWNERSHIP_0004
    // @tc.name partitioningThenRepartitioningPreservesGlobalPixelOrder
    // @tc.desc Verify a hierarchical split retains every source byte and complete RGBA pixel in order.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('partitioningThenRepartitioningPreservesGlobalPixelOrder', 0, () => {
      const source = sampleBuffer(37);
      const expected = joinedBytes([source]);
      const first = splitRgbaShards(source, 4);
      const flattened: ArrayBuffer[] = [];
      for (const buffer of first) {
        for (const shard of splitRgbaShards(buffer, 3)) {
          const aligned = shard.byteLength % 4;
          expect(aligned).assertEqual(0);
          flattened.push(shard);
        }
      }
      assertBuffers(flattened, expected);
      assertBuffers(first, expected);
      assertBuffers([source], expected);
    });

    // @tc.number SUB_PERFORMANCE_RGBAOWNERSHIP_0005
    // @tc.name aFailedPartitionLeavesExistingSuccessfulShardsUsable
    // @tc.desc Verify invalid task input cannot corrupt the source or a previously returned partition.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('aFailedPartitionLeavesExistingSuccessfulShardsUsable', 0, () => {
      const source = sampleBuffer(11);
      const expected = joinedBytes([source]);
      const existing = splitRgbaShards(source, 3);
      const message = rejectionMessage(source, -2);
      expect(message).assertEqual('Task count must be a positive integer');
      assertBuffers(existing, expected);
      assertBuffers([source], expected);
      const recovered = splitRgbaShards(source, 4);
      assertBuffers(recovered, expected);
    });

    // @tc.number SUB_PERFORMANCE_RGBAOWNERSHIP_0006
    // @tc.name invalidTaskCountsAreValidatedEvenForAnEmptyImage
    // @tc.desc Verify empty input cannot bypass positive-integer task validation and remains empty after rejection.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('invalidTaskCountsAreValidatedEvenForAnEmptyImage', 0, () => {
      const empty = new ArrayBuffer(0);
      for (const tasks of [0, -1, 0.5, Number.NEGATIVE_INFINITY]) {
        const message = rejectionMessage(empty, tasks);
        expect(message).assertEqual('Task count must be a positive integer');
      }
      const count = splitRgbaShards(empty, 1).length;
      const bytes = empty.byteLength;
      expect(count).assertEqual(0);
      expect(bytes).assertEqual(0);
    });

    // @tc.number SUB_PERFORMANCE_RGBAOWNERSHIP_0007
    // @tc.name tinyIncompleteBuffersRejectInsteadOfBecomingEmptyImages
    // @tc.desc Verify one to three bytes are rejected as incomplete pixels rather than treated as zero pixels.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('tinyIncompleteBuffersRejectInsteadOfBecomingEmptyImages', 0, () => {
      for (const length of [1, 2, 3]) {
        const buffer = new ArrayBuffer(length);
        const input = new Uint8Array(buffer);
        input.fill(173);
        const before = input.join(',');
        const message = rejectionMessage(buffer, 1);
        const after = input.join(',');
        expect(message).assertEqual('RGBA input must contain complete pixels');
        expect(after).assertEqual(before);
      }
    });

    // @tc.number SUB_PERFORMANCE_RGBAOWNERSHIP_0008
    // @tc.name veryLargeTaskRequestsAreCappedBeforeAllocatingShards
    // @tc.desc Verify a large finite integer task request allocates only one shard per available pixel.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('veryLargeTaskRequestsAreCappedBeforeAllocatingShards', 0, () => {
      const source = sampleBuffer(3);
      const expected = joinedBytes([source]);
      const shards = splitRgbaShards(source, Number.MAX_SAFE_INTEGER);
      const widths = shards.map(shard => shard.byteLength).join(',');
      expect(widths).assertEqual('4,4,4');
      assertBuffers(shards, expected);
      assertBuffers([source], expected);
    });

    // @tc.number SUB_PERFORMANCE_RGBAOWNERSHIP_0009
    // @tc.name fractionalValuesNextToAnIntegerCannotSilentlyRoundToATaskCount
    // @tc.desc Verify task validation distinguishes adjacent fractional numbers from a valid integer.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('fractionalValuesNextToAnIntegerCannotSilentlyRoundToATaskCount', 0, () => {
      const source = sampleBuffer(4);
      const before = joinedBytes([source]);
      for (const tasks of [1 - Number.EPSILON, 1 + Number.EPSILON, 20.000000000000004]) {
        const message = rejectionMessage(source, tasks);
        expect(message).assertEqual('Task count must be a positive integer');
      }
      assertBuffers([source], before);
      assertBuffers(splitRgbaShards(source, 1), before);
    });

    // @tc.number SUB_PERFORMANCE_RGBAOWNERSHIP_0010
    // @tc.name largeUnevenImagePartitionsRetainBytesBeyondSixteenBitOffsets
    // @tc.desc Verify split offsets and complete output for a source larger than sixty-four KiB.
    // @tc.size SMALLTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('largeUnevenImagePartitionsRetainBytesBeyondSixteenBitOffsets', 0, () => {
      const source = sampleBuffer(16387);
      const expected = joinedBytes([source]);
      const shards = splitRgbaShards(source, 19);
      const count = shards.length;
const total: number = shards.reduce((bytes: number, shard: ArrayBuffer): number => bytes + shard.byteLength, 0);
      expect(count).assertEqual(19);
      expect(total).assertEqual(65548);
      assertBuffers(shards, expected);
      assertBuffers([source], expected);
    });
  });
}
