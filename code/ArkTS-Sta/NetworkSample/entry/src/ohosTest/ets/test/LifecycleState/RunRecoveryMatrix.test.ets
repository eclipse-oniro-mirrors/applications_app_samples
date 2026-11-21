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
 * RunRecoveryMatrix suite of the NetworkSample ohosTest module.
 *
 * The suite walks the recovery matrix of the three row run: a partially
 * completed run that keeps the C gate closed, the poll that opens the gate,
 * failure codes, the retry policy, reset and rerun, and the timestamps that
 * tell one attempt from the next. It also compares the driver graph with the
 * ReferenceGraph oracle so a shared implementation slip cannot pass silently.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   62-64    lock, taskACompleted, taskBCompleted
 *   79-95    completeTaskA / completeTaskB / completeTaskC
 *   98-107   checkAndUnlock and canRunTaskC
 *   174-198  startAllTasks, shared A/B, exclusive C, 200 ms poll
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  URL_TASK_A,
  URL_TASK_B,
  STATUS_IDLE,
  STATUS_RUNNING,
  STATUS_COMPLETED,
  STATUS_FAILED,
  PROGRESS_TOTAL,
  ERROR_NONE,
  ERROR_CREATE,
  ERROR_START,
  ERROR_NETWORK,
  ERROR_TIMEOUT,
  DownloadTask,
  TaskGraph,
  createTaskGraph,
  ReferenceGraph,
  RetryPolicy,
  PollClock,
  completionTrace,
  isTopologicalCompletion,
  isRetryableError,
  expectedGateOpen
} from '../Shared/SharedDriver';

