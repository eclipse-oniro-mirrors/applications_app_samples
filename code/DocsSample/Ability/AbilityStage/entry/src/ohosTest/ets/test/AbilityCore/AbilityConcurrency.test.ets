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
  ensureIndexPageInitial,
  logInfo,
  logError,
  sleepMs,
  launchEntryAbility,
  startAbilityByWant,
  buildEntryWant,
  doAbilityForeground,
  doAbilityBackground,
  runSerializedUiOperation,
  isQueueBusy,
  resetDriver,
  waitForIndexPageStable,
  checkTextContent,
  pageComponentCount,
  DELAY_AFTER_BACKGROUND,
  DELAY_AFTER_LAUNCH,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED
} from '../Shared/SharedDriver';

enum LaunchOutcome {
  ACCEPTED = 'ACCEPTED',
  REJECTED = 'REJECTED',
  REUSED = 'REUSED'
}

interface LaunchRequest {
  requestId: number;
  abilityName: string;
  issuedAt: number;
}

interface LaunchResult {
  requestId: number;
  outcome: LaunchOutcome;
  reason: string;
  finishedAt: number;
}

class ConcurrencyLimitError extends Error {
  private readonly limit: number;
  private readonly attempted: number;

  constructor(limit: number, attempted: number) {
    super(`concurrency limit ${limit} exceeded by request ${attempted}`);
    this.name = 'ConcurrencyLimitError';
    this.limit = limit;
    this.attempted = attempted;
  }

  public getLimit(): number {
    return this.limit;
  }

  public getAttempted(): number {
    return this.attempted;
  }
}

class LaunchGate {
  private readonly capacity: number;
  private activeCount: number = 0;
  private acceptedCount: number = 0;
  private rejectedCount: number = 0;
  private peakActive: number = 0;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public acquire(): boolean {
    if (this.activeCount >= this.capacity) {
      this.rejectedCount++;
      return false;
    }
    this.activeCount++;
    this.acceptedCount++;
    if (this.activeCount > this.peakActive) {
      this.peakActive = this.activeCount;
    }
    return true;
  }

  public acquireOrThrow(): void {
    if (!this.acquire()) {
      throw new ConcurrencyLimitError(this.capacity, this.activeCount + 1);
    }
  }

  public release(): boolean {
    if (this.activeCount <= 0) {
      return false;
    }
    this.activeCount--;
    return true;
  }

  public getActive(): number {
    return this.activeCount;
  }

  public getCapacity(): number {
    return this.capacity;
  }

  public getAccepted(): number {
    return this.acceptedCount;
  }

  public getRejected(): number {
    return this.rejectedCount;
  }

  public getPeak(): number {
    return this.peakActive;
  }

  public isSaturated(): boolean {
    return this.activeCount >= this.capacity;
  }
}

class SerializedTaskQueue {
  private readonly labels: string[] = [];
  private order: number[] = [];
  private tail: Promise<void> = Promise.resolve();
  private runningCount: number = 0;
  private maxRunning: number = 0;
  private failureCount: number = 0;

  public enqueue(taskId: number, work: () => Promise<void>): Promise<void> {
    this.labels.push(`task-${taskId}`);
    const result: Promise<void> = this.tail.then(async (): Promise<void> => {
      this.runningCount++;
      if (this.runningCount > this.maxRunning) {
        this.maxRunning = this.runningCount;
      }
      try {
        await work();
        this.order.push(taskId);
      } finally {
        this.runningCount--;
      }
    });
    this.tail = result.then(async (): Promise<void> => {
    }, async (): Promise<void> => {
      this.failureCount++;
    });
    return result;
  }

  public async drain(): Promise<void> {
    await this.tail;
  }

  public getOrder(): number[] {
    return this.order.slice(0);
  }

  public getLabels(): string[] {
    return this.labels.slice(0);
  }

  public getMaxRunning(): number {
    return this.maxRunning;
  }

  public getFailureCount(): number {
    return this.failureCount;
  }

  public isOrderStrictlyIncreasing(): boolean {
    for (let i = 1; i < this.order.length; i++) {
      if (this.order[i] <= this.order[i - 1]) {
        return false;
      }
    }
    return true;
  }
}

class AlternationModel {
  private expectedNext: number = 0;
  private accepted: number = 0;
  private violated: number = 0;

