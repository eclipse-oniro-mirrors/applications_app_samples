/*
 * Copyright (c) 2023-2024 Huawei Device Co., Ltd.
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

import { describe, expect, it } from '@ohos/hypium';
import { runSerialized } from './Shared/PerformanceDriver';

class QueueGate {
  promise: Promise<number>;
  private complete?: (value: number) => void;

  constructor() {
    this.promise = new Promise<number>(resolve => { this.complete = resolve; });
  }

  release(value: number = 7): void {
    const complete = this.complete;
    if (complete === undefined) {
      throw new Error('Queue gate was not initialized');
    }
    complete(value);
  }
}

async function flushMicrotasks(): Promise<void> {
  for (let turn = 0; turn < 8; turn++) {
    await Promise.resolve();
  }
}

export default function queueLifecycleTest(): void {
  describe('PerformanceQueueLifecycle', () => {
    // @tc.number SUB_PERFORMANCE_QUEUELIFECYCLE_0001
    // @tc.name queuedActionDoesNotRunSynchronouslyAtSubmission
    // @tc.desc Verify submission defers the action until a promise turn and returns its actual result.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('queuedActionDoesNotRunSynchronouslyAtSubmission', 0, async () => {
      const events: string[] = [];
      const result = runSerialized(async () => { events.push('started'); return 13; });
      const immediate = events.join(',');
      expect(immediate).assertEqual('');
      const value = await result;
      const final = events.join(',');
      expect(value).assertEqual(13);
      expect(final).assertEqual('started');
    });

    // @tc.number SUB_PERFORMANCE_QUEUELIFECYCLE_0002
    // @tc.name unsettledActionPreventsItsFollowerFromStarting
    // @tc.desc Verify the next action remains pending while its predecessor awaits an explicitly controlled gate.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('unsettledActionPreventsItsFollowerFromStarting', 0, async () => {
      const gate = new QueueGate();
      const events: string[] = [];
      const first = runSerialized(async () => { events.push('first'); return await gate.promise; });
      const second = runSerialized(async () => { events.push('second'); return 11; });
      try {
        await flushMicrotasks();
        const pending = events.join(',');
        expect(pending).assertEqual('first');
      } finally {
        gate.release(17);
      }
      const values = await Promise.all([first, second]);
      const completed = events.join(',');
      const observedValue1 = values.join(',');
      expect(observedValue1).assertEqual('17,11');
      expect(completed).assertEqual('first,second');
    });

    // @tc.number SUB_PERFORMANCE_QUEUELIFECYCLE_0003
    // @tc.name delayedRejectionReleasesTheNextQueuedAction
    // @tc.desc Verify an asynchronous rejection preserves the original error and releases a waiting successor.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('delayedRejectionReleasesTheNextQueuedAction', 0, async () => {
      const gate = new QueueGate();
      const failure = new Error('late failure');
      const events: string[] = [];
      const first = runSerialized(async () => { events.push('first'); await gate.promise; throw failure; });
      const observed = first.then(() => false, (error: Error) => error === failure);
      const second = runSerialized(async () => { events.push('second'); return 19; });
      try {
        await flushMicrotasks();
        const pending = events.join(',');
        expect(pending).assertEqual('first');
      } finally {
        gate.release();
      }
      const exactError = await observed;
      const value = await second;
      expect(exactError).assertTrue();
      expect(value).assertEqual(19);
      const observedValue2 = events.join(',');
      expect(observedValue2).assertEqual('first,second');
    });

    // @tc.number SUB_PERFORMANCE_QUEUELIFECYCLE_0004
    // @tc.name actionEnqueuedFromInsideAnotherActionKeepsFifoOrder
    // @tc.desc Verify work submitted during an action stays behind a successor that was already queued.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('actionEnqueuedFromInsideAnotherActionKeepsFifoOrder', 0, async () => {
      const events: string[] = [];
      let nested: Promise<number> = Promise.resolve(-1);
      const first = runSerialized(async () => {
        events.push('first');
        nested = runSerialized(async () => { events.push('nested'); return 31; });
        return 23;
      });
      const second = runSerialized(async () => { events.push('second'); return 29; });
      const outer = await Promise.all([first, second]);
      const value = await nested;
      const observedValue3 = outer.join(',');
      expect(observedValue3).assertEqual('23,29');
      expect(value).assertEqual(31);
      const observedValue4 = events.join(',');
      expect(observedValue4).assertEqual('first,second,nested');
    });

    // @tc.number SUB_PERFORMANCE_QUEUELIFECYCLE_0005
    // @tc.name workEnqueuedBeforeAnActionFailsStillRunsInOrder
    // @tc.desc Verify a failing action cannot discard work that it submitted before rejecting.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('workEnqueuedBeforeAnActionFailsStillRunsInOrder', 0, async () => {
      const events: string[] = [];
      let nested: Promise<number> = Promise.resolve(-1);
      const first = runSerialized(async () => {
        events.push('failed');
        nested = runSerialized(async () => { events.push('nested'); return 37; });
        throw new Error('parent failed');
      });
      const observed = first.then(() => 'unexpected success', (error: Error) => error.message);
      const second = runSerialized(async () => { events.push('second'); return 41; });
      const message = await observed;
      const successor = await second;
      const child = await nested;
      expect(message).assertEqual('parent failed');
      expect(successor).assertEqual(41);
      expect(child).assertEqual(37);
      const observedValue5 = events.join(',');
      expect(observedValue5).assertEqual('failed,second,nested');
    });

    // @tc.number SUB_PERFORMANCE_QUEUELIFECYCLE_0006
    // @tc.name asynchronousFinallyCompletesBeforeTheNextActionStarts
    // @tc.desc Verify serialization includes awaited successful cleanup rather than just the main action body.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('asynchronousFinallyCompletesBeforeTheNextActionStarts', 0, async () => {
      const gate = new QueueGate();
      const events: string[] = [];
      const first = runSerialized(async () => {
        try { events.push('body'); return 43; }
        finally { events.push('cleanup-start'); await gate.promise; events.push('cleanup-end'); }
      });
      const second = runSerialized(async () => { events.push('next'); return 47; });
      try {
        await flushMicrotasks();
        const observedValue6 = events.join(',');
        expect(observedValue6).assertEqual('body,cleanup-start');
      } finally { gate.release(); }
      const values = await Promise.all([first, second]);
      const observedValue7 = values.join(',');
      expect(observedValue7).assertEqual('43,47');
      const observedValue8 = events.join(',');
      expect(observedValue8).assertEqual('body,cleanup-start,cleanup-end,next');
    });

    // @tc.number SUB_PERFORMANCE_QUEUELIFECYCLE_0007
    // @tc.name failedActionAlsoFinishesAwaitedCleanupBeforeItsSuccessor
    // @tc.desc Verify rejected work retains exclusive queue access until its asynchronous finally block completes.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('failedActionAlsoFinishesAwaitedCleanupBeforeItsSuccessor', 0, async () => {
      const gate = new QueueGate();
      const events: string[] = [];
      const first = runSerialized(async () => {
        try { throw new Error('body rejected'); }
        finally { events.push('cleanup'); await gate.promise; events.push('released'); }
      });
      const observed = first.then(() => 'unexpected success', (error: Error) => error.message);
      const second = runSerialized(async () => { events.push('next'); return 53; });
      try {
        await flushMicrotasks();
        const observedValue9 = events.join(',');
        expect(observedValue9).assertEqual('cleanup');
      } finally { gate.release(); }
      const message = await observed;
      const value = await second;
      expect(message).assertEqual('body rejected');
      expect(value).assertEqual(53);
      const observedValue10 = events.join(',');
      expect(observedValue10).assertEqual('cleanup,released,next');
    });

    // @tc.number SUB_PERFORMANCE_QUEUELIFECYCLE_0008
    // @tc.name observerFailureDoesNotPoisonTheUnderlyingQueue
    // @tc.desc Verify an exception in a caller continuation does not turn a successful queue action into queue failure.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('observerFailureDoesNotPoisonTheUnderlyingQueue', 0, async () => {
      const original = runSerialized(async () => 59);
      const observed = original.then(() => { throw new Error('observer failed'); })
        .then(() => 'unexpected success', (error: Error) => error.message);
      const next = runSerialized(async () => 61);
      const value = await original;
      const message = await observed;
      const successor = await next;
      expect(value).assertEqual(59);
      expect(message).assertEqual('observer failed');
      expect(successor).assertEqual(61);
    });

    // @tc.number SUB_PERFORMANCE_QUEUELIFECYCLE_0009
    // @tc.name stoppingAnObserverDoesNotCancelQueuedWork
    // @tc.desc Verify losing a Promise race does not cancel queued execution or release its successor prematurely.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('stoppingAnObserverDoesNotCancelQueuedWork', 0, async () => {
      const gate = new QueueGate();
      const events: string[] = [];
      const first = runSerialized(async () => { await gate.promise; events.push('first'); return 67; });
      const second = runSerialized(async () => { events.push('second'); return 71; });
      try {
        const raced = await Promise.race([first, Promise.resolve(-1)]);
        expect(raced).assertEqual(-1);
        await flushMicrotasks();
        const observedValue11 = events.length;
        expect(observedValue11).assertEqual(0);
      } finally { gate.release(); }
      const values = await Promise.all([first, second]);
      const observedValue12 = values.join(',');
      expect(observedValue12).assertEqual('67,71');
      const observedValue13 = events.join(',');
      expect(observedValue13).assertEqual('first,second');
    });

    // @tc.number SUB_PERFORMANCE_QUEUELIFECYCLE_0010
    // @tc.name mixedResultsAndErrorsStayAssociatedWithTheirOwnActions
    // @tc.desc Verify interleaved successes and failures preserve FIFO execution and each caller result.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('mixedResultsAndErrorsStayAssociatedWithTheirOwnActions', 0, async () => {
      const events: string[] = [];
      const first = runSerialized(async () => { events.push('a'); return 73; });
      const second = runSerialized(async () => { events.push('b'); throw new Error('b failed'); });
      const errorB = second.then(() => 'unexpected success', (error: Error) => error.message);
      const third = runSerialized(async () => { events.push('c'); return 79; });
      const fourth = runSerialized(async () => { events.push('d'); throw new Error('d failed'); });
      const errorD = fourth.then(() => 'unexpected success', (error: Error) => error.message);
      const values = await Promise.all([first, third]);
      const messages = await Promise.all([errorB, errorD]);
      const observedValue14 = values.join(',');
      expect(observedValue14).assertEqual('73,79');
      const observedValue15 = messages.join(',');
      expect(observedValue15).assertEqual('b failed,d failed');
      const observedValue16 = events.join(',');
      expect(observedValue16).assertEqual('a,b,c,d');
    });

    // @tc.number SUB_PERFORMANCE_QUEUELIFECYCLE_0011
    // @tc.name rejectionReasonIsPreservedEvenWhenItIsFalsy
    // @tc.desc Verify null, undefined, zero and empty-string rejections are forwarded without success substitution.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('rejectionReasonIsPreservedEvenWhenItIsFalsy', 0, async () => {
      const reasons: (number | string | null | undefined)[] = [0, '', null, undefined];
      for (const reason of reasons) {
        const action = runSerialized(() => Promise.reject<number>(reason));
        const sameReason = await action.then(() => false,
          (received: number | string | null | undefined) => received === reason);
        expect(sameReason).assertTrue();
      }
      const final = await runSerialized(async () => 83);
      expect(final).assertEqual(83);
    });

    // @tc.number SUB_PERFORMANCE_QUEUELIFECYCLE_0012
    // @tc.name resolvedObjectRemainsSharedWithTheCallerAndNextAction
    // @tc.desc Verify a delayed result preserves object identity and mutations made before the next queued observation.
    // @tc.size MEDIUMTEST
    // @tc.type FUNCTION
    // @tc.level LEVEL2
    it('resolvedObjectRemainsSharedWithTheCallerAndNextAction', 0, async () => {
      const state: number[] = [2];
      const first = runSerialized(async () => { await Promise.resolve(); state.push(3); return state; });
      const second = runSerialized(async () => { state.push(5); return state; });
      const results = await Promise.all([first, second]);
      const firstIdentity = results[0] === state;
      const secondIdentity = results[1] === state;
      expect(firstIdentity).assertTrue();
      expect(secondIdentity).assertTrue();
      const observedValue17 = state.join(',');
      expect(observedValue17).assertEqual('2,3,5');
    });
  });
}
