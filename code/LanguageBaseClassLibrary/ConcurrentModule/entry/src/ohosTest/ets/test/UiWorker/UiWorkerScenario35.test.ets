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

// Adapted from ets/test/PerformanceStability/AnimationPerformance.test.ets.
// Real application exports and entrypoints replace TV-only services and models.
export default function UiWorkerScenario35(): void {
  describe('UiWorkerScenario35', () => {
    const recorder: shared.OperationRecorder = new shared.OperationRecorder();
    beforeAll(() => {
      hilog.info(0xf811, 'UiWorkerScenario35', 'Suite started');
    });
    beforeEach(() => {
      recorder.clear();
    });
    afterEach(() => {
      hilog.info(0xf811, 'UiWorkerScenario35', 'Recorded operations: %{public}d', recorder.count());
    });
    afterAll(() => {
      recorder.clear();
      hilog.info(0xf811, 'UiWorkerScenario35', 'Suite completed');
    });

    // @tc.number UiWorkerScenario35_UiWorker_00
    // @tc.name UiWorkerScenario35_UiWorker_00
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 647.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_UiWorker_00', 0, async () => {
      const input: string = '中,中,中';
      const expected: string = '中,中,中';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario35_UiWorker_01
    // @tc.name UiWorkerScenario35_UiWorker_01
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 648.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_UiWorker_01', 0, async () => {
      const input: string = '😀,z,A,01,1,a,Z';
      const expected: string = '01,1,A,Z,a,z,😀';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario35_UiWorker_02
    // @tc.name UiWorkerScenario35_UiWorker_02
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 649.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_UiWorker_02', 0, async () => {
      const input: string = '';
      const expected: string = 'No input for the string to be sorted.\n';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario35_UiWorker_03
    // @tc.name UiWorkerScenario35_UiWorker_03
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 650.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_UiWorker_03', 0, async () => {
      const input: string = 'a-b,beta,Alpha,a-b,';
      const expected: string = ',Alpha,a-b,a-b,beta';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario35_UiWorker_04
    // @tc.name UiWorkerScenario35_UiWorker_04
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 651.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_UiWorker_04', 0, async () => {
      const input: string = 'a_b';
      const expected: string = 'a_b';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario35_UiWorker_05
    // @tc.name UiWorkerScenario35_UiWorker_05
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 652.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_UiWorker_05', 0, async () => {
      const input: string = ',,';
      const expected: string = ',,';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario35_Group_06
    // @tc.name UiWorkerScenario35_Group_06
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 653.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_Group_06', 0, async () => {
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

    // @tc.number UiWorkerScenario35_UiWorker_07
    // @tc.name UiWorkerScenario35_UiWorker_07
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 654.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_UiWorker_07', 0, async () => {
      const input: string = '';
      const expected: string = 'No input for the string to be sorted.\n';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario35_UiWorker_08
    // @tc.name UiWorkerScenario35_UiWorker_08
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 655.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_UiWorker_08', 0, async () => {
      const input: string = 'Ω,beta,Alpha,Ω,';
      const expected: string = ',Alpha,beta,Ω,Ω';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario35_UiWorker_09
    // @tc.name UiWorkerScenario35_UiWorker_09
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 656.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_UiWorker_09', 0, async () => {
      const input: string = 'a';
      const expected: string = 'a';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario35_Sendable_10
    // @tc.name UiWorkerScenario35_Sendable_10
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 657.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_Sendable_10', 0, async () => {
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

    // @tc.number UiWorkerScenario35_UiWorker_11
    // @tc.name UiWorkerScenario35_UiWorker_11
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 658.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_UiWorker_11', 0, async () => {
      const input: string = ',z,A,01,1,a,Z';
      const expected: string = ',01,1,A,Z,a,z';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario35_Copy_12
    // @tc.name UiWorkerScenario35_Copy_12
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 659.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_Copy_12', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_958');
      try {
        const expected: string = '10\nfile content\nxx';
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

    // @tc.number UiWorkerScenario35_Group_13
    // @tc.name UiWorkerScenario35_Group_13
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 660.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_Group_13', 0, async () => {
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

    // @tc.number UiWorkerScenario35_UiWorker_14
    // @tc.name UiWorkerScenario35_UiWorker_14
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 661.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_UiWorker_14', 0, async () => {
      const input: string = ' ';
      const expected: string = '';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario35_UiWorker_15
    // @tc.name UiWorkerScenario35_UiWorker_15
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 662.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_UiWorker_15', 0, async () => {
      const input: string = 'é,é,é';
      const expected: string = 'é,é,é';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario35_UiWorker_16
    // @tc.name UiWorkerScenario35_UiWorker_16
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 663.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_UiWorker_16', 0, async () => {
      const input: string = '中,z,A,01,1,a,Z';
      const expected: string = '01,1,A,Z,a,z,中';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario35_UiWorker_17
    // @tc.name UiWorkerScenario35_UiWorker_17
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 664.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_UiWorker_17', 0, async () => {
      const input: string = '';
      const expected: string = 'No input for the string to be sorted.\n';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario35_UiWorker_18
    // @tc.name UiWorkerScenario35_UiWorker_18
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 665.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_UiWorker_18', 0, async () => {
      const input: string = 'ab,beta,Alpha,ab,';
      const expected: string = ',Alpha,ab,ab,beta';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario35_UiWorker_19
    // @tc.name UiWorkerScenario35_UiWorker_19
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 666.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_UiWorker_19', 0, async () => {
      const input: string = 'a-b';
      const expected: string = 'a-b';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario35_Group_20
    // @tc.name UiWorkerScenario35_Group_20
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 667.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_Group_20', 0, async () => {
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

    // @tc.number UiWorkerScenario35_Sendable_21
    // @tc.name UiWorkerScenario35_Sendable_21
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 668.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_Sendable_21', 0, async () => {
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

    // @tc.number UiWorkerScenario35_UiWorker_22
    // @tc.name UiWorkerScenario35_UiWorker_22
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 669.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_UiWorker_22', 0, async () => {
      const input: string = '';
      const expected: string = 'No input for the string to be sorted.\n';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario35_UiWorker_23
    // @tc.name UiWorkerScenario35_UiWorker_23
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 670.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_UiWorker_23', 0, async () => {
      const input: string = 'ß,beta,Alpha,ß,';
      const expected: string = ',Alpha,beta,ß,ß';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario35_UiWorker_24
    // @tc.name UiWorkerScenario35_UiWorker_24
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 671.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_UiWorker_24', 0, async () => {
      const input: string = 'Ω';
      const expected: string = 'Ω';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario35_Copy_25
    // @tc.name UiWorkerScenario35_Copy_25
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 672.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_Copy_25', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_971');
      try {
        const expected: string = 'a\nfile content\nxxxxxx';
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

    // @tc.number UiWorkerScenario35_UiWorker_26
    // @tc.name UiWorkerScenario35_UiWorker_26
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 673.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_UiWorker_26', 0, async () => {
      const input: string = 'Z,z,A,01,1,a,Z';
      const expected: string = '01,1,A,Z,Z,a,z';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario35_Group_27
    // @tc.name UiWorkerScenario35_Group_27
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 674.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_Group_27', 0, async () => {
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

    // @tc.number UiWorkerScenario35_UiWorker_28
    // @tc.name UiWorkerScenario35_UiWorker_28
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 675.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_UiWorker_28', 0, async () => {
      const input: string = '10,beta,Alpha,10,';
      const expected: string = ',10,10,Alpha,beta';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario35_UiWorker_29
    // @tc.name UiWorkerScenario35_UiWorker_29
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 676.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_UiWorker_29', 0, async () => {
      const input: string = '2';
      const expected: string = '2';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario35_UiWorker_30
    // @tc.name UiWorkerScenario35_UiWorker_30
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 677.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_UiWorker_30', 0, async () => {
      const input: string = ' , , ';
      const expected: string = ',, ';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario35_UiWorker_31
    // @tc.name UiWorkerScenario35_UiWorker_31
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 678.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_UiWorker_31', 0, async () => {
      const input: string = 'é,z,A,01,1,a,Z';
      const expected: string = '01,1,A,Z,a,z,é';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario35_Sendable_32
    // @tc.name UiWorkerScenario35_Sendable_32
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 679.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_Sendable_32', 0, async () => {
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

    // @tc.number UiWorkerScenario35_UiWorker_33
    // @tc.name UiWorkerScenario35_UiWorker_33
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 680.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_UiWorker_33', 0, async () => {
      const input: string = '😀,beta,Alpha,😀,';
      const expected: string = ',Alpha,beta,😀,😀';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario35_Group_34
    // @tc.name UiWorkerScenario35_Group_34
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 681.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_Group_34', 0, async () => {
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

    // @tc.number UiWorkerScenario35_UiWorker_35
    // @tc.name UiWorkerScenario35_UiWorker_35
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 682.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_UiWorker_35', 0, async () => {
      const input: string = 'a-b,a-b,a-b';
      const expected: string = 'a-b,a-b,a-b';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario35_UiWorker_36
    // @tc.name UiWorkerScenario35_UiWorker_36
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 683.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario35_UiWorker_36', 0, async () => {
      const input: string = 'a_b,z,A,01,1,a,Z';
      const expected: string = '01,1,A,Z,a,a_b,z';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });
  });
}
