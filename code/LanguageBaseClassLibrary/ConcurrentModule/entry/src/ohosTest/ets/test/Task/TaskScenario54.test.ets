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

// Adapted from ets/test/PowerDialog/PowerOperationCatalog.test.ets.
// Real application exports and entrypoints replace TV-only services and models.
export default function TaskScenario54(): void {
  describe('TaskScenario54', () => {
    const recorder: shared.OperationRecorder = new shared.OperationRecorder();
    beforeAll(() => {
      hilog.info(0xf811, 'TaskScenario54', 'Suite started');
    });
    beforeEach(() => {
      recorder.clear();
    });
    afterEach(() => {
      hilog.info(0xf811, 'TaskScenario54', 'Recorded operations: %{public}d', recorder.count());
    });
    afterAll(() => {
      recorder.clear();
      hilog.info(0xf811, 'TaskScenario54', 'Suite completed');
    });

    // @tc.number TaskScenario54_Task_00
    // @tc.name TaskScenario54_Task_00
    // @tc.desc Verify Task application behavior, isolation and complete observable results for scenario 1008.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Task_00', 0, async () => {
      const input: string[] = ['a', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['01', '1', 'A', 'Z', 'a', 'a', 'z'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, false);
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

    // @tc.number TaskScenario54_Task_01
    // @tc.name TaskScenario54_Task_01
    // @tc.desc Verify Task application behavior, isolation and complete observable results for scenario 1009.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Task_01', 0, async () => {
      const input: string[] = [];
      const expected: string[] = [];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, false);
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

    // @tc.number TaskScenario54_Task_02
    // @tc.name TaskScenario54_Task_02
    // @tc.desc Verify Task application behavior, isolation and complete observable results for scenario 1010.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Task_02', 0, async () => {
      const input: string[] = ['', 'beta', 'Alpha', '', ''];
      const expected: string[] = ['', '', '', 'Alpha', 'beta'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, false);
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

    // @tc.number TaskScenario54_Task_03
    // @tc.name TaskScenario54_Task_03
    // @tc.desc Verify Task application behavior, isolation and complete observable results for scenario 1011.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Task_03', 0, async () => {
      const input: string[] = ['10'];
      const expected: string[] = ['10'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, false);
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

    // @tc.number TaskScenario54_Task_04
    // @tc.name TaskScenario54_Task_04
    // @tc.desc Verify Task application behavior, isolation and complete observable results for scenario 1012.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Task_04', 0, async () => {
      const input: string[] = ['2', '2', '2'];
      const expected: string[] = ['2', '2', '2'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, false);
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

    // @tc.number TaskScenario54_Task_05
    // @tc.name TaskScenario54_Task_05
    // @tc.desc Verify Task application behavior, isolation and complete observable results for scenario 1013.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Task_05', 0, async () => {
      const input: string[] = [' ', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = [' ', '01', '1', 'A', 'Z', 'a', 'z'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, false);
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

    // @tc.number TaskScenario54_Group_06
    // @tc.name TaskScenario54_Group_06
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1014.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Group_06', 0, async () => {
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

    // @tc.number TaskScenario54_Task_07
    // @tc.name TaskScenario54_Task_07
    // @tc.desc Verify Task application behavior, isolation and complete observable results for scenario 1015.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Task_07', 0, async () => {
      const input: string[] = ['中', 'beta', 'Alpha', '中', ''];
      const expected: string[] = ['', 'Alpha', 'beta', '中', '中'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, false);
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

    // @tc.number TaskScenario54_Task_08
    // @tc.name TaskScenario54_Task_08
    // @tc.desc Verify Task application behavior, isolation and complete observable results for scenario 1016.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Task_08', 0, async () => {
      const input: string[] = ['😀'];
      const expected: string[] = ['😀'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, false);
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

    // @tc.number TaskScenario54_Task_09
    // @tc.name TaskScenario54_Task_09
    // @tc.desc Verify Task application behavior, isolation and complete observable results for scenario 1017.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Task_09', 0, async () => {
      const input: string[] = ['a\u0000b', 'a\u0000b', 'a\u0000b'];
      const expected: string[] = ['a\u0000b', 'a\u0000b', 'a\u0000b'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, false);
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

    // @tc.number TaskScenario54_Sendable_10
    // @tc.name TaskScenario54_Sendable_10
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1018.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Sendable_10', 0, async () => {
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

    // @tc.number TaskScenario54_Task_11
    // @tc.name TaskScenario54_Task_11
    // @tc.desc Verify Task application behavior, isolation and complete observable results for scenario 1019.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Task_11', 0, async () => {
      const input: string[] = [];
      const expected: string[] = [];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, false);
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

    // @tc.number TaskScenario54_Copy_12
    // @tc.name TaskScenario54_Copy_12
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1020.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Copy_12', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1487');
      try {
        const expected: string = '\n\nfile content\nxxx';
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

    // @tc.number TaskScenario54_Group_13
    // @tc.name TaskScenario54_Group_13
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1021.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Group_13', 0, async () => {
      const input: string[] = ['\t'];
      const expected: string[] = ['\t'];
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

    // @tc.number TaskScenario54_Task_14
    // @tc.name TaskScenario54_Task_14
    // @tc.desc Verify Task application behavior, isolation and complete observable results for scenario 1022.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Task_14', 0, async () => {
      const input: string[] = ['ß', 'ß', 'ß'];
      const expected: string[] = ['ß', 'ß', 'ß'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, false);
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

    // @tc.number TaskScenario54_Task_15
    // @tc.name TaskScenario54_Task_15
    // @tc.desc Verify Task application behavior, isolation and complete observable results for scenario 1023.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Task_15', 0, async () => {
      const input: string[] = ['Ω', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['01', '1', 'A', 'Z', 'a', 'z', 'Ω'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, false);
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

    // @tc.number TaskScenario54_Task_16
    // @tc.name TaskScenario54_Task_16
    // @tc.desc Verify Task application behavior, isolation and complete observable results for scenario 1024.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Task_16', 0, async () => {
      const input: string[] = [];
      const expected: string[] = [];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, false);
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

    // @tc.number TaskScenario54_Task_17
    // @tc.name TaskScenario54_Task_17
    // @tc.desc Verify Task application behavior, isolation and complete observable results for scenario 1025.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Task_17', 0, async () => {
      const input: string[] = ['Z', 'beta', 'Alpha', 'Z', ''];
      const expected: string[] = ['', 'Alpha', 'Z', 'Z', 'beta'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, false);
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

    // @tc.number TaskScenario54_Task_18
    // @tc.name TaskScenario54_Task_18
    // @tc.desc Verify Task application behavior, isolation and complete observable results for scenario 1026.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Task_18', 0, async () => {
      const input: string[] = [''];
      const expected: string[] = [''];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, false);
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

    // @tc.number TaskScenario54_Task_19
    // @tc.name TaskScenario54_Task_19
    // @tc.desc Verify Task application behavior, isolation and complete observable results for scenario 1027.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Task_19', 0, async () => {
      const input: string[] = ['10', '10', '10'];
      const expected: string[] = ['10', '10', '10'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, false);
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

    // @tc.number TaskScenario54_Group_20
    // @tc.name TaskScenario54_Group_20
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1028.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Group_20', 0, async () => {
      const input: string[] = ['2', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['01', '1', '2', 'A', 'Z', 'a', 'z'];
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

    // @tc.number TaskScenario54_Sendable_21
    // @tc.name TaskScenario54_Sendable_21
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1029.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Sendable_21', 0, async () => {
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

    // @tc.number TaskScenario54_Task_22
    // @tc.name TaskScenario54_Task_22
    // @tc.desc Verify Task application behavior, isolation and complete observable results for scenario 1030.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Task_22', 0, async () => {
      const input: string[] = ['é', 'beta', 'Alpha', 'é', ''];
      const expected: string[] = ['', 'Alpha', 'beta', 'é', 'é'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, false);
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

    // @tc.number TaskScenario54_Task_23
    // @tc.name TaskScenario54_Task_23
    // @tc.desc Verify Task application behavior, isolation and complete observable results for scenario 1031.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Task_23', 0, async () => {
      const input: string[] = ['中'];
      const expected: string[] = ['中'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, false);
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

    // @tc.number TaskScenario54_Task_24
    // @tc.name TaskScenario54_Task_24
    // @tc.desc Verify Task application behavior, isolation and complete observable results for scenario 1032.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Task_24', 0, async () => {
      const input: string[] = ['😀', '😀', '😀'];
      const expected: string[] = ['😀', '😀', '😀'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, false);
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

    // @tc.number TaskScenario54_Copy_25
    // @tc.name TaskScenario54_Copy_25
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1033.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Copy_25', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1500');
      try {
        const expected: string = 'a\u0000b\nfile content\nxxxxxxx';
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

    // @tc.number TaskScenario54_Task_26
    // @tc.name TaskScenario54_Task_26
    // @tc.desc Verify Task application behavior, isolation and complete observable results for scenario 1034.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Task_26', 0, async () => {
      const input: string[] = [];
      const expected: string[] = [];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, false);
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

    // @tc.number TaskScenario54_Group_27
    // @tc.name TaskScenario54_Group_27
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1035.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Group_27', 0, async () => {
      const input: string[] = ['a_b', 'beta', 'Alpha', 'a_b', ''];
      const expected: string[] = ['', 'Alpha', 'a_b', 'a_b', 'beta'];
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

    // @tc.number TaskScenario54_Task_28
    // @tc.name TaskScenario54_Task_28
    // @tc.desc Verify Task application behavior, isolation and complete observable results for scenario 1036.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Task_28', 0, async () => {
      const input: string[] = ['\n'];
      const expected: string[] = ['\n'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, false);
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

    // @tc.number TaskScenario54_Task_29
    // @tc.name TaskScenario54_Task_29
    // @tc.desc Verify Task application behavior, isolation and complete observable results for scenario 1037.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Task_29', 0, async () => {
      const input: string[] = ['\t', '\t', '\t'];
      const expected: string[] = ['\t', '\t', '\t'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, false);
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

    // @tc.number TaskScenario54_Task_30
    // @tc.name TaskScenario54_Task_30
    // @tc.desc Verify Task application behavior, isolation and complete observable results for scenario 1038.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Task_30', 0, async () => {
      const input: string[] = ['ß', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['01', '1', 'A', 'Z', 'a', 'z', 'ß'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, false);
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

    // @tc.number TaskScenario54_Task_31
    // @tc.name TaskScenario54_Task_31
    // @tc.desc Verify Task application behavior, isolation and complete observable results for scenario 1039.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Task_31', 0, async () => {
      const input: string[] = [];
      const expected: string[] = [];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, false);
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

    // @tc.number TaskScenario54_Sendable_32
    // @tc.name TaskScenario54_Sendable_32
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1040.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Sendable_32', 0, async () => {
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

    // @tc.number TaskScenario54_Task_33
    // @tc.name TaskScenario54_Task_33
    // @tc.desc Verify Task application behavior, isolation and complete observable results for scenario 1041.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Task_33', 0, async () => {
      const input: string[] = ['Z'];
      const expected: string[] = ['Z'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, false);
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

    // @tc.number TaskScenario54_Group_34
    // @tc.name TaskScenario54_Group_34
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1042.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Group_34', 0, async () => {
      const input: string[] = ['', '', ''];
      const expected: string[] = ['', '', ''];
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

    // @tc.number TaskScenario54_Task_35
    // @tc.name TaskScenario54_Task_35
    // @tc.desc Verify Task application behavior, isolation and complete observable results for scenario 1043.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Task_35', 0, async () => {
      const input: string[] = ['10', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['01', '1', '10', 'A', 'Z', 'a', 'z'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, false);
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

    // @tc.number TaskScenario54_Task_36
    // @tc.name TaskScenario54_Task_36
    // @tc.desc Verify Task application behavior, isolation and complete observable results for scenario 1044.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Task_36', 0, async () => {
      const input: string[] = [];
      const expected: string[] = [];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, false);
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

    // @tc.number TaskScenario54_Task_37
    // @tc.name TaskScenario54_Task_37
    // @tc.desc Verify Task application behavior, isolation and complete observable results for scenario 1045.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('TaskScenario54_Task_37', 0, async () => {
      const input: string[] = [' ', 'beta', 'Alpha', ' ', ''];
      const expected: string[] = ['', ' ', ' ', 'Alpha', 'beta'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, false);
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
