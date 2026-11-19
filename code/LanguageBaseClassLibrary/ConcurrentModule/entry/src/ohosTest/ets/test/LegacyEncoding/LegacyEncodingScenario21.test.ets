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

import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import fs from '@ohos.file.fs';
import * as shared from '../Shared/SharedDriver';

// Adapted from ets/test/Interaction/ThemeVariation.test.ets.
// Real application exports and entrypoints replace TV-only services and models.
export default function LegacyEncodingScenario21(): void {
  describe('LegacyEncodingScenario21', () => {
    const recorder: shared.OperationRecorder = new shared.OperationRecorder();
    beforeAll(() => {
      hilog.info(0xf811, 'LegacyEncodingScenario21', 'Suite started');
    });
    beforeEach(() => {
      recorder.clear();
    });
    afterEach(() => {
      hilog.info(0xf811, 'LegacyEncodingScenario21', 'Recorded operations: %{public}d', recorder.count());
    });
    afterAll(() => {
      recorder.clear();
      hilog.info(0xf811, 'LegacyEncodingScenario21', 'Suite completed');
    });

    // @tc.number LegacyEncodingScenario21_LegacyEncoding_00
    // @tc.name LegacyEncodingScenario21_LegacyEncoding_00
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 381.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario21_LegacyEncoding_00', 0, async () => {
      const input: string = '\t';
      const expected: number[] = [9];
      const bytes: number[] = shared.strToUtf8Bytes(input);
      const buffer: ArrayBuffer = shared.strToArrayBuffer(input);
      const bufferBytes: number[] = shared.bytesOf(buffer);
      const actualBuffer: string = JSON.stringify(bufferBytes);
      const expectedBuffer: string = JSON.stringify(expected);
      expect(actualBuffer).assertEqual(expectedBuffer);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number LegacyEncodingScenario21_LegacyEncoding_01
    // @tc.name LegacyEncodingScenario21_LegacyEncoding_01
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 382.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario21_LegacyEncoding_01', 0, async () => {
      const input: string = 'ßASCII';
      const expected: number[] = [195, 159, 65, 83, 67, 73, 73];
      const bytes: number[] = shared.strToUtf8Bytes(input);
      const buffer: ArrayBuffer = shared.strToArrayBuffer(input);
      const bufferBytes: number[] = shared.bytesOf(buffer);
      const actualBuffer: string = JSON.stringify(bufferBytes);
      const expectedBuffer: string = JSON.stringify(expected);
      expect(actualBuffer).assertEqual(expectedBuffer);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number LegacyEncodingScenario21_LegacyEncoding_02
    // @tc.name LegacyEncodingScenario21_LegacyEncoding_02
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 383.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario21_LegacyEncoding_02', 0, async () => {
      const input: string = 'Ω﻿';
      const expected: number[] = [206, 169, 239, 187, 191];
      const bytes: number[] = shared.strToUtf8Bytes(input);
      const buffer: ArrayBuffer = shared.strToArrayBuffer(input);
      const bufferBytes: number[] = shared.bytesOf(buffer);
      const actualBuffer: string = JSON.stringify(bufferBytes);
      const expectedBuffer: string = JSON.stringify(expected);
      expect(actualBuffer).assertEqual(expectedBuffer);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number LegacyEncodingScenario21_LegacyEncoding_03
    // @tc.name LegacyEncodingScenario21_LegacyEncoding_03
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 384.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario21_LegacyEncoding_03', 0, async () => {
      const input: string = 'a\r\n';
      const expected: number[] = [97, 13, 10];
      const bytes: number[] = shared.strToUtf8Bytes(input);
      const buffer: ArrayBuffer = shared.strToArrayBuffer(input);
      const bufferBytes: number[] = shared.bytesOf(buffer);
      const actualBuffer: string = JSON.stringify(bufferBytes);
      const expectedBuffer: string = JSON.stringify(expected);
      expect(actualBuffer).assertEqual(expectedBuffer);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number LegacyEncodingScenario21_LegacyEncoding_04
    // @tc.name LegacyEncodingScenario21_LegacyEncoding_04
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 385.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario21_LegacyEncoding_04', 0, async () => {
      const input: string = 'Z\u0000';
      const expected: number[] = [90, 0];
      const bytes: number[] = shared.strToUtf8Bytes(input);
      const buffer: ArrayBuffer = shared.strToArrayBuffer(input);
      const bufferBytes: number[] = shared.bytesOf(buffer);
      const actualBuffer: string = JSON.stringify(bufferBytes);
      const expectedBuffer: string = JSON.stringify(expected);
      expect(actualBuffer).assertEqual(expectedBuffer);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number LegacyEncodingScenario21_LegacyEncoding_05
    // @tc.name LegacyEncodingScenario21_LegacyEncoding_05
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 386.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario21_LegacyEncoding_05', 0, async () => {
      const input: string = 'é';
      const expected: number[] = [195, 169];
      const bytes: number[] = shared.strToUtf8Bytes(input);
      const buffer: ArrayBuffer = shared.strToArrayBuffer(input);
      const bufferBytes: number[] = shared.bytesOf(buffer);
      const actualBuffer: string = JSON.stringify(bufferBytes);
      const expectedBuffer: string = JSON.stringify(expected);
      expect(actualBuffer).assertEqual(expectedBuffer);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number LegacyEncodingScenario21_Group_06
    // @tc.name LegacyEncodingScenario21_Group_06
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 387.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario21_Group_06', 0, async () => {
      const input: string[] = ['10', '10', '10'];
      const expected: string[] = ['10', '10', '10'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const inputs: string[][] = [input, ['z', 'a'], []];
      const actual: string[][] = await shared.executeGroup(inputs);
      const groupSize: number = actual.length;
      expect(groupSize).assertEqual(3);
      const first: string = JSON.stringify(actual[0]);
      const expectedFirst: string = JSON.stringify(expected);
      expect(first).assertEqual(expectedFirst);
      const second: string = JSON.stringify(actual[1]);
      expect(second).assertEqual('["a","z"]');
      const thirdLength: number = actual[2].length;
      expect(thirdLength).assertEqual(0);
      const inputAfter: string = JSON.stringify(input);
      expect(inputAfter).assertEqual(original);
    });

    // @tc.number LegacyEncodingScenario21_LegacyEncoding_07
    // @tc.name LegacyEncodingScenario21_LegacyEncoding_07
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 388.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario21_LegacyEncoding_07', 0, async () => {
      const input: string = '2😀';
      const expected: number[] = [50, 240, 159, 152, 128];
      const bytes: number[] = shared.strToUtf8Bytes(input);
      const buffer: ArrayBuffer = shared.strToArrayBuffer(input);
      const bufferBytes: number[] = shared.bytesOf(buffer);
      const actualBuffer: string = JSON.stringify(bufferBytes);
      const expectedBuffer: string = JSON.stringify(expected);
      expect(actualBuffer).assertEqual(expectedBuffer);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number LegacyEncodingScenario21_LegacyEncoding_08
    // @tc.name LegacyEncodingScenario21_LegacyEncoding_08
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 389.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario21_LegacyEncoding_08', 0, async () => {
      const input: string = ' ';
      const expected: number[] = [32];
      const bytes: number[] = shared.strToUtf8Bytes(input);
      const buffer: ArrayBuffer = shared.strToArrayBuffer(input);
      const bufferBytes: number[] = shared.bytesOf(buffer);
      const actualBuffer: string = JSON.stringify(bufferBytes);
      const expectedBuffer: string = JSON.stringify(expected);
      expect(actualBuffer).assertEqual(expectedBuffer);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number LegacyEncodingScenario21_LegacyEncoding_09
    // @tc.name LegacyEncodingScenario21_LegacyEncoding_09
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 390.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario21_LegacyEncoding_09', 0, async () => {
      const input: string = 'éASCII';
      const expected: number[] = [195, 169, 65, 83, 67, 73, 73];
      const bytes: number[] = shared.strToUtf8Bytes(input);
      const buffer: ArrayBuffer = shared.strToArrayBuffer(input);
      const bufferBytes: number[] = shared.bytesOf(buffer);
      const actualBuffer: string = JSON.stringify(bufferBytes);
      const expectedBuffer: string = JSON.stringify(expected);
      expect(actualBuffer).assertEqual(expectedBuffer);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number LegacyEncodingScenario21_Sendable_10
    // @tc.name LegacyEncodingScenario21_Sendable_10
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 391.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario21_Sendable_10', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = 9007199254740991;
      const initial: number = await data.data1.getCount();
      expect(initial).assertEqual(0);
      await shared.transferSendable(data, expected);
      const fieldValue: number = data.data1.v1;
      expect(fieldValue).assertEqual(expected);
      const marker: string = data.data1.v2;
      expect(marker).assertEqual('worker');
      const flag: boolean = data.data1.v3;
      expect(flag).assertTrue();
      const size: number = data.data2.v1.length;
      expect(size).assertEqual(1);
      const first: number = data.data2.v1[0];
      expect(first).assertEqual(expected);
      const mapValue: string | undefined = data.data2.v2.get(expected);
      expect(mapValue).assertEqual('shared');
      const setHas: boolean = data.data2.v3.has('shared');
      expect(setHas).assertTrue();
      const actual: number = await data.data1.getCount();
      expect(actual).assertEqual(expected);
      await data.data1.setCount(0);
      const reset: number = await data.data1.getCount();
      expect(reset).assertEqual(0);
    });

    // @tc.number LegacyEncodingScenario21_LegacyEncoding_11
    // @tc.name LegacyEncodingScenario21_LegacyEncoding_11
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 392.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario21_LegacyEncoding_11', 0, async () => {
      const input: string = '😀\r\n';
      const expected: number[] = [240, 159, 152, 128, 13, 10];
      const bytes: number[] = shared.strToUtf8Bytes(input);
      const buffer: ArrayBuffer = shared.strToArrayBuffer(input);
      const bufferBytes: number[] = shared.bytesOf(buffer);
      const actualBuffer: string = JSON.stringify(bufferBytes);
      const expectedBuffer: string = JSON.stringify(expected);
      expect(actualBuffer).assertEqual(expectedBuffer);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number LegacyEncodingScenario21_Copy_12
    // @tc.name LegacyEncodingScenario21_Copy_12
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 393.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario21_Copy_12', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_555');
      try {
        const expected: string = 'a\u0000b\nfile content\nxxxxxx';
        shared.writeFixture(fixture.source + '/input.txt', expected);
        const request: shared.CopyRequest = {
          srcDir: fixture.source,
          destDir: fixture.destination,
          fileNames: ['input.txt'],
        };
        const reply: shared.CopyReply = await shared.copyThroughWorker(request);
        const count: number = reply.count;
        expect(count).assertEqual(1);
        const finished: boolean = reply.strFlag;
        expect(finished).assertTrue();
        const filename: string = reply.listFileNames[0];
        expect(filename).assertEqual('input.txt');
        const actual: string = shared.readFixture(fixture.destination + '/input.txt');
        expect(actual).assertEqual(expected);
        const original: string = shared.readFixture(fixture.source + '/input.txt');
        expect(original).assertEqual(expected);
      } finally {
        shared.removeFileFixture(fixture);
      }
    });

    // @tc.number LegacyEncodingScenario21_Group_13
    // @tc.name LegacyEncodingScenario21_Group_13
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 394.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario21_Group_13', 0, async () => {
      const input: string[] = [];
      const expected: string[] = [];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const inputs: string[][] = [input, ['z', 'a'], []];
      const actual: string[][] = await shared.executeGroup(inputs);
      const groupSize: number = actual.length;
      expect(groupSize).assertEqual(3);
      const first: string = JSON.stringify(actual[0]);
      const expectedFirst: string = JSON.stringify(expected);
      expect(first).assertEqual(expectedFirst);
      const second: string = JSON.stringify(actual[1]);
      expect(second).assertEqual('["a","z"]');
      const thirdLength: number = actual[2].length;
      expect(thirdLength).assertEqual(0);
      const inputAfter: string = JSON.stringify(input);
      expect(inputAfter).assertEqual(original);
    });

    // @tc.number LegacyEncodingScenario21_LegacyEncoding_14
    // @tc.name LegacyEncodingScenario21_LegacyEncoding_14
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 395.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario21_LegacyEncoding_14', 0, async () => {
      const input: string = 'a_b中文';
      const expected: number[] = [97, 95, 98, 228, 184, 173, 230, 150, 135];
      const bytes: number[] = shared.strToUtf8Bytes(input);
      const buffer: ArrayBuffer = shared.strToArrayBuffer(input);
      const bufferBytes: number[] = shared.bytesOf(buffer);
      const actualBuffer: string = JSON.stringify(bufferBytes);
      const expectedBuffer: string = JSON.stringify(expected);
      expect(actualBuffer).assertEqual(expectedBuffer);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number LegacyEncodingScenario21_LegacyEncoding_15
    // @tc.name LegacyEncodingScenario21_LegacyEncoding_15
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 396.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario21_LegacyEncoding_15', 0, async () => {
      const input: string = '\n😀';
      const expected: number[] = [10, 240, 159, 152, 128];
      const bytes: number[] = shared.strToUtf8Bytes(input);
      const buffer: ArrayBuffer = shared.strToArrayBuffer(input);
      const bufferBytes: number[] = shared.bytesOf(buffer);
      const actualBuffer: string = JSON.stringify(bufferBytes);
      const expectedBuffer: string = JSON.stringify(expected);
      expect(actualBuffer).assertEqual(expectedBuffer);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number LegacyEncodingScenario21_LegacyEncoding_16
    // @tc.name LegacyEncodingScenario21_LegacyEncoding_16
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 397.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario21_LegacyEncoding_16', 0, async () => {
      const input: string = '\t';
      const expected: number[] = [9];
      const bytes: number[] = shared.strToUtf8Bytes(input);
      const buffer: ArrayBuffer = shared.strToArrayBuffer(input);
      const bufferBytes: number[] = shared.bytesOf(buffer);
      const actualBuffer: string = JSON.stringify(bufferBytes);
      const expectedBuffer: string = JSON.stringify(expected);
      expect(actualBuffer).assertEqual(expectedBuffer);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number LegacyEncodingScenario21_LegacyEncoding_17
    // @tc.name LegacyEncodingScenario21_LegacyEncoding_17
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 398.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario21_LegacyEncoding_17', 0, async () => {
      const input: string = 'ßASCII';
      const expected: number[] = [195, 159, 65, 83, 67, 73, 73];
      const bytes: number[] = shared.strToUtf8Bytes(input);
      const buffer: ArrayBuffer = shared.strToArrayBuffer(input);
      const bufferBytes: number[] = shared.bytesOf(buffer);
      const actualBuffer: string = JSON.stringify(bufferBytes);
      const expectedBuffer: string = JSON.stringify(expected);
      expect(actualBuffer).assertEqual(expectedBuffer);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number LegacyEncodingScenario21_LegacyEncoding_18
    // @tc.name LegacyEncodingScenario21_LegacyEncoding_18
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 399.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario21_LegacyEncoding_18', 0, async () => {
      const input: string = 'Ω﻿';
      const expected: number[] = [206, 169, 239, 187, 191];
      const bytes: number[] = shared.strToUtf8Bytes(input);
      const buffer: ArrayBuffer = shared.strToArrayBuffer(input);
      const bufferBytes: number[] = shared.bytesOf(buffer);
      const actualBuffer: string = JSON.stringify(bufferBytes);
      const expectedBuffer: string = JSON.stringify(expected);
      expect(actualBuffer).assertEqual(expectedBuffer);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number LegacyEncodingScenario21_LegacyEncoding_19
    // @tc.name LegacyEncodingScenario21_LegacyEncoding_19
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 400.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario21_LegacyEncoding_19', 0, async () => {
      const input: string = 'a\r\n';
      const expected: number[] = [97, 13, 10];
      const bytes: number[] = shared.strToUtf8Bytes(input);
      const buffer: ArrayBuffer = shared.strToArrayBuffer(input);
      const bufferBytes: number[] = shared.bytesOf(buffer);
      const actualBuffer: string = JSON.stringify(bufferBytes);
      const expectedBuffer: string = JSON.stringify(expected);
      expect(actualBuffer).assertEqual(expectedBuffer);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number LegacyEncodingScenario21_Group_20
    // @tc.name LegacyEncodingScenario21_Group_20
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 401.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario21_Group_20', 0, async () => {
      const input: string[] = ['Z'];
      const expected: string[] = ['Z'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const inputs: string[][] = [input, ['z', 'a'], []];
      const actual: string[][] = await shared.executeGroup(inputs);
      const groupSize: number = actual.length;
      expect(groupSize).assertEqual(3);
      const first: string = JSON.stringify(actual[0]);
      const expectedFirst: string = JSON.stringify(expected);
      expect(first).assertEqual(expectedFirst);
      const second: string = JSON.stringify(actual[1]);
      expect(second).assertEqual('["a","z"]');
      const thirdLength: number = actual[2].length;
      expect(thirdLength).assertEqual(0);
      const inputAfter: string = JSON.stringify(input);
      expect(inputAfter).assertEqual(original);
    });

    // @tc.number LegacyEncodingScenario21_Sendable_21
    // @tc.name LegacyEncodingScenario21_Sendable_21
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 402.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario21_Sendable_21', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = 1;
      const initial: number = await data.data1.getCount();
      expect(initial).assertEqual(0);
      await shared.transferSendable(data, expected);
      const fieldValue: number = data.data1.v1;
      expect(fieldValue).assertEqual(expected);
      const marker: string = data.data1.v2;
      expect(marker).assertEqual('worker');
      const flag: boolean = data.data1.v3;
      expect(flag).assertTrue();
      const size: number = data.data2.v1.length;
      expect(size).assertEqual(1);
      const first: number = data.data2.v1[0];
      expect(first).assertEqual(expected);
      const mapValue: string | undefined = data.data2.v2.get(expected);
      expect(mapValue).assertEqual('shared');
      const setHas: boolean = data.data2.v3.has('shared');
      expect(setHas).assertTrue();
      const actual: number = await data.data1.getCount();
      expect(actual).assertEqual(expected);
      await data.data1.setCount(0);
      const reset: number = await data.data1.getCount();
      expect(reset).assertEqual(0);
    });

    // @tc.number LegacyEncodingScenario21_LegacyEncoding_22
    // @tc.name LegacyEncodingScenario21_LegacyEncoding_22
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 403.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario21_LegacyEncoding_22', 0, async () => {
      const input: string = '10中文';
      const expected: number[] = [49, 48, 228, 184, 173, 230, 150, 135];
      const bytes: number[] = shared.strToUtf8Bytes(input);
      const buffer: ArrayBuffer = shared.strToArrayBuffer(input);
      const bufferBytes: number[] = shared.bytesOf(buffer);
      const actualBuffer: string = JSON.stringify(bufferBytes);
      const expectedBuffer: string = JSON.stringify(expected);
      expect(actualBuffer).assertEqual(expectedBuffer);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number LegacyEncodingScenario21_LegacyEncoding_23
    // @tc.name LegacyEncodingScenario21_LegacyEncoding_23
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 404.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario21_LegacyEncoding_23', 0, async () => {
      const input: string = '2😀';
      const expected: number[] = [50, 240, 159, 152, 128];
      const bytes: number[] = shared.strToUtf8Bytes(input);
      const buffer: ArrayBuffer = shared.strToArrayBuffer(input);
      const bufferBytes: number[] = shared.bytesOf(buffer);
      const actualBuffer: string = JSON.stringify(bufferBytes);
      const expectedBuffer: string = JSON.stringify(expected);
      expect(actualBuffer).assertEqual(expectedBuffer);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number LegacyEncodingScenario21_LegacyEncoding_24
    // @tc.name LegacyEncodingScenario21_LegacyEncoding_24
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 405.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario21_LegacyEncoding_24', 0, async () => {
      const input: string = ' ';
      const expected: number[] = [32];
      const bytes: number[] = shared.strToUtf8Bytes(input);
      const buffer: ArrayBuffer = shared.strToArrayBuffer(input);
      const bufferBytes: number[] = shared.bytesOf(buffer);
      const actualBuffer: string = JSON.stringify(bufferBytes);
      const expectedBuffer: string = JSON.stringify(expected);
      expect(actualBuffer).assertEqual(expectedBuffer);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number LegacyEncodingScenario21_Copy_25
    // @tc.name LegacyEncodingScenario21_Copy_25
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 406.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario21_Copy_25', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_568');
      try {
        const expected: string = 'é\nfile content\nx';
        shared.writeFixture(fixture.source + '/input.txt', expected);
        const request: shared.CopyRequest = {
          srcDir: fixture.source,
          destDir: fixture.destination,
          fileNames: ['input.txt'],
        };
        const reply: shared.CopyReply = await shared.copyThroughWorker(request);
        const count: number = reply.count;
        expect(count).assertEqual(1);
        const finished: boolean = reply.strFlag;
        expect(finished).assertTrue();
        const filename: string = reply.listFileNames[0];
        expect(filename).assertEqual('input.txt');
        const actual: string = shared.readFixture(fixture.destination + '/input.txt');
        expect(actual).assertEqual(expected);
        const original: string = shared.readFixture(fixture.source + '/input.txt');
        expect(original).assertEqual(expected);
      } finally {
        shared.removeFileFixture(fixture);
      }
    });
  });
}
