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

// Adapted from ets/test/LifecycleState/ExtensionLifecycle.test.ets.
// Real application exports and entrypoints replace TV-only services and models.
export default function GroupScenario30(): void {
  describe('GroupScenario30', () => {
    const recorder: shared.OperationRecorder = new shared.OperationRecorder();
    beforeAll(() => {
      hilog.info(0xf811, 'GroupScenario30', 'Suite started');
    });
    beforeEach(() => {
      recorder.clear();
    });
    afterEach(() => {
      hilog.info(0xf811, 'GroupScenario30', 'Recorded operations: %{public}d', recorder.count());
    });
    afterAll(() => {
      recorder.clear();
      hilog.info(0xf811, 'GroupScenario30', 'Suite completed');
    });

    // @tc.number GroupScenario30_Group_00
    // @tc.name GroupScenario30_Group_00
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 552.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario30_Group_00', 0, async () => {
      const input: string[] = ['😀', '😀', '😀'];
      const expected: string[] = ['😀', '😀', '😀'];
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

    // @tc.number GroupScenario30_Group_01
    // @tc.name GroupScenario30_Group_01
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 553.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario30_Group_01', 0, async () => {
      const input: string[] = ['a\u0000b', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['01', '1', 'A', 'Z', 'a', 'a\u0000b', 'z'];
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

    // @tc.number GroupScenario30_Group_02
    // @tc.name GroupScenario30_Group_02
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 554.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario30_Group_02', 0, async () => {
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

    // @tc.number GroupScenario30_Group_03
    // @tc.name GroupScenario30_Group_03
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 555.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario30_Group_03', 0, async () => {
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

    // @tc.number GroupScenario30_Group_04
    // @tc.name GroupScenario30_Group_04
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 556.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario30_Group_04', 0, async () => {
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

    // @tc.number GroupScenario30_Group_05
    // @tc.name GroupScenario30_Group_05
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 557.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario30_Group_05', 0, async () => {
      const input: string[] = ['\t', '\t', '\t'];
      const expected: string[] = ['\t', '\t', '\t'];
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

    // @tc.number GroupScenario30_Group_06
    // @tc.name GroupScenario30_Group_06
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 558.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario30_Group_06', 0, async () => {
      const input: string[] = ['ß', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['01', '1', 'A', 'Z', 'a', 'z', 'ß'];
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

    // @tc.number GroupScenario30_Group_07
    // @tc.name GroupScenario30_Group_07
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 559.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario30_Group_07', 0, async () => {
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

    // @tc.number GroupScenario30_Group_08
    // @tc.name GroupScenario30_Group_08
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 560.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario30_Group_08', 0, async () => {
      const input: string[] = ['a', 'beta', 'Alpha', 'a', ''];
      const expected: string[] = ['', 'Alpha', 'a', 'a', 'beta'];
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

    // @tc.number GroupScenario30_Group_09
    // @tc.name GroupScenario30_Group_09
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 561.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario30_Group_09', 0, async () => {
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

    // @tc.number GroupScenario30_Sendable_10
    // @tc.name GroupScenario30_Sendable_10
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 562.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario30_Sendable_10', 0, async () => {
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

    // @tc.number GroupScenario30_Group_11
    // @tc.name GroupScenario30_Group_11
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 563.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario30_Group_11', 0, async () => {
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

    // @tc.number GroupScenario30_Copy_12
    // @tc.name GroupScenario30_Copy_12
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 564.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario30_Copy_12', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_840');
      try {
        const expected: string = '2\nfile content\nxxxxxx';
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

    // @tc.number GroupScenario30_Group_13
    // @tc.name GroupScenario30_Group_13
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 565.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario30_Group_13', 0, async () => {
      const input: string[] = [' ', 'beta', 'Alpha', ' ', ''];
      const expected: string[] = ['', ' ', ' ', 'Alpha', 'beta'];
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

    // @tc.number GroupScenario30_Group_14
    // @tc.name GroupScenario30_Group_14
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 566.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario30_Group_14', 0, async () => {
      const input: string[] = ['é'];
      const expected: string[] = ['é'];
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

    // @tc.number GroupScenario30_Group_15
    // @tc.name GroupScenario30_Group_15
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 567.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario30_Group_15', 0, async () => {
      const input: string[] = ['中', '中', '中'];
      const expected: string[] = ['中', '中', '中'];
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

    // @tc.number GroupScenario30_Group_16
    // @tc.name GroupScenario30_Group_16
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 568.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario30_Group_16', 0, async () => {
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

    // @tc.number GroupScenario30_Group_17
    // @tc.name GroupScenario30_Group_17
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 569.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario30_Group_17', 0, async () => {
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

    // @tc.number GroupScenario30_Group_18
    // @tc.name GroupScenario30_Group_18
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 570.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario30_Group_18', 0, async () => {
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

    // @tc.number GroupScenario30_Group_19
    // @tc.name GroupScenario30_Group_19
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 571.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario30_Group_19', 0, async () => {
      const input: string[] = ['a_b'];
      const expected: string[] = ['a_b'];
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

    // @tc.number GroupScenario30_Group_20
    // @tc.name GroupScenario30_Group_20
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 572.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario30_Group_20', 0, async () => {
      const input: string[] = ['\n', '\n', '\n'];
      const expected: string[] = ['\n', '\n', '\n'];
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

    // @tc.number GroupScenario30_Sendable_21
    // @tc.name GroupScenario30_Sendable_21
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 573.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario30_Sendable_21', 0, async () => {
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

    // @tc.number GroupScenario30_Group_22
    // @tc.name GroupScenario30_Group_22
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 574.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario30_Group_22', 0, async () => {
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

    // @tc.number GroupScenario30_Group_23
    // @tc.name GroupScenario30_Group_23
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 575.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario30_Group_23', 0, async () => {
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

    // @tc.number GroupScenario30_Group_24
    // @tc.name GroupScenario30_Group_24
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 576.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario30_Group_24', 0, async () => {
      const input: string[] = ['a'];
      const expected: string[] = ['a'];
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
  });
}
