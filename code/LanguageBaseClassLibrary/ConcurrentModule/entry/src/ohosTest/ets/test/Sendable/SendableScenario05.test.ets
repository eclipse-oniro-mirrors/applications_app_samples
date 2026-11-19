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

// Adapted from ets/test/Integration/IntegrationTesting.test.ets.
// Real application exports and entrypoints replace TV-only services and models.
export default function SendableScenario05(): void {
  describe('SendableScenario05', () => {
    const recorder: shared.OperationRecorder = new shared.OperationRecorder();
    beforeAll(() => {
      hilog.info(0xf811, 'SendableScenario05', 'Suite started');
    });
    beforeEach(() => {
      recorder.clear();
    });
    afterEach(() => {
      hilog.info(0xf811, 'SendableScenario05', 'Recorded operations: %{public}d', recorder.count());
    });
    afterAll(() => {
      recorder.clear();
      hilog.info(0xf811, 'SendableScenario05', 'Suite completed');
    });

    // @tc.number SendableScenario05_Sendable_00
    // @tc.name SendableScenario05_Sendable_00
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 77.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('SendableScenario05_Sendable_00', 0, async () => {
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

    // @tc.number SendableScenario05_Sendable_01
    // @tc.name SendableScenario05_Sendable_01
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 78.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('SendableScenario05_Sendable_01', 0, async () => {
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

    // @tc.number SendableScenario05_Sendable_02
    // @tc.name SendableScenario05_Sendable_02
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 79.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('SendableScenario05_Sendable_02', 0, async () => {
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

    // @tc.number SendableScenario05_Sendable_03
    // @tc.name SendableScenario05_Sendable_03
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 80.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('SendableScenario05_Sendable_03', 0, async () => {
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

    // @tc.number SendableScenario05_Sendable_04
    // @tc.name SendableScenario05_Sendable_04
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 81.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('SendableScenario05_Sendable_04', 0, async () => {
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

    // @tc.number SendableScenario05_Sendable_05
    // @tc.name SendableScenario05_Sendable_05
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 82.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('SendableScenario05_Sendable_05', 0, async () => {
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

    // @tc.number SendableScenario05_Group_06
    // @tc.name SendableScenario05_Group_06
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 83.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('SendableScenario05_Group_06', 0, async () => {
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

    // @tc.number SendableScenario05_Sendable_07
    // @tc.name SendableScenario05_Sendable_07
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 84.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('SendableScenario05_Sendable_07', 0, async () => {
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

    // @tc.number SendableScenario05_Sendable_08
    // @tc.name SendableScenario05_Sendable_08
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 85.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('SendableScenario05_Sendable_08', 0, async () => {
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

    // @tc.number SendableScenario05_Sendable_09
    // @tc.name SendableScenario05_Sendable_09
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 86.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('SendableScenario05_Sendable_09', 0, async () => {
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

    // @tc.number SendableScenario05_Sendable_10
    // @tc.name SendableScenario05_Sendable_10
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 87.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('SendableScenario05_Sendable_10', 0, async () => {
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

    // @tc.number SendableScenario05_Sendable_11
    // @tc.name SendableScenario05_Sendable_11
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 88.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('SendableScenario05_Sendable_11', 0, async () => {
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

    // @tc.number SendableScenario05_Copy_12
    // @tc.name SendableScenario05_Copy_12
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 89.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('SendableScenario05_Copy_12', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_109');
      try {
        const expected: string = 'a\u0000b\nfile content\nxxxxxxxx';
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

    // @tc.number SendableScenario05_Group_13
    // @tc.name SendableScenario05_Group_13
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 90.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('SendableScenario05_Group_13', 0, async () => {
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

    // @tc.number SendableScenario05_Sendable_14
    // @tc.name SendableScenario05_Sendable_14
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 91.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('SendableScenario05_Sendable_14', 0, async () => {
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

    // @tc.number SendableScenario05_Sendable_15
    // @tc.name SendableScenario05_Sendable_15
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 92.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('SendableScenario05_Sendable_15', 0, async () => {
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

    // @tc.number SendableScenario05_Sendable_16
    // @tc.name SendableScenario05_Sendable_16
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 93.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('SendableScenario05_Sendable_16', 0, async () => {
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

    // @tc.number SendableScenario05_Sendable_17
    // @tc.name SendableScenario05_Sendable_17
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 94.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('SendableScenario05_Sendable_17', 0, async () => {
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

    // @tc.number SendableScenario05_Sendable_18
    // @tc.name SendableScenario05_Sendable_18
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 95.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('SendableScenario05_Sendable_18', 0, async () => {
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

    // @tc.number SendableScenario05_Sendable_19
    // @tc.name SendableScenario05_Sendable_19
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 96.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('SendableScenario05_Sendable_19', 0, async () => {
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
  });
}
