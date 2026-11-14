/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  logInfo,
  serializedDelay,
  runSerializedUiOperation,
  resetDriver,
  isQueueBusy,
  launchEntryAbility,
  waitForIndexPageStable,
  isIndexPageVisible,
  measureElapsed,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_ABILITY_LAUNCH,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

class ConcurrencyLimitExceededError extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'ConcurrencyLimitExceededError';
  }
}

class QueueTicket {
  private sequence: number;
  private label: string;
  private submittedAt: number;
  private startedAt: number = 0;
  private finishedAt: number = 0;

  constructor(sequence: number, label: string) {
    this.sequence = sequence;
    this.label = label;
    this.submittedAt = Date.now();
  }

  public getSequence(): number {
    return this.sequence;
  }

  public getLabel(): string {
    return this.label;
  }

  public getSubmittedAt(): number {
    return this.submittedAt;
  }

  public getStartedAt(): number {
    return this.startedAt;
  }

  public getFinishedAt(): number {
    return this.finishedAt;
  }

  public markStarted(): void {
    this.startedAt = Date.now();
  }

  public markFinished(): void {
    this.finishedAt = Date.now();
  }

  public getWaitTime(): number {
    if (this.startedAt === 0) {
      return 0;
    }
    return this.startedAt - this.submittedAt;
  }

  public getExecutionTime(): number {
    if (this.startedAt === 0 || this.finishedAt === 0) {
      return 0;
    }
    return this.finishedAt - this.startedAt;
  }
}

class TicketOrderValidator {
  public isStrictlyIncreasing(tickets: QueueTicket[]): boolean {
    if (tickets.length < 2) {
      return tickets.length === 1;
    }
    for (let i = 1; i < tickets.length; i++) {
      if (tickets[i].getStartedAt() <= tickets[i - 1].getStartedAt()) {
        return false;
      }
    }
    return true;
  }

  public isExecutionOrderPreserved(tickets: QueueTicket[]): boolean {
    for (let i = 0; i < tickets.length; i++) {
      if (tickets[i].getSequence() !== i) {
        return false;
      }
    }
    return true;
  }

  public areAllCompleted(tickets: QueueTicket[]): boolean {
    if (tickets.length === 0) {
      return false;
    }
    for (let i = 0; i < tickets.length; i++) {
      if (tickets[i].getFinishedAt() === 0) {
        return false;
      }
    }
    return true;
  }

  public isNonOverlapping(tickets: QueueTicket[]): boolean {
    if (tickets.length < 2) {
      return true;
    }
    for (let i = 1; i < tickets.length; i++) {
      if (tickets[i].getStartedAt() < tickets[i - 1].getFinishedAt()) {
        return false;
      }
    }
    return true;
  }
}

class BoundedTaskQueue {
  private limit: number;
  private active: number = 0;
  private peak: number = 0;
  private acceptedTotal: number = 0;
  private rejectedTotal: number = 0;

  constructor(limit: number) {
    this.limit = limit;
  }

  public getLimit(): number {
    return this.limit;
  }

  public getActive(): number {
    return this.active;
  }

  public getPeak(): number {
    return this.peak;
  }

  public getAcceptedTotal(): number {
    return this.acceptedTotal;
  }

  public getRejectedTotal(): number {
    return this.rejectedTotal;
  }

  public trySubmit(): boolean {
    if (this.active >= this.limit) {
      this.rejectedTotal++;
      throw new ConcurrencyLimitExceededError('queue limit ' + this.limit + ' reached');
    }
    this.active++;
    this.acceptedTotal++;
    if (this.active > this.peak) {
      this.peak = this.active;
    }
    return true;
  }

  public complete(): boolean {
    if (this.active === 0) {
      return false;
    }
    this.active--;
    return true;
  }

  public drain(): void {
    this.active = 0;
  }
}

