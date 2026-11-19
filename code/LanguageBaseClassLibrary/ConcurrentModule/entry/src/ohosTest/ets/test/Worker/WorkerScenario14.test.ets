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

// Adapted from ets/test/Interaction/DataBinding.test.ets.
// Real application exports and entrypoints replace TV-only services and models.
export default function WorkerScenario14(): void {
  describe('WorkerScenario14', () => {
    const recorder: shared.OperationRecorder = new shared.OperationRecorder();
    beforeAll(() => {
      hilog.info(0xf811, 'WorkerScenario14', 'Suite started');
    });
    beforeEach(() => {
      recorder.clear();
    });
    afterEach(() => {
      hilog.info(0xf811, 'WorkerScenario14', 'Recorded operations: %{public}d', recorder.count());
    });
    afterAll(() => {
      recorder.clear();
      hilog.info(0xf811, 'WorkerScenario14', 'Suite completed');
    });

    // @tc.number WorkerScenario14_Worker_00
    // @tc.name WorkerScenario14_Worker_00
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 248.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario14_Worker_00', 0, async () => {
      const input: string[] = ['😀', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['01', '1', 'A', 'Z', 'a', 'z', '😀'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeWorkerFunc(input);
      const actualText: string = JSON.stringify(actual);
      const expectedText: string = JSON.stringify(expected);
      expect(actualText).assertEqual(expectedText);
      const inputAfter: string = JSON.stringify(input);
      expect(inputAfter).assertEqual(original);
      const actualLength: number = actual.length;
      const expectedLength: number = expected.length;
      expect(actualLength).assertEqual(expectedLength);
      const ordered: boolean = shared.isNondecreasing(actual);
      expect(ordered).assertTrue();
      const elapsed: number = Date.now() - started;
      recorder.record('sort', elapsed);
    });

    // @tc.number WorkerScenario14_Worker_01
    // @tc.name WorkerScenario14_Worker_01
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 249.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario14_Worker_01', 0, async () => {
      const input: string[] = [];
      const expected: string[] = [];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeWorkerFunc(input);
      const actualText: string = JSON.stringify(actual);
      const expectedText: string = JSON.stringify(expected);
      expect(actualText).assertEqual(expectedText);
      const inputAfter: string = JSON.stringify(input);
      expect(inputAfter).assertEqual(original);
      const actualLength: number = actual.length;
      const expectedLength: number = expected.length;
      expect(actualLength).assertEqual(expectedLength);
      const ordered: boolean = shared.isNondecreasing(actual);
      expect(ordered).assertTrue();
      const elapsed: number = Date.now() - started;
      recorder.record('sort', elapsed);
    });

    // @tc.number WorkerScenario14_Worker_02
    // @tc.name WorkerScenario14_Worker_02
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 250.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario14_Worker_02', 0, async () => {
      const input: string[] = ['a-b', 'beta', 'Alpha', 'a-b', ''];
      const expected: string[] = ['', 'Alpha', 'a-b', 'a-b', 'beta'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeWorkerFunc(input);
      const actualText: string = JSON.stringify(actual);
      const expectedText: string = JSON.stringify(expected);
      expect(actualText).assertEqual(expectedText);
      const inputAfter: string = JSON.stringify(input);
      expect(inputAfter).assertEqual(original);
      const actualLength: number = actual.length;
      const expectedLength: number = expected.length;
      expect(actualLength).assertEqual(expectedLength);
      const ordered: boolean = shared.isNondecreasing(actual);
      expect(ordered).assertTrue();
      const elapsed: number = Date.now() - started;
      recorder.record('sort', elapsed);
    });

    // @tc.number WorkerScenario14_Worker_03
    // @tc.name WorkerScenario14_Worker_03
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 251.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario14_Worker_03', 0, async () => {
      const input: string[] = ['a_b'];
      const expected: string[] = ['a_b'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeWorkerFunc(input);
      const actualText: string = JSON.stringify(actual);
      const expectedText: string = JSON.stringify(expected);
      expect(actualText).assertEqual(expectedText);
      const inputAfter: string = JSON.stringify(input);
      expect(inputAfter).assertEqual(original);
      const actualLength: number = actual.length;
      const expectedLength: number = expected.length;
      expect(actualLength).assertEqual(expectedLength);
      const ordered: boolean = shared.isNondecreasing(actual);
      expect(ordered).assertTrue();
      const elapsed: number = Date.now() - started;
      recorder.record('sort', elapsed);
    });

    // @tc.number WorkerScenario14_Worker_04
    // @tc.name WorkerScenario14_Worker_04
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 252.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario14_Worker_04', 0, async () => {
      const input: string[] = ['\n', '\n', '\n'];
      const expected: string[] = ['\n', '\n', '\n'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeWorkerFunc(input);
      const actualText: string = JSON.stringify(actual);
      const expectedText: string = JSON.stringify(expected);
      expect(actualText).assertEqual(expectedText);
      const inputAfter: string = JSON.stringify(input);
      expect(inputAfter).assertEqual(original);
      const actualLength: number = actual.length;
      const expectedLength: number = expected.length;
      expect(actualLength).assertEqual(expectedLength);
      const ordered: boolean = shared.isNondecreasing(actual);
      expect(ordered).assertTrue();
      const elapsed: number = Date.now() - started;
      recorder.record('sort', elapsed);
    });

    // @tc.number WorkerScenario14_Worker_05
    // @tc.name WorkerScenario14_Worker_05
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 253.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario14_Worker_05', 0, async () => {
      const input: string[] = ['\t', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['\t', '01', '1', 'A', 'Z', 'a', 'z'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeWorkerFunc(input);
      const actualText: string = JSON.stringify(actual);
      const expectedText: string = JSON.stringify(expected);
      expect(actualText).assertEqual(expectedText);
      const inputAfter: string = JSON.stringify(input);
      expect(inputAfter).assertEqual(original);
      const actualLength: number = actual.length;
      const expectedLength: number = expected.length;
      expect(actualLength).assertEqual(expectedLength);
      const ordered: boolean = shared.isNondecreasing(actual);
      expect(ordered).assertTrue();
      const elapsed: number = Date.now() - started;
      recorder.record('sort', elapsed);
    });

    // @tc.number WorkerScenario14_Group_06
    // @tc.name WorkerScenario14_Group_06
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 254.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario14_Group_06', 0, async () => {
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

    // @tc.number WorkerScenario14_Worker_07
    // @tc.name WorkerScenario14_Worker_07
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 255.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario14_Worker_07', 0, async () => {
      const input: string[] = ['Ω', 'beta', 'Alpha', 'Ω', ''];
      const expected: string[] = ['', 'Alpha', 'beta', 'Ω', 'Ω'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeWorkerFunc(input);
      const actualText: string = JSON.stringify(actual);
      const expectedText: string = JSON.stringify(expected);
      expect(actualText).assertEqual(expectedText);
      const inputAfter: string = JSON.stringify(input);
      expect(inputAfter).assertEqual(original);
      const actualLength: number = actual.length;
      const expectedLength: number = expected.length;
      expect(actualLength).assertEqual(expectedLength);
      const ordered: boolean = shared.isNondecreasing(actual);
      expect(ordered).assertTrue();
      const elapsed: number = Date.now() - started;
      recorder.record('sort', elapsed);
    });

    // @tc.number WorkerScenario14_Worker_08
    // @tc.name WorkerScenario14_Worker_08
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 256.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario14_Worker_08', 0, async () => {
      const input: string[] = ['a'];
      const expected: string[] = ['a'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeWorkerFunc(input);
      const actualText: string = JSON.stringify(actual);
      const expectedText: string = JSON.stringify(expected);
      expect(actualText).assertEqual(expectedText);
      const inputAfter: string = JSON.stringify(input);
      expect(inputAfter).assertEqual(original);
      const actualLength: number = actual.length;
      const expectedLength: number = expected.length;
      expect(actualLength).assertEqual(expectedLength);
      const ordered: boolean = shared.isNondecreasing(actual);
      expect(ordered).assertTrue();
      const elapsed: number = Date.now() - started;
      recorder.record('sort', elapsed);
    });

    // @tc.number WorkerScenario14_Worker_09
    // @tc.name WorkerScenario14_Worker_09
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 257.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario14_Worker_09', 0, async () => {
      const input: string[] = ['Z', 'Z', 'Z'];
      const expected: string[] = ['Z', 'Z', 'Z'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeWorkerFunc(input);
      const actualText: string = JSON.stringify(actual);
      const expectedText: string = JSON.stringify(expected);
      expect(actualText).assertEqual(expectedText);
      const inputAfter: string = JSON.stringify(input);
      expect(inputAfter).assertEqual(original);
      const actualLength: number = actual.length;
      const expectedLength: number = expected.length;
      expect(actualLength).assertEqual(expectedLength);
      const ordered: boolean = shared.isNondecreasing(actual);
      expect(ordered).assertTrue();
      const elapsed: number = Date.now() - started;
      recorder.record('sort', elapsed);
    });

    // @tc.number WorkerScenario14_Sendable_10
    // @tc.name WorkerScenario14_Sendable_10
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 258.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario14_Sendable_10', 0, async () => {
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

    // @tc.number WorkerScenario14_Worker_11
    // @tc.name WorkerScenario14_Worker_11
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 259.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario14_Worker_11', 0, async () => {
      const input: string[] = [];
      const expected: string[] = [];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeWorkerFunc(input);
      const actualText: string = JSON.stringify(actual);
      const expectedText: string = JSON.stringify(expected);
      expect(actualText).assertEqual(expectedText);
      const inputAfter: string = JSON.stringify(input);
      expect(inputAfter).assertEqual(original);
      const actualLength: number = actual.length;
      const expectedLength: number = expected.length;
      expect(actualLength).assertEqual(expectedLength);
      const ordered: boolean = shared.isNondecreasing(actual);
      expect(ordered).assertTrue();
      const elapsed: number = Date.now() - started;
      recorder.record('sort', elapsed);
    });

    // @tc.number WorkerScenario14_Copy_12
    // @tc.name WorkerScenario14_Copy_12
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 260.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario14_Copy_12', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_355');
      try {
        const expected: string = '2\nfile content\nxxxxxxxx';
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

    // @tc.number WorkerScenario14_Group_13
    // @tc.name WorkerScenario14_Group_13
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 261.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario14_Group_13', 0, async () => {
      const input: string[] = [' '];
      const expected: string[] = [' '];
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

    // @tc.number WorkerScenario14_Worker_14
    // @tc.name WorkerScenario14_Worker_14
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 262.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario14_Worker_14', 0, async () => {
      const input: string[] = ['é', 'é', 'é'];
      const expected: string[] = ['é', 'é', 'é'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeWorkerFunc(input);
      const actualText: string = JSON.stringify(actual);
      const expectedText: string = JSON.stringify(expected);
      expect(actualText).assertEqual(expectedText);
      const inputAfter: string = JSON.stringify(input);
      expect(inputAfter).assertEqual(original);
      const actualLength: number = actual.length;
      const expectedLength: number = expected.length;
      expect(actualLength).assertEqual(expectedLength);
      const ordered: boolean = shared.isNondecreasing(actual);
      expect(ordered).assertTrue();
      const elapsed: number = Date.now() - started;
      recorder.record('sort', elapsed);
    });

    // @tc.number WorkerScenario14_Worker_15
    // @tc.name WorkerScenario14_Worker_15
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 263.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario14_Worker_15', 0, async () => {
      const input: string[] = ['中', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['01', '1', 'A', 'Z', 'a', 'z', '中'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeWorkerFunc(input);
      const actualText: string = JSON.stringify(actual);
      const expectedText: string = JSON.stringify(expected);
      expect(actualText).assertEqual(expectedText);
      const inputAfter: string = JSON.stringify(input);
      expect(inputAfter).assertEqual(original);
      const actualLength: number = actual.length;
      const expectedLength: number = expected.length;
      expect(actualLength).assertEqual(expectedLength);
      const ordered: boolean = shared.isNondecreasing(actual);
      expect(ordered).assertTrue();
      const elapsed: number = Date.now() - started;
      recorder.record('sort', elapsed);
    });

    // @tc.number WorkerScenario14_Worker_16
    // @tc.name WorkerScenario14_Worker_16
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 264.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario14_Worker_16', 0, async () => {
      const input: string[] = [];
      const expected: string[] = [];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeWorkerFunc(input);
      const actualText: string = JSON.stringify(actual);
      const expectedText: string = JSON.stringify(expected);
      expect(actualText).assertEqual(expectedText);
      const inputAfter: string = JSON.stringify(input);
      expect(inputAfter).assertEqual(original);
      const actualLength: number = actual.length;
      const expectedLength: number = expected.length;
      expect(actualLength).assertEqual(expectedLength);
      const ordered: boolean = shared.isNondecreasing(actual);
      expect(ordered).assertTrue();
      const elapsed: number = Date.now() - started;
      recorder.record('sort', elapsed);
    });

    // @tc.number WorkerScenario14_Worker_17
    // @tc.name WorkerScenario14_Worker_17
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 265.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario14_Worker_17', 0, async () => {
      const input: string[] = ['a\u0000b', 'beta', 'Alpha', 'a\u0000b', ''];
      const expected: string[] = ['', 'Alpha', 'a\u0000b', 'a\u0000b', 'beta'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeWorkerFunc(input);
      const actualText: string = JSON.stringify(actual);
      const expectedText: string = JSON.stringify(expected);
      expect(actualText).assertEqual(expectedText);
      const inputAfter: string = JSON.stringify(input);
      expect(inputAfter).assertEqual(original);
      const actualLength: number = actual.length;
      const expectedLength: number = expected.length;
      expect(actualLength).assertEqual(expectedLength);
      const ordered: boolean = shared.isNondecreasing(actual);
      expect(ordered).assertTrue();
      const elapsed: number = Date.now() - started;
      recorder.record('sort', elapsed);
    });

    // @tc.number WorkerScenario14_Worker_18
    // @tc.name WorkerScenario14_Worker_18
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 266.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario14_Worker_18', 0, async () => {
      const input: string[] = ['a-b'];
      const expected: string[] = ['a-b'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeWorkerFunc(input);
      const actualText: string = JSON.stringify(actual);
      const expectedText: string = JSON.stringify(expected);
      expect(actualText).assertEqual(expectedText);
      const inputAfter: string = JSON.stringify(input);
      expect(inputAfter).assertEqual(original);
      const actualLength: number = actual.length;
      const expectedLength: number = expected.length;
      expect(actualLength).assertEqual(expectedLength);
      const ordered: boolean = shared.isNondecreasing(actual);
      expect(ordered).assertTrue();
      const elapsed: number = Date.now() - started;
      recorder.record('sort', elapsed);
    });

    // @tc.number WorkerScenario14_Worker_19
    // @tc.name WorkerScenario14_Worker_19
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 267.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario14_Worker_19', 0, async () => {
      const input: string[] = ['a_b', 'a_b', 'a_b'];
      const expected: string[] = ['a_b', 'a_b', 'a_b'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeWorkerFunc(input);
      const actualText: string = JSON.stringify(actual);
      const expectedText: string = JSON.stringify(expected);
      expect(actualText).assertEqual(expectedText);
      const inputAfter: string = JSON.stringify(input);
      expect(inputAfter).assertEqual(original);
      const actualLength: number = actual.length;
      const expectedLength: number = expected.length;
      expect(actualLength).assertEqual(expectedLength);
      const ordered: boolean = shared.isNondecreasing(actual);
      expect(ordered).assertTrue();
      const elapsed: number = Date.now() - started;
      recorder.record('sort', elapsed);
    });

    // @tc.number WorkerScenario14_Group_20
    // @tc.name WorkerScenario14_Group_20
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 268.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario14_Group_20', 0, async () => {
      const input: string[] = ['\n', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['\n', '01', '1', 'A', 'Z', 'a', 'z'];
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

    // @tc.number WorkerScenario14_Sendable_21
    // @tc.name WorkerScenario14_Sendable_21
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 269.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario14_Sendable_21', 0, async () => {
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

    // @tc.number WorkerScenario14_Worker_22
    // @tc.name WorkerScenario14_Worker_22
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 270.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario14_Worker_22', 0, async () => {
      const input: string[] = ['ß', 'beta', 'Alpha', 'ß', ''];
      const expected: string[] = ['', 'Alpha', 'beta', 'ß', 'ß'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeWorkerFunc(input);
      const actualText: string = JSON.stringify(actual);
      const expectedText: string = JSON.stringify(expected);
      expect(actualText).assertEqual(expectedText);
      const inputAfter: string = JSON.stringify(input);
      expect(inputAfter).assertEqual(original);
      const actualLength: number = actual.length;
      const expectedLength: number = expected.length;
      expect(actualLength).assertEqual(expectedLength);
      const ordered: boolean = shared.isNondecreasing(actual);
      expect(ordered).assertTrue();
      const elapsed: number = Date.now() - started;
      recorder.record('sort', elapsed);
    });

    // @tc.number WorkerScenario14_Worker_23
    // @tc.name WorkerScenario14_Worker_23
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 271.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario14_Worker_23', 0, async () => {
      const input: string[] = ['Ω'];
      const expected: string[] = ['Ω'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeWorkerFunc(input);
      const actualText: string = JSON.stringify(actual);
      const expectedText: string = JSON.stringify(expected);
      expect(actualText).assertEqual(expectedText);
      const inputAfter: string = JSON.stringify(input);
      expect(inputAfter).assertEqual(original);
      const actualLength: number = actual.length;
      const expectedLength: number = expected.length;
      expect(actualLength).assertEqual(expectedLength);
      const ordered: boolean = shared.isNondecreasing(actual);
      expect(ordered).assertTrue();
      const elapsed: number = Date.now() - started;
      recorder.record('sort', elapsed);
    });
  });
}