  public submit(kind: number): boolean {
    if (kind !== this.expectedNext) {
      this.violated++;
      return false;
    }
    this.accepted++;
    this.expectedNext = this.expectedNext === 0 ? 1 : 0;
    return true;
  }

  public getExpectedNext(): number {
    return this.expectedNext;
  }

  public getAccepted(): number {
    return this.accepted;
  }

  public getViolated(): number {
    return this.violated;
  }
}

class LaunchLedger {
  private results: LaunchResult[] = [];
  private accepted: number = 0;
  private rejected: number = 0;
  private reused: number = 0;

  public add(result: LaunchResult): void {
    this.results.push(result);
    if (result.outcome === LaunchOutcome.ACCEPTED) {
      this.accepted++;
    } else if (result.outcome === LaunchOutcome.REJECTED) {
      this.rejected++;
    } else {
      this.reused++;
    }
  }

  public getAccepted(): number {
    return this.accepted;
  }

  public getRejected(): number {
    return this.rejected;
  }

  public getReused(): number {
    return this.reused;
  }

  public getTotal(): number {
    return this.results.length;
  }

  public getOutcomeAt(index: number): LaunchOutcome | null {
    if (index < 0 || index >= this.results.length) {
      return null;
    }
    return this.results[index].outcome;
  }

  public allRequestIdsUnique(): boolean {
    const ids: number[] = [];
    for (let i = 0; i < this.results.length; i++) {
      if (ids.indexOf(this.results[i].requestId) >= 0) {
        return false;
      }
      ids.push(this.results[i].requestId);
    }
    return true;
  }

  public getFirstRejectionIndex(): number {
    for (let i = 0; i < this.results.length; i++) {
      if (this.results[i].outcome === LaunchOutcome.REJECTED) {
        return i;
      }
    }
    return -1;
  }
}

class ConcurrentLaunchModel {
  private readonly gate: LaunchGate;
  private readonly ledger: LaunchLedger = new LaunchLedger();
  private nextRequestId: number = 1;
  private reuseWindowMs: number = 200;

  constructor(capacity: number) {
    this.gate = new LaunchGate(capacity);
  }

  public request(elapsedSinceLastMs: number): LaunchResult {
    const request: LaunchRequest = {
      requestId: this.nextRequestId,
      abilityName: 'EntryAbility',
      issuedAt: Date.now()
    };
    this.nextRequestId++;
    if (elapsedSinceLastMs <= this.reuseWindowMs && this.ledger.getAccepted() > 0) {
      const reused: LaunchResult = {
        requestId: request.requestId,
        outcome: LaunchOutcome.REUSED,
        reason: 'within reuse window',
        finishedAt: Date.now()
      };
      this.ledger.add(reused);
      return reused;
    }
    if (!this.gate.acquire()) {
      const rejected: LaunchResult = {
        requestId: request.requestId,
        outcome: LaunchOutcome.REJECTED,
        reason: 'gate saturated',
        finishedAt: Date.now()
      };
      this.ledger.add(rejected);
      return rejected;
    }
    const accepted: LaunchResult = {
      requestId: request.requestId,
      outcome: LaunchOutcome.ACCEPTED,
      reason: 'gate acquired',
      finishedAt: Date.now()
    };
    this.ledger.add(accepted);
    return accepted;
  }

  public complete(): boolean {
    return this.gate.release();
  }

  public getGate(): LaunchGate {
    return this.gate;
  }

  public getLedger(): LaunchLedger {
    return this.ledger;
  }

  public setReuseWindow(windowMs: number): void {
    this.reuseWindowMs = windowMs;
  }

  public getReuseWindow(): number {
    return this.reuseWindowMs;
  }
}

