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

// Adapted from ets/test/Integration/ComprehensiveRegression.test.ets.
// Real application exports and entrypoints replace TV-only services and models.
export default function FunctionScenario03(): void {
  describe('FunctionScenario03', () => {
    const recorder: shared.OperationRecorder = new shared.OperationRecorder();
    beforeAll(() => {
      hilog.info(0xf811, 'FunctionScenario03', 'Suite started');
    });
    beforeEach(() => {
      recorder.clear();
    });
    afterEach(() => {
      hilog.info(0xf811, 'FunctionScenario03', 'Recorded operations: %{public}d', recorder.count());
    });
    afterAll(() => {
      recorder.clear();
      hilog.info(0xf811, 'FunctionScenario03', 'Suite completed');
    });

    // @tc.number FunctionScenario03_Function_00
    // @tc.name FunctionScenario03_Function_00
    // @tc.desc Verify Function application behavior, isolation and complete observable results for scenario 39.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('FunctionScenario03_Function_00', 0, async () => {
      const input: string[] = [];
      const expected: string[] = [];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, true);
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

    // @tc.number FunctionScenario03_Function_01
    // @tc.name FunctionScenario03_Function_01
    // @tc.desc Verify Function application behavior, isolation and complete observable results for scenario 40.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('FunctionScenario03_Function_01', 0, async () => {
      const input: string[] = ['😀', 'beta', 'Alpha', '😀', ''];
      const expected: string[] = ['', 'Alpha', 'beta', '😀', '😀'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, true);
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

    // @tc.number FunctionScenario03_Function_02
    // @tc.name FunctionScenario03_Function_02
    // @tc.desc Verify Function application behavior, isolation and complete observable results for scenario 41.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('FunctionScenario03_Function_02', 0, async () => {
      const input: string[] = ['a\u0000b'];
      const expected: string[] = ['a\u0000b'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, true);
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

    // @tc.number FunctionScenario03_Function_03
    // @tc.name FunctionScenario03_Function_03
    // @tc.desc Verify Function application behavior, isolation and complete observable results for scenario 42.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('FunctionScenario03_Function_03', 0, async () => {
      const input: string[] = ['a-b', 'a-b', 'a-b'];
      const expected: string[] = ['a-b', 'a-b', 'a-b'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, true);
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

    // @tc.number FunctionScenario03_Function_04
    // @tc.name FunctionScenario03_Function_04
    // @tc.desc Verify Function application behavior, isolation and complete observable results for scenario 43.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('FunctionScenario03_Function_04', 0, async () => {
      const input: string[] = ['a_b', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['01', '1', 'A', 'Z', 'a', 'a_b', 'z'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, true);
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

    // @tc.number FunctionScenario03_Function_05
    // @tc.name FunctionScenario03_Function_05
    // @tc.desc Verify Function application behavior, isolation and complete observable results for scenario 44.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('FunctionScenario03_Function_05', 0, async () => {
      const input: string[] = [];
      const expected: string[] = [];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, true);
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

    // @tc.number FunctionScenario03_Group_06
    // @tc.name FunctionScenario03_Group_06
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 45.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('FunctionScenario03_Group_06', 0, async () => {
      const input: string[] = ['\t', 'beta', 'Alpha', '\t', ''];
      const expected: string[] = ['', '\t', '\t', 'Alpha', 'beta'];
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

    // @tc.number FunctionScenario03_Function_07
    // @tc.name FunctionScenario03_Function_07
    // @tc.desc Verify Function application behavior, isolation and complete observable results for scenario 46.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('FunctionScenario03_Function_07', 0, async () => {
      const input: string[] = ['ß'];
      const expected: string[] = ['ß'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, true);
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

    // @tc.number FunctionScenario03_Function_08
    // @tc.name FunctionScenario03_Function_08
    // @tc.desc Verify Function application behavior, isolation and complete observable results for scenario 47.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('FunctionScenario03_Function_08', 0, async () => {
      const input: string[] = ['Ω', 'Ω', 'Ω'];
      const expected: string[] = ['Ω', 'Ω', 'Ω'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, true);
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

    // @tc.number FunctionScenario03_Function_09
    // @tc.name FunctionScenario03_Function_09
    // @tc.desc Verify Function application behavior, isolation and complete observable results for scenario 48.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('FunctionScenario03_Function_09', 0, async () => {
      const input: string[] = ['a', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['01', '1', 'A', 'Z', 'a', 'a', 'z'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, true);
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

    // @tc.number FunctionScenario03_Sendable_10
    // @tc.name FunctionScenario03_Sendable_10
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 49.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('FunctionScenario03_Sendable_10', 0, async () => {
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

    // @tc.number FunctionScenario03_Function_11
    // @tc.name FunctionScenario03_Function_11
    // @tc.desc Verify Function application behavior, isolation and complete observable results for scenario 50.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('FunctionScenario03_Function_11', 0, async () => {
      const input: string[] = ['', 'beta', 'Alpha', '', ''];
      const expected: string[] = ['', '', '', 'Alpha', 'beta'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, true);
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

    // @tc.number FunctionScenario03_Copy_12
    // @tc.name FunctionScenario03_Copy_12
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 51.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('FunctionScenario03_Copy_12', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_61');
      try {
        const expected: string = '10\nfile content\nxxxxxx';
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

    // @tc.number FunctionScenario03_Group_13
    // @tc.name FunctionScenario03_Group_13
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 52.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('FunctionScenario03_Group_13', 0, async () => {
      const input: string[] = ['2', '2', '2'];
      const expected: string[] = ['2', '2', '2'];
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

    // @tc.number FunctionScenario03_Function_14
    // @tc.name FunctionScenario03_Function_14
    // @tc.desc Verify Function application behavior, isolation and complete observable results for scenario 53.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('FunctionScenario03_Function_14', 0, async () => {
      const input: string[] = [' ', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = [' ', '01', '1', 'A', 'Z', 'a', 'z'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, true);
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

    // @tc.number FunctionScenario03_Function_15
    // @tc.name FunctionScenario03_Function_15
    // @tc.desc Verify Function application behavior, isolation and complete observable results for scenario 54.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('FunctionScenario03_Function_15', 0, async () => {
      const input: string[] = [];
      const expected: string[] = [];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, true);
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

    // @tc.number FunctionScenario03_Function_16
    // @tc.name FunctionScenario03_Function_16
    // @tc.desc Verify Function application behavior, isolation and complete observable results for scenario 55.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('FunctionScenario03_Function_16', 0, async () => {
      const input: string[] = ['中', 'beta', 'Alpha', '中', ''];
      const expected: string[] = ['', 'Alpha', 'beta', '中', '中'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, true);
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

    // @tc.number FunctionScenario03_Function_17
    // @tc.name FunctionScenario03_Function_17
    // @tc.desc Verify Function application behavior, isolation and complete observable results for scenario 56.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('FunctionScenario03_Function_17', 0, async () => {
      const input: string[] = ['😀'];
      const expected: string[] = ['😀'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, true);
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

    // @tc.number FunctionScenario03_Function_18
    // @tc.name FunctionScenario03_Function_18
    // @tc.desc Verify Function application behavior, isolation and complete observable results for scenario 57.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('FunctionScenario03_Function_18', 0, async () => {
      const input: string[] = ['a\u0000b', 'a\u0000b', 'a\u0000b'];
      const expected: string[] = ['a\u0000b', 'a\u0000b', 'a\u0000b'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, true);
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

    // @tc.number FunctionScenario03_Function_19
    // @tc.name FunctionScenario03_Function_19
    // @tc.desc Verify Function application behavior, isolation and complete observable results for scenario 58.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('FunctionScenario03_Function_19', 0, async () => {
      const input: string[] = ['a-b', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['01', '1', 'A', 'Z', 'a', 'a-b', 'z'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, true);
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

    // @tc.number FunctionScenario03_Group_20
    // @tc.name FunctionScenario03_Group_20
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 59.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('FunctionScenario03_Group_20', 0, async () => {
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

    // @tc.number FunctionScenario03_Sendable_21
    // @tc.name FunctionScenario03_Sendable_21
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 60.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('FunctionScenario03_Sendable_21', 0, async () => {
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

    // @tc.number FunctionScenario03_Function_22
    // @tc.name FunctionScenario03_Function_22
    // @tc.desc Verify Function application behavior, isolation and complete observable results for scenario 61.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('FunctionScenario03_Function_22', 0, async () => {
      const input: string[] = ['\t'];
      const expected: string[] = ['\t'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, true);
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

    // @tc.number FunctionScenario03_Function_23
    // @tc.name FunctionScenario03_Function_23
    // @tc.desc Verify Function application behavior, isolation and complete observable results for scenario 62.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('FunctionScenario03_Function_23', 0, async () => {
      const input: string[] = ['ß', 'ß', 'ß'];
      const expected: string[] = ['ß', 'ß', 'ß'];
      const original: string = JSON.stringify(input);
      const started: number = Date.now();
      const actual: string[] = await shared.executeTask(input, true);
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
