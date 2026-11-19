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

// Adapted from ets/test/Interaction/EventPropagation.test.ets.
// Real application exports and entrypoints replace TV-only services and models.
export default function GroupScenario17(): void {
  describe('GroupScenario17', () => {
    const recorder: shared.OperationRecorder = new shared.OperationRecorder();
    beforeAll(() => {
      hilog.info(0xf811, 'GroupScenario17', 'Suite started');
    });
    beforeEach(() => {
      recorder.clear();
    });
    afterEach(() => {
      hilog.info(0xf811, 'GroupScenario17', 'Recorded operations: %{public}d', recorder.count());
    });
    afterAll(() => {
      recorder.clear();
      hilog.info(0xf811, 'GroupScenario17', 'Suite completed');
    });

    // @tc.number GroupScenario17_Group_00
    // @tc.name GroupScenario17_Group_00
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 305.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario17_Group_00', 0, async () => {
      const input: string[] = ['Z', 'beta', 'Alpha', 'Z', ''];
      const expected: string[] = ['', 'Alpha', 'Z', 'Z', 'beta'];
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

    // @tc.number GroupScenario17_Group_01
    // @tc.name GroupScenario17_Group_01
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 306.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario17_Group_01', 0, async () => {
      const input: string[] = [''];
      const expected: string[] = [''];
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

    // @tc.number GroupScenario17_Group_02
    // @tc.name GroupScenario17_Group_02
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 307.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario17_Group_02', 0, async () => {
      const input: string[] = ['10', '10', '10'];
      const expected: string[] = ['10', '10', '10'];
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

    // @tc.number GroupScenario17_Group_03
    // @tc.name GroupScenario17_Group_03
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 308.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario17_Group_03', 0, async () => {
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

    // @tc.number GroupScenario17_Group_04
    // @tc.name GroupScenario17_Group_04
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 309.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario17_Group_04', 0, async () => {
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

    // @tc.number GroupScenario17_Group_05
    // @tc.name GroupScenario17_Group_05
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 310.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario17_Group_05', 0, async () => {
      const input: string[] = ['é', 'beta', 'Alpha', 'é', ''];
      const expected: string[] = ['', 'Alpha', 'beta', 'é', 'é'];
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

    // @tc.number GroupScenario17_Group_06
    // @tc.name GroupScenario17_Group_06
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 311.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario17_Group_06', 0, async () => {
      const input: string[] = ['中'];
      const expected: string[] = ['中'];
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

    // @tc.number GroupScenario17_Group_07
    // @tc.name GroupScenario17_Group_07
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 312.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario17_Group_07', 0, async () => {
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

    // @tc.number GroupScenario17_Group_08
    // @tc.name GroupScenario17_Group_08
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 313.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario17_Group_08', 0, async () => {
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

    // @tc.number GroupScenario17_Group_09
    // @tc.name GroupScenario17_Group_09
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 314.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario17_Group_09', 0, async () => {
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

    // @tc.number GroupScenario17_Sendable_10
    // @tc.name GroupScenario17_Sendable_10
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 315.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario17_Sendable_10', 0, async () => {
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

    // @tc.number GroupScenario17_Group_11
    // @tc.name GroupScenario17_Group_11
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 316.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario17_Group_11', 0, async () => {
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

    // @tc.number GroupScenario17_Copy_12
    // @tc.name GroupScenario17_Copy_12
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 317.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario17_Copy_12', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_435');
      try {
        const expected: string = '\t\nfile content\nxx';
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

    // @tc.number GroupScenario17_Group_13
    // @tc.name GroupScenario17_Group_13
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 318.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario17_Group_13', 0, async () => {
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

    // @tc.number GroupScenario17_Group_14
    // @tc.name GroupScenario17_Group_14
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 319.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario17_Group_14', 0, async () => {
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

    // @tc.number GroupScenario17_Group_15
    // @tc.name GroupScenario17_Group_15
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 320.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario17_Group_15', 0, async () => {
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

    // @tc.number GroupScenario17_Group_16
    // @tc.name GroupScenario17_Group_16
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 321.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario17_Group_16', 0, async () => {
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

    // @tc.number GroupScenario17_Group_17
    // @tc.name GroupScenario17_Group_17
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 322.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario17_Group_17', 0, async () => {
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

    // @tc.number GroupScenario17_Group_18
    // @tc.name GroupScenario17_Group_18
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 323.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario17_Group_18', 0, async () => {
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

    // @tc.number GroupScenario17_Group_19
    // @tc.name GroupScenario17_Group_19
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 324.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario17_Group_19', 0, async () => {
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

    // @tc.number GroupScenario17_Group_20
    // @tc.name GroupScenario17_Group_20
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 325.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario17_Group_20', 0, async () => {
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

    // @tc.number GroupScenario17_Sendable_21
    // @tc.name GroupScenario17_Sendable_21
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 326.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario17_Sendable_21', 0, async () => {
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

    // @tc.number GroupScenario17_Group_22
    // @tc.name GroupScenario17_Group_22
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 327.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario17_Group_22', 0, async () => {
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

    // @tc.number GroupScenario17_Group_23
    // @tc.name GroupScenario17_Group_23
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 328.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario17_Group_23', 0, async () => {
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

    // @tc.number GroupScenario17_Group_24
    // @tc.name GroupScenario17_Group_24
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 329.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario17_Group_24', 0, async () => {
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

    // @tc.number GroupScenario17_Copy_25
    // @tc.name GroupScenario17_Copy_25
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 330.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario17_Copy_25', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_448');
      try {
        const expected: string = 'a-b\nfile content\nxxxxxx';
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

    // @tc.number GroupScenario17_Group_26
    // @tc.name GroupScenario17_Group_26
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 331.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario17_Group_26', 0, async () => {
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

    // @tc.number GroupScenario17_Group_27
    // @tc.name GroupScenario17_Group_27
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 332.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario17_Group_27', 0, async () => {
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

    // @tc.number GroupScenario17_Group_28
    // @tc.name GroupScenario17_Group_28
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 333.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario17_Group_28', 0, async () => {
      const input: string[] = ['\t', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['\t', '01', '1', 'A', 'Z', 'a', 'z'];
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

    // @tc.number GroupScenario17_Group_29
    // @tc.name GroupScenario17_Group_29
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 334.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario17_Group_29', 0, async () => {
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
  });
}
