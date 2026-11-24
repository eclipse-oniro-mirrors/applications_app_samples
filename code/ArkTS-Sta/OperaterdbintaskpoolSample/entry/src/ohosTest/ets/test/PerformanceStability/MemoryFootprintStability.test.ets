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
 * MemoryFootprintStability models a repeatedly torn down and rebuilt page:
 *
 *   DatabaseConnection.ets:57-89   the singleton store is rebuilt after a reset
 *   ContactManager.ets:41-48        the cache is replaced, never appended, on a reload
 *   TaskPool.ets:69-117            queued wrappers finish before the next page load
 *   DatabaseConnection.ets:277-309 the result-set walk materializes fresh rows
 *   OperateRDBInTaskPool.ets:74-80 the page republishes its state on every appearance
 *
 * Nothing here measures real heap usage. Instead the probe asserts the bounded
 * structures: row lists, snapshot lists, log entries, queue entries and the
 * fingerprint ring all have a fixed ceiling, so no cycle can accumulate state.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  StoreDouble,
  TaskPoolQueue,
  ContactMetrics,
  ContactSnapshot,
  snapshotsOf,
  sameSnapshotArray,
  createSeedContacts,
  contactOf,
  cloneContact,
  contactNames,
  joined,
  countOf,
  uniqueStrings,
  sameStringArray,
  textFingerprint,
  resetContactManager,
  SearchEngine
} from '../Shared/SharedDriver';

/** Fixed capacity log used to model a bounded diagnostics buffer. */
class BoundedLog {
  public capacity: number;
  public entries: string[] = [];
  public dropped: number = 0;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public record(entry: string): void {
    this.entries.push(entry);
    while (this.entries.length > this.capacity) {
      this.entries.shift();
      this.dropped = this.dropped + 1;
    }
  }

  public size(): number {
    return this.entries.length;
  }

  public last(): string {
    return this.entries.length === 0 ? '' : this.entries[this.entries.length - 1];
  }

  public first(): string {
    return this.entries.length === 0 ? '' : this.entries[0];
  }

  public trace(): string {
    return joined(this.entries, '>');
  }

  public clear(): void {
    this.entries = [];
    this.dropped = 0;
  }
}

/** Drives reset and rebuild cycles while keeping every helper bounded. */
class FootprintProbe {
  public manager: ContactManager;
  public store: StoreDouble;
  public queue: TaskPoolQueue;
  public log: BoundedLog = new BoundedLog(16);
  public snapshots: ContactSnapshot[] = [];
  public fingerprints: number[] = [];
  public cycles: number = 0;

  constructor(manager: ContactManager, store: StoreDouble, queue: TaskPoolQueue) {
    this.manager = manager;
    this.store = store;
    this.queue = queue;
  }

  public cycle(rows: Contact[]): number {
    this.store.reset();
    this.manager.setContacts([]);
    this.queue.reset();
    this.snapshots = [];
    this.store.batchInsert(true, rows);
    this.manager.setContacts(this.store.query(true));
    this.snapshots = snapshotsOf(rows);
    this.fingerprints.push(this.fingerprintOf(rows));
    while (this.fingerprints.length > 16) {
      this.fingerprints.shift();
    }
    this.cycles = this.cycles + 1;
    this.log.record('cycle' + String(this.cycles));
    return this.store.rowCount();
  }

  public fingerprintOf(rows: Contact[]): number {
    const parts: string[] = [];
    for (let index = 0; index < rows.length; index++) {
      parts.push(rows[index].name + '=' + rows[index].phone);
    }
    return textFingerprint(joined(parts, ','));
  }

  public rowsMatch(): boolean {
    return sameStringArray(contactNames(this.store.rows), contactNames(this.manager.getContacts()));
  }

  public snapshotLength(): number {
    return this.snapshots.length;
  }

  public clearSnapshots(): void {
    this.snapshots = [];
  }