export default function runRecoveryMatrixTest(): void {
  describe('RunRecoveryMatrix', () => {
    beforeAll(() => {
      logSuite('RunRecoveryMatrix', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('RunRecoveryMatrix', 'end');
    });

    /**
     * @tc.name   runRecoveryPartialCompletionLeavesGateClosed
     * @tc.desc   Completing only A keeps the C gate closed because the gate requires both shared rows.
     * @tc.precondition  The shared driver is loaded and the graph has been started.
     * @tc.steps         1. Start the graph and complete row A.
     *                   2. Ask canRunTaskC and read the lock state.
     *                   3. Compare with the independent gate oracle.
     * @tc.expected      The gate stays closed, B still holds the shared lock and C is idle.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('runRecoveryPartialCompletionLeavesGateClosed', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const done: boolean = graph.completeTask(TASK_A, 10);
      logStep('RunRecoveryMatrix', 'partial gate ' + String(graph.canRunTaskC()));
      expect(done).assertTrue();
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.taskAt(0).isComplete()).assertTrue();
      expect(graph.taskAt(1).isRunning()).assertTrue();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.lock.hasShared(TASK_A)).assertFalse();
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
      expect(expectedGateOpen(true, false)).assertFalse();
    });

    /**
     * @tc.name   runRecoveryPartialCompletionKeepsTaskCIdle
     * @tc.desc   A half finished run cannot start C, so the exclusive row stays idle and the timer stays armed.
     * @tc.precondition  The shared driver is loaded and only row A has completed.
     * @tc.steps         1. Start the graph and complete row A.
     *                   2. Call runTaskCIfReady directly.
     *                   3. Read the timer flag and the C status.
     * @tc.expected      C refuses to start, its attempt count stays zero and the timer is still active.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('runRecoveryPartialCompletionKeepsTaskCIdle', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      const started: boolean = graph.runTaskCIfReady(20);
      logStep('RunRecoveryMatrix', 'C start while partial ' + String(started));
      expect(started).assertFalse();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.taskAt(2).attempts).assertEqual(0);
      expect(graph.timerActive).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.events.countOf('started')).assertEqual(2);
    });

    /**
     * @tc.name   runRecoveryGateOpensAfterBothShared
     * @tc.desc   The second completion unlocks the gate and records exactly one unlock event for C.
     * @tc.precondition  The shared driver is loaded and rows A and B are running under the shared lock.
     * @tc.steps         1. Start the graph and complete row A, then row B.
     *                   2. Ask canRunTaskC and read the unlock events.
     *                   3. Verify the shared lock is fully released.
     * @tc.expected      The gate opens, one unlock is recorded and the lock reports unlocked.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('runRecoveryGateOpensAfterBothShared', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      logStep('RunRecoveryMatrix', 'gate open ' + String(graph.canRunTaskC()));
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.events.last()).assertEqual('unlocked:C');
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.lock.sharedHolders.length).assertEqual(0);
      expect(expectedGateOpen(true, true)).assertTrue();
      expect(graph.taskAt(2).isIdle()).assertTrue();
    });

    /**
     * @tc.name   runRecoveryPollStartsCOnceGateOpen
     * @tc.desc   One poll after both shared rows complete starts the exclusive row and clears the timer.
     * @tc.precondition  The shared driver is loaded and rows A and B have both completed.
     * @tc.steps         1. Start the graph and complete rows A and B.
     *                   2. Call pollTick with a timestamp.
     *                   3. Read the C status, timer flag and poll counter.
     * @tc.expected      The poll returns true, C is running at the timestamp and the timer is down.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('runRecoveryPollStartsCOnceGateOpen', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      const started: boolean = graph.pollTick(300);
      logStep('RunRecoveryMatrix', 'poll start ' + String(started) + ' ' + graph.taskAt(2).describe());
      expect(started).assertTrue();
      expect(graph.taskAt(2).status).assertEqual(STATUS_RUNNING);
      expect(graph.taskAt(2).startedAt).assertEqual(300);
      expect(graph.taskAt(2).attempts).assertEqual(1);
      expect(graph.timerActive).assertFalse();
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
    });

    /**
     * @tc.name   runRecoveryPollBeforeGateDoesNothing
     * @tc.desc   Polling while A and B are still running advances the counter but never starts C.
     * @tc.precondition  The shared driver is loaded and the graph was just started.
     * @tc.steps         1. Start the graph without completing any row.
     *                   2. Call pollTick twice with increasing timestamps.
     *                   3. Read the C row and the timer flag.
     * @tc.expected      Both polls return false, the counter reaches two and the timer stays armed.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('runRecoveryPollBeforeGateDoesNothing', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const first: boolean = graph.pollTick(100);
      const second: boolean = graph.pollTick(200);
      logStep('RunRecoveryMatrix', 'early polls ' + String(first) + '/' + String(second));
      expect(first).assertFalse();
      expect(second).assertFalse();
      expect(graph.pollTicks).assertEqual(2);
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.taskAt(2).attempts).assertEqual(0);
      expect(graph.timerActive).assertTrue();
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
    });

    /**
     * @tc.name   runRecoveryFailedTaskRecordsCode
     * @tc.desc   A failed run stores the error code and stops reporting running or complete.
     * @tc.precondition  The shared driver is loaded and row B is running at 30 percent.
     * @tc.steps         1. Start row B and report 30 percent.
     *                   2. Fail the row with the network error code.
     *                   3. Read the status, code and bar.
     * @tc.expected      The row is failed with the network code while the bar keeps 30 percent.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('runRecoveryFailedTaskRecordsCode', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, URL_TASK_B);
      task.start(5);
      task.reportProgress(30);
      const accepted: boolean = task.fail(ERROR_NETWORK);
      logStep('RunRecoveryMatrix', 'failure ' + task.describe() + ' code ' + String(task.lastErrorCode));
      expect(accepted).assertTrue();
      expect(task.status).assertEqual(STATUS_FAILED);
      expect(task.lastErrorCode).assertEqual(ERROR_NETWORK);
      expect(task.isRunning()).assertFalse();
      expect(task.isComplete()).assertFalse();
      expect(task.progress).assertEqual(30);
      expect(task.finishedAt).assertEqual(0);
    });

    /**
     * @tc.name   runRecoveryFailedTaskBlocksStart
     * @tc.desc   The failed state is terminal for dispatch, so a failed row cannot be started again in place.
     * @tc.precondition  The shared driver is loaded and row A has failed once.
     * @tc.steps         1. Start row A, then fail it with a start error.
     *                   2. Attempt to start the row a second time.
     *                   3. Compare the attempt counter and the start stamp.
     * @tc.expected      The second start returns false and neither the attempts nor the stamp move.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('runRecoveryFailedTaskBlocksStart', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      task.start(10);
      task.fail(ERROR_START);
      const restart: boolean = task.start(500);
      logStep('RunRecoveryMatrix', 'restart failed ' + String(restart));
      expect(restart).assertFalse();
      expect(task.status).assertEqual(STATUS_FAILED);
      expect(task.attempts).assertEqual(1);
      expect(task.startedAt).assertEqual(10);
      expect(task.lastErrorCode).assertEqual(ERROR_START);
      expect(task.isIdle()).assertFalse();
    });

    /**
     * @tc.name   runRecoveryResetEnablesRetry
     * @tc.desc   Reset is the supported recovery edge: it clears the failure and lets the row start again.
     * @tc.precondition  The shared driver is loaded and row C has failed with a timeout.
     * @tc.steps         1. Start row C, then fail it with the timeout code.
     *                   2. Reset the row and start it with a new timestamp.
     *                   3. Read the status, attempts and error code.
     * @tc.expected      The retried row is running with two attempts and no residual error code.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('runRecoveryResetEnablesRetry', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_C, 'https://example.com/c.png');
      task.start(0);
      task.fail(ERROR_TIMEOUT);
      task.reset();
      const restarted: boolean = task.start(640);
      logStep('RunRecoveryMatrix', 'retry ' + task.describe() + ' attempts ' + String(task.attempts));
      expect(restarted).assertTrue();
      expect(task.status).assertEqual(STATUS_RUNNING);
      expect(task.attempts).assertEqual(2);
      expect(task.startedAt).assertEqual(640);
      expect(task.finishedAt).assertEqual(0);
      expect(task.lastErrorCode).assertEqual(ERROR_NONE);
    });

    /**
     * @tc.name   runRecoveryRetryPolicyAllowsTransientError
     * @tc.desc   The retry policy accepts a transient error while the attempt budget is not exhausted.
     * @tc.precondition  The shared driver is loaded and a default policy allows three attempts.
     * @tc.steps         1. Ask shouldRetry for attempt one with a network code.
     *                   2. Ask the same for a start error and a timeout.
     *                   3. Compare the three answers.
     * @tc.expected      All three transient codes are retried on the first attempt.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('runRecoveryRetryPolicyAllowsTransientError', 0, () => {
      const policy: RetryPolicy = new RetryPolicy();
      const network: boolean = policy.shouldRetry(1, ERROR_NETWORK, STATUS_RUNNING);
      const start: boolean = policy.shouldRetry(1, ERROR_START, STATUS_FAILED);
      const timeout: boolean = policy.shouldRetry(2, ERROR_TIMEOUT, STATUS_FAILED);
      logStep('RunRecoveryMatrix', 'retry answers ' + String(network) + '/' + String(start) + '/' + String(timeout));
      expect(network).assertTrue();
      expect(start).assertTrue();
      expect(timeout).assertTrue();
      expect(policy.maxAttempts).assertEqual(3);
      expect(policy.isExhausted(1)).assertFalse();
      expect(isRetryableError(ERROR_NETWORK)).assertTrue();
    });

    /**
     * @tc.name   runRecoveryRetryPolicyBlocksCompleted
     * @tc.desc   A completed row is never retried even when the other policy conditions would allow it.
     * @tc.precondition  The shared driver is loaded and the policy still has attempt budget left.
     * @tc.steps         1. Ask shouldRetry for a completed row with a network code.
     *                   2. Ask the same for a completed row with a start code.
     *                   3. Compare the answers with the running row answer.
     * @tc.expected      Both completed answers are false while the running answer is true.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('runRecoveryRetryPolicyBlocksCompleted', 0, () => {
      const policy: RetryPolicy = new RetryPolicy();
      const completedNetwork: boolean = policy.shouldRetry(0, ERROR_NETWORK, STATUS_COMPLETED);
      const completedStart: boolean = policy.shouldRetry(0, ERROR_START, STATUS_COMPLETED);
      const running: boolean = policy.shouldRetry(0, ERROR_NETWORK, STATUS_RUNNING);
      logStep('RunRecoveryMatrix', 'completed retry ' + String(completedNetwork) + '/' + String(completedStart));
      expect(completedNetwork).assertFalse();
      expect(completedStart).assertFalse();
      expect(running).assertTrue();
      expect(policy.shouldRetry(0, ERROR_NONE, STATUS_COMPLETED)).assertFalse();
      expect(policy.shouldRetry(0, ERROR_NONE, STATUS_RUNNING)).assertFalse();
      expect(completedNetwork).assertEqual(completedStart);
    });

    /**
     * @tc.name   runRecoveryRetryPolicyExhaustsAtMax
     * @tc.desc   The attempt budget is checked before the error code, so the last allowed attempt is final.
     * @tc.precondition  The shared driver is loaded and the policy allows three attempts.
     * @tc.steps         1. Ask shouldRetry at attempt two and at attempt three.
     *                   2. Ask isExhausted at both attempts.
     *                   3. Compare the answers.
     * @tc.expected      Attempt two retries, attempt three does not and is reported exhausted.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('runRecoveryRetryPolicyExhaustsAtMax', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(3, 200);
      const atTwo: boolean = policy.shouldRetry(2, ERROR_TIMEOUT, STATUS_FAILED);
      const atThree: boolean = policy.shouldRetry(3, ERROR_TIMEOUT, STATUS_FAILED);
      logStep('RunRecoveryMatrix', 'attempt two/three ' + String(atTwo) + '/' + String(atThree));
      expect(atTwo).assertTrue();
      expect(atThree).assertFalse();
      expect(policy.isExhausted(2)).assertFalse();
      expect(policy.isExhausted(3)).assertTrue();
      expect(policy.shouldRetry(4, ERROR_NETWORK, STATUS_FAILED)).assertFalse();
      expect(policy.maxAttempts).assertEqual(3);
    });

    /**
     * @tc.name   runRecoveryRetryDelayGrowsLinearly
     * @tc.desc   The retry delay is the base period multiplied by the attempt index, without a cap.
     * @tc.precondition  The shared driver is loaded and the policy base delay is two hundred milliseconds.
     * @tc.steps         1. Compute delays for attempts one, two and three.
     *                   2. Compute the difference between consecutive delays.
     *                   3. Compare every delay with the base multiple.
     * @tc.expected      The delays are 200, 400 and 600 with a constant step of 200.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('runRecoveryRetryDelayGrowsLinearly', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(4, 200);
      const first: number = policy.delayFor(1);
      const second: number = policy.delayFor(2);
      const third: number = policy.delayFor(3);
      logStep('RunRecoveryMatrix', 'delays ' + String(first) + '/' + String(second) + '/' + String(third));
      expect(first).assertEqual(200);
      expect(second).assertEqual(400);
      expect(third).assertEqual(600);
      expect(second - first).assertEqual(200);
      expect(third - second).assertEqual(first);
      expect(third).assertLarger(second);
      expect(first).assertEqual(policy.baseDelayMs);
    });

    /**
     * @tc.name   runRecoveryRetryDelayBaseForZeroAttempt
     * @tc.desc   The zero attempt and any negative index fall back to the base delay instead of zero.
     * @tc.precondition  The shared driver is loaded and the policy base delay is two hundred milliseconds.
     * @tc.steps         1. Compute the delay for attempt zero.
     *                   2. Compute the delay for attempt minus one.
     *                   3. Compare both with the base delay.
     * @tc.expected      Both degenerate attempts answer exactly the base delay.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('runRecoveryRetryDelayBaseForZeroAttempt', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(3, 200);
      const zero: number = policy.delayFor(0);
      const negative: number = policy.delayFor(-1);
      logStep('RunRecoveryMatrix', 'degenerate delays ' + String(zero) + '/' + String(negative));
      expect(zero).assertEqual(200);
      expect(negative).assertEqual(200);
      expect(zero).assertEqual(policy.baseDelayMs);
      expect(negative).assertEqual(zero);
      expect(zero).assertLarger(0);
      expect(policy.delayFor(1)).assertEqual(zero * 2 - zero);
    });

    /**
     * @tc.name   runRecoveryIsRetryableErrorMatrix
     * @tc.desc   Only the transient half of the error table is retryable; a create failure is not.
     * @tc.precondition  The shared driver is loaded and the error literals are exported.
     * @tc.steps         1. Classify the network, timeout and start codes.
     *                   2. Classify the create and zero codes.
     *                   3. Count the true answers.
     * @tc.expected      Exactly three codes are retryable and the create code is not one of them.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('runRecoveryIsRetryableErrorMatrix', 0, () => {
      const codes: number[] = [ERROR_NONE, ERROR_CREATE, ERROR_START, ERROR_NETWORK, ERROR_TIMEOUT];
      let retryable: number = 0;
      for (let index: int = 0; index < codes.length; index++) {
        if (isRetryableError(codes[index])) {
          retryable = retryable + 1;
        }
      }
      logStep('RunRecoveryMatrix', 'retryable count ' + String(retryable));
      expect(retryable).assertEqual(3);
      expect(isRetryableError(ERROR_NONE)).assertFalse();
      expect(isRetryableError(ERROR_CREATE)).assertFalse();
      expect(isRetryableError(ERROR_START)).assertTrue();
      expect(isRetryableError(ERROR_NETWORK)).assertTrue();
      expect(isRetryableError(ERROR_TIMEOUT)).assertTrue();
      expect(ERROR_CREATE).assertLarger(ERROR_NONE);
    });

    /**
     * @tc.name   runRecoveryRestartAfterCompletionNeedsReset
     * @tc.desc   A completed row refuses start until reset, which is the only path that revives it.
     * @tc.precondition  The shared driver is loaded and row A has completed at stamp 100.
     * @tc.steps         1. Start row A and complete it.
     *                   2. Attempt to start the completed row.
     *                   3. Reset the row and start it again.
     * @tc.expected      The direct restart fails, the reset restart succeeds and attempts reach two.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('runRecoveryRestartAfterCompletionNeedsReset', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      task.start(0);
      task.complete(100);
      const direct: boolean = task.start(200);
      task.reset();
      const afterReset: boolean = task.start(300);
      logStep('RunRecoveryMatrix', 'direct/after reset ' + String(direct) + '/' + String(afterReset));
      expect(direct).assertFalse();
      expect(afterReset).assertTrue();
      expect(task.status).assertEqual(STATUS_RUNNING);
      expect(task.attempts).assertEqual(2);
      expect(task.startedAt).assertEqual(300);
      expect(task.finishedAt).assertEqual(0);
      expect(task.progress).assertEqual(0);
    });

    /**
     * @tc.name   runRecoveryTimestampsStartAndFinish
     * @tc.desc   A successful attempt carries both the dispatch stamp and the completion stamp.
     * @tc.precondition  The shared driver is loaded and row B starts at stamp 100.
     * @tc.steps         1. Start row B at stamp 100 and capture the start field.
     *                   2. Complete the row at stamp 900.
     *                   3. Compare both stamps and the elapsed window.
     * @tc.expected      The start stamp is 100, the finish stamp is 900 and the window is 800.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('runRecoveryTimestampsStartAndFinish', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, URL_TASK_B);
      task.start(100);
      const startedAt: number = task.startedAt;
      task.complete(900);
      logStep('RunRecoveryMatrix', 'stamps ' + String(startedAt) + '/' + String(task.finishedAt));
      expect(startedAt).assertEqual(100);
      expect(task.startedAt).assertEqual(100);
      expect(task.finishedAt).assertEqual(900);
      expect(task.finishedAt - task.startedAt).assertEqual(800);
      expect(task.finishedAt).assertLarger(task.startedAt);
      expect(task.status).assertEqual(STATUS_COMPLETED);
      expect(task.progress).assertEqual(PROGRESS_TOTAL);
    });

    /**
     * @tc.name   runRecoveryFailureLeavesFinishStampZero
     * @tc.desc   A failure has no finish stamp because the row never reached the completed state.
     * @tc.precondition  The shared driver is loaded and row C starts at stamp 40.
     * @tc.steps         1. Start row C at stamp 40.
     *                   2. Fail the row with the timeout code.
     *                   3. Read the start stamp and the finish stamp.
     * @tc.expected      The start stamp survives at 40 and the finish stamp stays zero.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('runRecoveryFailureLeavesFinishStampZero', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_C, 'https://example.com/c.png');
      task.start(40);
      task.fail(ERROR_TIMEOUT);
      logStep('RunRecoveryMatrix', 'failed stamps ' + String(task.startedAt) + '/' + String(task.finishedAt));
      expect(task.startedAt).assertEqual(40);
      expect(task.finishedAt).assertEqual(0);
      expect(task.startedAt).assertLarger(task.finishedAt);
      expect(task.status).assertEqual(STATUS_FAILED);
      expect(task.lastErrorCode).assertEqual(ERROR_TIMEOUT);
      expect(task.isComplete()).assertFalse();
    });

    /**
     * @tc.name   runRecoveryResetClearsTimestamps
     * @tc.desc   Reset removes both stamps so a stale timestamp cannot leak into the next attempt.
     * @tc.precondition  The shared driver is loaded and row A completed at stamp 700.
     * @tc.steps         1. Start row A at stamp 50 and complete it at stamp 700.
     *                   2. Reset the row.
     *                   3. Read both stamps and the status.
     * @tc.expected      Both stamps are zero and the row reports idle.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('runRecoveryResetClearsTimestamps', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      task.start(50);
      task.complete(700);
      const beforeStart: number = task.startedAt;
      const beforeFinish: number = task.finishedAt;
      task.reset();
      logStep('RunRecoveryMatrix', 'reset stamps ' + String(task.startedAt) + '/' + String(task.finishedAt));
      expect(beforeStart).assertEqual(50);
      expect(beforeFinish).assertEqual(700);
      expect(task.startedAt).assertEqual(0);
      expect(task.finishedAt).assertEqual(0);
      expect(task.status).assertEqual(STATUS_IDLE);
      expect(task.progress).assertEqual(0);
      expect(task.lastErrorCode).assertEqual(ERROR_NONE);
    });

    /**
     * @tc.name   runRecoverySecondAttemptTimestampsReplace
     * @tc.desc   The second attempt overwrites the first attempt stamps, so the row reports only the latest run.
     * @tc.precondition  The shared driver is loaded and the first attempt failed at stamp 10.
     * @tc.steps         1. Start row B at stamp 10 and fail it.
     *                   2. Reset and start it at stamp 500.
     *                   3. Complete the row at stamp 900.
     * @tc.expected      The row reports start 500 and finish 900, not the first attempt values.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('runRecoverySecondAttemptTimestampsReplace', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, URL_TASK_B);
      task.start(10);
      task.fail(ERROR_NETWORK);
      task.reset();
      task.start(500);
      task.complete(900);
      logStep('RunRecoveryMatrix', 'second attempt stamps ' + String(task.startedAt) + '/' +
        String(task.finishedAt));
      expect(task.startedAt).assertEqual(500);
      expect(task.finishedAt).assertEqual(900);
      expect(task.startedAt).assertLarger(10);
      expect(task.attempts).assertEqual(2);
      expect(task.status).assertEqual(STATUS_COMPLETED);
      expect(task.lastErrorCode).assertEqual(ERROR_NONE);
    });

    /**
     * @tc.name   runRecoveryGraphResetRestoresIdle
     * @tc.desc   Resetting the whole graph returns all three rows to idle and re-arms the start button.
     * @tc.precondition  The shared driver is loaded and the graph has completed a full A, B, C run.
     * @tc.steps         1. Run the graph through the gate and complete row C.
     *                   2. Call reset on the graph.
     *                   3. Read the statuses, the progress total and the button flag.
     * @tc.expected      Every row is idle at zero, the total is zero and isTaskFinished is true.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('runRecoveryGraphResetRestoresIdle', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      graph.pollTick(30);
      graph.completeTaskC(40);
      const before: number = graph.totalProgress();
      graph.reset();
      logStep('RunRecoveryMatrix', 'graph after reset ' + graph.snapshotText());
      expect(before).assertEqual(300);
      expect(graph.taskAt(0).status).assertEqual(STATUS_IDLE);
      expect(graph.taskAt(1).status).assertEqual(STATUS_IDLE);
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.allCompleted()).assertFalse();
    });

    /**
     * @tc.name   runRecoveryGraphResetClearsEventsAndOrder
     * @tc.desc   Reset drops the event recorder, the completion order and the poll counter of the prior run.
     * @tc.precondition  The shared driver is loaded and the graph recorded a complete run.
     * @tc.steps         1. Run the graph and capture the event size and order length.
     *                   2. Call reset on the graph.
     *                   3. Read the recorder, order, poll counter and timer flag.
     * @tc.expected      The recorder is empty, the order is empty and the poll counter is zero.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('runRecoveryGraphResetClearsEventsAndOrder', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      graph.pollTick(30);
      graph.completeTaskC(40);
      const eventsBefore: number = graph.events.size();
      const orderBefore: number = graph.completionOrder.length;
      graph.reset();
      logStep('RunRecoveryMatrix', 'reset events ' + String(eventsBefore) + ' -> ' + String(graph.events.size()));
      expect(eventsBefore).assertLarger(0);
      expect(orderBefore).assertEqual(3);
      expect(graph.events.size()).assertEqual(0);
      expect(graph.events.fingerprint()).assertEqual(216613);
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.timerActive).assertFalse();
      expect(graph.completionOrder.length).assertLess(orderBefore);
    });

    /**
     * @tc.name   runRecoveryCompletionOrderIsTopological
     * @tc.desc   The recorded completion order always positions C after both shared rows, as the gate demands.
     * @tc.precondition  The shared driver is loaded and the graph runs the full three row sequence.
     * @tc.steps         1. Start the graph, complete A and B and poll for C.
     *                   2. Complete row C.
     *                   3. Read the completion trace and validate the order.
     * @tc.expected      The trace reads A|B|C and the order is classified as topological.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('runRecoveryCompletionOrderIsTopological', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      graph.pollTick(30);
      graph.completeTaskC(40);
      const trace: string = completionTrace(graph);
      logStep('RunRecoveryMatrix', 'completion trace ' + trace);
      expect(trace).assertEqual('A|B|C');
      expect(graph.completionOrder.length).assertEqual(3);
      expect(isTopologicalCompletion(graph.completionOrder)).assertTrue();
      expect(graph.completionOrder[2]).assertEqual(TASK_C);
      expect(graph.allCompleted()).assertTrue();
      expect(graph.events.countOf('completed')).assertEqual(3);
    });

    /**
     * @tc.name   runRecoveryFailedTaskNotInCompletionOrder
     * @tc.desc   A failed row never enters the completion order, so the trace cannot claim three successes.
     * @tc.precondition  The shared driver is loaded and row B fails while A completes.
     * @tc.steps         1. Start the graph, complete A and fail B.
     *                   2. Complete row C directly through completeTask.
     *                   3. Read the trace and validate the order.
     * @tc.expected      The trace is A|C without B and the order is not topological.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('runRecoveryFailedTaskNotInCompletionOrder', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.taskAt(1).fail(ERROR_NETWORK);
      graph.completeTask(TASK_C, 40);
      const trace: string = completionTrace(graph);
      logStep('RunRecoveryMatrix', 'trace with failed B ' + trace);
      expect(trace).assertEqual('A|C');
      expect(graph.completionOrder.indexOf(TASK_B)).assertEqual(-1);
      expect(isTopologicalCompletion(graph.completionOrder)).assertFalse();
      expect(graph.taskAt(1).isFailed()).assertTrue();
      expect(graph.taskAt(1).lastErrorCode).assertEqual(ERROR_NETWORK);
      expect(graph.allCompleted()).assertFalse();
      expect(graph.events.countOf('completed')).assertEqual(2);
    });

    /**
     * @tc.name   runRecoveryGateClosesAfterReset
     * @tc.desc   Resetting a shared row after a full run closes the gate again, so C cannot be re-entered.
     * @tc.precondition  The shared driver is loaded and rows A, B and C have all completed.
     * @tc.steps         1. Run the graph fully through the gate.
     *                   2. Reset rows A and B individually.
     *                   3. Ask canRunTaskC and read the C status.
     * @tc.expected      The gate is closed even though C still reports completed.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('runRecoveryGateClosesAfterReset', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      graph.pollTick(30);
      graph.completeTaskC(40);
      const openBefore: boolean = graph.canRunTaskC();
      graph.taskAt(0).reset();
      graph.taskAt(1).reset();
      logStep('RunRecoveryMatrix', 'gate after shared reset ' + String(graph.canRunTaskC()));
      expect(openBefore).assertTrue();
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.taskAt(0).isIdle()).assertTrue();
      expect(graph.taskAt(1).isIdle()).assertTrue();
      expect(graph.taskAt(2).isComplete()).assertTrue();
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(expectedGateOpen(false, false)).assertFalse();
    });

    /**
     * @tc.name   runRecoveryTimerStopsAfterTaskCStarts
     * @tc.desc   The 200 ms poll is one shot: after C starts a second poll neither restarts C nor the timer.
     * @tc.precondition  The shared driver is loaded and row C was started by the first poll.
     * @tc.steps         1. Start the graph, complete A and B and poll once.
     *                   2. Poll a second time.
     *                   3. Read the C attempts, the timer and the poll counter.
     * @tc.expected      The second poll returns false, C keeps one attempt and the timer stays down.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('runRecoveryTimerStopsAfterTaskCStarts', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      const first: boolean = graph.pollTick(30);
      const second: boolean = graph.pollTick(40);
      logStep('RunRecoveryMatrix', 'poll one/two ' + String(first) + '/' + String(second));
      expect(first).assertTrue();
      expect(second).assertFalse();
      expect(graph.pollTicks).assertEqual(2);
      expect(graph.taskAt(2).attempts).assertEqual(1);
      expect(graph.taskAt(2).startedAt).assertEqual(30);
      expect(graph.timerActive).assertFalse();
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
    });

    /**
     * @tc.name   runRecoveryReferenceGraphMatchesDriver
     * @tc.desc   The independent reference graph opens the gate on the same completion pair as the driver.
     * @tc.precondition  The shared driver is loaded and both graphs start from an empty completion set.
     * @tc.steps         1. Mark A and B complete in the reference graph and in the driver graph.
     *                   2. Poll both once.
     *                   3. Compare the gate flags and the C start flags.
     * @tc.expected      Both sides report an open gate and exactly one C start.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('runRecoveryReferenceGraphMatchesDriver', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const reference: ReferenceGraph = new ReferenceGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      reference.markComplete(TASK_A);
      graph.completeTask(TASK_B, 20);
      reference.markComplete(TASK_B);
      const driverStarted: boolean = graph.pollTick(30);
      const referenceStarted: boolean = reference.poll();
      logStep('RunRecoveryMatrix', 'driver/ref start ' + String(driverStarted) + '/' + String(referenceStarted));
      expect(graph.canRunTaskC()).assertEqual(reference.unlocked());
      expect(graph.canRunTaskC()).assertTrue();
      expect(driverStarted).assertTrue();
      expect(referenceStarted).assertTrue();
      expect(reference.cStarted).assertTrue();
      expect(graph.taskAt(2).isRunning()).assertTrue();
      expect(reference.rounds).assertEqual(1);
    });

    /**
     * @tc.name   runRecoveryReferenceGraphTracksRounds
     * @tc.desc   Poll rounds before the gate still count even though they cannot start the exclusive step.
     * @tc.precondition  The shared driver is loaded and the reference graph has no completion yet.
     * @tc.steps         1. Poll the reference graph twice with no completion.
     *                   2. Mark only A, poll again.
     *                   3. Mark B and poll a fourth time.
     * @tc.expected      Only the fourth poll starts C and the round counter reaches four.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('runRecoveryReferenceGraphTracksRounds', 0, () => {
      const reference: ReferenceGraph = new ReferenceGraph();
      const first: boolean = reference.poll();
      const second: boolean = reference.poll();
      reference.markComplete(TASK_A);
      const third: boolean = reference.poll();
      reference.markComplete(TASK_B);
      const fourth: boolean = reference.poll();
      logStep('RunRecoveryMatrix', 'reference rounds ' + String(reference.rounds) + ' trace ' + reference.trace());
      expect(first).assertFalse();
      expect(second).assertFalse();
      expect(third).assertFalse();
      expect(fourth).assertTrue();
      expect(reference.rounds).assertEqual(4);
      expect(reference.unlocked()).assertTrue();
      expect(reference.cStarted).assertTrue();
      expect(reference.trace()).assertEqual('true,true,true,false');
    });

    /**
     * @tc.name   runRecoveryCompleteOverridesFailure
     * @tc.desc   A late success can repair a failed row because completion only refuses an already completed row.
     * @tc.precondition  The shared driver is loaded and row C has failed with the network code.
     * @tc.steps         1. Start row C and fail it with the network code.
     *                   2. Complete the same row at a later stamp.
     *                   3. Read the status, bar and error code.
     * @tc.expected      The row becomes completed at 100 while the historic error code is preserved.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('runRecoveryCompleteOverridesFailure', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_C, 'https://example.com/c.png');
      task.start(0);
      task.fail(ERROR_NETWORK);
      const repaired: boolean = task.complete(900);
      logStep('RunRecoveryMatrix', 'repair ' + task.describe());
      expect(repaired).assertTrue();
      expect(task.status).assertEqual(STATUS_COMPLETED);
      expect(task.isFailed()).assertFalse();
      expect(task.isComplete()).assertTrue();
      expect(task.progress).assertEqual(PROGRESS_TOTAL);
      expect(task.lastErrorCode).assertEqual(ERROR_NETWORK);
      expect(task.finishedAt).assertEqual(900);
    });

    /**
     * @tc.name   runRecoveryFailedThenResetThenComplete
     * @tc.desc   The full recovery path failure, reset, retry and success leaves only the second attempt visible.
     * @tc.precondition  The shared driver is loaded and row A is idle.
     * @tc.steps         1. Start row A and fail it with the timeout code.
     *                   2. Reset and start the row again.
     *                   3. Complete the second attempt and read the stamps.
     * @tc.expected      The row completes with two attempts, no error and the second attempt stamps.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('runRecoveryFailedThenResetThenComplete', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      task.start(0);
      task.fail(ERROR_TIMEOUT);
      task.reset();
      task.start(640);
      const completed: boolean = task.complete(1280);
      logStep('RunRecoveryMatrix', 'recovered ' + task.describe() + ' attempts ' + String(task.attempts));
      expect(completed).assertTrue();
      expect(task.attempts).assertEqual(2);
      expect(task.status).assertEqual(STATUS_COMPLETED);
      expect(task.progress).assertEqual(100);
      expect(task.startedAt).assertEqual(640);
      expect(task.finishedAt).assertEqual(1280);
      expect(task.lastErrorCode).assertEqual(ERROR_NONE);
    });

    /**
     * @tc.name   runRecoveryRetryCycleKeepsErrorCodeUntilReset
     * @tc.desc   Failure codes are sticky across progress callbacks and only reset clears them.
     * @tc.precondition  The shared driver is loaded and row B fails with the network code.
     * @tc.steps         1. Start row B, fail it and read the code.
     *                   2. Report progress on the failed row and read the code again.
     *                   3. Reset, fail again with the timeout code and read the code.
     * @tc.expected      The code survives the report, clears on reset and becomes the new code on the second failure.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('runRecoveryRetryCycleKeepsErrorCodeUntilReset', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, URL_TASK_B);
      task.start(0);
      task.fail(ERROR_NETWORK);
      const firstCode: number = task.lastErrorCode;
      task.reportProgress(50);
      const afterReport: number = task.lastErrorCode;
      task.reset();
      const afterReset: number = task.lastErrorCode;
      task.start(1);
      task.fail(ERROR_TIMEOUT);
      logStep('RunRecoveryMatrix', 'codes ' + String(firstCode) + '/' + String(afterReport) + '/' +
        String(afterReset) + '/' + String(task.lastErrorCode));
      expect(firstCode).assertEqual(ERROR_NETWORK);
      expect(afterReport).assertEqual(ERROR_NETWORK);
      expect(afterReset).assertEqual(ERROR_NONE);
      expect(task.lastErrorCode).assertEqual(ERROR_TIMEOUT);
      expect(task.attempts).assertEqual(2);
      expect(firstCode === task.lastErrorCode).assertFalse();
    });

    /**
     * @tc.name   runRecoveryPartialResetKeepsOtherComplete
     * @tc.desc   Resetting one shared row leaves the other row completed but closes the gate again.
     * @tc.precondition  The shared driver is loaded and rows A and B have both completed.
     * @tc.steps         1. Start the graph and complete rows A and B.
     *                   2. Reset only row A.
     *                   3. Read both statuses and the gate flag.
     * @tc.expected      Row B stays completed, row A is idle and the gate is closed.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('runRecoveryPartialResetKeepsOtherComplete', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      graph.taskAt(0).reset();
      logStep('RunRecoveryMatrix', 'partial reset ' + graph.snapshotText());
      expect(graph.taskAt(0).isIdle()).assertTrue();
      expect(graph.taskAt(0).progress).assertEqual(0);
      expect(graph.taskAt(1).isComplete()).assertTrue();
      expect(graph.taskAt(1).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.completionOrder.length).assertEqual(2);
      expect(graph.allCompleted()).assertFalse();
    });

    /**
     * @tc.name   runRecoveryRestartKeepsIdentity
     * @tc.desc   Recovery never rewrites the task number or the URL, so the row keeps addressing the same file.
     * @tc.precondition  The shared driver is loaded and row C uses the third URL literal.
     * @tc.steps         1. Start row C, fail it and reset it.
     *                   2. Start the row again and complete it.
     *                   3. Compare the identity fields with the first reading.
     * @tc.expected      The task number and URL are unchanged after the whole recovery path.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('runRecoveryRestartKeepsIdentity', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_C, 'https://example.com/icon_main_color.png');
      const urlAtStart: string = task.url;
      task.start(0);
      task.fail(ERROR_START);
      task.reset();
      task.start(1);
      task.complete(2);
      logStep('RunRecoveryMatrix', 'identity ' + task.taskNo + ' ' + task.url);
      expect(task.taskNo).assertEqual(TASK_C);
      expect(task.url).assertEqual(urlAtStart);
      expect(task.url.indexOf('icon_main_color.png')).assertLarger(0);
      expect(task.status).assertEqual(STATUS_COMPLETED);
      expect(task.attempts).assertEqual(2);
      expect(task.url.startsWith('https://')).assertTrue();
    });

    /**
     * @tc.name   runRecoveryFailureCodePersistsAcrossReports
     * @tc.desc   A failed row keeps both its code and its frozen percentage when a late report arrives.
     * @tc.precondition  The shared driver is loaded and row A failed at 30 percent.
     * @tc.steps         1. Start row A, report 30 percent and fail with the start code.
     *                   2. Report 80 percent on the failed row.
     *                   3. Read the bar, the label and the code.
     * @tc.expected      The bar stays 30, the label keeps 30 percent and the code is unchanged.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('runRecoveryFailureCodePersistsAcrossReports', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      task.start(0);
      task.reportProgress(30);
      task.fail(ERROR_START);
      const late: number = task.reportProgress(80);
      logStep('RunRecoveryMatrix', 'late report ' + task.describe() + ' label ' + task.label());
      expect(late).assertEqual(30);
      expect(task.progress).assertEqual(30);
      expect(task.label()).assertEqual('任务A当前进度 30%');
      expect(task.lastErrorCode).assertEqual(ERROR_START);
      expect(task.status).assertEqual(STATUS_FAILED);
      expect(task.progress).assertLess(80);
    });

    /**
     * @tc.name   runRecoveryEventTraceDeterministic
     * @tc.desc   Two graphs that see the same recovery sequence produce an identical event trace and fingerprint.
     * @tc.precondition  The shared driver is loaded and two fresh graphs apply the same operations.
     * @tc.steps         1. Apply start, complete A, fail B and complete C to both graphs.
     *                   2. Read both event traces and both fingerprints.
     *                   3. Compare the values.
     * @tc.expected      The traces are identical and the fingerprints match each other.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('runRecoveryEventTraceDeterministic', 0, () => {
      const first: TaskGraph = createTaskGraph();
      const second: TaskGraph = createTaskGraph();
      first.startAll();
      second.startAll();
      first.completeTask(TASK_A, 10);
      second.completeTask(TASK_A, 10);
      first.taskAt(1).fail(ERROR_NETWORK);
      second.taskAt(1).fail(ERROR_NETWORK);
      first.completeTask(TASK_C, 40);
      second.completeTask(TASK_C, 40);
      logStep('RunRecoveryMatrix', 'trace ' + first.eventTrace());
      expect(first.eventTrace()).assertEqual(second.eventTrace());
      expect(first.events.fingerprint()).assertEqual(second.events.fingerprint());
      expect(first.events.countOf('completed')).assertEqual(2);
      expect(first.events.countOf('unlocked')).assertEqual(0);
      expect(first.events.size()).assertEqual(second.events.size());
      expect(first.eventTrace().indexOf('completed:A')).assertLarger(0);
    });

    /**
     * @tc.name   runRecoveryPollClockStopsAndRestarts
     * @tc.desc   The poll clock freezes its budget when stopped and only start resets the tick history.
     * @tc.precondition  The shared driver is loaded and a clock uses the default 200 ms period.
     * @tc.steps         1. Start the clock and tick three times.
     *                   2. Stop the clock and tick once more.
     *                   3. Start the clock again and read the counters.
     * @tc.expected      The stopped tick returns 600 unchanged and the restart clears ticks and elapsed time.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('runRecoveryPollClockStopsAndRestarts', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      clock.tick();
      clock.tick();
      const elapsed: number = clock.tick();
      clock.stop();
      const frozen: number = clock.tick();
      const ticksFrozen: number = clock.ticks;
      clock.start();
      logStep('RunRecoveryMatrix', 'clock elapsed/frozen ' + String(elapsed) + '/' + String(frozen));
      expect(elapsed).assertEqual(600);
      expect(frozen).assertEqual(600);
      expect(ticksFrozen).assertEqual(3);
      expect(clock.active).assertTrue();
      expect(clock.ticks).assertEqual(0);
      expect(clock.elapsedMs).assertEqual(0);
      expect(clock.isDueAfter(1)).assertFalse();
    });

    /**
     * @tc.name   runRecoveryExhaustedPolicyBlocksFurtherRetry
     * @tc.desc   Once the attempt index reaches the maximum the policy refuses every later transient error.
     * @tc.precondition  The shared driver is loaded and a policy allows only two attempts.
     * @tc.steps         1. Ask shouldRetry for attempts zero and one.
     *                   2. Ask shouldRetry for attempts two and five.
     *                   3. Count the true answers.
     * @tc.expected      Only the first two attempts retry and the exhausted checks report true at two.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('runRecoveryExhaustedPolicyBlocksFurtherRetry', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(2, 150);
      const zero: boolean = policy.shouldRetry(0, ERROR_START, STATUS_FAILED);
      const one: boolean = policy.shouldRetry(1, ERROR_START, STATUS_FAILED);
      const two: boolean = policy.shouldRetry(2, ERROR_START, STATUS_FAILED);
      const five: boolean = policy.shouldRetry(5, ERROR_START, STATUS_FAILED);
      let accepted: number = 0;
      if (zero) {
        accepted = accepted + 1;
      }
      if (one) {
        accepted = accepted + 1;
      }
      logStep('RunRecoveryMatrix', 'policy accepted ' + String(accepted) + ' base ' + String(policy.baseDelayMs));
      expect(zero).assertTrue();
      expect(one).assertTrue();
      expect(two).assertFalse();
      expect(five).assertFalse();
      expect(accepted).assertEqual(2);
      expect(policy.isExhausted(2)).assertTrue();
      expect(policy.delayFor(2)).assertEqual(300);
    });

    /**
     * @tc.name   runRecoveryStartAllRejectedWhileUnfinished
     * @tc.desc   A second startAll is refused while the current run is unfinished, so rows are not restarted mid flight.
     * @tc.precondition  The shared driver is loaded and the graph has been started once.
     * @tc.steps         1. Start the graph and capture the attempts of row A.
     *                   2. Call startAll a second time.
     *                   3. Read the rejection events and the row attempts.
     * @tc.expected      The second start returns false, records one rejection and leaves attempts at one.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('runRecoveryStartAllRejectedWhileUnfinished', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const first: boolean = graph.startAll();
      const second: boolean = graph.startAll();
      logStep('RunRecoveryMatrix', 'start all ' + String(first) + '/' + String(second));
      expect(first).assertTrue();
      expect(second).assertFalse();
      expect(graph.events.countOf('start-rejected')).assertEqual(1);
      expect(graph.events.last()).assertEqual('start-rejected:0');
      expect(graph.taskAt(0).attempts).assertEqual(1);
      expect(graph.taskAt(1).attempts).assertEqual(1);
      expect(graph.isTaskFinished).assertFalse();
    });

    /**
     * @tc.name   runRecoveryFailFromIdleThenReset
     * @tc.desc   A failure may arrive before any start; the row becomes failed without an attempt and reset revives it.
     * @tc.precondition  The shared driver is loaded and row B has never been started.
     * @tc.steps         1. Fail the idle row with the create code.
     *                   2. Attempt to start the failed row.
     *                   3. Reset and start the row.
     * @tc.expected      The failed idle row blocks start with zero attempts and the reset start records attempt one.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('runRecoveryFailFromIdleThenReset', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, URL_TASK_B);
      const failed: boolean = task.fail(ERROR_CREATE);
      const blocked: boolean = task.start(10);
      const attemptsAtFailure: number = task.attempts;
      task.reset();
      const restarted: boolean = task.start(20);
      logStep('RunRecoveryMatrix', 'idle failure ' + String(failed) + ' blocked ' + String(blocked));
      expect(failed).assertTrue();
      expect(blocked).assertFalse();
      expect(attemptsAtFailure).assertEqual(0);
      expect(task.status).assertEqual(STATUS_RUNNING);
      expect(restarted).assertTrue();
      expect(task.attempts).assertEqual(1);
      expect(task.startedAt).assertEqual(20);
    });

    /**
     * @tc.name   runRecoveryFailedRowGateRemainsClosed
     * @tc.desc   A failed shared row keeps the gate closed even when the other shared row completes.
     * @tc.precondition  The shared driver is loaded and row A fails after the run starts.
     * @tc.steps         1. Start the graph and fail row A.
     *                   2. Complete row B.
     *                   3. Ask the gate and attempt the exclusive acquisition.
     * @tc.expected      The gate stays closed, the exclusive acquisition is rejected and C stays idle.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('runRecoveryFailedRowGateRemainsClosed', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).fail(ERROR_NETWORK);
      graph.completeTask(TASK_B, 20);
      const gate: boolean = graph.canRunTaskC();
      const exclusive: boolean = graph.lock.acquireExclusive(TASK_C);
      logStep('RunRecoveryMatrix', 'failed gate ' + String(gate) + ' exclusive ' + String(exclusive));
      expect(gate).assertFalse();
      expect(exclusive).assertFalse();
      expect(graph.lock.rejections).assertLarger(0);
      expect(graph.lock.hasShared(TASK_A)).assertTrue();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      expect(graph.allCompleted()).assertFalse();
    });

    /**
     * @tc.name   runRecoveryFullRecoveryTrace
     * @tc.desc   Seven describe snapshots spell out the complete recovery path from idle to a repaired completion.
     * @tc.precondition  The shared driver is loaded and row A starts idle with an empty history.
     * @tc.steps         1. Walk idle, start, progress, failure and reset snapshots into a trace.
     *                   2. Start again and complete the row.
     *                   3. Compare the joined trace with the expected text.
     * @tc.expected      The trace is idle/running/failed/idle/completed in order with two attempts.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('runRecoveryFullRecoveryTrace', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      const traceParts: string[] = [];
      traceParts.push(task.describe());
      task.start(0);
      traceParts.push(task.describe());
      task.reportProgress(55);
      traceParts.push(task.describe());
      task.fail(ERROR_TIMEOUT);
      traceParts.push(task.describe());
      task.reset();
      traceParts.push(task.describe());
      task.start(1);
      traceParts.push(task.describe());
      task.complete(2);
      traceParts.push(task.describe());
      const trace: string = traceParts.join('>');
      logStep('RunRecoveryMatrix', 'full trace ' + trace);
      expect(traceParts.length).assertEqual(7);
      expect(trace).assertEqual('A:idle:0>A:running:0>A:running:55>A:failed:55>A:idle:0>' +
        'A:running:0>A:completed:100');
      expect(traceParts[3].indexOf('failed')).assertLarger(0);
      expect(traceParts[4]).assertEqual('A:idle:0');
      expect(traceParts[6]).assertEqual('A:completed:100');
      expect(task.attempts).assertEqual(2);
      expect(task.lastErrorCode).assertEqual(ERROR_NONE);
    });
  });
}
