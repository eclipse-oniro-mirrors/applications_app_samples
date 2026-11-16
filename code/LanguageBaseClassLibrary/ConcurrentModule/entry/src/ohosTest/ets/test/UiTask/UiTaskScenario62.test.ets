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

// Adapted from ets/test/PowerValidation/PowerInterruptionRecovery.test.ets.
// Real application exports and entrypoints replace TV-only services and models.
export default function UiTaskScenario62(): void {
  describe('UiTaskScenario62', () => {
    const recorder: shared.OperationRecorder = new shared.OperationRecorder();
    beforeAll(() => {
      hilog.info(0xf811, 'UiTaskScenario62', 'Suite started');
    });
    beforeEach(() => {
      recorder.clear();
    });
    afterEach(() => {
      hilog.info(0xf811, 'UiTaskScenario62', 'Recorded operations: %{public}d', recorder.count());
    });
    afterAll(() => {
      recorder.clear();
      hilog.info(0xf811, 'UiTaskScenario62', 'Suite completed');
    });

    // @tc.number UiTaskScenario62_UiTask_00
    // @tc.name UiTaskScenario62_UiTask_00
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 1160.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario62_UiTask_00', 0, async () => {
      const input: string = '😀,beta,Alpha,😀,';
      const expected: string = 'Task executed successfully: ,Alpha,beta,😀,😀\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario62_UiTask_01
    // @tc.name UiTaskScenario62_UiTask_01
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 1161.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario62_UiTask_01', 0, async () => {
      const input: string = 'ab';
      const expected: string = 'Task executed successfully: ab\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario62_UiTask_02
    // @tc.name UiTaskScenario62_UiTask_02
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 1162.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario62_UiTask_02', 0, async () => {
      const input: string = 'a-b,a-b,a-b';
      const expected: string = 'Task executed successfully: a-b,a-b,a-b\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario62_UiTask_03
    // @tc.name UiTaskScenario62_UiTask_03
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 1163.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario62_UiTask_03', 0, async () => {
      const input: string = 'a_b,z,A,01,1,a,Z';
      const expected: string = 'Task executed successfully: 01,1,A,Z,a,a_b,z\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario62_UiTask_04
    // @tc.name UiTaskScenario62_UiTask_04
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 1164.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario62_UiTask_04', 0, async () => {
      const input: string = '';
      const expected: string = 'No input for the string to be sorted.\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario62_UiTask_05
    // @tc.name UiTaskScenario62_UiTask_05
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 1165.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario62_UiTask_05', 0, async () => {
      const input: string = ',beta,Alpha,,';
      const expected: string = 'Task executed successfully: ,,,Alpha,beta\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario62_Group_06
    // @tc.name UiTaskScenario62_Group_06
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1166.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario62_Group_06', 0, async () => {
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

    // @tc.number UiTaskScenario62_UiTask_07
    // @tc.name UiTaskScenario62_UiTask_07
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 1167.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario62_UiTask_07', 0, async () => {
      const input: string = 'Ω,Ω,Ω';
      const expected: string = 'Task executed successfully: Ω,Ω,Ω\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario62_UiTask_08
    // @tc.name UiTaskScenario62_UiTask_08
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 1168.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario62_UiTask_08', 0, async () => {
      const input: string = 'a,z,A,01,1,a,Z';
      const expected: string = 'Task executed successfully: 01,1,A,Z,a,a,z\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario62_UiTask_09
    // @tc.name UiTaskScenario62_UiTask_09
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 1169.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario62_UiTask_09', 0, async () => {
      const input: string = '';
      const expected: string = 'No input for the string to be sorted.\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario62_Sendable_10
    // @tc.name UiTaskScenario62_Sendable_10
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1170.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario62_Sendable_10', 0, async () => {
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

    // @tc.number UiTaskScenario62_UiTask_11
    // @tc.name UiTaskScenario62_UiTask_11
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 1171.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario62_UiTask_11', 0, async () => {
      const input: string = '10';
      const expected: string = 'Task executed successfully: 10\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario62_Copy_12
    // @tc.name UiTaskScenario62_Copy_12
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1172.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario62_Copy_12', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1725');
      try {
        const expected: string = '2\nfile content\nxx';
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

    // @tc.number UiTaskScenario62_Group_13
    // @tc.name UiTaskScenario62_Group_13
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1173.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario62_Group_13', 0, async () => {
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

    // @tc.number UiTaskScenario62_UiTask_14
    // @tc.name UiTaskScenario62_UiTask_14
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 1174.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario62_UiTask_14', 0, async () => {
      const input: string = '';
      const expected: string = 'No input for the string to be sorted.\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario62_UiTask_15
    // @tc.name UiTaskScenario62_UiTask_15
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 1175.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario62_UiTask_15', 0, async () => {
      const input: string = '中,beta,Alpha,中,';
      const expected: string = 'Task executed successfully: ,Alpha,beta,中,中\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario62_UiTask_16
    // @tc.name UiTaskScenario62_UiTask_16
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 1176.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario62_UiTask_16', 0, async () => {
      const input: string = '😀';
      const expected: string = 'Task executed successfully: 😀\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario62_UiTask_17
    // @tc.name UiTaskScenario62_UiTask_17
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 1177.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario62_UiTask_17', 0, async () => {
      const input: string = 'ab,ab,ab';
      const expected: string = 'Task executed successfully: ab,ab,ab\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario62_UiTask_18
    // @tc.name UiTaskScenario62_UiTask_18
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 1178.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario62_UiTask_18', 0, async () => {
      const input: string = 'a-b,z,A,01,1,a,Z';
      const expected: string = 'Task executed successfully: 01,1,A,Z,a,a-b,z\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario62_UiTask_19
    // @tc.name UiTaskScenario62_UiTask_19
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 1179.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario62_UiTask_19', 0, async () => {
      const input: string = '';
      const expected: string = 'No input for the string to be sorted.\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario62_Group_20
    // @tc.name UiTaskScenario62_Group_20
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1180.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario62_Group_20', 0, async () => {
      const input: string[] = ['\n', 'beta', 'Alpha', '\n', ''];
      const expected: string[] = ['', '\n', '\n', 'Alpha', 'beta'];
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

    // @tc.number UiTaskScenario62_Sendable_21
    // @tc.name UiTaskScenario62_Sendable_21
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 1181.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario62_Sendable_21', 0, async () => {
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

    // @tc.number UiTaskScenario62_UiTask_22
    // @tc.name UiTaskScenario62_UiTask_22
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 1182.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario62_UiTask_22', 0, async () => {
      const input: string = 'ß,ß,ß';
      const expected: string = 'Task executed successfully: ß,ß,ß\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario62_UiTask_23
    // @tc.name UiTaskScenario62_UiTask_23
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 1183.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario62_UiTask_23', 0, async () => {
      const input: string = 'Ω,z,A,01,1,a,Z';
      const expected: string = 'Task executed successfully: 01,1,A,Z,a,z,Ω\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario62_UiTask_24
    // @tc.name UiTaskScenario62_UiTask_24
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 1184.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario62_UiTask_24', 0, async () => {
      const input: string = '';
      const expected: string = 'No input for the string to be sorted.\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario62_Copy_25
    // @tc.name UiTaskScenario62_Copy_25
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 1185.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario62_Copy_25', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_1738');
      try {
        const expected: string = 'Z\nfile content\nxxxxxx';
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

    // @tc.number UiTaskScenario62_UiTask_26
    // @tc.name UiTaskScenario62_UiTask_26
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 1186.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario62_UiTask_26', 0, async () => {
      const input: string = '';
      const expected: string = 'No input for the string to be sorted.\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario62_Group_27
    // @tc.name UiTaskScenario62_Group_27
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 1187.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario62_Group_27', 0, async () => {
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

    // @tc.number UiTaskScenario62_UiTask_28
    // @tc.name UiTaskScenario62_UiTask_28
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 1188.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario62_UiTask_28', 0, async () => {
      const input: string = '2,z,A,01,1,a,Z';
      const expected: string = 'Task executed successfully: 01,1,2,A,Z,a,z\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario62_UiTask_29
    // @tc.name UiTaskScenario62_UiTask_29
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 1189.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario62_UiTask_29', 0, async () => {
      const input: string = '';
      const expected: string = 'No input for the string to be sorted.\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });
  });
}