  public queueDepth(): number {
    return this.queue.pending.length + this.queue.running.length;
  }

  public submitBurst(count: number): number {
    for (let index = 0; index < count; index++) {
      this.queue.submit('task-' + String(index));
    }
    return this.queue.pending.length;
  }
}

/** A short payload used to keep the cycles cheap. */
function shortPayload(): Contact[] {
  return createSeedContacts().slice(0, 6);
}

export default function memoryFootprintStabilityTest(): void {
  describe('MemoryFootprintStability', () => {
    let manager: ContactManager = resetContactManager();
    let store: StoreDouble = new StoreDouble();
    let queue: TaskPoolQueue = new TaskPoolQueue();
    let probe: FootprintProbe = new FootprintProbe(manager, store, queue);

    beforeAll(() => {
      logSuite('MemoryFootprintStability', 'begin');
    });

    beforeEach(async () => {
      manager = resetContactManager();
      store = new StoreDouble();
      queue = new TaskPoolQueue();
      probe = new FootprintProbe(manager, store, queue);
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });

    afterAll(() => {
      resetContactManager();
      logSuite('MemoryFootprintStability', 'end');
    });

    /**
     * @tc.name   resetCycleLeavesNoResidualRows
     * @tc.desc   One reset and rebuild cycle replaces the old payload instead of appending to it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('resetCycleLeavesNoResidualRows', 0, () => {
      store.batchInsert(true, createSeedContacts());
      const before: number = store.rowCount();
      const after: number = probe.cycle(shortPayload());
      logStep('residual', String(before) + '->' + String(after));
      expect(before).assertEqual(15);
      expect(after).assertEqual(6);
      expect(store.rowCount()).assertEqual(6);
      expect(countOf(store.names(), '法里')).assertEqual(0);
      expect(store.batchCalls).assertEqual(1);
    });

    /**
     * @tc.name   tenCyclesKeepRowCountAtPayload
     * @tc.desc   Ten identical cycles always end with the payload size, never with an accumulation.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('tenCyclesKeepRowCountAtPayload', 0, () => {
      for (let round = 0; round < 10; round++) {
        probe.cycle(shortPayload());
      }
      logStep('ten-cycles', String(probe.cycles) + '/' + String(store.rowCount()));
      expect(probe.cycles).assertEqual(10);
      expect(store.rowCount()).assertEqual(6);
      expect(manager.getContacts().length).assertEqual(6);
      expect(probe.log.size()).assertEqual(10);
      expect(store.initCalls).assertEqual(1);
    });

    /**
     * @tc.name   cycleCountTracksRuns
     * @tc.desc   The probe cycle counter advances once per call and labels every log entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cycleCountTracksRuns', 0, () => {
      probe.cycle(shortPayload());
      probe.cycle(shortPayload().slice(0, 3));
      probe.cycle(shortPayload().slice(0, 1));
      logStep('cycle-log', probe.log.trace());
      expect(probe.cycles).assertEqual(3);
      expect(probe.log.trace()).assertEqual('cycle1>cycle2>cycle3');
      expect(store.rowCount()).assertEqual(1);
      expect(probe.log.last()).assertEqual('cycle3');
    });

    /**
     * @tc.name   resetCycleClearsManagerCacheBeforeRebuild
     * @tc.desc   The cycle empties the cache first, so the rebuilt list holds only the new payload.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetCycleClearsManagerCacheBeforeRebuild', 0, () => {
      manager = resetContactManager(createSeedContacts());
      probe.cycle([createSeedContacts()[14]]);
      logStep('cache-cycle', String(manager.getContacts().length));
      expect(manager.getContacts().length).assertEqual(1);
      expect(manager.getContacts()[0].name).assertEqual('法里');
      expect(countOf(contactNames(manager.getContacts()), '艾德里安')).assertEqual(0);
      expect(probe.rowsMatch()).assertTrue();
    });

    /**
     * @tc.name   boundedLogNeverExceedsCapacity
     * @tc.desc   A burst of thirty entries leaves the log at its sixteen entry ceiling.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('boundedLogNeverExceedsCapacity', 0, () => {
      for (let index = 0; index < 30; index++) {
        probe.log.record('entry-' + String(index));
      }
      logStep('log-size', String(probe.log.size()));
      expect(probe.log.capacity).assertEqual(16);
      expect(probe.log.size()).assertEqual(16);
      expect(probe.log.size() <= probe.log.capacity).assertTrue();
      expect(probe.log.entries.length).assertEqual(16);
    });

    /**
     * @tc.name   boundedLogDropsOldestEntries
     * @tc.desc   Once full the log discards the oldest entries, so the first entry is not entry-0.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('boundedLogDropsOldestEntries', 0, () => {
      for (let index = 0; index < 20; index++) {
        probe.log.record('entry-' + String(index));
      }
      logStep('log-drop', probe.log.first());
      expect(probe.log.first()).assertEqual('entry-4');
      expect(probe.log.last()).assertEqual('entry-19');
      expect(probe.log.dropped).assertEqual(4);
      expect(probe.log.size()).assertEqual(16);
      expect(probe.log.entries.indexOf('entry-0')).assertEqual(-1);
    });

    /**
     * @tc.name   boundedLogKeepsNewestEntry
     * @tc.desc   The newest entry always survives, so the last diagnostic line is never lost.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('boundedLogKeepsNewestEntry', 0, () => {
      for (let index = 0; index < 25; index++) {
        probe.log.record('step-' + String(index));
      }
      logStep('log-last', probe.log.last());
      expect(probe.log.last()).assertEqual('step-24');
      expect(probe.log.entries[15]).assertEqual('step-24');
      expect(probe.log.trace().indexOf('step-9')).assertEqual(0);
      expect(probe.log.dropped).assertEqual(9);
      expect(probe.log.size()).assertEqual(probe.log.capacity);
    });

    /**
     * @tc.name   snapshotClearEmptiesSnapshot
     * @tc.desc   Clearing the snapshot list drops every descriptor without touching the store rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotClearEmptiesSnapshot', 0, () => {
      probe.cycle(shortPayload());
      const before: number = probe.snapshotLength();
      probe.clearSnapshots();
      logStep('snapshot-clear', String(before) + '->' + String(probe.snapshotLength()));
      expect(before).assertEqual(6);
      expect(probe.snapshotLength()).assertEqual(0);
      expect(store.rowCount()).assertEqual(6);
      expect(manager.getContacts().length).assertEqual(6);
      expect(probe.rowsMatch()).assertTrue();
    });

    /**
     * @tc.name   snapshotCaptureDoesNotGrowStore
     * @tc.desc   Building snapshots is a read only step, so the store row count is unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotCaptureDoesNotGrowStore', 0, () => {
      probe.cycle(shortPayload());
      const rowsBefore: number = store.rowCount();
      const snapshots: ContactSnapshot[] = snapshotsOf(store.query(true));
      logStep('snapshot-read', String(snapshots.length) + '/' + String(store.rowCount()));
      expect(snapshots.length).assertEqual(rowsBefore);
      expect(store.rowCount()).assertEqual(rowsBefore);
      expect(store.queryCalls).assertEqual(2);
      expect(store.insertCalls).assertEqual(0);
      expect(snapshots[0].name).assertEqual('艾德里安');
    });

    /**
     * @tc.name   fingerprintsBoundedToCapacity
     * @tc.desc   More than sixteen cycles keep the fingerprint ring at sixteen entries.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fingerprintsBoundedToCapacity', 0, () => {
      for (let round = 0; round < 25; round++) {
        probe.cycle(shortPayload().slice(0, 1 + round % 5));
      }
      logStep('ring-size', String(probe.fingerprints.length));
      expect(probe.cycles).assertEqual(25);
      expect(probe.fingerprints.length).assertEqual(16);
      expect(probe.fingerprints.length <= 16).assertTrue();
      expect(probe.fingerprints.length < probe.cycles).assertTrue();
    });

    /**
     * @tc.name   fingerprintsStableAcrossIdenticalCycles
     * @tc.desc   Two cycles with the same payload push the same fingerprint value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintsStableAcrossIdenticalCycles', 0, () => {
      probe.cycle(shortPayload());
      probe.cycle(shortPayload());
      const first: number = probe.fingerprints[0];
      const second: number = probe.fingerprints[1];
      logStep('stable-fingerprint', String(first));
      expect(first).assertEqual(second);
      expect(first).assertEqual(probe.fingerprintOf(shortPayload()));
      expect(first > 0).assertTrue();
      expect(probe.fingerprints.length).assertEqual(2);
    });

    /**
     * @tc.name   repeatedRebuildKeepsRowOrder
     * @tc.desc   Five identical cycles always rebuild the same ordered name list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedRebuildKeepsRowOrder', 0, () => {
      for (let round = 0; round < 5; round++) {
        probe.cycle(shortPayload());
      }
      const expected: string[] = contactNames(shortPayload());
      logStep('rebuild-order', joined(store.names(), ','));
      expect(sameStringArray(store.names(), expected)).assertTrue();
      expect(sameStringArray(contactNames(manager.getContacts()), expected)).assertTrue();
      expect(store.names()[0]).assertEqual('艾德里安');
      expect(store.names()[5]).assertEqual('卡梅隆');
    });

    /**
     * @tc.name   repeatedRebuildKeepsCategoryBuckets
     * @tc.desc   The rebuilt payload keeps its three category buckets across cycles.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedRebuildKeepsCategoryBuckets', 0, () => {
      for (let round = 0; round < 4; round++) {
        probe.cycle(shortPayload());
      }
      const groups: string[] = SearchEngine.groupByCategory(store.rows);
      logStep('rebuild-buckets', joined(groups, ','));
      expect(groups.length).assertEqual(3);
      expect(sameStringArray(groups, ['A', 'B', 'C'])).assertTrue();
      expect(SearchEngine.countCategory(store.rows, 'A')).assertEqual(2);
      expect(SearchEngine.countCategory(store.rows, 'B')).assertEqual(3);
      expect(store.rowCount()).assertEqual(6);
    });

    /**
     * @tc.name   resetClearsQueueHistory
     * @tc.desc   A cycle clears the completed, failed and order lists of the queue.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetClearsQueueHistory', 0, () => {
      queue.submit('query-all');
      queue.submit('insert-one');
      queue.complete(queue.runNext());
      queue.fail(queue.runNext());
      const before: string = String(queue.completed.length) + '/' + String(queue.failed.length);
      probe.cycle(shortPayload());
      logStep('queue-history', before);
      expect(queue.completed.length).assertEqual(0);
      expect(queue.failed.length).assertEqual(0);
      expect(queue.completionOrder.length).assertEqual(0);
      expect(probe.queueDepth()).assertEqual(0);
      expect(before).assertEqual('1/1');
    });

    /**
     * @tc.name   queueDrainLeavesNoPending
     * @tc.desc   Draining a submitted burst leaves no pending or running work.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queueDrainLeavesNoPending', 0, () => {
      probe.submitBurst(12);
      const drained: number = queue.drain();
      logStep('drain', String(drained));
      expect(drained).assertEqual(12);
      expect(queue.pending.length).assertEqual(0);
      expect(queue.running.length).assertEqual(0);
      expect(probe.queueDepth()).assertEqual(0);
      expect(queue.completed.length).assertEqual(12);
    });

    /**
     * @tc.name   submitBurstReportsPendingCount
     * @tc.desc   A burst helper returns the pending depth, which matches the submitted count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('submitBurstReportsPendingCount', 0, () => {
      const pending: number = probe.submitBurst(20);
      logStep('burst', String(pending));
      expect(pending).assertEqual(20);
      expect(queue.pending.length).assertEqual(20);
      expect(queue.running.length).assertEqual(0);
      expect(queue.size()).assertEqual(20);
      expect(probe.queueDepth()).assertEqual(20);
    });

    /**
     * @tc.name   queueCapacityRespectedAfterDrain
     * @tc.desc   After a drain and a reset the queue accepts a new burst without old entries.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queueCapacityRespectedAfterDrain', 0, () => {
      probe.submitBurst(8);
      queue.drain();
      queue.reset();
      probe.submitBurst(4);
      logStep('refill-depth', String(probe.queueDepth()));
      expect(probe.queueDepth()).assertEqual(4);
      expect(queue.completed.length).assertEqual(0);
      expect(queue.completionOrder.length).assertEqual(0);
      expect(queue.drain()).assertEqual(4);
      expect(probe.queueDepth()).assertEqual(0);
    });

    /**
     * @tc.name   noResidualNamesAfterRebuild
     * @tc.desc   Names from the first payload cannot appear after rebuilding with another slice.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('noResidualNamesAfterRebuild', 0, () => {
      probe.cycle(createSeedContacts());
      probe.cycle(createSeedContacts().slice(10, 15));
      const names: string[] = store.names();
      logStep('residual-names', joined(names, ','));
      expect(names.length).assertEqual(5);
      expect(countOf(names, '艾德里安')).assertEqual(0);
      expect(countOf(names, '法里')).assertEqual(1);
      expect(names[0]).assertEqual('艾登');
      expect(sameStringArray(names, contactNames(manager.getContacts()))).assertTrue();
    });

    /**
     * @tc.name   storeRowsEqualManagerAfterEachCycle
     * @tc.desc   Parity is restored after every one of six cycles, not only at the end.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeRowsEqualManagerAfterEachCycle', 0, () => {
      let parityRounds = 0;
      for (let round = 0; round < 6; round++) {
        probe.cycle(shortPayload().slice(0, 1 + round));
        if (probe.rowsMatch() && store.rowCount() === manager.getContacts().length) {
          parityRounds = parityRounds + 1;
        }
      }
      logStep('parity-rounds', String(parityRounds));
      expect(parityRounds).assertEqual(6);
      expect(parityRounds).assertEqual(probe.cycles);
      expect(store.rowCount()).assertEqual(6);
      expect(manager.getContacts().length).assertEqual(6);
    });

    /**
     * @tc.name   metricsTotalStableAfterEachCycle
     * @tc.desc   Metrics computed after each cycle track the current payload, never a running total.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsTotalStableAfterEachCycle', 0, () => {
      const observed: number[] = [];
      for (let round = 0; round < 4; round++) {
        probe.cycle(shortPayload().slice(0, 2 + round));
        observed.push(ContactMetrics.from(store.rows).total);
      }
      logStep('metric-totals', joined([String(observed[0]), String(observed[3])], ','));
      expect(observed.length).assertEqual(4);
      expect(observed[0]).assertEqual(2);
      expect(observed[1]).assertEqual(3);
      expect(observed[2]).assertEqual(4);
      expect(observed[3]).assertEqual(5);
      expect(observed[3]).assertEqual(store.rowCount());
    });

    /**
     * @tc.name   probeDefaultsOnConstruction
     * @tc.desc   A new probe starts with no cycles, no snapshots, no fingerprints and an empty log.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('probeDefaultsOnConstruction', 0, () => {
      const freshProbe: FootprintProbe =
        new FootprintProbe(resetContactManager(), new StoreDouble(), new TaskPoolQueue());
      logStep('probe-defaults', String(freshProbe.cycles));
      expect(freshProbe.cycles).assertEqual(0);
      expect(freshProbe.snapshotLength()).assertEqual(0);
      expect(freshProbe.fingerprints.length).assertEqual(0);
      expect(freshProbe.log.size()).assertEqual(0);
      expect(freshProbe.queueDepth()).assertEqual(0);
      expect(freshProbe.log.capacity).assertEqual(16);
    });

    /**
     * @tc.name   logTraceEmptyAfterClear
     * @tc.desc   Clearing the bounded log empties the trace and resets the dropped counter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logTraceEmptyAfterClear', 0, () => {
      for (let index = 0; index < 20; index++) {
        probe.log.record('line-' + String(index));
      }
      const droppedBefore: number = probe.log.dropped;
      probe.log.clear();
      logStep('log-cleared', String(droppedBefore));
      expect(probe.log.size()).assertEqual(0);
      expect(probe.log.dropped).assertEqual(0);
      expect(probe.log.trace()).assertEqual('');
      expect(probe.log.last()).assertEqual('');
      expect(droppedBefore).assertEqual(4);
    });

    /**
     * @tc.name   snapshotLengthMatchesRowCount
     * @tc.desc   The snapshot list built by a cycle always has one descriptor per stored row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotLengthMatchesRowCount', 0, () => {
      probe.cycle(createSeedContacts());
      logStep('snapshot-rows', String(probe.snapshotLength()));
      expect(probe.snapshotLength()).assertEqual(15);
      expect(probe.snapshotLength()).assertEqual(store.rowCount());
      expect(probe.snapshotLength()).assertEqual(manager.getContacts().length);
      expect(probe.snapshots[14].name).assertEqual('法里');
    });

    /**
     * @tc.name   repeatedQueryDoesNotGrowQueue
     * @tc.desc   Query reads never enqueue tasks, so the queue depth stays at zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedQueryDoesNotGrowQueue', 0, () => {
      probe.cycle(shortPayload());
      for (let round = 0; round < 5; round++) {
        store.query(true);
      }
      logStep('query-queue', String(probe.queueDepth()));
      expect(probe.queueDepth()).assertEqual(0);
      expect(queue.pending.length).assertEqual(0);
      expect(store.queryCalls).assertEqual(6);
      expect(store.rowCount()).assertEqual(6);
    });

    /**
     * @tc.name   hundredStepsDoNotAccumulateRows
     * @tc.desc   One hundred cycles still leave exactly the payload size in the store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('hundredStepsDoNotAccumulateRows', 0, () => {
      for (let round = 0; round < 100; round++) {
        probe.cycle(shortPayload());
      }
      logStep('hundred-cycles', String(store.rowCount()) + '/' + String(probe.log.size()));
      expect(probe.cycles).assertEqual(100);
      expect(store.rowCount()).assertEqual(6);
      expect(manager.getContacts().length).assertEqual(6);
      expect(probe.log.size()).assertEqual(16);
      expect(probe.fingerprints.length).assertEqual(16);
    });

    /**
     * @tc.name   fingerprintDiffersWhenPayloadChanges
     * @tc.desc   A cycle with a different payload records a different fingerprint value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintDiffersWhenPayloadChanges', 0, () => {
      probe.cycle(shortPayload());
      const first: number = probe.fingerprints[0];
      probe.cycle(shortPayload().slice(0, 5));
      const second: number = probe.fingerprints[1];
      logStep('fingerprint-diff', String(first) + '/' + String(second));
      expect(first === second).assertFalse();
      expect(probe.fingerprints.length).assertEqual(2);
      expect(probe.fingerprintOf(shortPayload().slice(0, 5))).assertEqual(second);
      expect(store.rowCount()).assertEqual(5);
    });

    /**
     * @tc.name   cycleWithEmptyPayloadLeavesZero
     * @tc.desc   A cycle with an empty payload clears both holders without an error.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cycleWithEmptyPayloadLeavesZero', 0, () => {
      probe.cycle(shortPayload());
      const written: number = probe.cycle([]);
      logStep('empty-cycle', String(written));
      expect(written).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(manager.getContacts().length).assertEqual(0);
      expect(probe.snapshotLength()).assertEqual(0);
      expect(probe.rowsMatch()).assertTrue();
      expect(store.initialized).assertTrue();
    });

    /**
     * @tc.name   cycleRestoresSeedAfterEmpty
     * @tc.desc   A cycle after an empty one restores the payload and full parity.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cycleRestoresSeedAfterEmpty', 0, () => {
      probe.cycle([]);
      const restored: number = probe.cycle(createSeedContacts());
      logStep('restore', String(restored));
      expect(restored).assertEqual(15);
      expect(store.rowCount()).assertEqual(15);
      expect(manager.getContacts().length).assertEqual(15);
      expect(store.names()[0]).assertEqual('艾德里安');
      expect(probe.snapshotLength()).assertEqual(15);
      expect(probe.rowsMatch()).assertTrue();
    });

    /**
     * @tc.name   snapshotEqualityBetweenIdenticalCycles
     * @tc.desc   Two identical cycles produce snapshot arrays that compare equal field by field.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotEqualityBetweenIdenticalCycles', 0, () => {
      probe.cycle(shortPayload());
      const first: ContactSnapshot[] = probe.snapshots;
      probe.cycle(shortPayload());
      const second: ContactSnapshot[] = probe.snapshots;
      logStep('snapshot-cycles', String(first.length) + '/' + String(second.length));
      expect(first.length).assertEqual(6);
      expect(second.length).assertEqual(6);
      expect(sameSnapshotArray(first, second)).assertTrue();
      expect(first[0] === second[0]).assertFalse();
      expect(second[5].name).assertEqual('卡梅隆');
    });

    /**
     * @tc.name   cycleResetsStoreCountersEachTime
     * @tc.desc   Each cycle starts from reset counters, so init and table counts stay at one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cycleResetsStoreCountersEachTime', 0, () => {
      probe.cycle(shortPayload());
      probe.cycle(shortPayload());
      probe.cycle(shortPayload());
      logStep('cycle-counters', String(store.initCalls) + '/' + String(store.batchCalls));
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.deleteCalls).assertEqual(0);
      expect(store.updateCalls).assertEqual(0);
      expect(store.rowCount()).assertEqual(6);
    });

    /**
     * @tc.name   payloadCloneIndependenceInCycle
     * @tc.desc   Editing the payload after a cycle cannot rewrite the stored or cached rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('payloadCloneIndependenceInCycle', 0, () => {
      const payload: Contact[] = shortPayload();
      probe.cycle(payload);
      const storedName: string = store.names()[0];
      payload[0].name = '被修改';
      payload.splice(1, 4);
      logStep('payload-independent', store.names()[0]);
      expect(store.names()[0]).assertEqual(storedName);
      expect(store.rowCount()).assertEqual(6);
      expect(manager.getContacts()[0].name).assertEqual(storedName);
      expect(countOf(store.names(), '被修改')).assertEqual(0);
      expect(payload.length).assertEqual(2);
    });

    /**
     * @tc.name   logBoundedUnderCycleStorm
     * @tc.desc   Sixty cycles produce sixty log records but the buffer keeps only sixteen.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logBoundedUnderCycleStorm', 0, () => {
      for (let round = 0; round < 60; round++) {
        probe.cycle(shortPayload());
      }
      logStep('storm-log', String(probe.log.size()) + '/' + String(probe.log.dropped));
      expect(probe.cycles).assertEqual(60);
      expect(probe.log.size()).assertEqual(16);
      expect(probe.log.dropped).assertEqual(44);
      expect(probe.log.last()).assertEqual('cycle60');
      expect(probe.log.first()).assertEqual('cycle45');
    });

    /**
     * @tc.name   queueResetAfterBurstDropsPending
     * @tc.desc   A burst followed by a reset leaves the queue with no pending entries.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queueResetAfterBurstDropsPending', 0, () => {
      probe.submitBurst(15);
      const depthBefore: number = probe.queueDepth();
      queue.reset();
      logStep('burst-reset', String(depthBefore) + '->' + String(probe.queueDepth()));
      expect(depthBefore).assertEqual(15);
      expect(probe.queueDepth()).assertEqual(0);
      expect(queue.pending.length).assertEqual(0);
      expect(queue.runNext()).assertEqual('');
      expect(probe.cycle(shortPayload())).assertEqual(6);
    });

    /**
     * @tc.name   metricsAfterTenCyclesMatchPayload
     * @tc.desc   Metrics after ten cycles describe only the six row payload in hand.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsAfterTenCyclesMatchPayload', 0, () => {
      for (let round = 0; round < 10; round++) {
        probe.cycle(shortPayload());
      }
      const metrics: ContactMetrics = ContactMetrics.from(store.rows);
      logStep('cycle-metrics', String(metrics.total));
      expect(metrics.total).assertEqual(6);
      expect(metrics.uniqueNames).assertEqual(6);
      expect(metrics.duplicateNames).assertEqual(0);
      expect(metrics.categories).assertEqual(3);
      expect(metrics.fingerprint()).assertEqual(ContactMetrics.from(manager.getContacts()).fingerprint());
    });

    /**
     * @tc.name   fingerprintsRingKeepsNewestValues
     * @tc.desc   The fingerprint ring drops the oldest value and keeps the most recent cycle hash.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('fingerprintsRingKeepsNewestValues', 0, () => {
      probe.cycle(shortPayload().slice(0, 1));
      const oldest: number = probe.fingerprints[0];
      for (let round = 0; round < 16; round++) {
        probe.cycle(shortPayload());
      }
      const newest: number = probe.fingerprints[15];
      logStep('ring-newest', String(newest));
      expect(probe.cycles).assertEqual(17);
      expect(probe.fingerprints.length).assertEqual(16);
      expect(probe.fingerprints.indexOf(oldest)).assertEqual(-1);
      expect(newest).assertEqual(probe.fingerprintOf(shortPayload()));
      expect(newest === oldest).assertFalse();
    });

    /**
     * @tc.name   cycleKeepsSixRowSnapshotCapacity
     * @tc.desc   Snapshots are replaced on each cycle, so the list cannot hold two payload generations.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cycleKeepsSixRowSnapshotCapacity', 0, () => {
      probe.cycle(createSeedContacts());
      const large: number = probe.snapshotLength();
      probe.cycle(shortPayload());
      const small: number = probe.snapshotLength();
      logStep('snapshot-capacity', String(large) + '->' + String(small));
      expect(large).assertEqual(15);
      expect(small).assertEqual(6);
      expect(probe.snapshotLength()).assertEqual(store.rowCount());
      expect(countOf(store.names(), '法里')).assertEqual(0);
      expect(probe.rowsMatch()).assertTrue();
    });

    /**
     * @tc.name   emptyCycleKeepsLogBounded
     * @tc.desc   Repeating empty cycles still advances the bounded log and leaves zero rows behind.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryFootprintStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('emptyCycleKeepsLogBounded', 0, () => {
      for (let round = 0; round < 20; round++) {
        probe.cycle([]);
      }
      logStep('empty-cycles', String(probe.log.size()) + '/' + String(probe.log.dropped));
      expect(probe.cycles).assertEqual(20);
      expect(store.rowCount()).assertEqual(0);
      expect(manager.getContacts().length).assertEqual(0);
      expect(probe.log.size()).assertEqual(16);
      expect(probe.log.dropped).assertEqual(4);
      expect(probe.snapshotLength()).assertEqual(0);
    });
  });
}
