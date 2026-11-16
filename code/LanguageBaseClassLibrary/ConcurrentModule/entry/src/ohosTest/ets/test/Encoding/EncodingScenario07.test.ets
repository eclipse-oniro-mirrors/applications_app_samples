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

// Adapted from ets/test/Integration/NetworkConnectivity.test.ets.
// Real application exports and entrypoints replace TV-only services and models.
export default function EncodingScenario07(): void {
  describe('EncodingScenario07', () => {
    const recorder: shared.OperationRecorder = new shared.OperationRecorder();
    beforeAll(() => {
      hilog.info(0xf811, 'EncodingScenario07', 'Suite started');
    });
    beforeEach(() => {
      recorder.clear();
    });
    afterEach(() => {
      hilog.info(0xf811, 'EncodingScenario07', 'Recorded operations: %{public}d', recorder.count());
    });
    afterAll(() => {
      recorder.clear();
      hilog.info(0xf811, 'EncodingScenario07', 'Suite completed');
    });

    // @tc.number EncodingScenario07_Encoding_00
    // @tc.name EncodingScenario07_Encoding_00
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 115.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario07_Encoding_00', 0, async () => {
      const input: string = '10中文';
      const expected: number[] = [49, 48, 228, 184, 173, 230, 150, 135];
      const actual: Uint8Array = shared.stringToBuffer(input);
      const bytes: number[] = [];
      for (let index: number = 0; index < actual.length; index++) {
        bytes.push(actual[index]);
      }
      const buffer: ArrayBuffer = new ArrayBuffer(bytes.length);
      const view: DataView = new DataView(buffer);
      for (let index: number = 0; index < bytes.length; index++) {
        view.setUint8(index, bytes[index]);
      }
      const decoded: string = shared.bufferToString(buffer);
      expect(decoded).assertEqual(input);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number EncodingScenario07_Encoding_01
    // @tc.name EncodingScenario07_Encoding_01
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 116.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario07_Encoding_01', 0, async () => {
      const input: string = '2😀';
      const expected: number[] = [50, 240, 159, 152, 128];
      const actual: Uint8Array = shared.stringToBuffer(input);
      const bytes: number[] = [];
      for (let index: number = 0; index < actual.length; index++) {
        bytes.push(actual[index]);
      }
      const buffer: ArrayBuffer = new ArrayBuffer(bytes.length);
      const view: DataView = new DataView(buffer);
      for (let index: number = 0; index < bytes.length; index++) {
        view.setUint8(index, bytes[index]);
      }
      const decoded: string = shared.bufferToString(buffer);
      expect(decoded).assertEqual(input);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number EncodingScenario07_Encoding_02
    // @tc.name EncodingScenario07_Encoding_02
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 117.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario07_Encoding_02', 0, async () => {
      const input: string = ' ';
      const expected: number[] = [32];
      const actual: Uint8Array = shared.stringToBuffer(input);
      const bytes: number[] = [];
      for (let index: number = 0; index < actual.length; index++) {
        bytes.push(actual[index]);
      }
      const buffer: ArrayBuffer = new ArrayBuffer(bytes.length);
      const view: DataView = new DataView(buffer);
      for (let index: number = 0; index < bytes.length; index++) {
        view.setUint8(index, bytes[index]);
      }
      const decoded: string = shared.bufferToString(buffer);
      expect(decoded).assertEqual(input);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number EncodingScenario07_Encoding_03
    // @tc.name EncodingScenario07_Encoding_03
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 118.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario07_Encoding_03', 0, async () => {
      const input: string = 'éASCII';
      const expected: number[] = [195, 169, 65, 83, 67, 73, 73];
      const actual: Uint8Array = shared.stringToBuffer(input);
      const bytes: number[] = [];
      for (let index: number = 0; index < actual.length; index++) {
        bytes.push(actual[index]);
      }
      const buffer: ArrayBuffer = new ArrayBuffer(bytes.length);
      const view: DataView = new DataView(buffer);
      for (let index: number = 0; index < bytes.length; index++) {
        view.setUint8(index, bytes[index]);
      }
      const decoded: string = shared.bufferToString(buffer);
      expect(decoded).assertEqual(input);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number EncodingScenario07_Encoding_04
    // @tc.name EncodingScenario07_Encoding_04
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 119.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario07_Encoding_04', 0, async () => {
      const input: string = '中﻿';
      const expected: number[] = [228, 184, 173, 239, 187, 191];
      const actual: Uint8Array = shared.stringToBuffer(input);
      const bytes: number[] = [];
      for (let index: number = 0; index < actual.length; index++) {
        bytes.push(actual[index]);
      }
      const buffer: ArrayBuffer = new ArrayBuffer(bytes.length);
      const view: DataView = new DataView(buffer);
      for (let index: number = 0; index < bytes.length; index++) {
        view.setUint8(index, bytes[index]);
      }
      const decoded: string = shared.bufferToString(buffer);
      expect(decoded).assertEqual(input);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number EncodingScenario07_Encoding_05
    // @tc.name EncodingScenario07_Encoding_05
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 120.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario07_Encoding_05', 0, async () => {
      const input: string = '😀\r\n';
      const expected: number[] = [240, 159, 152, 128, 13, 10];
      const actual: Uint8Array = shared.stringToBuffer(input);
      const bytes: number[] = [];
      for (let index: number = 0; index < actual.length; index++) {
        bytes.push(actual[index]);
      }
      const buffer: ArrayBuffer = new ArrayBuffer(bytes.length);
      const view: DataView = new DataView(buffer);
      for (let index: number = 0; index < bytes.length; index++) {
        view.setUint8(index, bytes[index]);
      }
      const decoded: string = shared.bufferToString(buffer);
      expect(decoded).assertEqual(input);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number EncodingScenario07_Group_06
    // @tc.name EncodingScenario07_Group_06
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 121.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario07_Group_06', 0, async () => {
      const input: string[] = ['a\u0000b'];
      const expected: string[] = ['a\u0000b'];
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

    // @tc.number EncodingScenario07_Encoding_07
    // @tc.name EncodingScenario07_Encoding_07
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 122.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario07_Encoding_07', 0, async () => {
      const input: string = 'a-bé';
      const expected: number[] = [97, 45, 98, 195, 169];
      const actual: Uint8Array = shared.stringToBuffer(input);
      const bytes: number[] = [];
      for (let index: number = 0; index < actual.length; index++) {
        bytes.push(actual[index]);
      }
      const buffer: ArrayBuffer = new ArrayBuffer(bytes.length);
      const view: DataView = new DataView(buffer);
      for (let index: number = 0; index < bytes.length; index++) {
        view.setUint8(index, bytes[index]);
      }
      const decoded: string = shared.bufferToString(buffer);
      expect(decoded).assertEqual(input);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number EncodingScenario07_Encoding_08
    // @tc.name EncodingScenario07_Encoding_08
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 123.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario07_Encoding_08', 0, async () => {
      const input: string = 'a_b中文';
      const expected: number[] = [97, 95, 98, 228, 184, 173, 230, 150, 135];
      const actual: Uint8Array = shared.stringToBuffer(input);
      const bytes: number[] = [];
      for (let index: number = 0; index < actual.length; index++) {
        bytes.push(actual[index]);
      }
      const buffer: ArrayBuffer = new ArrayBuffer(bytes.length);
      const view: DataView = new DataView(buffer);
      for (let index: number = 0; index < bytes.length; index++) {
        view.setUint8(index, bytes[index]);
      }
      const decoded: string = shared.bufferToString(buffer);
      expect(decoded).assertEqual(input);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number EncodingScenario07_Encoding_09
    // @tc.name EncodingScenario07_Encoding_09
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 124.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario07_Encoding_09', 0, async () => {
      const input: string = '\n😀';
      const expected: number[] = [10, 240, 159, 152, 128];
      const actual: Uint8Array = shared.stringToBuffer(input);
      const bytes: number[] = [];
      for (let index: number = 0; index < actual.length; index++) {
        bytes.push(actual[index]);
      }
      const buffer: ArrayBuffer = new ArrayBuffer(bytes.length);
      const view: DataView = new DataView(buffer);
      for (let index: number = 0; index < bytes.length; index++) {
        view.setUint8(index, bytes[index]);
      }
      const decoded: string = shared.bufferToString(buffer);
      expect(decoded).assertEqual(input);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number EncodingScenario07_Sendable_10
    // @tc.name EncodingScenario07_Sendable_10
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 125.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario07_Sendable_10', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = 0.5;
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

    // @tc.number EncodingScenario07_Encoding_11
    // @tc.name EncodingScenario07_Encoding_11
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 126.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario07_Encoding_11', 0, async () => {
      const input: string = 'ßASCII';
      const expected: number[] = [195, 159, 65, 83, 67, 73, 73];
      const actual: Uint8Array = shared.stringToBuffer(input);
      const bytes: number[] = [];
      for (let index: number = 0; index < actual.length; index++) {
        bytes.push(actual[index]);
      }
      const buffer: ArrayBuffer = new ArrayBuffer(bytes.length);
      const view: DataView = new DataView(buffer);
      for (let index: number = 0; index < bytes.length; index++) {
        view.setUint8(index, bytes[index]);
      }
      const decoded: string = shared.bufferToString(buffer);
      expect(decoded).assertEqual(input);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number EncodingScenario07_Copy_12
    // @tc.name EncodingScenario07_Copy_12
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 127.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario07_Copy_12', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_154');
      try {
        const expected: string = 'Ω\nfile content\nx';
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

    // @tc.number EncodingScenario07_Group_13
    // @tc.name EncodingScenario07_Group_13
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 128.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario07_Group_13', 0, async () => {
      const input: string[] = ['a', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['01', '1', 'A', 'Z', 'a', 'a', 'z'];
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

    // @tc.number EncodingScenario07_Encoding_14
    // @tc.name EncodingScenario07_Encoding_14
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 129.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario07_Encoding_14', 0, async () => {
      const input: string = 'Z\u0000';
      const expected: number[] = [90, 0];
      const actual: Uint8Array = shared.stringToBuffer(input);
      const bytes: number[] = [];
      for (let index: number = 0; index < actual.length; index++) {
        bytes.push(actual[index]);
      }
      const buffer: ArrayBuffer = new ArrayBuffer(bytes.length);
      const view: DataView = new DataView(buffer);
      for (let index: number = 0; index < bytes.length; index++) {
        view.setUint8(index, bytes[index]);
      }
      const decoded: string = shared.bufferToString(buffer);
      expect(decoded).assertEqual(input);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number EncodingScenario07_Encoding_15
    // @tc.name EncodingScenario07_Encoding_15
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 130.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario07_Encoding_15', 0, async () => {
      const input: string = 'é';
      const expected: number[] = [195, 169];
      const actual: Uint8Array = shared.stringToBuffer(input);
      const bytes: number[] = [];
      for (let index: number = 0; index < actual.length; index++) {
        bytes.push(actual[index]);
      }
      const buffer: ArrayBuffer = new ArrayBuffer(bytes.length);
      const view: DataView = new DataView(buffer);
      for (let index: number = 0; index < bytes.length; index++) {
        view.setUint8(index, bytes[index]);
      }
      const decoded: string = shared.bufferToString(buffer);
      expect(decoded).assertEqual(input);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number EncodingScenario07_Encoding_16
    // @tc.name EncodingScenario07_Encoding_16
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 131.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario07_Encoding_16', 0, async () => {
      const input: string = '10中文';
      const expected: number[] = [49, 48, 228, 184, 173, 230, 150, 135];
      const actual: Uint8Array = shared.stringToBuffer(input);
      const bytes: number[] = [];
      for (let index: number = 0; index < actual.length; index++) {
        bytes.push(actual[index]);
      }
      const buffer: ArrayBuffer = new ArrayBuffer(bytes.length);
      const view: DataView = new DataView(buffer);
      for (let index: number = 0; index < bytes.length; index++) {
        view.setUint8(index, bytes[index]);
      }
      const decoded: string = shared.bufferToString(buffer);
      expect(decoded).assertEqual(input);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number EncodingScenario07_Encoding_17
    // @tc.name EncodingScenario07_Encoding_17
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 132.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario07_Encoding_17', 0, async () => {
      const input: string = '2😀';
      const expected: number[] = [50, 240, 159, 152, 128];
      const actual: Uint8Array = shared.stringToBuffer(input);
      const bytes: number[] = [];
      for (let index: number = 0; index < actual.length; index++) {
        bytes.push(actual[index]);
      }
      const buffer: ArrayBuffer = new ArrayBuffer(bytes.length);
      const view: DataView = new DataView(buffer);
      for (let index: number = 0; index < bytes.length; index++) {
        view.setUint8(index, bytes[index]);
      }
      const decoded: string = shared.bufferToString(buffer);
      expect(decoded).assertEqual(input);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number EncodingScenario07_Encoding_18
    // @tc.name EncodingScenario07_Encoding_18
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 133.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario07_Encoding_18', 0, async () => {
      const input: string = ' ';
      const expected: number[] = [32];
      const actual: Uint8Array = shared.stringToBuffer(input);
      const bytes: number[] = [];
      for (let index: number = 0; index < actual.length; index++) {
        bytes.push(actual[index]);
      }
      const buffer: ArrayBuffer = new ArrayBuffer(bytes.length);
      const view: DataView = new DataView(buffer);
      for (let index: number = 0; index < bytes.length; index++) {
        view.setUint8(index, bytes[index]);
      }
      const decoded: string = shared.bufferToString(buffer);
      expect(decoded).assertEqual(input);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number EncodingScenario07_Encoding_19
    // @tc.name EncodingScenario07_Encoding_19
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 134.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario07_Encoding_19', 0, async () => {
      const input: string = 'éASCII';
      const expected: number[] = [195, 169, 65, 83, 67, 73, 73];
      const actual: Uint8Array = shared.stringToBuffer(input);
      const bytes: number[] = [];
      for (let index: number = 0; index < actual.length; index++) {
        bytes.push(actual[index]);
      }
      const buffer: ArrayBuffer = new ArrayBuffer(bytes.length);
      const view: DataView = new DataView(buffer);
      for (let index: number = 0; index < bytes.length; index++) {
        view.setUint8(index, bytes[index]);
      }
      const decoded: string = shared.bufferToString(buffer);
      expect(decoded).assertEqual(input);
      const actualBytes: string = JSON.stringify(bytes);
      const expectedBytes: string = JSON.stringify(expected);
      expect(actualBytes).assertEqual(expectedBytes);
      const size: number = bytes.length;
      const expectedSize: number = expected.length;
      expect(size).assertEqual(expectedSize);
    });

    // @tc.number EncodingScenario07_Group_20
    // @tc.name EncodingScenario07_Group_20
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 135.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario07_Group_20', 0, async () => {
      const input: string[] = ['中', 'beta', 'Alpha', '中', ''];
      const expected: string[] = ['', 'Alpha', 'beta', '中', '中'];
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

    // @tc.number EncodingScenario07_Sendable_21
    // @tc.name EncodingScenario07_Sendable_21
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 136.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario07_Sendable_21', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = -1;
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
