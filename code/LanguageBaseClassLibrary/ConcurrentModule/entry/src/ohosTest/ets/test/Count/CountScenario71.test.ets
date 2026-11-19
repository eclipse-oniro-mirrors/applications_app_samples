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

// Adapted from ets/test/Validation/CommonEventUtilValidation.test.ets.
// Real application exports and entrypoints replace TV-only services and models.
export default function CountScenario71(): void {
  describe('CountScenario71', () => {
    const recorder: shared.OperationRecorder = new shared.OperationRecorder();
    beforeAll(() => {
      hilog.info(0xf811, 'CountScenario71', 'Suite started');
    });
    beforeEach(() => {
      recorder.clear();
    });
    afterEach(() => {
      hilog.info(0xf811, 'CountScenario71', 'Recorded operations: %{public}d', recorder.count());
    });
    afterAll(() => {
      recorder.clear();
      hilog.info(0xf811, 'CountScenario71', 'Suite completed');
    });

    // @tc.number CountScenario71_Count_00
    // @tc.name CountScenario71_Count_00
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1331.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_00', 0, async () => {
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

    // @tc.number CountScenario71_Count_01
    // @tc.name CountScenario71_Count_01
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1332.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_01', 0, async () => {
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

    // @tc.number CountScenario71_Count_02
    // @tc.name CountScenario71_Count_02
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1333.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_02', 0, async () => {
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

    // @tc.number CountScenario71_Count_03
    // @tc.name CountScenario71_Count_03
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1334.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_03', 0, async () => {
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

    // @tc.number CountScenario71_Count_04
    // @tc.name CountScenario71_Count_04
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1335.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_04', 0, async () => {
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

    // @tc.number CountScenario71_Count_05
    // @tc.name CountScenario71_Count_05
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1336.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_05', 0, async () => {
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

    // @tc.number CountScenario71_Group_06
    // @tc.name CountScenario71_Group_06
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1337.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Group_06', 0, async () => {
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

    // @tc.number CountScenario71_Count_07
    // @tc.name CountScenario71_Count_07
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1338.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_07', 0, async () => {
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

    // @tc.number CountScenario71_Count_08
    // @tc.name CountScenario71_Count_08
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1339.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_08', 0, async () => {
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

    // @tc.number CountScenario71_Count_09
    // @tc.name CountScenario71_Count_09
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1340.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_09', 0, async () => {
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

    // @tc.number CountScenario71_Sendable_10
    // @tc.name CountScenario71_Sendable_10
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1341.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Sendable_10', 0, async () => {
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

    // @tc.number CountScenario71_Count_11
    // @tc.name CountScenario71_Count_11
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1342.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_11', 0, async () => {
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

    // @tc.number CountScenario71_Copy_12
    // @tc.name CountScenario71_Copy_12
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1343.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Copy_12', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1984');
      try {
        const expected: string = 'Ω\nfile content\nxx';
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

    // @tc.number CountScenario71_Group_13
    // @tc.name CountScenario71_Group_13
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1344.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Group_13', 0, async () => {
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

    // @tc.number CountScenario71_Count_14
    // @tc.name CountScenario71_Count_14
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1345.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_14', 0, async () => {
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

    // @tc.number CountScenario71_Count_15
    // @tc.name CountScenario71_Count_15
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1346.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_15', 0, async () => {
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

    // @tc.number CountScenario71_Count_16
    // @tc.name CountScenario71_Count_16
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1347.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_16', 0, async () => {
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

    // @tc.number CountScenario71_Count_17
    // @tc.name CountScenario71_Count_17
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1348.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_17', 0, async () => {
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

    // @tc.number CountScenario71_Count_18
    // @tc.name CountScenario71_Count_18
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1349.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_18', 0, async () => {
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

    // @tc.number CountScenario71_Count_19
    // @tc.name CountScenario71_Count_19
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1350.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_19', 0, async () => {
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

    // @tc.number CountScenario71_Group_20
    // @tc.name CountScenario71_Group_20
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1351.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Group_20', 0, async () => {
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

    // @tc.number CountScenario71_Sendable_21
    // @tc.name CountScenario71_Sendable_21
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1352.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Sendable_21', 0, async () => {
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

    // @tc.number CountScenario71_Count_22
    // @tc.name CountScenario71_Count_22
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1353.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_22', 0, async () => {
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

    // @tc.number CountScenario71_Count_23
    // @tc.name CountScenario71_Count_23
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1354.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_23', 0, async () => {
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

    // @tc.number CountScenario71_Count_24
    // @tc.name CountScenario71_Count_24
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1355.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_24', 0, async () => {
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

    // @tc.number CountScenario71_Copy_25
    // @tc.name CountScenario71_Copy_25
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1356.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Copy_25', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1997');
      try {
        const expected: string = '\n\nfile content\nxxxxxx';
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

    // @tc.number CountScenario71_Count_26
    // @tc.name CountScenario71_Count_26
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1357.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_26', 0, async () => {
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

    // @tc.number CountScenario71_Group_27
    // @tc.name CountScenario71_Group_27
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1358.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Group_27', 0, async () => {
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

    // @tc.number CountScenario71_Count_28
    // @tc.name CountScenario71_Count_28
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1359.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_28', 0, async () => {
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

    // @tc.number CountScenario71_Count_29
    // @tc.name CountScenario71_Count_29
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1360.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_29', 0, async () => {
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

    // @tc.number CountScenario71_Count_30
    // @tc.name CountScenario71_Count_30
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1361.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_30', 0, async () => {
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

    // @tc.number CountScenario71_Count_31
    // @tc.name CountScenario71_Count_31
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1362.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_31', 0, async () => {
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

    // @tc.number CountScenario71_Sendable_32
    // @tc.name CountScenario71_Sendable_32
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1363.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Sendable_32', 0, async () => {
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

    // @tc.number CountScenario71_Count_33
    // @tc.name CountScenario71_Count_33
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1364.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_33', 0, async () => {
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

    // @tc.number CountScenario71_Group_34
    // @tc.name CountScenario71_Group_34
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1365.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Group_34', 0, async () => {
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

    // @tc.number CountScenario71_Count_35
    // @tc.name CountScenario71_Count_35
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1366.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_35', 0, async () => {
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

    // @tc.number CountScenario71_Count_36
    // @tc.name CountScenario71_Count_36
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1367.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_36', 0, async () => {
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

    // @tc.number CountScenario71_Count_37
    // @tc.name CountScenario71_Count_37
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1368.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_37', 0, async () => {
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

    // @tc.number CountScenario71_Copy_38
    // @tc.name CountScenario71_Copy_38
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1369.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Copy_38', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_2010');
      try {
        const expected: string = 'a\u0000b\nfile content\nx';
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

    // @tc.number CountScenario71_Count_39
    // @tc.name CountScenario71_Count_39
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1370.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_39', 0, async () => {
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

    // @tc.number CountScenario71_Count_40
    // @tc.name CountScenario71_Count_40
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1371.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_40', 0, async () => {
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

    // @tc.number CountScenario71_Group_41
    // @tc.name CountScenario71_Group_41
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1372.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Group_41', 0, async () => {
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

    // @tc.number CountScenario71_Count_42
    // @tc.name CountScenario71_Count_42
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1373.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_42', 0, async () => {
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

    // @tc.number CountScenario71_Sendable_43
    // @tc.name CountScenario71_Sendable_43
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1374.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Sendable_43', 0, async () => {
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

    // @tc.number CountScenario71_Count_44
    // @tc.name CountScenario71_Count_44
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 1375.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario71_Count_44', 0, async () => {
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
  });
}
