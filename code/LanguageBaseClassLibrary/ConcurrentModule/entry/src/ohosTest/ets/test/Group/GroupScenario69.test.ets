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

// Adapted from ets/test/Validation/AnimationControllerValidation.test.ets.
// Real application exports and entrypoints replace TV-only services and models.
export default function GroupScenario69(): void {
  describe('GroupScenario69', () => {
    const recorder: shared.OperationRecorder = new shared.OperationRecorder();
    beforeAll(() => {
      hilog.info(0xf811, 'GroupScenario69', 'Suite started');
    });
    beforeEach(() => {
      recorder.clear();
    });
    afterEach(() => {
      hilog.info(0xf811, 'GroupScenario69', 'Recorded operations: %{public}d', recorder.count());
    });
    afterAll(() => {
      recorder.clear();
      hilog.info(0xf811, 'GroupScenario69', 'Suite completed');
    });

    // @tc.number GroupScenario69_Group_00
    // @tc.name GroupScenario69_Group_00
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1293.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_00', 0, async () => {
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

    // @tc.number GroupScenario69_Group_01
    // @tc.name GroupScenario69_Group_01
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1294.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_01', 0, async () => {
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

    // @tc.number GroupScenario69_Group_02
    // @tc.name GroupScenario69_Group_02
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1295.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_02', 0, async () => {
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

    // @tc.number GroupScenario69_Group_03
    // @tc.name GroupScenario69_Group_03
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1296.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_03', 0, async () => {
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

    // @tc.number GroupScenario69_Group_04
    // @tc.name GroupScenario69_Group_04
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1297.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_04', 0, async () => {
      const input: string[] = ['Z', 'Z', 'Z'];
      const expected: string[] = ['Z', 'Z', 'Z'];
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

    // @tc.number GroupScenario69_Group_05
    // @tc.name GroupScenario69_Group_05
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1298.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_05', 0, async () => {
      const input: string[] = ['', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['', '01', '1', 'A', 'Z', 'a', 'z'];
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

    // @tc.number GroupScenario69_Group_06
    // @tc.name GroupScenario69_Group_06
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1299.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_06', 0, async () => {
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

    // @tc.number GroupScenario69_Group_07
    // @tc.name GroupScenario69_Group_07
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1300.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_07', 0, async () => {
      const input: string[] = ['2', 'beta', 'Alpha', '2', ''];
      const expected: string[] = ['', '2', '2', 'Alpha', 'beta'];
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

    // @tc.number GroupScenario69_Group_08
    // @tc.name GroupScenario69_Group_08
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1301.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_08', 0, async () => {
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

    // @tc.number GroupScenario69_Group_09
    // @tc.name GroupScenario69_Group_09
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1302.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_09', 0, async () => {
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

    // @tc.number GroupScenario69_Sendable_10
    // @tc.name GroupScenario69_Sendable_10
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1303.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Sendable_10', 0, async () => {
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

    // @tc.number GroupScenario69_Group_11
    // @tc.name GroupScenario69_Group_11
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1304.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_11', 0, async () => {
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

    // @tc.number GroupScenario69_Copy_12
    // @tc.name GroupScenario69_Copy_12
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1305.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Copy_12', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1916');
      try {
        const expected: string = 'a\u0000b\nfile content\n';
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

    // @tc.number GroupScenario69_Group_13
    // @tc.name GroupScenario69_Group_13
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1306.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_13', 0, async () => {
      const input: string[] = ['a-b'];
      const expected: string[] = ['a-b'];
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

    // @tc.number GroupScenario69_Group_14
    // @tc.name GroupScenario69_Group_14
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1307.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_14', 0, async () => {
      const input: string[] = ['a_b', 'a_b', 'a_b'];
      const expected: string[] = ['a_b', 'a_b', 'a_b'];
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

    // @tc.number GroupScenario69_Group_15
    // @tc.name GroupScenario69_Group_15
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1308.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_15', 0, async () => {
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

    // @tc.number GroupScenario69_Group_16
    // @tc.name GroupScenario69_Group_16
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1309.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_16', 0, async () => {
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

    // @tc.number GroupScenario69_Group_17
    // @tc.name GroupScenario69_Group_17
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1310.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_17', 0, async () => {
      const input: string[] = ['ß', 'beta', 'Alpha', 'ß', ''];
      const expected: string[] = ['', 'Alpha', 'beta', 'ß', 'ß'];
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

    // @tc.number GroupScenario69_Group_18
    // @tc.name GroupScenario69_Group_18
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1311.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_18', 0, async () => {
      const input: string[] = ['Ω'];
      const expected: string[] = ['Ω'];
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

    // @tc.number GroupScenario69_Group_19
    // @tc.name GroupScenario69_Group_19
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1312.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_19', 0, async () => {
      const input: string[] = ['a', 'a', 'a'];
      const expected: string[] = ['a', 'a', 'a'];
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

    // @tc.number GroupScenario69_Group_20
    // @tc.name GroupScenario69_Group_20
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1313.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_20', 0, async () => {
      const input: string[] = ['Z', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['01', '1', 'A', 'Z', 'Z', 'a', 'z'];
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

    // @tc.number GroupScenario69_Sendable_21
    // @tc.name GroupScenario69_Sendable_21
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1314.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Sendable_21', 0, async () => {
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

    // @tc.number GroupScenario69_Group_22
    // @tc.name GroupScenario69_Group_22
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1315.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_22', 0, async () => {
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

    // @tc.number GroupScenario69_Group_23
    // @tc.name GroupScenario69_Group_23
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1316.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_23', 0, async () => {
      const input: string[] = ['2'];
      const expected: string[] = ['2'];
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

    // @tc.number GroupScenario69_Group_24
    // @tc.name GroupScenario69_Group_24
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1317.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_24', 0, async () => {
      const input: string[] = [' ', ' ', ' '];
      const expected: string[] = [' ', ' ', ' '];
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

    // @tc.number GroupScenario69_Copy_25
    // @tc.name GroupScenario69_Copy_25
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1318.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Copy_25', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1929');
      try {
        const expected: string = 'é\nfile content\nxxxx';
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

    // @tc.number GroupScenario69_Group_26
    // @tc.name GroupScenario69_Group_26
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1319.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_26', 0, async () => {
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

    // @tc.number GroupScenario69_Group_27
    // @tc.name GroupScenario69_Group_27
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1320.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_27', 0, async () => {
      const input: string[] = ['😀', 'beta', 'Alpha', '😀', ''];
      const expected: string[] = ['', 'Alpha', 'beta', '😀', '😀'];
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

    // @tc.number GroupScenario69_Group_28
    // @tc.name GroupScenario69_Group_28
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1321.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_28', 0, async () => {
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

    // @tc.number GroupScenario69_Group_29
    // @tc.name GroupScenario69_Group_29
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1322.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_29', 0, async () => {
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

    // @tc.number GroupScenario69_Group_30
    // @tc.name GroupScenario69_Group_30
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1323.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_30', 0, async () => {
      const input: string[] = ['a_b', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['01', '1', 'A', 'Z', 'a', 'a_b', 'z'];
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

    // @tc.number GroupScenario69_Group_31
    // @tc.name GroupScenario69_Group_31
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1324.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_31', 0, async () => {
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

    // @tc.number GroupScenario69_Sendable_32
    // @tc.name GroupScenario69_Sendable_32
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1325.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Sendable_32', 0, async () => {
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

    // @tc.number GroupScenario69_Group_33
    // @tc.name GroupScenario69_Group_33
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1326.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_33', 0, async () => {
      const input: string[] = ['ß'];
      const expected: string[] = ['ß'];
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

    // @tc.number GroupScenario69_Group_34
    // @tc.name GroupScenario69_Group_34
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1327.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_34', 0, async () => {
      const input: string[] = ['Ω', 'Ω', 'Ω'];
      const expected: string[] = ['Ω', 'Ω', 'Ω'];
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

    // @tc.number GroupScenario69_Group_35
    // @tc.name GroupScenario69_Group_35
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1328.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_35', 0, async () => {
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

    // @tc.number GroupScenario69_Group_36
    // @tc.name GroupScenario69_Group_36
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1329.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_36', 0, async () => {
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

    // @tc.number GroupScenario69_Group_37
    // @tc.name GroupScenario69_Group_37
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1330.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_37', 0, async () => {
      const input: string[] = ['', 'beta', 'Alpha', '', ''];
      const expected: string[] = ['', '', '', 'Alpha', 'beta'];
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

    // @tc.number GroupScenario69_Copy_38
    // @tc.name GroupScenario69_Copy_38
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1331.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Copy_38', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1942');
      try {
        const expected: string = '10\nfile content\nxxxxxxxx';
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

    // @tc.number GroupScenario69_Group_39
    // @tc.name GroupScenario69_Group_39
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1332.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_39', 0, async () => {
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

    // @tc.number GroupScenario69_Group_40
    // @tc.name GroupScenario69_Group_40
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1333.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_40', 0, async () => {
      const input: string[] = [' ', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = [' ', '01', '1', 'A', 'Z', 'a', 'z'];
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

    // @tc.number GroupScenario69_Group_41
    // @tc.name GroupScenario69_Group_41
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1334.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_41', 0, async () => {
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

    // @tc.number GroupScenario69_Group_42
    // @tc.name GroupScenario69_Group_42
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1335.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_42', 0, async () => {
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

    // @tc.number GroupScenario69_Sendable_43
    // @tc.name GroupScenario69_Sendable_43
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1336.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Sendable_43', 0, async () => {
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

    // @tc.number GroupScenario69_Group_44
    // @tc.name GroupScenario69_Group_44
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1337.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_44', 0, async () => {
      const input: string[] = ['a\u0000b', 'a\u0000b', 'a\u0000b'];
      const expected: string[] = ['a\u0000b', 'a\u0000b', 'a\u0000b'];
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

    // @tc.number GroupScenario69_Group_45
    // @tc.name GroupScenario69_Group_45
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1338.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_45', 0, async () => {
      const input: string[] = ['a-b', 'z', 'A', '01', '1', 'a', 'Z'];
      const expected: string[] = ['01', '1', 'A', 'Z', 'a', 'a-b', 'z'];
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

    // @tc.number GroupScenario69_Group_46
    // @tc.name GroupScenario69_Group_46
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1339.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('GroupScenario69_Group_46', 0, async () => {
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
