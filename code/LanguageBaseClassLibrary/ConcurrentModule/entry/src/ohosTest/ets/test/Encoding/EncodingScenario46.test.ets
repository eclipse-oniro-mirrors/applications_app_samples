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

// Adapted from ets/test/PowerDialog/PowerDialogLifecycle.test.ets.
// Real application exports and entrypoints replace TV-only services and models.
export default function EncodingScenario46(): void {
  describe('EncodingScenario46', () => {
    const recorder: shared.OperationRecorder = new shared.OperationRecorder();
    beforeAll(() => {
      hilog.info(0xf811, 'EncodingScenario46', 'Suite started');
    });
    beforeEach(() => {
      recorder.clear();
    });
    afterEach(() => {
      hilog.info(0xf811, 'EncodingScenario46', 'Recorded operations: %{public}d', recorder.count());
    });
    afterAll(() => {
      recorder.clear();
      hilog.info(0xf811, 'EncodingScenario46', 'Suite completed');
    });

    // @tc.number EncodingScenario46_Encoding_00
    // @tc.name EncodingScenario46_Encoding_00
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 856.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario46_Encoding_00', 0, async () => {
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

    // @tc.number EncodingScenario46_Encoding_01
    // @tc.name EncodingScenario46_Encoding_01
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 857.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario46_Encoding_01', 0, async () => {
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

    // @tc.number EncodingScenario46_Encoding_02
    // @tc.name EncodingScenario46_Encoding_02
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 858.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario46_Encoding_02', 0, async () => {
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

    // @tc.number EncodingScenario46_Encoding_03
    // @tc.name EncodingScenario46_Encoding_03
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 859.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario46_Encoding_03', 0, async () => {
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

    // @tc.number EncodingScenario46_Encoding_04
    // @tc.name EncodingScenario46_Encoding_04
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 860.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario46_Encoding_04', 0, async () => {
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

    // @tc.number EncodingScenario46_Encoding_05
    // @tc.name EncodingScenario46_Encoding_05
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 861.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario46_Encoding_05', 0, async () => {
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

    // @tc.number EncodingScenario46_Group_06
    // @tc.name EncodingScenario46_Group_06
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 862.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario46_Group_06', 0, async () => {
      const input: string[] = ['ß', 'ß', 'ß'];
      const expected: string[] = ['ß', 'ß', 'ß'];
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

    // @tc.number EncodingScenario46_Encoding_07
    // @tc.name EncodingScenario46_Encoding_07
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 863.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario46_Encoding_07', 0, async () => {
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

    // @tc.number EncodingScenario46_Encoding_08
    // @tc.name EncodingScenario46_Encoding_08
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 864.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario46_Encoding_08', 0, async () => {
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

    // @tc.number EncodingScenario46_Encoding_09
    // @tc.name EncodingScenario46_Encoding_09
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 865.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario46_Encoding_09', 0, async () => {
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

    // @tc.number EncodingScenario46_Sendable_10
    // @tc.name EncodingScenario46_Sendable_10
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 866.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario46_Sendable_10', 0, async () => {
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

    // @tc.number EncodingScenario46_Encoding_11
    // @tc.name EncodingScenario46_Encoding_11
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 867.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario46_Encoding_11', 0, async () => {
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

    // @tc.number EncodingScenario46_Copy_12
    // @tc.name EncodingScenario46_Copy_12
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 868.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario46_Copy_12', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1249');
      try {
        const expected: string = '2\nfile content\nxxxx';
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

    // @tc.number EncodingScenario46_Group_13
    // @tc.name EncodingScenario46_Group_13
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 869.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario46_Group_13', 0, async () => {
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

    // @tc.number EncodingScenario46_Encoding_14
    // @tc.name EncodingScenario46_Encoding_14
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 870.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario46_Encoding_14', 0, async () => {
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

    // @tc.number EncodingScenario46_Encoding_15
    // @tc.name EncodingScenario46_Encoding_15
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 871.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario46_Encoding_15', 0, async () => {
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

    // @tc.number EncodingScenario46_Encoding_16
    // @tc.name EncodingScenario46_Encoding_16
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 872.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario46_Encoding_16', 0, async () => {
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

    // @tc.number EncodingScenario46_Encoding_17
    // @tc.name EncodingScenario46_Encoding_17
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 873.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario46_Encoding_17', 0, async () => {
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

    // @tc.number EncodingScenario46_Encoding_18
    // @tc.name EncodingScenario46_Encoding_18
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 874.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario46_Encoding_18', 0, async () => {
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

    // @tc.number EncodingScenario46_Encoding_19
    // @tc.name EncodingScenario46_Encoding_19
    // @tc.desc Verify Encoding application behavior, isolation and complete observable results for scenario 875.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario46_Encoding_19', 0, async () => {
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

    // @tc.number EncodingScenario46_Group_20
    // @tc.name EncodingScenario46_Group_20
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 876.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario46_Group_20', 0, async () => {
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

    // @tc.number EncodingScenario46_Sendable_21
    // @tc.name EncodingScenario46_Sendable_21
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 877.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('EncodingScenario46_Sendable_21', 0, async () => {
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
  });
}
