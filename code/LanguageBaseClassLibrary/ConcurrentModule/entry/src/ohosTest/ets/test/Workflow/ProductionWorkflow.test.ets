/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect } from '@ohos/hypium';
import * as shared from '../Shared/SharedDriver';

export default function productionWorkflowTest(): void {
  describe('ProductionWorkflow', () => {
    // @tc.number ProductionWorkflow_DelayedSort_00
    // @tc.name ProductionWorkflow_DelayedSort_00
    // @tc.desc Verify TaskPoolTab executeDelay publishes sorted text after the three second worker delay.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('ProductionWorkflow_DelayedSort_00', 0, async () => {
      await shared.openSortPage(true);
      await shared.inputId('taskPoolInPutTextArea', 'z,a,m');
      const started: number = Date.now();
      await shared.clickId('exeDelayButton');
      const expected: string = 'Task executed successfully: a,m,z\n';
      const actual: string = await shared.waitForText('taskPoolOutPutText', expected);
      const elapsed: number = Date.now() - started;
      expect(actual).assertEqual(expected);
      expect(elapsed).assertLargerOrEqual(2900);
      await shared.openHome();
    });

    // @tc.number ProductionWorkflow_TaskGroup_001
    // @tc.name ProductionWorkflow_TaskGroup_001
    // @tc.desc Verify TaskPoolTab taskAdd and TaskGroupExec preserve task insertion order and reset group mode.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1

    it('ProductionWorkflow_EmptyCancellation_01', 0, async () => {
      await shared.openSortPage(true);
      await shared.inputId('taskPoolInPutTextArea', 'z,a');
      await shared.clickId('exeCancelButton');
      const expected: string = 'The current task queue has no cancellable tasks.\n';
      const actual: string = await shared.waitForText('taskPoolOutPutText', expected);
      expect(actual).assertEqual(expected);
      const input: string = await shared.readId('taskPoolInPutTextArea');
      expect(input).assertEqual('z,a');
      await shared.openHome();
    });

    // @tc.number ProductionWorkflow_CompletedCancellation_02
    // @tc.name ProductionWorkflow_CompletedCancellation_02
    // @tc.desc Verify TaskPoolTab removes a completed task from its cancellation stack.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('ProductionWorkflow_CompletedCancellation_02', 0, async () => {
      await shared.openSortPage(true);
      await shared.inputId('taskPoolInPutTextArea', 'z,a');
      await shared.clickId('exeImmButton');
      const sorted: string = 'Task executed successfully: a,z\n';
      await shared.waitForText('taskPoolOutPutText', sorted);
      await shared.clickId('exeCancelButton');
      const expected: string = sorted + 'The current task queue has no cancellable tasks.\n';
      const actual: string = await shared.waitForText('taskPoolOutPutText', expected);
      expect(actual).assertEqual(expected);
      await shared.openHome();
    });

    // @tc.number ProductionWorkflow_EmptyAdd_03
    // @tc.name ProductionWorkflow_EmptyAdd_03
    // @tc.desc Verify TaskPoolTab taskAdd rejects empty input without entering TaskGroup mode.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('ProductionWorkflow_EmptyAdd_03', 0, async () => {
      await shared.openSortPage(true);
      await shared.clickId('addButton');
      const rejected: string = await shared.readId('taskPoolOutPutText');
      expect(rejected).assertEqual('No input for the string to be sorted.\n');
      await shared.inputId('taskPoolInPutTextArea', 'b,a');
      await shared.clickId('exeImmButton');
      const expected: string = 'Task executed successfully: a,b\n';
      const actual: string = await shared.waitForText('taskPoolOutPutText', expected);
      expect(actual).assertEqual(expected);
      await shared.openHome();
    });

    // @tc.number ProductionWorkflow_EditInvalidatesResult_04
    // @tc.name ProductionWorkflow_EditInvalidatesResult_04
    // @tc.desc Verify WorkerTab onChange invalidates the previous result before a new Worker request.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('ProductionWorkflow_EditInvalidatesResult_04', 0, async () => {
      const first: string = await shared.sortThroughUi('z,a', false);
      expect(first).assertEqual('a,z');
      await shared.inputId('jsWorkerInPutTextArea', 'y,b');
      const invalidated: string = await shared.readId('jsWorkerOutPutText');
      expect(invalidated).assertEqual('');
      await shared.clickId('workerStrSort');
      const second: string = await shared.waitForText('jsWorkerOutPutText', 'b,y');
      expect(second).assertEqual('b,y');
      await shared.openHome();
    });

    // @tc.number ProductionWorkflow_ClearAndResort_05
    // @tc.name ProductionWorkflow_ClearAndResort_05
    // @tc.desc Verify WorkerTab clear invalidates cached input before another sort request.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('ProductionWorkflow_ClearAndResort_05', 0, async () => {
      const first: string = await shared.sortThroughUi('z,a', false);
      expect(first).assertEqual('a,z');
      await shared.clickId('workerClearButton');
      await shared.clickId('workerStrSort');
      const expected: string = 'No input for the string to be sorted.\n';
      const actual: string = await shared.waitForText('jsWorkerOutPutText', expected);
      expect(actual).assertEqual(expected);
      await shared.openHome();
    });

    // @tc.number ProductionWorkflow_TabIsolation_06
    // @tc.name ProductionWorkflow_TabIsolation_06
    // @tc.desc Verify switching StrSort tabs preserves WorkerTab input and does not copy it into TaskPoolTab.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('ProductionWorkflow_TabIsolation_06', 0, async () => {
      await shared.openSortPage(false);
      await shared.inputId('jsWorkerInPutTextArea', 'worker,input');
      await shared.clickId('tabTaskPool');
      const initialTaskInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(initialTaskInput).assertEqual('');
      await shared.inputId('taskPoolInPutTextArea', 'task,input');
      await shared.clickId('tabJsWorker');
      const workerInput: string = await shared.readId('jsWorkerInPutTextArea');
      expect(workerInput).assertEqual('worker,input');
      await shared.clickId('tabTaskPool');
      const taskInput: string = await shared.readId('taskPoolInPutTextArea');
      expect(taskInput).assertEqual('task,input');
      await shared.openHome();
    });

    // @tc.number ProductionWorkflow_FileNavigation_07
    // @tc.name ProductionWorkflow_FileNavigation_07
    // @tc.desc Verify CopyFile page renders generated source files and returns to the home page.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('ProductionWorkflow_FileNavigation_07', 0, async () => {
      await shared.openHome();
      await shared.clickId('fileCopy');
      await shared.waitForComponent('listWorkerFile');
      await shared.waitForComponent('checkbox0');
      const log: string = await shared.readId('copyFileLog');
      expect(log).assertEqual('');
      await shared.clickId('backIndex2');
      await shared.waitForComponent('fileCopy');
      await shared.waitForComponent('strSort');
    });

    // @tc.number ProductionWorkflow_LockOrdering_08
    // @tc.name ProductionWorkflow_LockOrdering_08
    // @tc.desc Verify TestA setCount operations are awaited and the final explicit write is observable.
    // @tc.size MEDIUM
    // @tc.type Function
    // @tc.level Level 1
    it('ProductionWorkflow_LockOrdering_08', 0, async () => {
      const data: shared.TestA = new shared.TestA();
      const writes: Promise<void>[] = [];
      for (let index: number = 0; index < 20; index++) {
        writes.push(data.setCount(index));
      }
      await Promise.all(writes);
      await data.setCount(100);
      const count: number = await data.getCount();
      expect(count).assertEqual(100);
    });
  });
}
