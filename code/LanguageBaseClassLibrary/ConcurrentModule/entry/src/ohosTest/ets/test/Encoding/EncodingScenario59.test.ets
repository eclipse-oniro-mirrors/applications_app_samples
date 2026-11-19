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

// Adapted from ets/test/PowerValidation/PowerAuthSession.test.ets.
// Real application exports and entrypoints replace TV-only services and models.
export default function EncodingScenario59(): void {
  describe('EncodingScenario59', () => {
    const recorder: shared.OperationRecorder = new shared.OperationRecorder();
    beforeAll(() => {
      hilog.info(0xf811, 'EncodingScenario59', 'Suite started');
    });
    beforeEach(() => {
      recorder.clear();
    });
    afterEach(() => {
      hilog.info(0xf811, 'EncodingScenario59', 'Recorded operations: %{public}d', recorder.count());
    });
    afterAll(() => {
      recorder.clear();
      hilog.info(0xf811, 'EncodingScenario59', 'Suite completed');
    });

    // @tc.number EncodingScenario59_Encoding_00
    // @tc.name EncodingScenario59_Encoding_00
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 1103.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario59_Encoding_00', 0, async () => {
      const input: string = 'Ω﻿';
      const expected: number[] = [206, 169, 239, 187, 191];
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

    // @tc.number EncodingScenario59_Encoding_01
    // @tc.name EncodingScenario59_Encoding_01
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 1104.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario59_Encoding_01', 0, async () => {
      const input: string = 'a\r\n';
      const expected: number[] = [97, 13, 10];
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

    // @tc.number EncodingScenario59_Encoding_02
    // @tc.name EncodingScenario59_Encoding_02
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 1105.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario59_Encoding_02', 0, async () => {
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

    // @tc.number EncodingScenario59_Encoding_03
    // @tc.name EncodingScenario59_Encoding_03
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 1106.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario59_Encoding_03', 0, async () => {
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

    // @tc.number EncodingScenario59_Encoding_04
    // @tc.name EncodingScenario59_Encoding_04
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 1107.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario59_Encoding_04', 0, async () => {
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

    // @tc.number EncodingScenario59_Encoding_05
    // @tc.name EncodingScenario59_Encoding_05
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 1108.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario59_Encoding_05', 0, async () => {
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

    // @tc.number EncodingScenario59_Group_06
    // @tc.name EncodingScenario59_Group_06
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1109.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario59_Group_06', 0, async () => {
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

    // @tc.number EncodingScenario59_Encoding_07
    // @tc.name EncodingScenario59_Encoding_07
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 1110.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario59_Encoding_07', 0, async () => {
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

    // @tc.number EncodingScenario59_Encoding_08
    // @tc.name EncodingScenario59_Encoding_08
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 1111.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario59_Encoding_08', 0, async () => {
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

    // @tc.number EncodingScenario59_Encoding_09
    // @tc.name EncodingScenario59_Encoding_09
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 1112.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario59_Encoding_09', 0, async () => {
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

    // @tc.number EncodingScenario59_Sendable_10
    // @tc.name EncodingScenario59_Sendable_10
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1113.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario59_Sendable_10', 0, async () => {
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

    // @tc.number EncodingScenario59_Encoding_11
    // @tc.name EncodingScenario59_Encoding_11
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 1114.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario59_Encoding_11', 0, async () => {
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

    // @tc.number EncodingScenario59_Copy_12
    // @tc.name EncodingScenario59_Copy_12
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1115.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario59_Copy_12', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1640');
      try {
        const expected: string = 'a_b\nfile content\nxxxxxxxx';
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

    // @tc.number EncodingScenario59_Group_13
    // @tc.name EncodingScenario59_Group_13
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1116.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario59_Group_13', 0, async () => {
      const input: string[] = ['\n'];
      const expected: string[] = ['\n'];
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

    // @tc.number EncodingScenario59_Encoding_14
    // @tc.name EncodingScenario59_Encoding_14
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 1117.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario59_Encoding_14', 0, async () => {
      const input: string = '\t';
      const expected: number[] = [9];
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

    // @tc.number EncodingScenario59_Encoding_15
    // @tc.name EncodingScenario59_Encoding_15
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 1118.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario59_Encoding_15', 0, async () => {
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

    // @tc.number EncodingScenario59_Encoding_16
    // @tc.name EncodingScenario59_Encoding_16
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 1119.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario59_Encoding_16', 0, async () => {
      const input: string = 'Ω﻿';
      const expected: number[] = [206, 169, 239, 187, 191];
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

    // @tc.number EncodingScenario59_Encoding_17
    // @tc.name EncodingScenario59_Encoding_17
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 1120.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario59_Encoding_17', 0, async () => {
      const input: string = 'a\r\n';
      const expected: number[] = [97, 13, 10];
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

    // @tc.number EncodingScenario59_Encoding_18
    // @tc.name EncodingScenario59_Encoding_18
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 1121.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario59_Encoding_18', 0, async () => {
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

    // @tc.number EncodingScenario59_Encoding_19
    // @tc.name EncodingScenario59_Encoding_19
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 1122.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario59_Encoding_19', 0, async () => {
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

    // @tc.number EncodingScenario59_Group_20
    // @tc.name EncodingScenario59_Group_20
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1123.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario59_Group_20', 0, async () => {
      const input: string[] = ['10', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['01', '1', '10', 'A', 'Z', 'a', 'z'];
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

    // @tc.number EncodingScenario59_Sendable_21
    // @tc.name EncodingScenario59_Sendable_21
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1124.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario59_Sendable_21', 0, async () => {
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

    // @tc.number EncodingScenario59_Encoding_22
    // @tc.name EncodingScenario59_Encoding_22
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 1125.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario59_Encoding_22', 0, async () => {
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

    // @tc.number EncodingScenario59_Encoding_23
    // @tc.name EncodingScenario59_Encoding_23
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 1126.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario59_Encoding_23', 0, async () => {
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

    // @tc.number EncodingScenario59_Encoding_24
    // @tc.name EncodingScenario59_Encoding_24
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 1127.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario59_Encoding_24', 0, async () => {
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

    // @tc.number EncodingScenario59_Copy_25
    // @tc.name EncodingScenario59_Copy_25
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1128.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario59_Copy_25', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1653');
      try {
        const expected: string = '😀\nfile content\nxxx';
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

    // @tc.number EncodingScenario59_Encoding_26
    // @tc.name EncodingScenario59_Encoding_26
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 1129.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario59_Encoding_26', 0, async () => {
      const input: string = 'a\u0000b\u0000';
      const expected: number[] = [97, 0, 98, 0];
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

    // @tc.number EncodingScenario59_Group_27
    // @tc.name EncodingScenario59_Group_27
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1130.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario59_Group_27', 0, async () => {
      const input: string[] = ['a-b', 'beta', 'Alpha', 'a-b', ''];
      const expected: string[] = ['', 'Alpha', 'a-b', 'a-b', 'beta'];
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

    // @tc.number EncodingScenario59_Encoding_28
    // @tc.name EncodingScenario59_Encoding_28
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 1131.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario59_Encoding_28', 0, async () => {
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
  });
}
