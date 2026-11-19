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

// Adapted from ets/test/PowerValidation/PowerAppVersion.test.ets.
// Real application exports and entrypoints replace TV-only services and models.
export default function CountScenario58(): void {
  describe('CountScenario58', () => {
    const recorder: shared.OperationRecorder = new shared.OperationRecorder();
    beforeAll(() => {
      hilog.info(0xf811, 'CountScenario58', 'Suite started');
    });
    beforeEach(() => {
      recorder.clear();
    });
    afterEach(() => {
      hilog.info(0xf811, 'CountScenario58', 'Recorded operations: %{public}d', recorder.count());
    });
    afterAll(() => {
      recorder.clear();
      hilog.info(0xf811, 'CountScenario58', 'Suite completed');
    });

    // @tc.number CountScenario58_Count_00
    // @tc.name CountScenario58_Count_00
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1084.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Count_00', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = -2147483648;
      const initial: number = await data.data1.getCount();
      expect(initial).assertEqual(0);
      await data.data1.setCount(expected);
      const other: shared.TestA = new shared.TestA();
      const otherCount: number = await other.getCount();
      expect(otherCount).assertEqual(0);
      await other.setCount(7);
      const changedOther: number = await other.getCount();
      expect(changedOther).assertEqual(7);
      const actual: number = await data.data1.getCount();
      expect(actual).assertEqual(expected);
      await data.data1.setCount(0);
      const reset: number = await data.data1.getCount();
      expect(reset).assertEqual(0);
    });

    // @tc.number CountScenario58_Count_01
    // @tc.name CountScenario58_Count_01
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1085.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Count_01', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = 0.5;
      const initial: number = await data.data1.getCount();
      expect(initial).assertEqual(0);
      await data.data1.setCount(expected);
      const other: shared.TestA = new shared.TestA();
      const otherCount: number = await other.getCount();
      expect(otherCount).assertEqual(0);
      await other.setCount(7);
      const changedOther: number = await other.getCount();
      expect(changedOther).assertEqual(7);
      const actual: number = await data.data1.getCount();
      expect(actual).assertEqual(expected);
      await data.data1.setCount(0);
      const reset: number = await data.data1.getCount();
      expect(reset).assertEqual(0);
    });

    // @tc.number CountScenario58_Count_02
    // @tc.name CountScenario58_Count_02
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1086.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Count_02', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = -0.5;
      const initial: number = await data.data1.getCount();
      expect(initial).assertEqual(0);
      await data.data1.setCount(expected);
      const other: shared.TestA = new shared.TestA();
      const otherCount: number = await other.getCount();
      expect(otherCount).assertEqual(0);
      await other.setCount(7);
      const changedOther: number = await other.getCount();
      expect(changedOther).assertEqual(7);
      const actual: number = await data.data1.getCount();
      expect(actual).assertEqual(expected);
      await data.data1.setCount(0);
      const reset: number = await data.data1.getCount();
      expect(reset).assertEqual(0);
    });

    // @tc.number CountScenario58_Count_03
    // @tc.name CountScenario58_Count_03
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1087.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Count_03', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = 9007199254740991;
      const initial: number = await data.data1.getCount();
      expect(initial).assertEqual(0);
      await data.data1.setCount(expected);
      const other: shared.TestA = new shared.TestA();
      const otherCount: number = await other.getCount();
      expect(otherCount).assertEqual(0);
      await other.setCount(7);
      const changedOther: number = await other.getCount();
      expect(changedOther).assertEqual(7);
      const actual: number = await data.data1.getCount();
      expect(actual).assertEqual(expected);
      await data.data1.setCount(0);
      const reset: number = await data.data1.getCount();
      expect(reset).assertEqual(0);
    });

    // @tc.number CountScenario58_Count_04
    // @tc.name CountScenario58_Count_04
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1088.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Count_04', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = -1;
      const initial: number = await data.data1.getCount();
      expect(initial).assertEqual(0);
      await data.data1.setCount(expected);
      const other: shared.TestA = new shared.TestA();
      const otherCount: number = await other.getCount();
      expect(otherCount).assertEqual(0);
      await other.setCount(7);
      const changedOther: number = await other.getCount();
      expect(changedOther).assertEqual(7);
      const actual: number = await data.data1.getCount();
      expect(actual).assertEqual(expected);
      await data.data1.setCount(0);
      const reset: number = await data.data1.getCount();
      expect(reset).assertEqual(0);
    });

    // @tc.number CountScenario58_Count_05
    // @tc.name CountScenario58_Count_05
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1089.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Count_05', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = 0;
      const initial: number = await data.data1.getCount();
      expect(initial).assertEqual(0);
      await data.data1.setCount(expected);
      const other: shared.TestA = new shared.TestA();
      const otherCount: number = await other.getCount();
      expect(otherCount).assertEqual(0);
      await other.setCount(7);
      const changedOther: number = await other.getCount();
      expect(changedOther).assertEqual(7);
      const actual: number = await data.data1.getCount();
      expect(actual).assertEqual(expected);
      await data.data1.setCount(0);
      const reset: number = await data.data1.getCount();
      expect(reset).assertEqual(0);
    });

    // @tc.number CountScenario58_Group_06
    // @tc.name CountScenario58_Group_06
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1090.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Group_06', 0, async () => {
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

    // @tc.number CountScenario58_Count_07
    // @tc.name CountScenario58_Count_07
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1091.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Count_07', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = 2147483647;
      const initial: number = await data.data1.getCount();
      expect(initial).assertEqual(0);
      await data.data1.setCount(expected);
      const other: shared.TestA = new shared.TestA();
      const otherCount: number = await other.getCount();
      expect(otherCount).assertEqual(0);
      await other.setCount(7);
      const changedOther: number = await other.getCount();
      expect(changedOther).assertEqual(7);
      const actual: number = await data.data1.getCount();
      expect(actual).assertEqual(expected);
      await data.data1.setCount(0);
      const reset: number = await data.data1.getCount();
      expect(reset).assertEqual(0);
    });

    // @tc.number CountScenario58_Count_08
    // @tc.name CountScenario58_Count_08
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1092.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Count_08', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = -2147483648;
      const initial: number = await data.data1.getCount();
      expect(initial).assertEqual(0);
      await data.data1.setCount(expected);
      const other: shared.TestA = new shared.TestA();
      const otherCount: number = await other.getCount();
      expect(otherCount).assertEqual(0);
      await other.setCount(7);
      const changedOther: number = await other.getCount();
      expect(changedOther).assertEqual(7);
      const actual: number = await data.data1.getCount();
      expect(actual).assertEqual(expected);
      await data.data1.setCount(0);
      const reset: number = await data.data1.getCount();
      expect(reset).assertEqual(0);
    });

    // @tc.number CountScenario58_Count_09
    // @tc.name CountScenario58_Count_09
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1093.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Count_09', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = 0.5;
      const initial: number = await data.data1.getCount();
      expect(initial).assertEqual(0);
      await data.data1.setCount(expected);
      const other: shared.TestA = new shared.TestA();
      const otherCount: number = await other.getCount();
      expect(otherCount).assertEqual(0);
      await other.setCount(7);
      const changedOther: number = await other.getCount();
      expect(changedOther).assertEqual(7);
      const actual: number = await data.data1.getCount();
      expect(actual).assertEqual(expected);
      await data.data1.setCount(0);
      const reset: number = await data.data1.getCount();
      expect(reset).assertEqual(0);
    });

    // @tc.number CountScenario58_Sendable_10
    // @tc.name CountScenario58_Sendable_10
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1094.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Sendable_10', 0, async () => {
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

    // @tc.number CountScenario58_Count_11
    // @tc.name CountScenario58_Count_11
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1095.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Count_11', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = 9007199254740991;
      const initial: number = await data.data1.getCount();
      expect(initial).assertEqual(0);
      await data.data1.setCount(expected);
      const other: shared.TestA = new shared.TestA();
      const otherCount: number = await other.getCount();
      expect(otherCount).assertEqual(0);
      await other.setCount(7);
      const changedOther: number = await other.getCount();
      expect(changedOther).assertEqual(7);
      const actual: number = await data.data1.getCount();
      expect(actual).assertEqual(expected);
      await data.data1.setCount(0);
      const reset: number = await data.data1.getCount();
      expect(reset).assertEqual(0);
    });

    // @tc.number CountScenario58_Copy_12
    // @tc.name CountScenario58_Copy_12
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1096.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Copy_12', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1606');
      try {
        const expected: string = '😀\nfile content\nxxxxxxx';
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

    // @tc.number CountScenario58_Group_13
    // @tc.name CountScenario58_Group_13
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1097.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Group_13', 0, async () => {
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

    // @tc.number CountScenario58_Count_14
    // @tc.name CountScenario58_Count_14
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1098.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Count_14', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = 1;
      const initial: number = await data.data1.getCount();
      expect(initial).assertEqual(0);
      await data.data1.setCount(expected);
      const other: shared.TestA = new shared.TestA();
      const otherCount: number = await other.getCount();
      expect(otherCount).assertEqual(0);
      await other.setCount(7);
      const changedOther: number = await other.getCount();
      expect(changedOther).assertEqual(7);
      const actual: number = await data.data1.getCount();
      expect(actual).assertEqual(expected);
      await data.data1.setCount(0);
      const reset: number = await data.data1.getCount();
      expect(reset).assertEqual(0);
    });

    // @tc.number CountScenario58_Count_15
    // @tc.name CountScenario58_Count_15
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1099.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Count_15', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = 2147483647;
      const initial: number = await data.data1.getCount();
      expect(initial).assertEqual(0);
      await data.data1.setCount(expected);
      const other: shared.TestA = new shared.TestA();
      const otherCount: number = await other.getCount();
      expect(otherCount).assertEqual(0);
      await other.setCount(7);
      const changedOther: number = await other.getCount();
      expect(changedOther).assertEqual(7);
      const actual: number = await data.data1.getCount();
      expect(actual).assertEqual(expected);
      await data.data1.setCount(0);
      const reset: number = await data.data1.getCount();
      expect(reset).assertEqual(0);
    });

    // @tc.number CountScenario58_Count_16
    // @tc.name CountScenario58_Count_16
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1100.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Count_16', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = -2147483648;
      const initial: number = await data.data1.getCount();
      expect(initial).assertEqual(0);
      await data.data1.setCount(expected);
      const other: shared.TestA = new shared.TestA();
      const otherCount: number = await other.getCount();
      expect(otherCount).assertEqual(0);
      await other.setCount(7);
      const changedOther: number = await other.getCount();
      expect(changedOther).assertEqual(7);
      const actual: number = await data.data1.getCount();
      expect(actual).assertEqual(expected);
      await data.data1.setCount(0);
      const reset: number = await data.data1.getCount();
      expect(reset).assertEqual(0);
    });

    // @tc.number CountScenario58_Count_17
    // @tc.name CountScenario58_Count_17
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1101.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Count_17', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = 0.5;
      const initial: number = await data.data1.getCount();
      expect(initial).assertEqual(0);
      await data.data1.setCount(expected);
      const other: shared.TestA = new shared.TestA();
      const otherCount: number = await other.getCount();
      expect(otherCount).assertEqual(0);
      await other.setCount(7);
      const changedOther: number = await other.getCount();
      expect(changedOther).assertEqual(7);
      const actual: number = await data.data1.getCount();
      expect(actual).assertEqual(expected);
      await data.data1.setCount(0);
      const reset: number = await data.data1.getCount();
      expect(reset).assertEqual(0);
    });

    // @tc.number CountScenario58_Count_18
    // @tc.name CountScenario58_Count_18
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1102.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Count_18', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = -0.5;
      const initial: number = await data.data1.getCount();
      expect(initial).assertEqual(0);
      await data.data1.setCount(expected);
      const other: shared.TestA = new shared.TestA();
      const otherCount: number = await other.getCount();
      expect(otherCount).assertEqual(0);
      await other.setCount(7);
      const changedOther: number = await other.getCount();
      expect(changedOther).assertEqual(7);
      const actual: number = await data.data1.getCount();
      expect(actual).assertEqual(expected);
      await data.data1.setCount(0);
      const reset: number = await data.data1.getCount();
      expect(reset).assertEqual(0);
    });

    // @tc.number CountScenario58_Count_19
    // @tc.name CountScenario58_Count_19
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1103.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Count_19', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = 9007199254740991;
      const initial: number = await data.data1.getCount();
      expect(initial).assertEqual(0);
      await data.data1.setCount(expected);
      const other: shared.TestA = new shared.TestA();
      const otherCount: number = await other.getCount();
      expect(otherCount).assertEqual(0);
      await other.setCount(7);
      const changedOther: number = await other.getCount();
      expect(changedOther).assertEqual(7);
      const actual: number = await data.data1.getCount();
      expect(actual).assertEqual(expected);
      await data.data1.setCount(0);
      const reset: number = await data.data1.getCount();
      expect(reset).assertEqual(0);
    });

    // @tc.number CountScenario58_Group_20
    // @tc.name CountScenario58_Group_20
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1104.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Group_20', 0, async () => {
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

    // @tc.number CountScenario58_Sendable_21
    // @tc.name CountScenario58_Sendable_21
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1105.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Sendable_21', 0, async () => {
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

    // @tc.number CountScenario58_Count_22
    // @tc.name CountScenario58_Count_22
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1106.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Count_22', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = 1;
      const initial: number = await data.data1.getCount();
      expect(initial).assertEqual(0);
      await data.data1.setCount(expected);
      const other: shared.TestA = new shared.TestA();
      const otherCount: number = await other.getCount();
      expect(otherCount).assertEqual(0);
      await other.setCount(7);
      const changedOther: number = await other.getCount();
      expect(changedOther).assertEqual(7);
      const actual: number = await data.data1.getCount();
      expect(actual).assertEqual(expected);
      await data.data1.setCount(0);
      const reset: number = await data.data1.getCount();
      expect(reset).assertEqual(0);
    });

    // @tc.number CountScenario58_Count_23
    // @tc.name CountScenario58_Count_23
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1107.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Count_23', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = 2147483647;
      const initial: number = await data.data1.getCount();
      expect(initial).assertEqual(0);
      await data.data1.setCount(expected);
      const other: shared.TestA = new shared.TestA();
      const otherCount: number = await other.getCount();
      expect(otherCount).assertEqual(0);
      await other.setCount(7);
      const changedOther: number = await other.getCount();
      expect(changedOther).assertEqual(7);
      const actual: number = await data.data1.getCount();
      expect(actual).assertEqual(expected);
      await data.data1.setCount(0);
      const reset: number = await data.data1.getCount();
      expect(reset).assertEqual(0);
    });

    // @tc.number CountScenario58_Count_24
    // @tc.name CountScenario58_Count_24
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1108.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Count_24', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = -2147483648;
      const initial: number = await data.data1.getCount();
      expect(initial).assertEqual(0);
      await data.data1.setCount(expected);
      const other: shared.TestA = new shared.TestA();
      const otherCount: number = await other.getCount();
      expect(otherCount).assertEqual(0);
      await other.setCount(7);
      const changedOther: number = await other.getCount();
      expect(changedOther).assertEqual(7);
      const actual: number = await data.data1.getCount();
      expect(actual).assertEqual(expected);
      await data.data1.setCount(0);
      const reset: number = await data.data1.getCount();
      expect(reset).assertEqual(0);
    });

    // @tc.number CountScenario58_Copy_25
    // @tc.name CountScenario58_Copy_25
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1109.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Copy_25', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1619');
      try {
        const expected: string = ' \nfile content\nxx';
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

    // @tc.number CountScenario58_Count_26
    // @tc.name CountScenario58_Count_26
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1110.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Count_26', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = -0.5;
      const initial: number = await data.data1.getCount();
      expect(initial).assertEqual(0);
      await data.data1.setCount(expected);
      const other: shared.TestA = new shared.TestA();
      const otherCount: number = await other.getCount();
      expect(otherCount).assertEqual(0);
      await other.setCount(7);
      const changedOther: number = await other.getCount();
      expect(changedOther).assertEqual(7);
      const actual: number = await data.data1.getCount();
      expect(actual).assertEqual(expected);
      await data.data1.setCount(0);
      const reset: number = await data.data1.getCount();
      expect(reset).assertEqual(0);
    });

    // @tc.number CountScenario58_Group_27
    // @tc.name CountScenario58_Group_27
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1111.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Group_27', 0, async () => {
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

    // @tc.number CountScenario58_Count_28
    // @tc.name CountScenario58_Count_28
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1112.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Count_28', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = -1;
      const initial: number = await data.data1.getCount();
      expect(initial).assertEqual(0);
      await data.data1.setCount(expected);
      const other: shared.TestA = new shared.TestA();
      const otherCount: number = await other.getCount();
      expect(otherCount).assertEqual(0);
      await other.setCount(7);
      const changedOther: number = await other.getCount();
      expect(changedOther).assertEqual(7);
      const actual: number = await data.data1.getCount();
      expect(actual).assertEqual(expected);
      await data.data1.setCount(0);
      const reset: number = await data.data1.getCount();
      expect(reset).assertEqual(0);
    });

    // @tc.number CountScenario58_Count_29
    // @tc.name CountScenario58_Count_29
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1113.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Count_29', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = 0;
      const initial: number = await data.data1.getCount();
      expect(initial).assertEqual(0);
      await data.data1.setCount(expected);
      const other: shared.TestA = new shared.TestA();
      const otherCount: number = await other.getCount();
      expect(otherCount).assertEqual(0);
      await other.setCount(7);
      const changedOther: number = await other.getCount();
      expect(changedOther).assertEqual(7);
      const actual: number = await data.data1.getCount();
      expect(actual).assertEqual(expected);
      await data.data1.setCount(0);
      const reset: number = await data.data1.getCount();
      expect(reset).assertEqual(0);
    });

    // @tc.number CountScenario58_Count_30
    // @tc.name CountScenario58_Count_30
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1114.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Count_30', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = 1;
      const initial: number = await data.data1.getCount();
      expect(initial).assertEqual(0);
      await data.data1.setCount(expected);
      const other: shared.TestA = new shared.TestA();
      const otherCount: number = await other.getCount();
      expect(otherCount).assertEqual(0);
      await other.setCount(7);
      const changedOther: number = await other.getCount();
      expect(changedOther).assertEqual(7);
      const actual: number = await data.data1.getCount();
      expect(actual).assertEqual(expected);
      await data.data1.setCount(0);
      const reset: number = await data.data1.getCount();
      expect(reset).assertEqual(0);
    });

    // @tc.number CountScenario58_Count_31
    // @tc.name CountScenario58_Count_31
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1115.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Count_31', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = 2147483647;
      const initial: number = await data.data1.getCount();
      expect(initial).assertEqual(0);
      await data.data1.setCount(expected);
      const other: shared.TestA = new shared.TestA();
      const otherCount: number = await other.getCount();
      expect(otherCount).assertEqual(0);
      await other.setCount(7);
      const changedOther: number = await other.getCount();
      expect(changedOther).assertEqual(7);
      const actual: number = await data.data1.getCount();
      expect(actual).assertEqual(expected);
      await data.data1.setCount(0);
      const reset: number = await data.data1.getCount();
      expect(reset).assertEqual(0);
    });

    // @tc.number CountScenario58_Sendable_32
    // @tc.name CountScenario58_Sendable_32
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1116.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Sendable_32', 0, async () => {
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

    // @tc.number CountScenario58_Count_33
    // @tc.name CountScenario58_Count_33
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1117.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario58_Count_33', 0, async () => {
      const data: shared.SendableClass = new shared.SendableClass();
      const expected: number = 0.5;
      const initial: number = await data.data1.getCount();
      expect(initial).assertEqual(0);
      await data.data1.setCount(expected);
      const other: shared.TestA = new shared.TestA();
      const otherCount: number = await other.getCount();
      expect(otherCount).assertEqual(0);
      await other.setCount(7);
      const changedOther: number = await other.getCount();
      expect(changedOther).assertEqual(7);
      const actual: number = await data.data1.getCount();
      expect(actual).assertEqual(expected);
      await data.data1.setCount(0);
      const reset: number = await data.data1.getCount();
      expect(reset).assertEqual(0);
    });
  });
}
