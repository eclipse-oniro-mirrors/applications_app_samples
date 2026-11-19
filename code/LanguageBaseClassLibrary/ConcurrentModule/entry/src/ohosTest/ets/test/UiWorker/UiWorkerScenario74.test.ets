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

// Adapted from ets/test/Validation/FocusManagerValidation.test.ets.
// Real application exports and entrypoints replace TV-only services and models.
export default function UiWorkerScenario74(): void {
  describe('UiWorkerScenario74', () => {
    const recorder: shared.OperationRecorder = new shared.OperationRecorder();
    beforeAll(() => {
      hilog.info(0xf811, 'UiWorkerScenario74', 'Suite started');
    });
    beforeEach(() => {
      recorder.clear();
    });
    afterEach(() => {
      hilog.info(0xf811, 'UiWorkerScenario74', 'Recorded operations: %{public}d', recorder.count());
    });
    afterAll(() => {
      recorder.clear();
      hilog.info(0xf811, 'UiWorkerScenario74', 'Suite completed');
    });

    // @tc.number UiWorkerScenario74_UiWorker_00
    // @tc.name UiWorkerScenario74_UiWorker_00
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1388.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_00', 0, async () => {
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

    // @tc.number UiWorkerScenario74_UiWorker_01
    // @tc.name UiWorkerScenario74_UiWorker_01
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1389.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_01', 0, async () => {
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

    // @tc.number UiWorkerScenario74_UiWorker_02
    // @tc.name UiWorkerScenario74_UiWorker_02
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1390.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_02', 0, async () => {
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

    // @tc.number UiWorkerScenario74_UiWorker_03
    // @tc.name UiWorkerScenario74_UiWorker_03
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1391.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_03', 0, async () => {
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

    // @tc.number UiWorkerScenario74_UiWorker_04
    // @tc.name UiWorkerScenario74_UiWorker_04
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1392.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_04', 0, async () => {
      const input: string = 'a,a,a';
      const expected: string = 'a,a,a';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario74_UiWorker_05
    // @tc.name UiWorkerScenario74_UiWorker_05
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1393.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_05', 0, async () => {
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

    // @tc.number UiWorkerScenario74_Group_06
    // @tc.name UiWorkerScenario74_Group_06
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1394.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_Group_06', 0, async () => {
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

    // @tc.number UiWorkerScenario74_UiWorker_07
    // @tc.name UiWorkerScenario74_UiWorker_07
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1395.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_07', 0, async () => {
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

    // @tc.number UiWorkerScenario74_UiWorker_08
    // @tc.name UiWorkerScenario74_UiWorker_08
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1396.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_08', 0, async () => {
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

    // @tc.number UiWorkerScenario74_UiWorker_09
    // @tc.name UiWorkerScenario74_UiWorker_09
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1397.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_09', 0, async () => {
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

    // @tc.number UiWorkerScenario74_Sendable_10
    // @tc.name UiWorkerScenario74_Sendable_10
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1398.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_Sendable_10', 0, async () => {
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

    // @tc.number UiWorkerScenario74_UiWorker_11
    // @tc.name UiWorkerScenario74_UiWorker_11
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1399.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_11', 0, async () => {
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

    // @tc.number UiWorkerScenario74_Copy_12
    // @tc.name UiWorkerScenario74_Copy_12
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1400.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_Copy_12', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_2095');
      try {
        const expected: string = '😀\nfile content\nxxxxx';
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

    // @tc.number UiWorkerScenario74_Group_13
    // @tc.name UiWorkerScenario74_Group_13
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1401.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_Group_13', 0, async () => {
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

    // @tc.number UiWorkerScenario74_UiWorker_14
    // @tc.name UiWorkerScenario74_UiWorker_14
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1402.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_14', 0, async () => {
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

    // @tc.number UiWorkerScenario74_UiWorker_15
    // @tc.name UiWorkerScenario74_UiWorker_15
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1403.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_15', 0, async () => {
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

    // @tc.number UiWorkerScenario74_UiWorker_16
    // @tc.name UiWorkerScenario74_UiWorker_16
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1404.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_16', 0, async () => {
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

    // @tc.number UiWorkerScenario74_UiWorker_17
    // @tc.name UiWorkerScenario74_UiWorker_17
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1405.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_17', 0, async () => {
      const input: string = ',beta,Alpha,,';
      const expected: string = ',,,Alpha,beta';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario74_UiWorker_18
    // @tc.name UiWorkerScenario74_UiWorker_18
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1406.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_18', 0, async () => {
      const input: string = 'ß';
      const expected: string = 'ß';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario74_UiWorker_19
    // @tc.name UiWorkerScenario74_UiWorker_19
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1407.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_19', 0, async () => {
      const input: string = 'Ω,Ω,Ω';
      const expected: string = 'Ω,Ω,Ω';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario74_Group_20
    // @tc.name UiWorkerScenario74_Group_20
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1408.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_Group_20', 0, async () => {
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

    // @tc.number UiWorkerScenario74_Sendable_21
    // @tc.name UiWorkerScenario74_Sendable_21
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1409.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_Sendable_21', 0, async () => {
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

    // @tc.number UiWorkerScenario74_UiWorker_22
    // @tc.name UiWorkerScenario74_UiWorker_22
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1410.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_22', 0, async () => {
      const input: string = ',beta,Alpha,,';
      const expected: string = ',,,Alpha,beta';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario74_UiWorker_23
    // @tc.name UiWorkerScenario74_UiWorker_23
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1411.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_23', 0, async () => {
      const input: string = '10';
      const expected: string = '10';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario74_UiWorker_24
    // @tc.name UiWorkerScenario74_UiWorker_24
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1412.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_24', 0, async () => {
      const input: string = '2,2,2';
      const expected: string = '2,2,2';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario74_Copy_25
    // @tc.name UiWorkerScenario74_Copy_25
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1413.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_Copy_25', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_2108');
      try {
        const expected: string = ' \nfile content\n';
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

    // @tc.number UiWorkerScenario74_UiWorker_26
    // @tc.name UiWorkerScenario74_UiWorker_26
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1414.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_26', 0, async () => {
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

    // @tc.number UiWorkerScenario74_Group_27
    // @tc.name UiWorkerScenario74_Group_27
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1415.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_Group_27', 0, async () => {
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

    // @tc.number UiWorkerScenario74_UiWorker_28
    // @tc.name UiWorkerScenario74_UiWorker_28
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1416.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_28', 0, async () => {
      const input: string = '😀';
      const expected: string = '😀';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario74_UiWorker_29
    // @tc.name UiWorkerScenario74_UiWorker_29
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1417.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_29', 0, async () => {
      const input: string = 'ab,ab,ab';
      const expected: string = 'ab,ab,ab';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario74_UiWorker_30
    // @tc.name UiWorkerScenario74_UiWorker_30
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1418.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_30', 0, async () => {
      const input: string = 'a-b,z,A,01,1,a,Z';
      const expected: string = '01,1,A,Z,a,a-b,z';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario74_UiWorker_31
    // @tc.name UiWorkerScenario74_UiWorker_31
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1419.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_31', 0, async () => {
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

    // @tc.number UiWorkerScenario74_Sendable_32
    // @tc.name UiWorkerScenario74_Sendable_32
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1420.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_Sendable_32', 0, async () => {
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

    // @tc.number UiWorkerScenario74_UiWorker_33
    // @tc.name UiWorkerScenario74_UiWorker_33
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1421.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_33', 0, async () => {
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

    // @tc.number UiWorkerScenario74_Group_34
    // @tc.name UiWorkerScenario74_Group_34
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1422.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_Group_34', 0, async () => {
      const input: string[] = ['ß', 'ß', 'ß'];
      const expected: string[] = ['ß', 'ß', 'ß'];
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

    // @tc.number UiWorkerScenario74_UiWorker_35
    // @tc.name UiWorkerScenario74_UiWorker_35
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1423.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_35', 0, async () => {
      const input: string = 'Ω,z,A,01,1,a,Z';
      const expected: string = '01,1,A,Z,a,z,Ω';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario74_UiWorker_36
    // @tc.name UiWorkerScenario74_UiWorker_36
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1424.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_36', 0, async () => {
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

    // @tc.number UiWorkerScenario74_UiWorker_37
    // @tc.name UiWorkerScenario74_UiWorker_37
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1425.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_37', 0, async () => {
      const input: string = 'Z,beta,Alpha,Z,';
      const expected: string = ',Alpha,Z,Z,beta';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario74_Copy_38
    // @tc.name UiWorkerScenario74_Copy_38
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1426.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_Copy_38', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_2121');
      try {
        const expected: string = '\nfile content\nxxxx';
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

    // @tc.number UiWorkerScenario74_UiWorker_39
    // @tc.name UiWorkerScenario74_UiWorker_39
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1427.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_39', 0, async () => {
      const input: string = '10,10,10';
      const expected: string = '10,10,10';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario74_UiWorker_40
    // @tc.name UiWorkerScenario74_UiWorker_40
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1428.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_40', 0, async () => {
      const input: string = '2,z,A,01,1,a,Z';
      const expected: string = '01,1,2,A,Z,a,z';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario74_Group_41
    // @tc.name UiWorkerScenario74_Group_41
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1429.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_Group_41', 0, async () => {
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

    // @tc.number UiWorkerScenario74_UiWorker_42
    // @tc.name UiWorkerScenario74_UiWorker_42
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1430.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_42', 0, async () => {
      const input: string = 'é,beta,Alpha,é,';
      const expected: string = ',Alpha,beta,é,é';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario74_Sendable_43
    // @tc.name UiWorkerScenario74_Sendable_43
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1431.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_Sendable_43', 0, async () => {
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

    // @tc.number UiWorkerScenario74_UiWorker_44
    // @tc.name UiWorkerScenario74_UiWorker_44
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1432.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_44', 0, async () => {
      const input: string = '😀,😀,😀';
      const expected: string = '😀,😀,😀';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario74_UiWorker_45
    // @tc.name UiWorkerScenario74_UiWorker_45
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1433.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_45', 0, async () => {
      const input: string = 'ab,z,A,01,1,a,Z';
      const expected: string = '01,1,A,Z,a,ab,z';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario74_UiWorker_46
    // @tc.name UiWorkerScenario74_UiWorker_46
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1434.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_46', 0, async () => {
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

    // @tc.number UiWorkerScenario74_UiWorker_47
    // @tc.name UiWorkerScenario74_UiWorker_47
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1435.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_47', 0, async () => {
      const input: string = 'a_b,beta,Alpha,a_b,';
      const expected: string = ',Alpha,a_b,a_b,beta';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario74_Group_48
    // @tc.name UiWorkerScenario74_Group_48
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1436.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_Group_48', 0, async () => {
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

    // @tc.number UiWorkerScenario74_UiWorker_49
    // @tc.name UiWorkerScenario74_UiWorker_49
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1437.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_49', 0, async () => {
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

    // @tc.number UiWorkerScenario74_UiWorker_50
    // @tc.name UiWorkerScenario74_UiWorker_50
    // @tc.desc Verify UiWorker application behavior, isolation and complete observable results for scenario 1438.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_UiWorker_50', 0, async () => {
      const input: string = 'ß,z,A,01,1,a,Z';
      const expected: string = '01,1,A,Z,a,z,ß';
      const actual: string = await shared.sortThroughUi(input, false, 'workerStrSort');
      expect(actual).assertEqual(expected);
      await shared.clickId('workerClearButton');
      const cleared: string = await shared.readId('jsWorkerOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiWorkerScenario74_Copy_51
    // @tc.name UiWorkerScenario74_Copy_51
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1439.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiWorkerScenario74_Copy_51', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_2134');
      try {
        const expected: string = 'Ω\nfile content\nxxxxxxxx';
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
  });
}
