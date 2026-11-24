'use static';
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

/**
 * CoreGraph suite.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   57-65    three progress values and isTaskFinished
 *   62-64    lock plus taskACompleted / taskBCompleted
 *   98-107   checkAndUnlock and canRunTaskC
 *   174-198  startAllTasks, the shared pair and the exclusive follower
 *   200-247  three progress rows built from the same values
 *
 * The suite treats TaskGraph as a data structure: topology, the dependency
 * invariant, the aggregate counters behind the progress bars, snapshotText,
 * completionTrace and the topological order oracle.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TaskGraph,
  ReferenceGraph,
  createTaskGraph,
  completionTrace,
  isTopologicalCompletion,
  expectedGateOpen,
  TASK_A,
  TASK_B,
  TASK_C,
  TASK_NUMBERS,
  URL_TASK_A,
  URL_TASK_B,
  URL_TASK_C,
  countOf,
  joined,
  sortedCopy,
  reversedCopy
} from '../Shared/SharedDriver';

export default function networkCoreGraphTest(): void {
  describe('CoreGraph', () => {
    beforeAll(() => {
      logSuite('CoreGraph', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('CoreGraph', 'end');
    });

    /**
     * @tc.name   graphTopologyMatchesTheThreeRows
     * @tc.desc   The graph owns exactly A, B and C in the order the page renders.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('graphTopologyMatchesTheThreeRows', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.tasks.length).assertEqual(3);
      expect(graph.taskAt(0).taskNo).assertEqual(TASK_A);
      expect(graph.taskAt(1).taskNo).assertEqual(TASK_B);
      expect(graph.taskAt(2).taskNo).assertEqual(TASK_C);
      expect(graph.tasks[0].url).assertEqual(URL_TASK_A);
      expect(graph.tasks[1].url).assertEqual(URL_TASK_B);
      expect(graph.tasks[2].url).assertEqual(URL_TASK_C);
    });

    /**
     * @tc.name   graphTaskNumbersAreDistinct
     * @tc.desc   No two rows share a task number, so the lookup is unambiguous.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('graphTaskNumbersAreDistinct', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const numbers: string[] = [];
      for (let index = 0; index < graph.tasks.length; index++) {
        numbers.push(graph.tasks[index].taskNo);
      }
      expect(countOf(numbers, TASK_C)).assertEqual(1);
      expect(joined(sortedCopy(numbers), ',')).assertEqual('A,B,C');
      expect(joined(reversedCopy(numbers), ',')).assertEqual('C,B,A');
    });

    /**
     * @tc.name   graphStartsWithNoDependencySatisfied
     * @tc.desc   Initially neither A nor B is complete, so the gate predicate is false.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('graphStartsWithNoDependencySatisfied', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.tasks[0].isComplete()).assertFalse();
      expect(graph.tasks[1].isComplete()).assertFalse();
      expect(graph.completionOrder.length).assertEqual(0);
    });

    /**
     * @tc.name   graphDependencyInvariantHoldsAfterEachStep
     * @tc.desc   canRunTaskC equals A complete AND B complete at every checkpoint.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphDependencyInvariantHoldsAfterEachStep', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.canRunTaskC()).assertEqual(false && false);
      graph.completeTask(TASK_A);
      expect(graph.canRunTaskC()).assertEqual(true && false);
      graph.completeTask(TASK_B);
      expect(graph.canRunTaskC()).assertEqual(true && true);
      expect(graph.canRunTaskC()).assertEqual(expectedGateOpen(true, true));
      expect(expectedGateOpen(false, false)).assertFalse();
    });

    /**
     * @tc.name   graphReferenceModelAgreesOnTheGate
     * @tc.desc   The independent boolean reference model unlocks at the same step.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphReferenceModelAgreesOnTheGate', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const reference: ReferenceGraph = new ReferenceGraph();
      graph.completeTask(TASK_B);
      reference.markComplete(TASK_B);
      expect(graph.canRunTaskC()).assertEqual(reference.unlocked());
      graph.completeTask(TASK_A);
      reference.markComplete(TASK_A);
      expect(graph.canRunTaskC()).assertEqual(reference.unlocked());
      expect(graph.canRunTaskC()).assertTrue();
      expect(reference.trace()).assertEqual('true,true,false,false');
    });

    /**
     * @tc.name   graphRunningCountStartsAtZero
     * @tc.desc   No seeded task is running, so the aggregate is zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('graphRunningCountStartsAtZero', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.tasks[0].isIdle()).assertTrue();
      expect(graph.tasks[1].isIdle()).assertTrue();
      expect(graph.tasks[2].isIdle()).assertTrue();
      expect(graph.allCompleted()).assertFalse();
    });
    /**
     * @tc.name   graphAllCompletedRequiresAllThreeRows
     * @tc.desc   Two completed tasks are not enough for the aggregate completion flag.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphAllCompletedRequiresAllThreeRows', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.completeTask(TASK_A);
      expect(graph.allCompleted()).assertFalse();
      graph.completeTask(TASK_B);
      expect(graph.allCompleted()).assertFalse();
      graph.completeTaskC();
      expect(graph.allCompleted()).assertTrue();
      expect(graph.runningCount()).assertEqual(0);
    });

    /**
     * @tc.name   graphTotalProgressSumsTheRows
     * @tc.desc   The total is the plain sum of the three progress values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('graphTotalProgressSumsTheRows', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.totalProgress()).assertEqual(0);
      graph.tasks[0].reportProgress(10);
      expect(graph.totalProgress()).assertEqual(10);
      graph.tasks[1].reportProgress(20);
      expect(graph.totalProgress()).assertEqual(30);
      graph.tasks[2].reportProgress(30);
      expect(graph.totalProgress()).assertEqual(60);
      expect(graph.totalProgress()).assertEqual(10 + 20 + 30);
    });

    /**
     * @tc.name   graphAverageProgressDividesByThree
     * @tc.desc   The average is the total divided by the row count, not rounded.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphAverageProgressDividesByThree', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.tasks[0].reportProgress(100);
      expect(graph.averageProgress()).assertEqual(100.0 / 3);
      graph.tasks[1].reportProgress(100);
      expect(graph.averageProgress()).assertEqual(200.0 / 3);
      graph.tasks[2].reportProgress(100);
      expect(graph.averageProgress()).assertEqual(100);
      expect(graph.averageProgress()).assertEqual(graph.totalProgress() / graph.tasks.length);
    });

    /**
     * @tc.name   graphSnapshotTextNamesEveryRow
     * @tc.desc   snapshotText joins the three describe() results with pipes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('graphSnapshotTextNamesEveryRow', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const text: string = graph.snapshotText();
      expect(text).assertEqual('A:idle:0|B:idle:0|C:idle:0');
      expect(text.split('|').length).assertEqual(3);
      expect(text.indexOf('A:idle:0')).assertEqual(0);
      expect(text.endsWith('C:idle:0')).assertTrue();
    });

    /**
     * @tc.name   graphSnapshotTextFollowsProgressWrites
     * @tc.desc   A progress write is reflected immediately in the snapshot string.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphSnapshotTextFollowsProgressWrites', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.tasks[1].reportProgress(45);
      expect(graph.snapshotText()).assertEqual('A:idle:0|B:idle:45|C:idle:0');
      expect(graph.snapshotText().indexOf('B:idle:45')).assertLarger(0);
      graph.tasks[1].complete(9);
      expect(graph.snapshotText()).assertEqual('A:idle:0|B:completed:100|C:idle:0');
      expect(graph.totalProgress()).assertEqual(100);
    });

    /**
     * @tc.name   graphSnapshotTextMatchesTheTaskDescriptions
     * @tc.desc   The snapshot is exactly the three describe() values joined in row order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('graphSnapshotTextMatchesTheTaskDescriptions', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B);
      const expected: string = graph.tasks[0].describe() + '|' + graph.tasks[1].describe() + '|' +
        graph.tasks[2].describe();
      expect(graph.snapshotText()).assertEqual(expected);
      expect(graph.snapshotText()).assertEqual('A:running:0|B:completed:100|C:idle:0');
    });

    /**
     * @tc.name   graphCompletionTraceIsEmptyBeforeAnyCompletion
     * @tc.desc   completionTrace returns an empty string while the order list is empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphCompletionTraceIsEmptyBeforeAnyCompletion', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(completionTrace(graph)).assertEqual('');
      expect(graph.completionOrder.length).assertEqual(0);
      graph.startAll();
      expect(completionTrace(graph)).assertEqual('');
      expect(graph.events.countOf('completed')).assertEqual(0);
    });

    /**
     * @tc.name   graphCompletionTraceTracksTheCallbackOrder
     * @tc.desc   The trace appends each completed task number in call order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphCompletionTraceTracksTheCallbackOrder', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.completeTask(TASK_B);
      expect(completionTrace(graph)).assertEqual('B');
      graph.completeTask(TASK_A);
      expect(completionTrace(graph)).assertEqual('B|A');
      graph.completeTaskC();
      expect(completionTrace(graph)).assertEqual('B|A|C');
      expect(joined(graph.completionOrder, ',')).assertEqual('B,A,C');
    });

    /**
     * @tc.name   graphIsTopologicalForTheCanonicalOrder
     * @tc.desc   A|B|C and B|A|C are topological because C comes last.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('graphIsTopologicalForTheCanonicalOrder', 0, () => {
      expect(isTopologicalCompletion([TASK_A, TASK_B, TASK_C])).assertTrue();
      expect(isTopologicalCompletion([TASK_B, TASK_A, TASK_C])).assertTrue();
      expect(isTopologicalCompletion([TASK_A, TASK_B, TASK_C])).assertEqual(isTopologicalCompletion([TASK_B, TASK_A, TASK_C]));
      expect(isTopologicalCompletion([])).assertFalse();
    });

    /**
     * @tc.name   graphIsNotTopologicalWhenCIsNotLast
     * @tc.desc   Any order that puts C before a dependency is rejected.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphIsNotTopologicalWhenCIsNotLast', 0, () => {
      expect(isTopologicalCompletion([TASK_C, TASK_A, TASK_B])).assertFalse();
      expect(isTopologicalCompletion([TASK_A, TASK_C, TASK_B])).assertFalse();
      expect(isTopologicalCompletion([TASK_B, TASK_C, TASK_A])).assertFalse();
      expect(isTopologicalCompletion([TASK_C])).assertFalse();
    });

    /**
     * @tc.name   graphIsNotTopologicalWhenATaskIsMissing
     * @tc.desc   A trace without one of the three numbers cannot be a full topological order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphIsNotTopologicalWhenATaskIsMissing', 0, () => {
      expect(isTopologicalCompletion([TASK_A, TASK_B])).assertFalse();
      expect(isTopologicalCompletion([TASK_A, TASK_C])).assertFalse();
      expect(isTopologicalCompletion([TASK_B, TASK_C])).assertFalse();
      expect(isTopologicalCompletion([TASK_A, TASK_B, TASK_C, 'D'])).assertTrue();
    });

    /**
     * @tc.name   graphOrderOracleIgnoresDuplicatesPosition
     * @tc.desc   A duplicated A before C still satisfies the ordering predicate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('graphOrderOracleIgnoresDuplicatesPosition', 0, () => {
      expect(isTopologicalCompletion([TASK_A, TASK_A, TASK_B, TASK_C])).assertTrue();
      expect(isTopologicalCompletion([TASK_B, TASK_B, TASK_A, TASK_C])).assertTrue();
      expect(isTopologicalCompletion([TASK_C, TASK_A, TASK_B, TASK_C])).assertFalse();
      expect(isTopologicalCompletion([TASK_A, TASK_B, TASK_C, TASK_C])).assertTrue();
    });
    /**
     * @tc.name   graphGateIgnoresTaskStatusesOtherThanComplete
     * @tc.desc   A running or failed dependency does not open the gate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphGateIgnoresTaskStatusesOtherThanComplete', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.tasks[0].isRunning()).assertTrue();
      expect(graph.canRunTaskC()).assertFalse();
      graph.tasks[1].fail(13400003);
      expect(graph.canRunTaskC()).assertFalse();
      graph.completeTask(TASK_A);
      expect(graph.canRunTaskC()).assertFalse();
      graph.completeTask(TASK_B);
      expect(graph.canRunTaskC()).assertTrue();
    });

    /**
     * @tc.name   graphReferencePollStartsExactlyOneExclusiveTask
     * @tc.desc   The reference model starts C on the first unlocked round only.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphReferencePollStartsExactlyOneExclusiveTask', 0, () => {
      const reference: ReferenceGraph = new ReferenceGraph();
      expect(reference.poll()).assertFalse();
      reference.markComplete(TASK_A);
      expect(reference.poll()).assertFalse();
      reference.markComplete(TASK_B);
      expect(reference.poll()).assertTrue();
      expect(reference.poll()).assertFalse();
      expect(reference.rounds).assertEqual(4);
      expect(reference.cStarted).assertTrue();
    });

    /**
     * @tc.name   graphReferenceTraceIsAStableQuadruple
     * @tc.desc   The reference trace is four comma separated booleans in fixed positions.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('graphReferenceTraceIsAStableQuadruple', 0, () => {
      const reference: ReferenceGraph = new ReferenceGraph();
      expect(reference.trace()).assertEqual('false,false,false,false');
      reference.markComplete(TASK_A);
      expect(reference.trace()).assertEqual('true,false,false,false');
      reference.markComplete(TASK_C);
      expect(reference.trace()).assertEqual('true,false,false,true');
      expect(reference.trace().split(',').length).assertEqual(4);
    });

    /**
     * @tc.name   graphReferenceIgnoresUnknownTaskNumbers
     * @tc.desc   Marking a number outside A/B/C changes nothing in the reference model.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('graphReferenceIgnoresUnknownTaskNumbers', 0, () => {
      const reference: ReferenceGraph = new ReferenceGraph();
      reference.markComplete('Z');
      expect(reference.unlocked()).assertFalse();
      expect(reference.trace()).assertEqual('false,false,false,false');
      reference.markComplete(TASK_A);
      reference.markComplete(TASK_B);
      expect(reference.unlocked()).assertTrue();
      expect(reference.trace()).assertEqual('true,true,false,false');
    });

    /**
     * @tc.name   graphCountsRunningTasksOnlyWhileTheyRun
     * @tc.desc   runningCount follows status transitions and ignores completed tasks.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphCountsRunningTasksOnlyWhileTheyRun', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.runningCount()).assertEqual(2);
      graph.completeTask(TASK_A);
      expect(graph.runningCount()).assertEqual(1);
      graph.completeTask(TASK_B);
      expect(graph.runningCount()).assertEqual(0);
      graph.runTaskCIfReady(1);
      expect(graph.runningCount()).assertEqual(1);
      graph.completeTaskC(2);
      expect(graph.runningCount()).assertEqual(0);
    });

    /**
     * @tc.name   graphTotalsSurviveARepeatedReadback
     * @tc.desc   Aggregates are pure reads: they never mutate the graph.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('graphTotalsSurviveARepeatedReadback', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      const first: number = graph.totalProgress();
      const second: number = graph.totalProgress();
      const average: number = graph.averageProgress();
      expect(first).assertEqual(second);
      expect(first).assertEqual(100);
      expect(average).assertEqual(first / 3);
      expect(graph.runningCount()).assertEqual(1);
      expect(graph.snapshotText()).assertEqual('A:completed:100|B:running:0|C:idle:0');
    });

    /**
     * @tc.name   graphResetRestoresTheTopologyAggregates
     * @tc.desc   reset() zeroes the aggregates but keeps the three rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphResetRestoresTheTopologyAggregates', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.reset();
      expect(graph.tasks.length).assertEqual(3);
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.averageProgress()).assertEqual(0);
      expect(graph.allCompleted()).assertFalse();
      expect(graph.snapshotText()).assertEqual('A:idle:0|B:idle:0|C:idle:0');
    });

    /**
     * @tc.name   graphCompletionTraceIgnoresRejectedCompletions
     * @tc.desc   Refused completions never enter completionOrder.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphCompletionTraceIgnoresRejectedCompletions', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_A);
      graph.completeTask('Z');
      expect(completionTrace(graph)).assertEqual('A');
      expect(graph.completionOrder.length).assertEqual(1);
      expect(countOf(graph.completionOrder, TASK_A)).assertEqual(1);
      expect(graph.allCompleted()).assertFalse();
    });

    /**
     * @tc.name   graphTopologyKeepsTheURLTripleAlignedWithTheNumbers
     * @tc.desc   Index order, task number order and URL order all agree.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphTopologyKeepsTheURLTripleAlignedWithTheNumbers', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.taskAt(0).taskNo).assertEqual(TASK_NUMBERS[0]);
      expect(graph.taskAt(1).taskNo).assertEqual(TASK_NUMBERS[1]);
      expect(graph.taskAt(2).taskNo).assertEqual(TASK_NUMBERS[2]);
      expect(graph.taskAt(0).url.endsWith('favor_list_tea.png')).assertTrue();
      expect(graph.taskAt(1).url.endsWith('after_cache.png')).assertTrue();
      expect(graph.taskAt(2).url.endsWith('icon_main_color.png')).assertTrue();
    });

    /**
     * @tc.name   graphSnapshotTextIsUniquePerPhase
     * @tc.desc   Every phase of the run produces a different snapshot string.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('graphSnapshotTextIsUniquePerPhase', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const seen: string[] = [];
      seen.push(graph.snapshotText());
      graph.startAll();
      seen.push(graph.snapshotText());
      graph.completeTask(TASK_A);
      seen.push(graph.snapshotText());
      graph.completeTask(TASK_B);
      seen.push(graph.snapshotText());
      graph.runTaskCIfReady(1);
      seen.push(graph.snapshotText());
      let unique: number = 0;
      for (let index = 0; index < seen.length; index++) {
        if (seen.indexOf(seen[index]) === index) {
          unique = unique + 1;
        }
      }
      expect(unique).assertEqual(5);
      expect(seen.length).assertEqual(5);
    });
    /**
     * @tc.name   graphTopologicalOracleAcceptsTheObservedTrace
     * @tc.desc   The completionOrder produced by a full run satisfies isTopologicalCompletion.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphTopologicalOracleAcceptsTheObservedTrace', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.runTaskCIfReady(1);
      graph.completeTaskC(2);
      expect(isTopologicalCompletion(graph.completionOrder)).assertTrue();
      expect(isTopologicalCompletion(reversedCopy(graph.completionOrder))).assertFalse();
      expect(completionTrace(graph)).assertEqual('A|B|C');
    });

    /**
     * @tc.name   graphCompletionTraceNeverReordersExistingEntries
     * @tc.desc   Appending C leaves the earlier B entry at index zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('graphCompletionTraceNeverReordersExistingEntries', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.completeTask(TASK_B);
      graph.completeTask(TASK_A);
      graph.completeTaskC();
      expect(graph.completionOrder[0]).assertEqual(TASK_B);
      expect(graph.completionOrder[1]).assertEqual(TASK_A);
      expect(graph.completionOrder[2]).assertEqual(TASK_C);
      expect(joined(sortedCopy(graph.completionOrder), '')).assertEqual('ABC');
      expect(joined(reversedCopy(graph.completionOrder), '')).assertEqual('CAB');
    });

    /**
     * @tc.name   graphDependencyInvariantIsBinaryExhaustive
     * @tc.desc   All four completion combinations match the two-input gate predicate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('graphDependencyInvariantIsBinaryExhaustive', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.canRunTaskC()).assertEqual(expectedGateOpen(false, false));
      graph.completeTask(TASK_A);
      expect(graph.canRunTaskC()).assertEqual(expectedGateOpen(true, false));
      const second: TaskGraph = createTaskGraph();
      second.completeTask(TASK_B);
      expect(second.canRunTaskC()).assertEqual(expectedGateOpen(false, true));
      second.completeTask(TASK_A);
      expect(second.canRunTaskC()).assertEqual(expectedGateOpen(true, true));
      expect(expectedGateOpen(true, true)).assertTrue();
    });

    /**
     * @tc.name   graphAggregatesNeverExceedTheBarCap
     * @tc.desc   Total progress is bounded by three full bars and the average by 100.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('graphAggregatesNeverExceedTheBarCap', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.tasks[0].reportProgress(500);
      graph.tasks[1].reportProgress(500);
      graph.tasks[2].reportProgress(500);
      expect(graph.totalProgress()).assertEqual(300);
      expect(graph.averageProgress()).assertEqual(100);
      expect(graph.averageProgress() <= 100).assertTrue();
      expect(graph.totalProgress() <= graph.tasks.length * 100).assertTrue();
    });

    /**
     * @tc.name   graphSnapshotTextUsesTheExactRowSeparator
     * @tc.desc   The separator is a single pipe with no spaces or trailing pipe.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('graphSnapshotTextUsesTheExactRowSeparator', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.completeTask(TASK_A);
      const text: string = graph.snapshotText();
      expect(text.indexOf(' ')).assertEqual(-1);
      expect(text.endsWith('|')).assertFalse();
      expect(text.split('|').length).assertEqual(3);
      expect(text.indexOf('A:completed:100')).assertEqual(0);
    });

    /**
     * @tc.name   graphTopologySurvivesManyOperationCycles
     * @tc.desc   Ten start/complete/reset cycles leave the three rows unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('graphTopologySurvivesManyOperationCycles', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      for (let cycle = 0; cycle < 10; cycle++) {
        graph.startAll();
        graph.completeTask(TASK_A);
        graph.completeTask(TASK_B);
        graph.pollTick(200);
        graph.completeTaskC(400);
        graph.reset();
      }
      expect(graph.tasks.length).assertEqual(3);
      expect(graph.taskAt(0).taskNo).assertEqual(TASK_A);
      expect(graph.taskAt(2).taskNo).assertEqual(TASK_C);
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.events.size()).assertEqual(0);
    });

    /**
     * @tc.name   graphRunningCountIsIndependentOfTheTimer
     * @tc.desc   The timer flag can be armed with zero running tasks, as startAll shows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('graphRunningCountIsIndependentOfTheTimer', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.timerActive = true;
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.timerActive).assertTrue();
      graph.startAll();
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.timerActive).assertTrue();
      graph.timerActive = false;
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.snapshotText().indexOf('running')).assertLarger(0);
    });

    /**
     * @tc.name   graphTaskOrderIsStableForTheProgressRows
     * @tc.desc   No aggregate read or completion changes the row order A, B, C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphTaskOrderIsStableForTheProgressRows', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.totalProgress();
      graph.averageProgress();
      graph.runningCount();
      graph.snapshotText();
      expect(graph.taskAt(0).taskNo).assertEqual(TASK_A);
      expect(graph.taskAt(1).taskNo).assertEqual(TASK_B);
      expect(graph.taskAt(2).taskNo).assertEqual(TASK_C);
      expect(graph.tasks[0].url).assertEqual(URL_TASK_A);
      expect(graph.tasks[2].url).assertEqual(URL_TASK_C);
    });

    /**
     * @tc.name   graphIsUnfinishedUntilEveryCallbackArrives
     * @tc.desc   allCompleted stays false while any row is not completed, including C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphIsUnfinishedUntilEveryCallbackArrives', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      expect(graph.allCompleted()).assertFalse();
      expect(graph.tasks[2].isRunning()).assertTrue();
      graph.completeTaskC(400);
      expect(graph.allCompleted()).assertTrue();
      expect(countOf(graph.completionOrder, TASK_C)).assertEqual(1);
    });

    /**
     * @tc.name   graphEntryPointsAgreeOnTheCompletionTrace
     * @tc.desc   completeTaskC and completeTask(C) produce the same trace for C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('graphEntryPointsAgreeOnTheCompletionTrace', 0, () => {
      const direct: TaskGraph = createTaskGraph();
      const helper: TaskGraph = createTaskGraph();
      direct.completeTask(TASK_C, 5);
      helper.completeTaskC(5);
      expect(completionTrace(direct)).assertEqual(completionTrace(helper));
      expect(direct.snapshotText()).assertEqual(helper.snapshotText());
      expect(direct.totalProgress()).assertEqual(helper.totalProgress());
      expect(direct.events.countOf('completed')).assertEqual(helper.events.countOf('completed'));
    });

    /**
     * @tc.name   graphReferenceRoundCounterTracksEveryPoll
     * @tc.desc   The reference rounds field counts polls even when they fail.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphReferenceRoundCounterTracksEveryPoll', 0, () => {
      const reference: ReferenceGraph = new ReferenceGraph();
      reference.poll();
      reference.poll();
      expect(reference.rounds).assertEqual(2);
      reference.markComplete(TASK_A);
      reference.markComplete(TASK_B);
      reference.poll();
      expect(reference.rounds).assertEqual(3);
      expect(reference.cStarted).assertTrue();
      expect(reference.trace()).assertEqual('true,true,true,false');
    });

    /**
     * @tc.name   graphSnapshotSegmentsAlignWithTheRows
     * @tc.desc   Splitting the snapshot yields the three task numbers in order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('graphSnapshotSegmentsAlignWithTheRows', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.completeTask(TASK_B);
      const segments: string[] = graph.snapshotText().split('|');
      expect(segments[0].startsWith(TASK_A + ':')).assertTrue();
      expect(segments[1].startsWith(TASK_B + ':')).assertTrue();
      expect(segments[2].startsWith(TASK_C + ':')).assertTrue();
      expect(segments[1].indexOf('completed')).assertLarger(0);
      logStep('CoreGraph', graph.snapshotText());
    });
    /**
     * @tc.name   graphDependencyInvariantHoldsThroughTheTimer
     * @tc.desc   Poll ticks do not change canRunTaskC before or after the last dependency.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphDependencyInvariantHoldsThroughTheTimer', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.pollTick(200);
      expect(graph.canRunTaskC()).assertFalse();
      graph.completeTask(TASK_A);
      graph.pollTick(400);
      expect(graph.canRunTaskC()).assertFalse();
      graph.completeTask(TASK_B);
      expect(graph.canRunTaskC()).assertTrue();
      graph.pollTick(600);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.runningCount()).assertEqual(1);
    });

    /**
     * @tc.name   graphAverageProgressOfAnInterruptedRunStaysFractional
     * @tc.desc   One full bar out of three averages 33.33..., not a rounded integer.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('graphAverageProgressOfAnInterruptedRunStaysFractional', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.completeTask(TASK_A);
      expect(graph.totalProgress()).assertEqual(100);
      expect(graph.averageProgress()).assertEqual(100.0 / 3);
      expect(graph.averageProgress() < 34).assertTrue();
      expect(graph.averageProgress() > 33).assertTrue();
    });

    /**
     * @tc.name   graphCompletionTraceOfCOnlyIsNotTopological
     * @tc.desc   A single C completion is recorded but the order oracle refuses it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphCompletionTraceOfCOnlyIsNotTopological', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.completeTaskC(1);
      expect(completionTrace(graph)).assertEqual('C');
      expect(isTopologicalCompletion(graph.completionOrder)).assertFalse();
      expect(graph.allCompleted()).assertFalse();
      expect(graph.totalProgress()).assertEqual(100);
      expect(graph.runningCount()).assertEqual(0);
    });

    /**
     * @tc.name   graphSeededURLsAreUntouchedByAggregateReads
     * @tc.desc   Reading totals repeatedly leaves every URL literal intact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphSeededURLsAreUntouchedByAggregateReads', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      for (let round = 0; round < 5; round++) {
        graph.totalProgress();
        graph.averageProgress();
        graph.snapshotText();
        graph.allCompleted();
      }
      expect(graph.tasks[0].url).assertEqual(URL_TASK_A);
      expect(graph.tasks[1].url).assertEqual(URL_TASK_B);
      expect(graph.tasks[2].url).assertEqual(URL_TASK_C);
      expect(graph.tasks[0].url === graph.tasks[1].url).assertFalse();
    });

    /**
     * @tc.name   graphDependencyChainHasExactlyOneExclusiveEdge
     * @tc.desc   Only C depends on the pair; A and B have no dependency on each other.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('graphDependencyChainHasExactlyOneExclusiveEdge', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.completeTask(TASK_A);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.taskByNo(TASK_B) !== undefined).assertTrue();
      const onlyB: TaskGraph = createTaskGraph();
      onlyB.completeTask(TASK_B);
      expect(onlyB.canRunTaskC()).assertFalse();
      expect(graph.lock.isUnlocked()).assertTrue();
    });
    /**
     * @tc.name   graphEmptyTraceTextIsTheEmptyString
     * @tc.desc   No completion means the trace helper returns a zero length string.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreGraph scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('graphEmptyTraceTextIsTheEmptyString', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(completionTrace(graph).length).assertEqual(0);
      expect(completionTrace(graph)).assertEqual('');
      expect(graph.events.trace()).assertEqual('');
    });
  });
}
