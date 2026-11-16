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

// Adapted from ets/test/PowerValidation/PowerDataSourceValidation.test.ets.
// Real application exports and entrypoints replace TV-only services and models.
export default function LegacyEncodingScenario60(): void {
  describe('LegacyEncodingScenario60', () => {
    const recorder: shared.OperationRecorder = new shared.OperationRecorder();
    beforeAll(() => {
      hilog.info(0xf811, 'LegacyEncodingScenario60', 'Suite started');
    });
    beforeEach(() => {
      recorder.clear();
    });
    afterEach(() => {
      hilog.info(0xf811, 'LegacyEncodingScenario60', 'Recorded operations: %{public}d', recorder.count());
    });
    afterAll(() => {
      recorder.clear();
      hilog.info(0xf811, 'LegacyEncodingScenario60', 'Suite completed');
    });

    // @tc.number LegacyEncodingScenario60_LegacyEncoding_00
    // @tc.name LegacyEncodingScenario60_LegacyEncoding_00
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1122.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario60_LegacyEncoding_00', 0, async () => {
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

    // @tc.number LegacyEncodingScenario60_LegacyEncoding_01
    // @tc.name LegacyEncodingScenario60_LegacyEncoding_01
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1123.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario60_LegacyEncoding_01', 0, async () => {
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

    // @tc.number LegacyEncodingScenario60_LegacyEncoding_02
    // @tc.name LegacyEncodingScenario60_LegacyEncoding_02
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1124.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario60_LegacyEncoding_02', 0, async () => {
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

    // @tc.number LegacyEncodingScenario60_LegacyEncoding_03
    // @tc.name LegacyEncodingScenario60_LegacyEncoding_03
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1125.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario60_LegacyEncoding_03', 0, async () => {
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

    // @tc.number LegacyEncodingScenario60_LegacyEncoding_04
    // @tc.name LegacyEncodingScenario60_LegacyEncoding_04
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1126.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario60_LegacyEncoding_04', 0, async () => {
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

    // @tc.number LegacyEncodingScenario60_LegacyEncoding_05
    // @tc.name LegacyEncodingScenario60_LegacyEncoding_05
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1127.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario60_LegacyEncoding_05', 0, async () => {
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

    // @tc.number LegacyEncodingScenario60_Group_06
    // @tc.name LegacyEncodingScenario60_Group_06
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1128.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario60_Group_06', 0, async () => {
      const input: string[] = ['😀', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['01', '1', 'A', 'Z', 'a', 'z', '😀'];
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

    // @tc.number LegacyEncodingScenario60_LegacyEncoding_07
    // @tc.name LegacyEncodingScenario60_LegacyEncoding_07
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1129.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario60_LegacyEncoding_07', 0, async () => {
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

    // @tc.number LegacyEncodingScenario60_LegacyEncoding_08
    // @tc.name LegacyEncodingScenario60_LegacyEncoding_08
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1130.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario60_LegacyEncoding_08', 0, async () => {
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

    // @tc.number LegacyEncodingScenario60_LegacyEncoding_09
    // @tc.name LegacyEncodingScenario60_LegacyEncoding_09
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1131.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario60_LegacyEncoding_09', 0, async () => {
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

    // @tc.number LegacyEncodingScenario60_Sendable_10
    // @tc.name LegacyEncodingScenario60_Sendable_10
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1132.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario60_Sendable_10', 0, async () => {
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

    // @tc.number LegacyEncodingScenario60_LegacyEncoding_11
    // @tc.name LegacyEncodingScenario60_LegacyEncoding_11
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1133.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario60_LegacyEncoding_11', 0, async () => {
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

    // @tc.number LegacyEncodingScenario60_Copy_12
    // @tc.name LegacyEncodingScenario60_Copy_12
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1134.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario60_Copy_12', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1669');
      try {
        const expected: string = 'ß\nfile content\n';
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

    // @tc.number LegacyEncodingScenario60_Group_13
    // @tc.name LegacyEncodingScenario60_Group_13
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1135.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario60_Group_13', 0, async () => {
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

    // @tc.number LegacyEncodingScenario60_LegacyEncoding_14
    // @tc.name LegacyEncodingScenario60_LegacyEncoding_14
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1136.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario60_LegacyEncoding_14', 0, async () => {
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

    // @tc.number LegacyEncodingScenario60_LegacyEncoding_15
    // @tc.name LegacyEncodingScenario60_LegacyEncoding_15
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1137.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario60_LegacyEncoding_15', 0, async () => {
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

    // @tc.number LegacyEncodingScenario60_LegacyEncoding_16
    // @tc.name LegacyEncodingScenario60_LegacyEncoding_16
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1138.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario60_LegacyEncoding_16', 0, async () => {
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

    // @tc.number LegacyEncodingScenario60_LegacyEncoding_17
    // @tc.name LegacyEncodingScenario60_LegacyEncoding_17
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1139.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario60_LegacyEncoding_17', 0, async () => {
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

    // @tc.number LegacyEncodingScenario60_LegacyEncoding_18
    // @tc.name LegacyEncodingScenario60_LegacyEncoding_18
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1140.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario60_LegacyEncoding_18', 0, async () => {
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

    // @tc.number LegacyEncodingScenario60_LegacyEncoding_19
    // @tc.name LegacyEncodingScenario60_LegacyEncoding_19
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1141.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario60_LegacyEncoding_19', 0, async () => {
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

    // @tc.number LegacyEncodingScenario60_Group_20
    // @tc.name LegacyEncodingScenario60_Group_20
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1142.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario60_Group_20', 0, async () => {
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

    // @tc.number LegacyEncodingScenario60_Sendable_21
    // @tc.name LegacyEncodingScenario60_Sendable_21
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1143.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario60_Sendable_21', 0, async () => {
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

    // @tc.number LegacyEncodingScenario60_LegacyEncoding_22
    // @tc.name LegacyEncodingScenario60_LegacyEncoding_22
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1144.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario60_LegacyEncoding_22', 0, async () => {
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

    // @tc.number LegacyEncodingScenario60_LegacyEncoding_23
    // @tc.name LegacyEncodingScenario60_LegacyEncoding_23
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1145.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario60_LegacyEncoding_23', 0, async () => {
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

    // @tc.number LegacyEncodingScenario60_LegacyEncoding_24
    // @tc.name LegacyEncodingScenario60_LegacyEncoding_24
    // @tc.desc Verify LegacyEncoding application behavior, isolation and complete observable results for scenario 1146.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario60_LegacyEncoding_24', 0, async () => {
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

    // @tc.number LegacyEncodingScenario60_Copy_25
    // @tc.name LegacyEncodingScenario60_Copy_25
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1147.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('LegacyEncodingScenario60_Copy_25', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1682');
      try {
        const expected: string = 'a_b\nfile content\nxxxx';
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