export default function abilityConcurrencyTest(): void {
  describe('AbilityConcurrencyTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      logInfo('AbilityConcurrencyTest beforeAll: preparing EntryAbility');
      try {
        await launchEntryAbility();
        await waitForIndexPageStable(driver);
        await ensureIndexPageInitial(driver);
      } catch (error) {
        logError(`AbilityConcurrencyTest beforeAll error: ${error}`);
      }
    })

    afterAll(async () => {
      try {
        await doAbilityForeground();
        await sleepMs(DELAY_AFTER_BACKGROUND);
        resetDriver();
      } catch (error) {
        logError(`AbilityConcurrencyTest afterAll error: ${error}`);
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCONCUR_0100
     * @tc.name testConcurrencyGateAcceptsUpToCapacity
     * @tc.desc Verify a gate with capacity three accepts exactly three acquisitions and rejects the fourth
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcurrencyGateAcceptsUpToCapacity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const gate: LaunchGate = new LaunchGate(3);
          expect(gate.acquire()).assertTrue();
          expect(gate.acquire()).assertTrue();
          expect(gate.acquire()).assertTrue();
          expect(gate.isSaturated()).assertTrue();
          expect(gate.acquire()).assertFalse();
          expect(gate.getActive()).assertEqual(3);
          expect(gate.getAccepted()).assertEqual(3);
          expect(gate.getRejected()).assertEqual(1);
          expect(gate.getPeak()).assertEqual(3);
          expect(gate.getCapacity()).assertEqual(3);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCONCUR_0200
     * @tc.name testConcurrencyGateReleaseRestoresSlot
     * @tc.desc Verify releasing one slot lets the next acquisition succeed and peak stays at capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcurrencyGateReleaseRestoresSlot', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const gate: LaunchGate = new LaunchGate(2);
          expect(gate.acquire()).assertTrue();
          expect(gate.acquire()).assertTrue();
          expect(gate.acquire()).assertFalse();
          expect(gate.release()).assertTrue();
          expect(gate.getActive()).assertEqual(1);
          expect(gate.isSaturated()).assertFalse();
          expect(gate.acquire()).assertTrue();
          expect(gate.getActive()).assertEqual(2);
          expect(gate.getPeak()).assertEqual(2);
          expect(gate.getRejected()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCONCUR_0300
     * @tc.name testConcurrencyGateReleaseEmptyRejected
     * @tc.desc Verify releasing an empty gate returns false and active count stays at zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcurrencyGateReleaseEmptyRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const gate: LaunchGate = new LaunchGate(1);
          expect(gate.release()).assertFalse();
          expect(gate.release()).assertFalse();
          expect(gate.getActive()).assertEqual(0);
          expect(gate.getPeak()).assertEqual(0);
          expect(gate.isSaturated()).assertFalse();
          expect(gate.acquire()).assertTrue();
          expect(gate.getPeak()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCONCUR_0400
     * @tc.name testConcurrencyAcquireOrThrowReportsLimit
     * @tc.desc Verify acquireOrThrow throws ConcurrencyLimitError carrying limit two when saturated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcurrencyAcquireOrThrowReportsLimit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const gate: LaunchGate = new LaunchGate(2);
          gate.acquireOrThrow();
          gate.acquireOrThrow();
          try {
            gate.acquireOrThrow();
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('ConcurrencyLimitError');
            const limitError: ConcurrencyLimitError = e as ConcurrencyLimitError;
            expect(limitError.getLimit()).assertEqual(2);
            expect(limitError.getAttempted()).assertEqual(3);
          }
          expect(gate.getActive()).assertEqual(2);
          expect(gate.getAccepted()).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCONCUR_0500
     * @tc.name testConcurrencyRapidLaunchReusesAbility
     * @tc.desc Verify requests inside the reuse window are marked REUSED and never touch the gate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcurrencyRapidLaunchReusesAbility', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const model: ConcurrentLaunchModel = new ConcurrentLaunchModel(2);
          expect(model.request(5000).outcome).assertEqual(LaunchOutcome.ACCEPTED);
          expect(model.request(10).outcome).assertEqual(LaunchOutcome.REUSED);
          expect(model.request(200).outcome).assertEqual(LaunchOutcome.REUSED);
          expect(model.request(201).outcome).assertEqual(LaunchOutcome.ACCEPTED);
          expect(model.getLedger().getAccepted()).assertEqual(2);
          expect(model.getLedger().getReused()).assertEqual(2);
          expect(model.getLedger().getRejected()).assertEqual(0);
          expect(model.getGate().getActive()).assertEqual(2);
          expect(model.getReuseWindow()).assertEqual(200);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCONCUR_0600
     * @tc.name testConcurrencyOverloadRejectsBeyondCapacity
     * @tc.desc Verify five concurrent requests against capacity two yield three rejections with unique ids
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcurrencyOverloadRejectsBeyondCapacity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const model: ConcurrentLaunchModel = new ConcurrentLaunchModel(2);
          model.setReuseWindow(0);
          for (let i = 0; i < 5; i++) {
            model.request(1000);
          }
          const ledger: LaunchLedger = model.getLedger();
          expect(ledger.getTotal()).assertEqual(5);
          expect(ledger.getAccepted()).assertEqual(2);
          expect(ledger.getRejected()).assertEqual(3);
          expect(ledger.allRequestIdsUnique()).assertTrue();
          expect(ledger.getFirstRejectionIndex()).assertEqual(2);
          expect(ledger.getOutcomeAt(0)).assertEqual(LaunchOutcome.ACCEPTED);
          expect(ledger.getOutcomeAt(4)).assertEqual(LaunchOutcome.REJECTED);
          expect(model.getGate().getPeak()).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCONCUR_0700
     * @tc.name testConcurrencySerialQueuePreservesOrder
     * @tc.desc Verify serialized task queue executes enqueued tasks in strictly increasing submission order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcurrencySerialQueuePreservesOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const queue: SerializedTaskQueue = new SerializedTaskQueue();
          for (let taskId = 1; taskId <= 6; taskId++) {
            queue.enqueue(taskId, async (): Promise<void> => {
              await sleepMs(5);
            });
          }
          await queue.drain();
          const order: number[] = queue.getOrder();
          expect(order.length).assertEqual(6);
          expect(order[0]).assertEqual(1);
          expect(order[5]).assertEqual(6);
          expect(queue.isOrderStrictlyIncreasing()).assertTrue();
          expect(queue.getMaxRunning()).assertEqual(1);
          expect(queue.getLabels().length).assertEqual(6);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCONCUR_0800
     * @tc.name testConcurrencySerialQueueSkipsFailedTask
     * @tc.desc Verify a throwing task is skipped and later tasks still run in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcurrencySerialQueueSkipsFailedTask', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const queue: SerializedTaskQueue = new SerializedTaskQueue();
          queue.enqueue(1, async (): Promise<void> => {
            await sleepMs(2);
          });
          queue.enqueue(2, async (): Promise<void> => {
            throw new Error('simulated queue failure');
          }).catch((error: Error) => {
            logInfo(`testConcurrencySerialQueueSkipsFailedTask: caught ${error.message}`);
          });
          queue.enqueue(3, async (): Promise<void> => {
            await sleepMs(2);
          });
          await sleepMs(50);
          const order: number[] = queue.getOrder();
          expect(order.length).assertEqual(2);
          expect(order[0]).assertEqual(1);
          expect(order[1]).assertEqual(3);
          expect(queue.getMaxRunning()).assertEqual(1);
          expect(queue.getFailureCount()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCONCUR_0900
     * @tc.name testConcurrencyAlternationModelStrict
     * @tc.desc Verify alternation model accepts six ordered foreground background flips and rejects a repeat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcurrencyAlternationModelStrict', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const model: AlternationModel = new AlternationModel();
          for (let i = 0; i < 6; i++) {
            expect(model.submit(i % 2)).assertTrue();
          }
          expect(model.getAccepted()).assertEqual(6);
          expect(model.getViolated()).assertEqual(0);
          expect(model.getExpectedNext()).assertEqual(0);
          expect(model.submit(0)).assertTrue();
          expect(model.submit(0)).assertFalse();
          expect(model.getViolated()).assertEqual(1);
          expect(model.getAccepted()).assertEqual(7);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCONCUR_1000
     * @tc.name testConcurrencyRunSerializedRealOperations
     * @tc.desc Verify real serialized UI operations all complete and the queue is idle afterwards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcurrencyRunSerializedRealOperations', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const completions: number[] = [];
          for (let i = 1; i <= 4; i++) {
            await runSerializedUiOperation(async (): Promise<void> => {
              await sleepMs(5);
              completions.push(i);
            });
          }
          expect(completions.length).assertEqual(4);
          expect(completions[0]).assertEqual(1);
          expect(completions[3]).assertEqual(4);
          expect(completions[1]).assertEqual(2);
          expect(completions[2]).assertEqual(3);
          expect(isQueueBusy()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCONCUR_1100
     * @tc.name testConcurrencyParallelSerializedOperations
     * @tc.desc Verify four operations started without await still run one at a time in submission order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcurrencyParallelSerializedOperations', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const order: number[] = [];
          const pending: Promise<void>[] = [];
          for (let i = 1; i <= 4; i++) {
            const taskId: number = i;
            pending.push(runSerializedUiOperation(async (): Promise<void> => {
              await sleepMs(5);
              order.push(taskId);
            }));
          }
          await Promise.all(pending);
          expect(order.length).assertEqual(4);
          expect(order[0]).assertEqual(1);
          expect(order[1]).assertEqual(2);
          expect(order[2]).assertEqual(3);
          expect(order[3]).assertEqual(4);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCONCUR_1200
     * @tc.name testConcurrencyParallelRealLaunchesReachForeground
     * @tc.desc Verify five parallel startAbility requests leave the Index page rendered and readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcurrencyParallelRealLaunchesReachForeground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const pending: Promise<void>[] = [];
          for (let i = 0; i < 5; i++) {
            pending.push(startAbilityByWant(buildEntryWant()));
          }
          await Promise.all(pending);
          await sleepMs(DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver);
          expect(stable).assertTrue();
          const readable: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL) ||
            await checkTextContent(driver, PAGE_TEXT_CLICKED);
          expect(readable).assertTrue();
          const components: number = await pageComponentCount(driver);
          expect(components > 0).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCONCUR_1300
     * @tc.name testConcurrencySerializedRealBackgroundForeground
     * @tc.desc Verify serialized background and foreground calls alternate three times without breaking the
     * page: seven submissions are accepted in strict alternation, so the model ends expecting the
     * background step next and reports no violations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcurrencySerializedRealBackgroundForeground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const model: AlternationModel = new AlternationModel();
          await runSerializedUiOperation(async (): Promise<void> => {
            await doAbilityForeground();
            await sleepMs(DELAY_AFTER_BACKGROUND);
          });
          model.submit(0);
          for (let round = 0; round < 3; round++) {
            await runSerializedUiOperation(async (): Promise<void> => {
              await doAbilityBackground();
              await sleepMs(DELAY_AFTER_BACKGROUND);
            });
            expect(model.submit(1)).assertTrue();
            await runSerializedUiOperation(async (): Promise<void> => {
              await doAbilityForeground();
              await sleepMs(DELAY_AFTER_BACKGROUND);
            });
            expect(model.submit(0)).assertTrue();
          }
          expect(model.getAccepted()).assertEqual(7);
          expect(model.getViolated()).assertEqual(0);
          expect(model.getExpectedNext()).assertEqual(1);
          const stable: boolean = await waitForIndexPageStable(driver);
          expect(stable).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCONCUR_1400
     * @tc.name testConcurrencyGateExhaustionThenRecovery
     * @tc.desc Verify model recovers full capacity after three completions release all saturated slots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcurrencyGateExhaustionThenRecovery', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const model: ConcurrentLaunchModel = new ConcurrentLaunchModel(3);
          model.setReuseWindow(0);
          expect(model.request(1000).outcome).assertEqual(LaunchOutcome.ACCEPTED);
          expect(model.request(1000).outcome).assertEqual(LaunchOutcome.ACCEPTED);
          expect(model.request(1000).outcome).assertEqual(LaunchOutcome.ACCEPTED);
          expect(model.request(1000).outcome).assertEqual(LaunchOutcome.REJECTED);
          expect(model.complete()).assertTrue();
          expect(model.complete()).assertTrue();
          expect(model.complete()).assertTrue();
          expect(model.complete()).assertFalse();
          expect(model.getGate().getActive()).assertEqual(0);
          expect(model.request(1000).outcome).assertEqual(LaunchOutcome.ACCEPTED);
          expect(model.getLedger().getRejected()).assertEqual(1);
          expect(model.getLedger().getTotal()).assertEqual(5);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYCONCUR_1500
     * @tc.name testConcurrencyRealQueueSurvivesRepeatedLaunch
     * @tc.desc Verify three serialized real launches keep queue responsive and page readable each round
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcurrencyRealQueueSurvivesRepeatedLaunch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          for (let round = 1; round <= 3; round++) {
            await runSerializedUiOperation(async (): Promise<void> => {
              await launchEntryAbility();
              await sleepMs(DELAY_AFTER_LAUNCH);
            });
            const visible: boolean = await waitForIndexPageStable(driver);
            expect(visible).assertTrue();
            logInfo(`testConcurrencyRealQueueSurvivesRepeatedLaunch: round ${round} visible ${visible}`);
          }
          expect(isQueueBusy()).assertFalse();
        } finally {
          done();
        }
      })
  })
}