export default function concurrencyControlTest(): void {
  describe('ConcurrencyControlTest', () => {
    let driver: Driver;
    let validator: TicketOrderValidator;

    beforeAll(async () => {
      driver = getDriver();
      validator = new TicketOrderValidator();
      await serializedDelay(driver, 100);

      await ensureIndexPageInitial(driver);
    });

    afterAll(async () => {
      resetDriver();
      await serializedDelay(driver, 100);
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_CONCURRENCY_0100
     * @tc.name testQueueIdleAfterReset
     * @tc.desc Verify serialized queue idle state: after reset the busy flag is false and no pending operation remains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testQueueIdleAfterReset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        resetDriver();
        expect(isQueueBusy()).assertFalse();
        await serializedDelay(driver, 50);
        expect(isQueueBusy()).assertFalse();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_CONCURRENCY_0200
     * @tc.name testSerializedTasksKeepSubmissionOrder
     * @tc.desc Verify five concurrently submitted UI tasks: all complete, sequence order preserved, start times strictly increasing and no two tasks overlap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSerializedTasksKeepSubmissionOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const tickets: QueueTicket[] = [];
        const pending: Promise<void>[] = [];
        for (let i = 0; i < 5; i++) {
          const ticket: QueueTicket = new QueueTicket(i, 'ui-op-' + i);
          tickets.push(ticket);
          pending.push(runSerializedUiOperation(async (): Promise<void> => {
            ticket.markStarted();
            await driver.delayMs(20);
            ticket.markFinished();
          }));
        }
        await Promise.all(pending);
        logInfo('serialized tasks completed: ' + tickets.length);
        expect(tickets.length).assertEqual(5);
        expect(validator.areAllCompleted(tickets)).assertTrue();
        expect(validator.isExecutionOrderPreserved(tickets)).assertTrue();
        expect(validator.isStrictlyIncreasing(tickets)).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_CONCURRENCY_0300
     * @tc.name testSerializedTasksDoNotOverlap
     * @tc.desc Verify serialization exclusivity: four submitted tasks never overlap, each start time is not earlier than the previous finish time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSerializedTasksDoNotOverlap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const tickets: QueueTicket[] = [];
        const pending: Promise<void>[] = [];
        for (let i = 0; i < 4; i++) {
          const ticket: QueueTicket = new QueueTicket(i, 'exclusive-' + i);
          tickets.push(ticket);
          pending.push(runSerializedUiOperation(async (): Promise<void> => {
            ticket.markStarted();
            await driver.delayMs(30);
            ticket.markFinished();
          }));
        }
        await Promise.all(pending);
        expect(validator.areAllCompleted(tickets)).assertTrue();
        expect(validator.isNonOverlapping(tickets)).assertTrue();
        expect(tickets[3].getExecutionTime() >= 20).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_CONCURRENCY_0400
     * @tc.name testSerializedDelayTotalTimeEnforcesQueueing
     * @tc.desc Verify queueing cost: three concurrently submitted 100 ms serialized delays finish in at least 250 ms total
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSerializedDelayTotalTimeEnforcesQueueing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const startTime: number = Date.now();
        const pending: Promise<void>[] = [];
        for (let i = 0; i < 3; i++) {
          pending.push(serializedDelay(driver, 100));
        }
        await Promise.all(pending);
        const elapsed: number = measureElapsed(startTime);
        logInfo('serialized delay total elapsed: ' + elapsed);
        expect(elapsed >= 250).assertTrue();
        expect(elapsed <= TIMEOUT_ABILITY_LAUNCH * 4).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_CONCURRENCY_0500
     * @tc.name testSerializedOperationTaskResult
     * @tc.desc Verify serialized operation return value: task resolving 21 returns 21 to the caller and queue is idle afterwards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSerializedOperationTaskResult', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const result: number = await runSerializedUiOperation(async (): Promise<number> => {
          await driver.delayMs(10);
          return 21;
        });
        expect(result).assertEqual(21);
        expect(isQueueBusy()).assertFalse();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_CONCURRENCY_0600
     * @tc.name testSerializedOperationFailurePropagates
     * @tc.desc Verify failure propagation: a rejecting serialized task surfaces an Error whose name is Error and later tasks still run
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSerializedOperationFailurePropagates', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        try {
          await runSerializedUiOperation(async (): Promise<number> => {
            throw new Error('injected serialized failure');
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('Error');
          expect((e as Error).message).assertContain('injected serialized failure');
        }
        const followUp: number = await runSerializedUiOperation(async (): Promise<number> => {
          await driver.delayMs(10);
          return 7;
        });
        expect(followUp).assertEqual(7);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_CONCURRENCY_0700
     * @tc.name testBoundedQueueAcceptsUpToLimit
     * @tc.desc Verify bounded queue capacity: limit 3 accepts exactly three submissions and reports peak active three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoundedQueueAcceptsUpToLimit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const queue: BoundedTaskQueue = new BoundedTaskQueue(3);
        expect(queue.trySubmit()).assertTrue();
        expect(queue.trySubmit()).assertTrue();
        expect(queue.trySubmit()).assertTrue();
        expect(queue.getLimit()).assertEqual(3);
        expect(queue.getActive()).assertEqual(3);
        expect(queue.getPeak()).assertEqual(3);
        expect(queue.getAcceptedTotal()).assertEqual(3);
        expect(queue.getRejectedTotal()).assertEqual(0);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_CONCURRENCY_0800
     * @tc.name testBoundedQueueRejectsBeyondLimit
     * @tc.desc Verify concurrency limit rejection: a fourth submission against limit 3 throws ConcurrencyLimitExceededError and increments rejected count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoundedQueueRejectsBeyondLimit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const queue: BoundedTaskQueue = new BoundedTaskQueue(3);
        queue.trySubmit();
        queue.trySubmit();
        queue.trySubmit();
        try {
          queue.trySubmit();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ConcurrencyLimitExceededError');
        }
        expect(queue.getRejectedTotal()).assertEqual(1);
        expect(queue.getActive()).assertEqual(3);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_CONCURRENCY_0900
     * @tc.name testBoundedQueueReleaseAllowsResubmission
     * @tc.desc Verify capacity release: completing one of three active tasks frees a slot so the next submission is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoundedQueueReleaseAllowsResubmission', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const queue: BoundedTaskQueue = new BoundedTaskQueue(2);
        queue.trySubmit();
        queue.trySubmit();
        expect(queue.complete()).assertTrue();
        expect(queue.getActive()).assertEqual(1);
        expect(queue.trySubmit()).assertTrue();
        expect(queue.getAcceptedTotal()).assertEqual(3);
        expect(queue.getPeak()).assertEqual(2);
        queue.drain();
        expect(queue.getActive()).assertEqual(0);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_CONCURRENCY_1000
     * @tc.name testBoundedQueueZeroLimitRejectsAll
     * @tc.desc Verify zero capacity queue: limit 0 rejects the first submission and completion on empty queue returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoundedQueueZeroLimitRejectsAll', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const queue: BoundedTaskQueue = new BoundedTaskQueue(0);
        try {
          queue.trySubmit();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ConcurrencyLimitExceededError');
        }
        expect(queue.getActive()).assertEqual(0);
        expect(queue.complete()).assertFalse();
        expect(queue.getRejectedTotal()).assertEqual(1);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_CONCURRENCY_1100
     * @tc.name testTicketWaitTimeNonNegative
     * @tc.desc Verify ticket timing accessors: a submitted and started ticket reports non negative wait time and positive execution time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTicketWaitTimeNonNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const ticket: QueueTicket = new QueueTicket(0, 'timed');
        expect(ticket.getStartedAt()).assertEqual(0);
        expect(ticket.getWaitTime()).assertEqual(0);
        expect(ticket.getExecutionTime()).assertEqual(0);
        ticket.markStarted();
        ticket.markFinished();
        expect(ticket.getWaitTime() >= 0).assertTrue();
        expect(ticket.getFinishedAt() >= ticket.getStartedAt()).assertTrue();
        expect(ticket.getLabel()).assertEqual('timed');
        expect(ticket.getSubmittedAt() > 0).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_CONCURRENCY_1200
     * @tc.name testValidatorBoundaryCases
     * @tc.desc Verify order validator boundaries: empty list is not completed, single ticket is strictly increasing, duplicate start times fail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testValidatorBoundaryCases', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(validator.areAllCompleted([])).assertFalse();
        expect(validator.isStrictlyIncreasing([])).assertFalse();
        expect(validator.isNonOverlapping([])).assertTrue();
        const single: QueueTicket = new QueueTicket(0, 'single');
        single.markStarted();
        single.markFinished();
        expect(validator.isStrictlyIncreasing([single])).assertTrue();
        const first: QueueTicket = new QueueTicket(0, 'a');
        const second: QueueTicket = new QueueTicket(1, 'b');
        first.markStarted();
        second.markStarted();
        expect(validator.isStrictlyIncreasing([first, second])).assertFalse();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_CONCURRENCY_1300
     * @tc.name testConcurrentLaunchKeepsPageVisible
     * @tc.desc Verify concurrent ability launch requests: two serialized launch tasks complete and the Index page stays visible afterwards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcurrentLaunchKeepsPageVisible', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const pending: Promise<void>[] = [];
        pending.push(runSerializedUiOperation(async (): Promise<void> => {
          await launchEntryAbility();
        }));
        pending.push(runSerializedUiOperation(async (): Promise<void> => {
          await launchEntryAbility();
        }));
        await Promise.all(pending);
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_CONCURRENCY_1400
     * @tc.name testRepeatedSubmissionIsNotIdempotentInSequence
     * @tc.desc Verify each submission receives a distinct sequence: submitting four identical delays yields sequences 0 to 3 and four completions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRepeatedSubmissionIsNotIdempotentInSequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const tickets: QueueTicket[] = [];
        const pending: Promise<void>[] = [];
        for (let i = 0; i < 4; i++) {
          const ticket: QueueTicket = new QueueTicket(i, 'same-delay');
          tickets.push(ticket);
          pending.push(runSerializedUiOperation(async (): Promise<void> => {
            ticket.markStarted();
            await driver.delayMs(15);
            ticket.markFinished();
          }));
        }
        await Promise.all(pending);
        expect(tickets[0].getSequence()).assertEqual(0);
        expect(tickets[3].getSequence()).assertEqual(3);
        expect(validator.areAllCompleted(tickets)).assertTrue();
        expect(validator.isStrictlyIncreasing(tickets)).assertTrue();
      } finally {
        done();
      }
    });
  });
}
