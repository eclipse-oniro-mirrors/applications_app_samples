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

// Adapted from ets/test/Interaction/UIComponentRendering.test.ets.
// Real application exports and entrypoints replace TV-only services and models.
export default function UiTaskScenario23(): void {
  describe('UiTaskScenario23', () => {
    const recorder: shared.OperationRecorder = new shared.OperationRecorder();
    beforeAll(() => {
      hilog.info(0xf811, 'UiTaskScenario23', 'Suite started');
    });
    beforeEach(() => {
      recorder.clear();
    });
    afterEach(() => {
      hilog.info(0xf811, 'UiTaskScenario23', 'Recorded operations: %{public}d', recorder.count());
    });
    afterAll(() => {
      recorder.clear();
      hilog.info(0xf811, 'UiTaskScenario23', 'Suite completed');
    });

    // @tc.number UiTaskScenario23_UiTask_00
    // @tc.name UiTaskScenario23_UiTask_00
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 419.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_UiTask_00', 0, async () => {
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

    // @tc.number UiTaskScenario23_UiTask_01
    // @tc.name UiTaskScenario23_UiTask_01
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 420.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_UiTask_01', 0, async () => {
      const input: string = '2,beta,Alpha,2,';
      const expected: string = 'Task executed successfully: ,2,2,Alpha,beta\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario23_UiTask_02
    // @tc.name UiTaskScenario23_UiTask_02
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 421.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_UiTask_02', 0, async () => {
      const input: string = ' ';
      const expected: string = 'Task executed successfully: \n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario23_UiTask_03
    // @tc.name UiTaskScenario23_UiTask_03
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 422.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_UiTask_03', 0, async () => {
      const input: string = 'é,é,é';
      const expected: string = 'Task executed successfully: é,é,é\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario23_UiTask_04
    // @tc.name UiTaskScenario23_UiTask_04
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 423.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_UiTask_04', 0, async () => {
      const input: string = '中,z,A,01,1,a,Z';
      const expected: string = 'Task executed successfully: 01,1,A,Z,a,z,中\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario23_UiTask_05
    // @tc.name UiTaskScenario23_UiTask_05
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 424.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_UiTask_05', 0, async () => {
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

    // @tc.number UiTaskScenario23_Group_06
    // @tc.name UiTaskScenario23_Group_06
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 425.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_Group_06', 0, async () => {
      const input: string[] = ['a\u0000b', 'beta', 'Alpha', 'a\u0000b', ''];
      const expected: string[] = ['', 'Alpha', 'a\u0000b', 'a\u0000b', 'beta'];
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

    // @tc.number UiTaskScenario23_UiTask_07
    // @tc.name UiTaskScenario23_UiTask_07
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 426.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_UiTask_07', 0, async () => {
      const input: string = 'a-b';
      const expected: string = 'Task executed successfully: a-b\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario23_UiTask_08
    // @tc.name UiTaskScenario23_UiTask_08
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 427.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_UiTask_08', 0, async () => {
      const input: string = 'a_b,a_b,a_b';
      const expected: string = 'Task executed successfully: a_b,a_b,a_b\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario23_UiTask_09
    // @tc.name UiTaskScenario23_UiTask_09
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 428.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_UiTask_09', 0, async () => {
      const input: string = ',z,A,01,1,a,Z';
      const expected: string = 'Task executed successfully: ,01,1,A,Z,a,z\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario23_Sendable_10
    // @tc.name UiTaskScenario23_Sendable_10
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 429.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_Sendable_10', 0, async () => {
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

    // @tc.number UiTaskScenario23_UiTask_11
    // @tc.name UiTaskScenario23_UiTask_11
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 430.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_UiTask_11', 0, async () => {
      const input: string = 'ß,beta,Alpha,ß,';
      const expected: string = 'Task executed successfully: ,Alpha,beta,ß,ß\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario23_Copy_12
    // @tc.name UiTaskScenario23_Copy_12
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 431.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_Copy_12', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_622');
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

    // @tc.number UiTaskScenario23_Group_13
    // @tc.name UiTaskScenario23_Group_13
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 432.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_Group_13', 0, async () => {
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

    // @tc.number UiTaskScenario23_UiTask_14
    // @tc.name UiTaskScenario23_UiTask_14
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 433.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_UiTask_14', 0, async () => {
      const input: string = 'Z,z,A,01,1,a,Z';
      const expected: string = 'Task executed successfully: 01,1,A,Z,Z,a,z\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario23_UiTask_15
    // @tc.name UiTaskScenario23_UiTask_15
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 434.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_UiTask_15', 0, async () => {
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

    // @tc.number UiTaskScenario23_UiTask_16
    // @tc.name UiTaskScenario23_UiTask_16
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 435.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_UiTask_16', 0, async () => {
      const input: string = '10,beta,Alpha,10,';
      const expected: string = 'Task executed successfully: ,10,10,Alpha,beta\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario23_UiTask_17
    // @tc.name UiTaskScenario23_UiTask_17
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 436.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_UiTask_17', 0, async () => {
      const input: string = '2';
      const expected: string = 'Task executed successfully: 2\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario23_UiTask_18
    // @tc.name UiTaskScenario23_UiTask_18
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 437.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_UiTask_18', 0, async () => {
      const input: string = ' , , ';
      const expected: string = 'Task executed successfully: ,, \n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario23_UiTask_19
    // @tc.name UiTaskScenario23_UiTask_19
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 438.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_UiTask_19', 0, async () => {
      const input: string = 'é,z,A,01,1,a,Z';
      const expected: string = 'Task executed successfully: 01,1,A,Z,a,z,é\n';
      const actual: string = await shared.sortThroughUi(input, true, 'exeImmButton');
      expect(actual).assertEqual(expected);
      await shared.clickId('taskPoolClearButton');
      const cleared: string = await shared.readId('taskPoolOutPutText');
      expect(cleared).assertEqual('');
      const clearedInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(clearedInput).assertEqual('');
      await shared.openHome();
    });

    // @tc.number UiTaskScenario23_Group_20
    // @tc.name UiTaskScenario23_Group_20
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 439.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_Group_20', 0, async () => {
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

    // @tc.number UiTaskScenario23_Sendable_21
    // @tc.name UiTaskScenario23_Sendable_21
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 440.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_Sendable_21', 0, async () => {
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

    // @tc.number UiTaskScenario23_UiTask_22
    // @tc.name UiTaskScenario23_UiTask_22
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 441.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_UiTask_22', 0, async () => {
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

    // @tc.number UiTaskScenario23_UiTask_23
    // @tc.name UiTaskScenario23_UiTask_23
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 442.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_UiTask_23', 0, async () => {
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

    // @tc.number UiTaskScenario23_UiTask_24
    // @tc.name UiTaskScenario23_UiTask_24
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 443.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_UiTask_24', 0, async () => {
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

    // @tc.number UiTaskScenario23_Copy_25
    // @tc.name UiTaskScenario23_Copy_25
    // @tc.desc Verify Copy application behavior, isolation and complete observable results for scenario 444.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_Copy_25', 0, async () => {
      const fixture: shared.FileFixture = shared.createFileFixture('case_635');
      try {
        const expected: string = '\n\nfile content\nxxx';
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

    // @tc.number UiTaskScenario23_UiTask_26
    // @tc.name UiTaskScenario23_UiTask_26
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 445.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_UiTask_26', 0, async () => {
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

    // @tc.number UiTaskScenario23_Group_27
    // @tc.name UiTaskScenario23_Group_27
    // @tc.desc Verify Group application behavior, isolation and complete observable results for scenario 446.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_Group_27', 0, async () => {
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

    // @tc.number UiTaskScenario23_UiTask_28
    // @tc.name UiTaskScenario23_UiTask_28
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 447.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_UiTask_28', 0, async () => {
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

    // @tc.number UiTaskScenario23_UiTask_29
    // @tc.name UiTaskScenario23_UiTask_29
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 448.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_UiTask_29', 0, async () => {
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

    // @tc.number UiTaskScenario23_UiTask_30
    // @tc.name UiTaskScenario23_UiTask_30
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 449.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_UiTask_30', 0, async () => {
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

    // @tc.number UiTaskScenario23_UiTask_31
    // @tc.name UiTaskScenario23_UiTask_31
    // @tc.desc Verify UiTask application behavior, isolation and complete observable results for scenario 450.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_UiTask_31', 0, async () => {
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

    // @tc.number UiTaskScenario23_Sendable_32
    // @tc.name UiTaskScenario23_Sendable_32
    // @tc.desc Verify Sendable application behavior, isolation and complete observable results for scenario 451.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('UiTaskScenario23_Sendable_32', 0, async () => {
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
  });
}
