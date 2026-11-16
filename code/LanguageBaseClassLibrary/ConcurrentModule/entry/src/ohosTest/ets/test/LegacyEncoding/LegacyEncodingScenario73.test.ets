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

// Adapted from ets/test/Validation/DialogStateManagerValidation.test.ets.
// Real application exports and entrypoints replace TV-only services and models.
export default function LegacyEncodingScenario73(): void {
  describe('LegacyEncodingScenario73', () => {
    const recorder: shared.OperationRecorder = new shared.OperationRecorder();
    beforeAll(() => {
      hilog.info(0xf811, 'LegacyEncodingScenario73', 'Suite started');
    });
    beforeEach(() => {
      recorder.clear();
    });
    afterEach(() => {
      hilog.info(0xf811, 'LegacyEncodingScenario73', 'Recorded operations: %{public}d', recorder.count());
    });
    afterAll(() => {
      recorder.clear();
      hilog.info(0xf811, 'LegacyEncodingScenario73', 'Suite completed');
    });

    // @tc.number LegacyEncodingScenario73_LegacyEncoding_00
    // @tc.name LegacyEncodingScenario73_LegacyEncoding_00
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1369.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_LegacyEncoding_00', 0, async () => {
      const input: string = 'a\u0000b\u0000';
      const expected: number[] = [97, 0, 98, 0];
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

    // @tc.number LegacyEncodingScenario73_LegacyEncoding_01
    // @tc.name LegacyEncodingScenario73_LegacyEncoding_01
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1370.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_LegacyEncoding_01', 0, async () => {
      const input: string = 'a-bé';
      const expected: number[] = [97, 45, 98, 195, 169];
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

    // @tc.number LegacyEncodingScenario73_LegacyEncoding_02
    // @tc.name LegacyEncodingScenario73_LegacyEncoding_02
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1371.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_LegacyEncoding_02', 0, async () => {
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

    // @tc.number LegacyEncodingScenario73_LegacyEncoding_03
    // @tc.name LegacyEncodingScenario73_LegacyEncoding_03
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1372.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_LegacyEncoding_03', 0, async () => {
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

    // @tc.number LegacyEncodingScenario73_LegacyEncoding_04
    // @tc.name LegacyEncodingScenario73_LegacyEncoding_04
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1373.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_LegacyEncoding_04', 0, async () => {
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

    // @tc.number LegacyEncodingScenario73_LegacyEncoding_05
    // @tc.name LegacyEncodingScenario73_LegacyEncoding_05
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1374.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_LegacyEncoding_05', 0, async () => {
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

    // @tc.number LegacyEncodingScenario73_Group_06
    // @tc.name LegacyEncodingScenario73_Group_06
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1375.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_Group_06', 0, async () => {
      const input: string[] = ['Ω', 'beta', 'Alpha', 'Ω', ''];
      const expected: string[] = ['', 'Alpha', 'beta', 'Ω', 'Ω'];
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

    // @tc.number LegacyEncodingScenario73_LegacyEncoding_07
    // @tc.name LegacyEncodingScenario73_LegacyEncoding_07
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1376.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_LegacyEncoding_07', 0, async () => {
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

    // @tc.number LegacyEncodingScenario73_LegacyEncoding_08
    // @tc.name LegacyEncodingScenario73_LegacyEncoding_08
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1377.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_LegacyEncoding_08', 0, async () => {
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

    // @tc.number LegacyEncodingScenario73_LegacyEncoding_09
    // @tc.name LegacyEncodingScenario73_LegacyEncoding_09
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1378.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_LegacyEncoding_09', 0, async () => {
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

    // @tc.number LegacyEncodingScenario73_Sendable_10
    // @tc.name LegacyEncodingScenario73_Sendable_10
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1379.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_Sendable_10', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = 2147483647;
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

    // @tc.number LegacyEncodingScenario73_LegacyEncoding_11
    // @tc.name LegacyEncodingScenario73_LegacyEncoding_11
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1380.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_LegacyEncoding_11', 0, async () => {
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

    // @tc.number LegacyEncodingScenario73_Copy_12
    // @tc.name LegacyEncodingScenario73_Copy_12
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1381.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_Copy_12', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_2051');
      try {
        const expected: string = ' \nfile content\nxxxx';
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

    // @tc.number LegacyEncodingScenario73_Group_13
    // @tc.name LegacyEncodingScenario73_Group_13
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1382.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_Group_13', 0, async () => {
      const input: string[] = ['é', 'é', 'é'];
      const expected: string[] = ['é', 'é', 'é'];
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

    // @tc.number LegacyEncodingScenario73_LegacyEncoding_14
    // @tc.name LegacyEncodingScenario73_LegacyEncoding_14
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1383.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_LegacyEncoding_14', 0, async () => {
      const input: string = '中﻿';
      const expected: number[] = [228, 184, 173, 239, 187, 191];
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

    // @tc.number LegacyEncodingScenario73_LegacyEncoding_15
    // @tc.name LegacyEncodingScenario73_LegacyEncoding_15
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1384.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_LegacyEncoding_15', 0, async () => {
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

    // @tc.number LegacyEncodingScenario73_LegacyEncoding_16
    // @tc.name LegacyEncodingScenario73_LegacyEncoding_16
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1385.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_LegacyEncoding_16', 0, async () => {
      const input: string = 'a\u0000b\u0000';
      const expected: number[] = [97, 0, 98, 0];
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

    // @tc.number LegacyEncodingScenario73_LegacyEncoding_17
    // @tc.name LegacyEncodingScenario73_LegacyEncoding_17
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1386.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_LegacyEncoding_17', 0, async () => {
      const input: string = 'a-bé';
      const expected: number[] = [97, 45, 98, 195, 169];
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

    // @tc.number LegacyEncodingScenario73_LegacyEncoding_18
    // @tc.name LegacyEncodingScenario73_LegacyEncoding_18
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1387.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_LegacyEncoding_18', 0, async () => {
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

    // @tc.number LegacyEncodingScenario73_LegacyEncoding_19
    // @tc.name LegacyEncodingScenario73_LegacyEncoding_19
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1388.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_LegacyEncoding_19', 0, async () => {
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

    // @tc.number LegacyEncodingScenario73_Group_20
    // @tc.name LegacyEncodingScenario73_Group_20
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1389.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_Group_20', 0, async () => {
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

    // @tc.number LegacyEncodingScenario73_Sendable_21
    // @tc.name LegacyEncodingScenario73_Sendable_21
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1390.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_Sendable_21', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = -0.5;
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

    // @tc.number LegacyEncodingScenario73_LegacyEncoding_22
    // @tc.name LegacyEncodingScenario73_LegacyEncoding_22
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1391.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_LegacyEncoding_22', 0, async () => {
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

    // @tc.number LegacyEncodingScenario73_LegacyEncoding_23
    // @tc.name LegacyEncodingScenario73_LegacyEncoding_23
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1392.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_LegacyEncoding_23', 0, async () => {
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

    // @tc.number LegacyEncodingScenario73_LegacyEncoding_24
    // @tc.name LegacyEncodingScenario73_LegacyEncoding_24
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1393.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_LegacyEncoding_24', 0, async () => {
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

    // @tc.number LegacyEncodingScenario73_Copy_25
    // @tc.name LegacyEncodingScenario73_Copy_25
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1394.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_Copy_25', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_2064');
      try {
        const expected: string = '\nfile content\nxxxxxxxx';
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

    // @tc.number LegacyEncodingScenario73_LegacyEncoding_26
    // @tc.name LegacyEncodingScenario73_LegacyEncoding_26
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1395.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_LegacyEncoding_26', 0, async () => {
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

    // @tc.number LegacyEncodingScenario73_Group_27
    // @tc.name LegacyEncodingScenario73_Group_27
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1396.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_Group_27', 0, async () => {
      const input: string[] = ['2'];
      const expected: string[] = ['2'];
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

    // @tc.number LegacyEncodingScenario73_LegacyEncoding_28
    // @tc.name LegacyEncodingScenario73_LegacyEncoding_28
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1397.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_LegacyEncoding_28', 0, async () => {
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

    // @tc.number LegacyEncodingScenario73_LegacyEncoding_29
    // @tc.name LegacyEncodingScenario73_LegacyEncoding_29
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1398.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_LegacyEncoding_29', 0, async () => {
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

    // @tc.number LegacyEncodingScenario73_LegacyEncoding_30
    // @tc.name LegacyEncodingScenario73_LegacyEncoding_30
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1399.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_LegacyEncoding_30', 0, async () => {
      const input: string = '中﻿';
      const expected: number[] = [228, 184, 173, 239, 187, 191];
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

    // @tc.number LegacyEncodingScenario73_LegacyEncoding_31
    // @tc.name LegacyEncodingScenario73_LegacyEncoding_31
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1400.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_LegacyEncoding_31', 0, async () => {
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

    // @tc.number LegacyEncodingScenario73_Sendable_32
    // @tc.name LegacyEncodingScenario73_Sendable_32
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1401.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_Sendable_32', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = 0;
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

    // @tc.number LegacyEncodingScenario73_LegacyEncoding_33
    // @tc.name LegacyEncodingScenario73_LegacyEncoding_33
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1402.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_LegacyEncoding_33', 0, async () => {
      const input: string = 'a-bé';
      const expected: number[] = [97, 45, 98, 195, 169];
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

    // @tc.number LegacyEncodingScenario73_Group_34
    // @tc.name LegacyEncodingScenario73_Group_34
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1403.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_Group_34', 0, async () => {
      const input: string[] = ['a_b', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['01', '1', 'A', 'Z', 'a', 'a_b', 'z'];
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

    // @tc.number LegacyEncodingScenario73_LegacyEncoding_35
    // @tc.name LegacyEncodingScenario73_LegacyEncoding_35
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1404.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_LegacyEncoding_35', 0, async () => {
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

    // @tc.number LegacyEncodingScenario73_LegacyEncoding_36
    // @tc.name LegacyEncodingScenario73_LegacyEncoding_36
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1405.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_LegacyEncoding_36', 0, async () => {
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

    // @tc.number LegacyEncodingScenario73_LegacyEncoding_37
    // @tc.name LegacyEncodingScenario73_LegacyEncoding_37
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1406.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_LegacyEncoding_37', 0, async () => {
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

    // @tc.number LegacyEncodingScenario73_Copy_38
    // @tc.name LegacyEncodingScenario73_Copy_38
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1407.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_Copy_38', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_2077');
      try {
        const expected: string = 'Ω\nfile content\nxxx';
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

    // @tc.number LegacyEncodingScenario73_LegacyEncoding_39
    // @tc.name LegacyEncodingScenario73_LegacyEncoding_39
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1408.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_LegacyEncoding_39', 0, async () => {
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

    // @tc.number LegacyEncodingScenario73_LegacyEncoding_40
    // @tc.name LegacyEncodingScenario73_LegacyEncoding_40
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1409.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_LegacyEncoding_40', 0, async () => {
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

    // @tc.number LegacyEncodingScenario73_Group_41
    // @tc.name LegacyEncodingScenario73_Group_41
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1410.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_Group_41', 0, async () => {
      const input: string[] = ['', 'beta', 'Alpha', '', ''];
      const expected: string[] = ['', '', '', 'Alpha', 'beta'];
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

    // @tc.number LegacyEncodingScenario73_LegacyEncoding_42
    // @tc.name LegacyEncodingScenario73_LegacyEncoding_42
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1411.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_LegacyEncoding_42', 0, async () => {
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

    // @tc.number LegacyEncodingScenario73_Sendable_43
    // @tc.name LegacyEncodingScenario73_Sendable_43
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1412.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario73_Sendable_43', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = -2147483648;
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
  });
}
