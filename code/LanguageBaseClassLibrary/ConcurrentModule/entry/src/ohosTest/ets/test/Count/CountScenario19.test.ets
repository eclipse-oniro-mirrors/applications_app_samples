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

// Adapted from ets/test/Interaction/FocusRingBehavior.test.ets.
// Real application exports and entrypoints replace TV-only services and models.
export default function CountScenario19(): void {
  describe('CountScenario19', () => {
    const recorder: shared.OperationRecorder = new shared.OperationRecorder();
    beforeAll(() => {
      hilog.info(0xf811, 'CountScenario19', 'Suite started');
    });
    beforeEach(() => {
      recorder.clear();
    });
    afterEach(() => {
      hilog.info(0xf811, 'CountScenario19', 'Recorded operations: %{public}d', recorder.count());
    });
    afterAll(() => {
      recorder.clear();
      hilog.info(0xf811, 'CountScenario19', 'Suite completed');
    });

    // @tc.number CountScenario19_Count_00
    // @tc.name CountScenario19_Count_00
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 343.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario19_Count_00', 0, async () => {
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

    // @tc.number CountScenario19_Count_01
    // @tc.name CountScenario19_Count_01
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 344.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario19_Count_01', 0, async () => {
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

    // @tc.number CountScenario19_Count_02
    // @tc.name CountScenario19_Count_02
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 345.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario19_Count_02', 0, async () => {
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

    // @tc.number CountScenario19_Count_03
    // @tc.name CountScenario19_Count_03
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 346.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario19_Count_03', 0, async () => {
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

    // @tc.number CountScenario19_Count_04
    // @tc.name CountScenario19_Count_04
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 347.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario19_Count_04', 0, async () => {
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

    // @tc.number CountScenario19_Count_05
    // @tc.name CountScenario19_Count_05
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 348.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario19_Count_05', 0, async () => {
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

    // @tc.number CountScenario19_Group_06
    // @tc.name CountScenario19_Group_06
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 349.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario19_Group_06', 0, async () => {
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

    // @tc.number CountScenario19_Count_07
    // @tc.name CountScenario19_Count_07
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 350.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario19_Count_07', 0, async () => {
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

    // @tc.number CountScenario19_Count_08
    // @tc.name CountScenario19_Count_08
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 351.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario19_Count_08', 0, async () => {
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

    // @tc.number CountScenario19_Count_09
    // @tc.name CountScenario19_Count_09
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 352.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario19_Count_09', 0, async () => {
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

    // @tc.number CountScenario19_Sendable_10
    // @tc.name CountScenario19_Sendable_10
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 353.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario19_Sendable_10', 0, async () => {
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

    // @tc.number CountScenario19_Count_11
    // @tc.name CountScenario19_Count_11
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 354.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario19_Count_11', 0, async () => {
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

    // @tc.number CountScenario19_Copy_12
    // @tc.name CountScenario19_Copy_12
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 355.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario19_Copy_12', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_501');
      try {
        const expected: string = '10\nfile content\nxxxx';
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

    // @tc.number CountScenario19_Group_13
    // @tc.name CountScenario19_Group_13
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 356.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario19_Group_13', 0, async () => {
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

    // @tc.number CountScenario19_Count_14
    // @tc.name CountScenario19_Count_14
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 357.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario19_Count_14', 0, async () => {
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

    // @tc.number CountScenario19_Count_15
    // @tc.name CountScenario19_Count_15
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 358.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario19_Count_15', 0, async () => {
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

    // @tc.number CountScenario19_Count_16
    // @tc.name CountScenario19_Count_16
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 359.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario19_Count_16', 0, async () => {
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

    // @tc.number CountScenario19_Count_17
    // @tc.name CountScenario19_Count_17
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 360.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario19_Count_17', 0, async () => {
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

    // @tc.number CountScenario19_Count_18
    // @tc.name CountScenario19_Count_18
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 361.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario19_Count_18', 0, async () => {
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

    // @tc.number CountScenario19_Count_19
    // @tc.name CountScenario19_Count_19
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 362.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario19_Count_19', 0, async () => {
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

    // @tc.number CountScenario19_Group_20
    // @tc.name CountScenario19_Group_20
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 363.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario19_Group_20', 0, async () => {
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

    // @tc.number CountScenario19_Sendable_21
    // @tc.name CountScenario19_Sendable_21
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 364.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario19_Sendable_21', 0, async () => {
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

    // @tc.number CountScenario19_Count_22
    // @tc.name CountScenario19_Count_22
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 365.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario19_Count_22', 0, async () => {
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

    // @tc.number CountScenario19_Count_23
    // @tc.name CountScenario19_Count_23
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 366.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario19_Count_23', 0, async () => {
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

    // @tc.number CountScenario19_Count_24
    // @tc.name CountScenario19_Count_24
    // @tc.desc Verify Count application behavior, isolation and complete observable results for scenario 367.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('CountScenario19_Count_24', 0, async () => {
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
