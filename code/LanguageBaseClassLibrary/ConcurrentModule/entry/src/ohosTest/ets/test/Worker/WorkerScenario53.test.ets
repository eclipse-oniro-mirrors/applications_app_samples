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

// Adapted from ets/test/PowerDialog/PowerModelDeep.test.ets.
// Real application exports and entrypoints replace TV-only services and models.
export default function WorkerScenario53(): void {
  describe('WorkerScenario53', () => {
    const recorder: shared.OperationRecorder = new shared.OperationRecorder();
    beforeAll(() => {
      hilog.info(0xf811, 'WorkerScenario53', 'Suite started');
    });
    beforeEach(() => {
      recorder.clear();
    });
    afterEach(() => {
      hilog.info(0xf811, 'WorkerScenario53', 'Recorded operations: %{public}d', recorder.count());
    });
    afterAll(() => {
      recorder.clear();
      hilog.info(0xf811, 'WorkerScenario53', 'Suite completed');
    });

    // @tc.number WorkerScenario53_Worker_00
    // @tc.name WorkerScenario53_Worker_00
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 989.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Worker_00', 0, async () => {
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

    // @tc.number WorkerScenario53_Worker_01
    // @tc.name WorkerScenario53_Worker_01
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 990.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Worker_01', 0, async () => {
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

    // @tc.number WorkerScenario53_Worker_02
    // @tc.name WorkerScenario53_Worker_02
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 991.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Worker_02', 0, async () => {
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

    // @tc.number WorkerScenario53_Worker_03
    // @tc.name WorkerScenario53_Worker_03
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 992.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Worker_03', 0, async () => {
      const input: string[] = ['a', 'a', 'a'];
      const expected: string[] = ['a', 'a', 'a'];
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

    // @tc.number WorkerScenario53_Worker_04
    // @tc.name WorkerScenario53_Worker_04
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 993.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Worker_04', 0, async () => {
      const input: string[] = ['Z', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['01', '1', 'A', 'Z', 'Z', 'a', 'z'];
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

    // @tc.number WorkerScenario53_Worker_05
    // @tc.name WorkerScenario53_Worker_05
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 994.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Worker_05', 0, async () => {
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

    // @tc.number WorkerScenario53_Group_06
    // @tc.name WorkerScenario53_Group_06
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 995.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Group_06', 0, async () => {
      const input: string[] = ['10', 'beta', 'Alpha', '10', ''];
      const expected: string[] = ['', '10', '10', 'Alpha', 'beta'];
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

    // @tc.number WorkerScenario53_Worker_07
    // @tc.name WorkerScenario53_Worker_07
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 996.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Worker_07', 0, async () => {
      const input: string[] = ['2'];
      const expected: string[] = ['2'];
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

    // @tc.number WorkerScenario53_Worker_08
    // @tc.name WorkerScenario53_Worker_08
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 997.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Worker_08', 0, async () => {
      const input: string[] = [' ', ' ', ' '];
      const expected: string[] = [' ', ' ', ' '];
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

    // @tc.number WorkerScenario53_Worker_09
    // @tc.name WorkerScenario53_Worker_09
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 998.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Worker_09', 0, async () => {
      const input: string[] = ['é', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['01', '1', 'A', 'Z', 'a', 'z', 'é'];
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

    // @tc.number WorkerScenario53_Sendable_10
    // @tc.name WorkerScenario53_Sendable_10
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 999.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Sendable_10', 0, async () => {
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

    // @tc.number WorkerScenario53_Worker_11
    // @tc.name WorkerScenario53_Worker_11
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 1000.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Worker_11', 0, async () => {
      const input: string[] = ['😀', 'beta', 'Alpha', '😀', ''];
      const expected: string[] = ['', 'Alpha', 'beta', '😀', '😀'];
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

    // @tc.number WorkerScenario53_Copy_12
    // @tc.name WorkerScenario53_Copy_12
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1001.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Copy_12', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1448');
      try {
        const expected: string = 'a\u0000b\nfile content\nxx';
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

    // @tc.number WorkerScenario53_Group_13
    // @tc.name WorkerScenario53_Group_13
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1002.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Group_13', 0, async () => {
      const input: string[] = ['a-b', 'a-b', 'a-b'];
      const expected: string[] = ['a-b', 'a-b', 'a-b'];
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

    // @tc.number WorkerScenario53_Worker_14
    // @tc.name WorkerScenario53_Worker_14
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 1003.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Worker_14', 0, async () => {
      const input: string[] = ['a_b', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['01', '1', 'A', 'Z', 'a', 'a_b', 'z'];
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

    // @tc.number WorkerScenario53_Worker_15
    // @tc.name WorkerScenario53_Worker_15
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 1004.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Worker_15', 0, async () => {
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

    // @tc.number WorkerScenario53_Worker_16
    // @tc.name WorkerScenario53_Worker_16
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 1005.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Worker_16', 0, async () => {
      const input: string[] = ['\t', 'beta', 'Alpha', '\t', ''];
      const expected: string[] = ['', '\t', '\t', 'Alpha', 'beta'];
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

    // @tc.number WorkerScenario53_Worker_17
    // @tc.name WorkerScenario53_Worker_17
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 1006.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Worker_17', 0, async () => {
      const input: string[] = ['ß'];
      const expected: string[] = ['ß'];
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

    // @tc.number WorkerScenario53_Worker_18
    // @tc.name WorkerScenario53_Worker_18
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 1007.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Worker_18', 0, async () => {
      const input: string[] = ['Ω', 'Ω', 'Ω'];
      const expected: string[] = ['Ω', 'Ω', 'Ω'];
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

    // @tc.number WorkerScenario53_Worker_19
    // @tc.name WorkerScenario53_Worker_19
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 1008.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Worker_19', 0, async () => {
      const input: string[] = ['a', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['01', '1', 'A', 'Z', 'a', 'a', 'z'];
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

    // @tc.number WorkerScenario53_Group_20
    // @tc.name WorkerScenario53_Group_20
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1009.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Group_20', 0, async () => {
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

    // @tc.number WorkerScenario53_Sendable_21
    // @tc.name WorkerScenario53_Sendable_21
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1010.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Sendable_21', 0, async () => {
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

    // @tc.number WorkerScenario53_Worker_22
    // @tc.name WorkerScenario53_Worker_22
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 1011.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Worker_22', 0, async () => {
      const input: string[] = ['10'];
      const expected: string[] = ['10'];
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

    // @tc.number WorkerScenario53_Worker_23
    // @tc.name WorkerScenario53_Worker_23
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 1012.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Worker_23', 0, async () => {
      const input: string[] = ['2', '2', '2'];
      const expected: string[] = ['2', '2', '2'];
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

    // @tc.number WorkerScenario53_Worker_24
    // @tc.name WorkerScenario53_Worker_24
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 1013.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Worker_24', 0, async () => {
      const input: string[] = [' ', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = [' ', '01', '1', 'A', 'Z', 'a', 'z'];
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

    // @tc.number WorkerScenario53_Copy_25
    // @tc.name WorkerScenario53_Copy_25
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1014.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Copy_25', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1461');
      try {
        const expected: string = 'é\nfile content\nxxxxxx';
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

    // @tc.number WorkerScenario53_Worker_26
    // @tc.name WorkerScenario53_Worker_26
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 1015.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Worker_26', 0, async () => {
      const input: string[] = ['中', 'beta', 'Alpha', '中', ''];
      const expected: string[] = ['', 'Alpha', 'beta', '中', '中'];
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

    // @tc.number WorkerScenario53_Group_27
    // @tc.name WorkerScenario53_Group_27
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1016.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Group_27', 0, async () => {
      const input: string[] = ['😀'];
      const expected: string[] = ['😀'];
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

    // @tc.number WorkerScenario53_Worker_28
    // @tc.name WorkerScenario53_Worker_28
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 1017.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Worker_28', 0, async () => {
      const input: string[] = ['a\u0000b', 'a\u0000b', 'a\u0000b'];
      const expected: string[] = ['a\u0000b', 'a\u0000b', 'a\u0000b'];
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

    // @tc.number WorkerScenario53_Worker_29
    // @tc.name WorkerScenario53_Worker_29
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 1018.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Worker_29', 0, async () => {
      const input: string[] = ['a-b', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['01', '1', 'A', 'Z', 'a', 'a-b', 'z'];
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

    // @tc.number WorkerScenario53_Worker_30
    // @tc.name WorkerScenario53_Worker_30
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 1019.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Worker_30', 0, async () => {
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

    // @tc.number WorkerScenario53_Worker_31
    // @tc.name WorkerScenario53_Worker_31
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 1020.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Worker_31', 0, async () => {
      const input: string[] = ['\n', 'beta', 'Alpha', '\n', ''];
      const expected: string[] = ['', '\n', '\n', 'Alpha', 'beta'];
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

    // @tc.number WorkerScenario53_Sendable_32
    // @tc.name WorkerScenario53_Sendable_32
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1021.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Sendable_32', 0, async () => {
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

    // @tc.number WorkerScenario53_Worker_33
    // @tc.name WorkerScenario53_Worker_33
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 1022.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Worker_33', 0, async () => {
      const input: string[] = ['ß', 'ß', 'ß'];
      const expected: string[] = ['ß', 'ß', 'ß'];
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

    // @tc.number WorkerScenario53_Group_34
    // @tc.name WorkerScenario53_Group_34
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1023.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Group_34', 0, async () => {
      const input: string[] = ['Ω', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['01', '1', 'A', 'Z', 'a', 'z', 'Ω'];
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

    // @tc.number WorkerScenario53_Worker_35
    // @tc.name WorkerScenario53_Worker_35
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 1024.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Worker_35', 0, async () => {
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

    // @tc.number WorkerScenario53_Worker_36
    // @tc.name WorkerScenario53_Worker_36
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 1025.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Worker_36', 0, async () => {
      const input: string[] = ['Z', 'beta', 'Alpha', 'Z', ''];
      const expected: string[] = ['', 'Alpha', 'Z', 'Z', 'beta'];
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

    // @tc.number WorkerScenario53_Worker_37
    // @tc.name WorkerScenario53_Worker_37
    // @tc.desc Verify Worker application behavior, isolation and complete observable results for scenario 1026.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Worker_37', 0, async () => {
      const input: string[] = [''];
      const expected: string[] = [''];
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

    // @tc.number WorkerScenario53_Copy_38
    // @tc.name WorkerScenario53_Copy_38
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1027.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('WorkerScenario53_Copy_38', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1474');
      try {
        const expected: string = '10\nfile content\nx';
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
