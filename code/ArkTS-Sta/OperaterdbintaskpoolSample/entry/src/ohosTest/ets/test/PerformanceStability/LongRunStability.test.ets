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
 * LongRunStability drives the add, edit and delete cycle for more than one
 * hundred rounds and checks the invariants that must hold after each round:
 *
 *   OperateRDBInTaskPool.ets:91-119 add, edit and delete all end in a cache reload
 *   ContactManager.ets:51-70        append, first match replace, filter by name
 *   DatabaseConnection.ets:187-236  insert append, update by name, delete by name
 *   DatabaseConnection.ets:116-134  the query used by every reload
 *   Contact.ets:31-47               the fields carried by every routed contact
 *
 * RoundRunner is deterministic: each round number picks exactly one operation,
 * so two runs with the same seed produce the same fingerprints.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  StoreDouble,
  ContactMetrics,
  ContactSnapshot,
  snapshotsOf,
  sameSnapshotArray,
  CONFLICT_REPLACE,
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

/** Runs a deterministic long mutation sequence over one manager and one store. */
class RoundRunner {
  public manager: ContactManager;
  public store: StoreDouble;
  public seedCount: number;
  public rounds: int = 0;
  public added: number = 0;
  public updated: number = 0;
  public deleted: number = 0;
  public deletedRows: number = 0;
  public parityChecks: number = 0;
  public failingChecks: number = 0;
  public checkpoints: string[] = [];
  public checkpointCounts: number[] = [];

  constructor(manager: ContactManager, store: StoreDouble, seedCount: number) {
    this.manager = manager;
    this.store = store;
    this.seedCount = seedCount;
  }

  private routeContact(round: number): Contact {
    return contactOf(
      '长跑' + String(round),
      '130' + String(10000000 + round),
      'longrun' + String(round) + '@example.com',
      '长跑地址' + String(round % 5),
      '',
      'A'
    );
  }

  private parityHolds(): boolean {
    return this.store.rowCount() === this.manager.getContacts().length &&
      sameStringArray(contactNames(this.store.rows), contactNames(this.manager.getContacts()));
  }

  public run(rounds: number): void {
    for (let step = 0; step < rounds; step++) {
      const round = this.rounds;
      this.rounds = this.rounds + 1;
      const phase: number = round % 4;
      if (phase === 0) {
        const contact: Contact = this.routeContact(round);
        this.store.insert(true, cloneContact(contact), CONFLICT_REPLACE);
        this.manager.addContact(cloneContact(contact));
        this.added = this.added + 1;
      } else if (phase === 1) {
        const contact: Contact = this.routeContact(round - 1);
        contact.phone = '131' + String(20000000 + round);
        this.store.updateContact(cloneContact(contact));
        this.manager.updateContact(cloneContact(contact));
        this.updated = this.updated + 1;
      } else if (phase === 2) {
        const target: string = '长跑' + String(round - 2);
        this.deletedRows = this.deletedRows + this.store.deleteByName(target);
        this.manager.deleteContact(new Contact(target));
        this.deleted = this.deleted + 1;
      } else {
        const seed: Contact = createSeedContacts()[round % 10];
        const contact: Contact = cloneContact(seed);
        contact.phone = '132' + String(30000000 + round);
        this.store.updateContact(contact);
        this.manager.updateContact(contact);
        this.updated = this.updated + 1;
      }
      if (this.parityHolds()) {
        this.parityChecks = this.parityChecks + 1;
      } else {
        this.failingChecks = this.failingChecks + 1;
      }
      if (round % 30 === 0) {
        this.checkpoints.push('c' + String(round));
        this.checkpointCounts.push(this.store.rowCount());
      }
    }
  }

  public expectedCount(): number {
    return this.seedCount + this.added - this.deletedRows;
  }

  public fingerprint(): number {
    const parts: string[] = [];
    for (let index = 0; index < this.store.rows.length; index++) {
      parts.push(this.store.rows[index].name + '=' + this.store.rows[index].phone);
    }
    return textFingerprint(joined(parts, ','));
  }

  public snapshotParity(): boolean {
    return sameSnapshotArray(snapshotsOf(this.store.rows), snapshotsOf(this.manager.getContacts()));
  }
}

/** Seeds a runner with ten payload rows on both sides. */
function seededRunner(manager: ContactManager, store: StoreDouble, count: int): RoundRunner {
  const rows: Contact[] = createSeedContacts().slice(0, count);
  store.batchInsert(true, rows);
  manager.setContacts(rows);
  return new RoundRunner(manager, store, count);
}

export default function longRunStabilityTest(): void {
  describe('LongRunStability', () => {
    let manager: ContactManager = resetContactManager();
    let store: StoreDouble = new StoreDouble();
    let runner: RoundRunner = new RoundRunner(manager, store, 0);

    beforeAll(() => {
      logSuite('LongRunStability', 'begin');
    });

    beforeEach(async () => {
      manager = resetContactManager();
      store = new StoreDouble();
      runner = seededRunner(manager, store, 10);
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });

    afterAll(() => {
      resetContactManager();
      logSuite('LongRunStability', 'end');
    });

    /**
     * @tc.name   hundredTwentyRoundsKeepParity
     * @tc.desc   After one hundred and twenty rounds the store and cache hold the same rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('hundredTwentyRoundsKeepParity', 0, () => {
      runner.run(120);
      logStep('long-parity', String(store.rowCount()));
      expect(runner.rounds).assertEqual(120);
      expect(runner.failingChecks).assertEqual(0);
      expect(store.rowCount()).assertEqual(manager.getContacts().length);
      expect(sameStringArray(store.names(), contactNames(manager.getContacts()))).assertTrue();
      expect(store.rowCount()).assertEqual(runner.expectedCount());
    });

    /**
     * @tc.name   hundredTwentyRoundsSingleInit
     * @tc.desc   The long run reuses one store initialization and one table creation.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('hundredTwentyRoundsSingleInit', 0, () => {
      runner.run(120);
      logStep('long-init', String(store.initCalls) + '/' + String(store.createTableCalls));
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.initialized).assertTrue();
      expect(store.queryCalls).assertEqual(0);
    });

    /**
     * @tc.name   hundredTwentyRoundsOperationMix
     * @tc.desc   The four phase cycle produces thirty adds, sixty updates and thirty deletes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hundredTwentyRoundsOperationMix', 0, () => {
      runner.run(120);
      logStep('mix', String(runner.added) + '/' + String(runner.updated) + '/' + String(runner.deleted));
      expect(runner.added).assertEqual(30);
      expect(runner.updated).assertEqual(60);
      expect(runner.deleted).assertEqual(30);
      expect(runner.added + runner.updated + runner.deleted).assertEqual(120);
      expect(store.insertCalls).assertEqual(runner.added);
    });

    /**
     * @tc.name   hundredTwentyRoundsFinalCount
     * @tc.desc   Thirty adds offset by thirty deletes return the row count to the ten row seed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('hundredTwentyRoundsFinalCount', 0, () => {
      runner.run(120);
      logStep('final-count', String(store.rowCount()));
      expect(store.rowCount()).assertEqual(10);
      expect(manager.getContacts().length).assertEqual(10);
      expect(runner.deletedRows).assertEqual(30);
      expect(store.deleteCalls).assertEqual(30);
      expect(store.updateCalls).assertEqual(60);
    });

    /**
     * @tc.name   hundredTwentyRoundsRowCountFormula
     * @tc.desc   The final count equals the seed plus adds minus deleted rows at every observation.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hundredTwentyRoundsRowCountFormula', 0, () => {
      runner.run(120);
      const formula: number = 10 + runner.added - runner.deletedRows;
      logStep('formula', String(formula));
      expect(formula).assertEqual(10);
      expect(store.rowCount()).assertEqual(formula);
      expect(store.rowCount()).assertEqual(runner.expectedCount());
      expect(runner.expectedCount()).assertEqual(runner.seedCount + runner.added - runner.deletedRows);
      expect(store.rowCount() >= 0).assertTrue();
    });

    /**
     * @tc.name   hundredTwentyRoundsParityChecksAllPass
     * @tc.desc   Every one of the one hundred and twenty rounds passes its inline parity check.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hundredTwentyRoundsParityChecksAllPass', 0, () => {
      runner.run(120);
      logStep('parity-checks', String(runner.parityChecks));
      expect(runner.parityChecks).assertEqual(120);
      expect(runner.parityChecks).assertEqual(runner.rounds);
      expect(runner.failingChecks).assertEqual(0);
      expect(runner.parityChecks + runner.failingChecks).assertEqual(120);
      expect(store.rowCount()).assertEqual(10);
    });

    /**
     * @tc.name   hundredTwentyRoundsCheckpointsRecorded
     * @tc.desc   Checkpoints are captured every thirty rounds, giving four labelled samples.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hundredTwentyRoundsCheckpointsRecorded', 0, () => {
      runner.run(120);
      logStep('checkpoints', joined(runner.checkpoints, ','));
      expect(runner.checkpoints.length).assertEqual(4);
      expect(runner.checkpoints[0]).assertEqual('c0');
      expect(runner.checkpoints[3]).assertEqual('c90');
      expect(runner.checkpointCounts.length).assertEqual(4);
      expect(runner.checkpointCounts[0]).assertEqual(11);
      expect(runner.checkpointCounts[3]).assertEqual(10);
    });

    /**
     * @tc.name   hundredTwentyRoundsSnapshotParity
     * @tc.desc   Snapshot comparison at the end of the run still matches field by field.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hundredTwentyRoundsSnapshotParity', 0, () => {
      runner.run(120);
      logStep('snapshot-parity', String(runner.snapshotParity()));
      expect(runner.snapshotParity()).assertTrue();
      expect(snapshotsOf(store.rows).length).assertEqual(10);
      expect(snapshotsOf(manager.getContacts()).length).assertEqual(10);
      expect(sameSnapshotArray(snapshotsOf(store.rows), snapshotsOf(manager.getContacts()))).assertTrue();
      expect(store.rowCount()).assertEqual(10);
    });

    /**
     * @tc.name   hundredTwentyRoundsUniqueNameCount
     * @tc.desc   Every surviving row still has a unique name, so the deleted names left no residue.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hundredTwentyRoundsUniqueNameCount', 0, () => {
      runner.run(120);
      const names: string[] = store.names();
      logStep('unique-after-run', String(uniqueStrings(names).length));
      expect(names.length).assertEqual(10);
      expect(uniqueStrings(names).length).assertEqual(10);
      expect(countOf(names, '长跑0')).assertEqual(0);
      expect(countOf(names, '长跑119')).assertEqual(0);
      expect(names[0]).assertEqual('艾德里安');
    });

    /**
     * @tc.name   hundredTwentyRoundsMetricsTotal
     * @tc.desc   Metrics after the run report ten rows, ten unique names and no duplicates.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hundredTwentyRoundsMetricsTotal', 0, () => {
      runner.run(120);
      const metrics: ContactMetrics = ContactMetrics.from(store.rows);
      logStep('long-metrics', String(metrics.total));
      expect(metrics.total).assertEqual(10);
      expect(metrics.uniqueNames).assertEqual(10);
      expect(metrics.duplicateNames).assertEqual(0);
      expect(metrics.total).assertEqual(store.rowCount());
      expect(metrics.fillRatio()).assertEqual(1);
    });

    /**
     * @tc.name   hundredTwentyRoundsCategoryBound
     * @tc.desc   The category bucket count never exceeds six during the long run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hundredTwentyRoundsCategoryBound', 0, () => {
      runner.run(120);
      const groups: string[] = SearchEngine.groupByCategory(store.rows);
      logStep('long-categories', joined(groups, ','));
      expect(groups.length <= 6).assertTrue();
      expect(groups.length > 0).assertTrue();
      expect(groups.length).assertEqual(SearchEngine.groupByCategory(manager.getContacts()).length);
      expect(uniqueStrings(groups).length).assertEqual(groups.length);
      expect(store.rowCount()).assertEqual(10);
    });

    /**
     * @tc.name   hundredTwentyRoundsPhoneDigitsBounded
     * @tc.desc   The summed phone length equals eleven digits for each of the ten survivors.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hundredTwentyRoundsPhoneDigitsBounded', 0, () => {
      runner.run(120);
      const metrics: ContactMetrics = ContactMetrics.from(store.rows);
      logStep('long-digits', String(metrics.totalPhoneDigits));
      expect(metrics.totalPhoneDigits).assertEqual(10 * 11);
      expect(metrics.totalPhoneDigits).assertEqual(110);
      expect(store.rows[0].phone.length).assertEqual(11);
      expect(store.rows[9].phone.length).assertEqual(11);
      expect(metrics.totalPhoneDigits > 0).assertTrue();
    });

    /**
     * @tc.name   hundredTwentyRoundsDeleteCountMatches
     * @tc.desc   The store delete counter equals the number of delete phases in the run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hundredTwentyRoundsDeleteCountMatches', 0, () => {
      runner.run(120);
      logStep('delete-match', String(store.deleteCalls));
      expect(store.deleteCalls).assertEqual(30);
      expect(store.deleteCalls).assertEqual(runner.deleted);
      expect(runner.deletedRows).assertEqual(30);
      expect(store.deleteCalls + store.insertCalls).assertEqual(60);
      expect(store.rowCount()).assertEqual(10);
    });

    /**
     * @tc.name   hundredTwentyRoundsUpdateCountMatches
     * @tc.desc   The update counter equals the two update phases per four round cycle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hundredTwentyRoundsUpdateCountMatches', 0, () => {
      runner.run(120);
      logStep('update-match', String(store.updateCalls));
      expect(store.updateCalls).assertEqual(60);
      expect(store.updateCalls).assertEqual(runner.updated);
      expect(store.insertCalls).assertEqual(30);
      expect(store.initCalls).assertEqual(1);
      expect(store.updateCalls > store.insertCalls).assertTrue();
    });

    /**
     * @tc.name   twoHundredRoundsKeepParity
     * @tc.desc   A two hundred round run still ends with identical store and cache rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('twoHundredRoundsKeepParity', 0, () => {
      runner.run(200);
      logStep('two-hundred', String(runner.rounds));
      expect(runner.rounds).assertEqual(200);
      expect(runner.failingChecks).assertEqual(0);
      expect(runner.parityChecks).assertEqual(200);
      expect(store.rowCount()).assertEqual(manager.getContacts().length);
      expect(store.rowCount()).assertEqual(10);
    });

    /**
     * @tc.name   twoHundredRoundsSingleInit
     * @tc.desc   Doubling the run length does not add another initialization or table step.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('twoHundredRoundsSingleInit', 0, () => {
      runner.run(200);
      logStep('two-hundred-init', String(store.initCalls));
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(runner.added).assertEqual(50);
      expect(runner.deleted).assertEqual(50);
      expect(runner.updated).assertEqual(100);
    });

    /**
     * @tc.name   twoHundredRoundsFinalCount
     * @tc.desc   Fifty adds and fifty deletes cancel out, leaving the ten row seed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('twoHundredRoundsFinalCount', 0, () => {
      runner.run(200);
      logStep('two-hundred-count', String(store.rowCount()));
      expect(store.rowCount()).assertEqual(10);
      expect(runner.deletedRows).assertEqual(50);
      expect(store.deleteCalls).assertEqual(50);
      expect(store.insertCalls).assertEqual(50);
      expect(store.rowCount()).assertEqual(runner.expectedCount());
    });

    /**
     * @tc.name   replayProducesSameFingerprint
     * @tc.desc   Two independent runs of the same sequence produce the same final fingerprint.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('replayProducesSameFingerprint', 0, () => {
      runner.run(120);
      const first: number = runner.fingerprint();
      const otherStore: StoreDouble = new StoreDouble();
      const otherManager: ContactManager = resetContactManager();
      const replay: RoundRunner = seededRunner(otherManager, otherStore, 10);
      replay.run(120);
      const second: number = replay.fingerprint();
      logStep('replay-fingerprint', String(first));
      expect(first).assertEqual(second);
      expect(first > 0).assertTrue();
      expect(sameStringArray(store.names(), otherStore.names())).assertTrue();
      expect(replay.checkpoints.length).assertEqual(runner.checkpoints.length);
    });

    /**
     * @tc.name   longRunRowCountNeverNegative
     * @tc.desc   The row count stays inside the seed band and never drops below zero during the run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('longRunRowCountNeverNegative', 0, () => {
      runner.run(120);
      let minimum: number = store.rowCount();
      let maximum: number = 0;
      for (let index = 0; index < runner.checkpointCounts.length; index++) {
        if (runner.checkpointCounts[index] < minimum) {
          minimum = runner.checkpointCounts[index];
        }
        if (runner.checkpointCounts[index] > maximum) {
          maximum = runner.checkpointCounts[index];
        }
      }
      logStep('band', String(minimum) + '..' + String(maximum));
      expect(minimum >= 0).assertTrue();
      expect(minimum).assertEqual(10);
      expect(maximum).assertEqual(11);
      expect(store.rowCount()).assertEqual(10);
      expect(manager.getContacts().length >= 0).assertTrue();
    });

    /**
     * @tc.name   longRunStepsSplitEvenly
     * @tc.desc   The one hundred and twenty steps split evenly across the four phases.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('longRunStepsSplitEvenly', 0, () => {
      runner.run(120);
      const total: number = runner.added + runner.updated + runner.deleted;
      const perPhase: number = total / 4;
      logStep('split', String(total) + '/' + String(perPhase));
      expect(total).assertEqual(120);
      expect(perPhase).assertEqual(30);
      expect(runner.added).assertEqual(perPhase);
      expect(runner.deleted).assertEqual(perPhase);
      expect(runner.updated).assertEqual(perPhase * 2);
    });

    /**
     * @tc.name   longRunSeedRowsSurviveEdits
     * @tc.desc   All ten seed names survive the run because edits never delete them.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('longRunSeedRowsSurviveEdits', 0, () => {
      runner.run(120);
      const seedNames: string[] = contactNames(createSeedContacts().slice(0, 10));
      let present = 0;
      for (let index = 0; index < seedNames.length; index++) {
        if (store.names().indexOf(seedNames[index]) >= 0) {
          present = present + 1;
        }
      }
      logStep('seed-survivors', String(present));
      expect(present).assertEqual(10);
      expect(store.names()[0]).assertEqual('艾德里安');
      expect(store.names()[9]).assertEqual('戴维维');
      expect(countOf(store.names(), '长跑0')).assertEqual(0);
      expect(store.rowCount()).assertEqual(10);
    });

    /**
     * @tc.name   longRunReloadAfterRunStable
     * @tc.desc   Reloading the cache from the store after the run changes nothing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('longRunReloadAfterRunStable', 0, () => {
      runner.run(120);
      const before: ContactSnapshot[] = snapshotsOf(manager.getContacts());
      manager.setContacts(store.query(true));
      const after: ContactSnapshot[] = snapshotsOf(manager.getContacts());
      logStep('reload-stable', String(after.length));
      expect(sameSnapshotArray(before, after)).assertTrue();
      expect(store.queryCalls).assertEqual(1);
      expect(manager.getContacts().length).assertEqual(10);
      expect(store.rowCount()).assertEqual(10);
    });

    /**
     * @tc.name   longRunManagerResetThenReloadConverges
     * @tc.desc   Clearing the cache mid-way and reloading restores full parity with the store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('longRunManagerResetThenReloadConverges', 0, () => {
      runner.run(60);
      const storeRowsMid: number = store.rowCount();
      resetContactManager();
      const cleared: number = manager.getContacts().length;
      manager.setContacts(store.query(true));
      logStep('mid-reset', String(cleared) + '->' + String(manager.getContacts().length));
      expect(cleared).assertEqual(0);
      expect(manager.getContacts().length).assertEqual(storeRowsMid);
      expect(sameStringArray(store.names(), contactNames(manager.getContacts()))).assertTrue();
      expect(runner.rounds).assertEqual(60);
    });

    /**
     * @tc.name   longRunMetricsFingerprintStable
     * @tc.desc   The metrics fingerprint is identical for the store and the cache after the run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('longRunMetricsFingerprintStable', 0, () => {
      runner.run(120);
      const storeMetrics: ContactMetrics = ContactMetrics.from(store.rows);
      const cacheMetrics: ContactMetrics = ContactMetrics.from(manager.getContacts());
      logStep('metric-fingerprint', String(storeMetrics.fingerprint()));
      expect(storeMetrics.fingerprint()).assertEqual(cacheMetrics.fingerprint());
      expect(storeMetrics.total).assertEqual(10);
      expect(storeMetrics.categories).assertEqual(cacheMetrics.categories);
      expect(storeMetrics.fingerprint() > 0).assertTrue();
      expect(storeMetrics.fingerprint() === textFingerprint('')).assertFalse();
    });

    /**
     * @tc.name   longRunQueryCallsAfterReload
     * @tc.desc   Each reload costs exactly one query call on the reused store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('longRunQueryCallsAfterReload', 0, () => {
      runner.run(120);
      manager.setContacts(store.query(true));
      manager.setContacts(store.query(true));
      manager.setContacts(store.query(true));
      logStep('reload-count', String(store.queryCalls));
      expect(store.queryCalls).assertEqual(3);
      expect(store.initCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(10);
      expect(store.batchCalls).assertEqual(1);
      expect(manager.getContacts().length).assertEqual(10);
    });

    /**
     * @tc.name   longRunFingerprintChangesMidRun
     * @tc.desc   The row fingerprint at the midpoint differs from the fingerprint at the end.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('longRunFingerprintChangesMidRun', 0, () => {
      runner.run(60);
      const mid: number = runner.fingerprint();
      runner.run(60);
      const end: number = runner.fingerprint();
      logStep('fingerprint-mid', String(mid) + '/' + String(end));
      expect(mid === end).assertFalse();
      expect(runner.rounds).assertEqual(120);
      expect(store.rowCount()).assertEqual(10);
      expect(store.names().length).assertEqual(10);
    });

    /**
     * @tc.name   seededRunnerStartsWithSnapshotParity
     * @tc.desc   A freshly seeded runner already reports snapshot parity before any round.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('seededRunnerStartsWithSnapshotParity', 0, () => {
      logStep('seed-parity', String(store.rowCount()));
      expect(store.rowCount()).assertEqual(10);
      expect(manager.getContacts().length).assertEqual(10);
      expect(runner.snapshotParity()).assertTrue();
      expect(runner.rounds).assertEqual(0);
      expect(runner.added).assertEqual(0);
      expect(runner.parityChecks).assertEqual(0);
      expect(runner.checkpoints.length).assertEqual(0);
    });

    /**
     * @tc.name   seededRunnerStoresRequestedCount
     * @tc.desc   The runner seed size controls both holders and the expected count formula.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('seededRunnerStoresRequestedCount', 0, () => {
      const smallStore: StoreDouble = new StoreDouble();
      const smallManager: ContactManager = resetContactManager();
      const smallRunner: RoundRunner = seededRunner(smallManager, smallStore, 4);
      logStep('seed-size', String(smallStore.rowCount()));
      expect(smallStore.rowCount()).assertEqual(4);
      expect(smallManager.getContacts().length).assertEqual(4);
      expect(smallRunner.seedCount).assertEqual(4);
      expect(smallRunner.expectedCount()).assertEqual(4);
      expect(smallRunner.snapshotParity()).assertTrue();
    });

    /**
     * @tc.name   longRunSeedDeletionAfterRunKeepsParity
     * @tc.desc   Two deletes after the run keep both holders at eight rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('longRunSeedDeletionAfterRunKeepsParity', 0, () => {
      runner.run(120);
      store.deleteByName('艾德里安');
      manager.deleteContact(createSeedContacts()[0]);
      store.deleteByName('阿诺德');
      manager.deleteContact(createSeedContacts()[1]);
      logStep('post-run-delete', String(store.rowCount()));
      expect(store.rowCount()).assertEqual(8);
      expect(manager.getContacts().length).assertEqual(8);
      expect(countOf(store.names(), '艾德里安')).assertEqual(0);
      expect(sameStringArray(store.names(), contactNames(manager.getContacts()))).assertTrue();
      expect(store.deleteCalls).assertEqual(32);
    });

    /**
     * @tc.name   longRunAlternateSeedSizeParity
     * @tc.desc   A four row seed also returns to its seed size after the full cycle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('longRunAlternateSeedSizeParity', 0, () => {
      const otherStore: StoreDouble = new StoreDouble();
      const otherManager: ContactManager = resetContactManager();
      const other: RoundRunner = seededRunner(otherManager, otherStore, 4);
      other.run(120);
      logStep('alt-seed', String(otherStore.rowCount()));
      expect(otherStore.rowCount()).assertEqual(4);
      expect(otherManager.getContacts().length).assertEqual(4);
      expect(other.failingChecks).assertEqual(0);
      expect(other.snapshotParity()).assertTrue();
      expect(other.expectedCount()).assertEqual(4);
    });

    /**
     * @tc.name   longRunPhoneDigitsAfterTwoHundred
     * @tc.desc   The two hundred round run leaves ten rows with eleven phone digits each.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('longRunPhoneDigitsAfterTwoHundred', 0, () => {
      runner.run(200);
      const metrics: ContactMetrics = ContactMetrics.from(store.rows);
      logStep('two-hundred-digits', String(metrics.totalPhoneDigits));
      expect(metrics.total).assertEqual(10);
      expect(metrics.totalPhoneDigits).assertEqual(110);
      expect(metrics.uniqueNames).assertEqual(10);
      expect(metrics.duplicateNames).assertEqual(0);
      expect(metrics.fillRatio()).assertEqual(1);
    });

    /**
     * @tc.name   longRunCheckpointCountsStayBounded
     * @tc.desc   Every recorded checkpoint count sits between ten and eleven rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('longRunCheckpointCountsStayBounded', 0, () => {
      runner.run(200);
      let bounded = 0;
      for (let index = 0; index < runner.checkpointCounts.length; index++) {
        if (runner.checkpointCounts[index] >= 10 && runner.checkpointCounts[index] <= 11) {
          bounded = bounded + 1;
        }
      }
      logStep('checkpoint-bound', String(bounded) + '/' + String(runner.checkpointCounts.length));
      expect(bounded).assertEqual(runner.checkpointCounts.length);
      expect(runner.checkpointCounts.length).assertEqual(7);
      expect(runner.checkpoints[0]).assertEqual('c0');
      expect(runner.checkpoints[6]).assertEqual('c180');
      expect(runner.checkpointCounts[0]).assertEqual(11);
    });

    /**
     * @tc.name   longRunSnapshotCheckpointGrowth
     * @tc.desc   Snapshots taken at two checkpoints differ while both keep ten rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('longRunSnapshotCheckpointGrowth', 0, () => {
      runner.run(30);
      const first: ContactSnapshot[] = snapshotsOf(store.rows);
      runner.run(30);
      const second: ContactSnapshot[] = snapshotsOf(store.rows);
      logStep('snapshot-checkpoints', String(first.length) + '/' + String(second.length));
      expect(first.length).assertEqual(11);
      expect(second.length).assertEqual(10);
      expect(sameSnapshotArray(first, second)).assertFalse();
      expect(runner.rounds).assertEqual(60);
      expect(runner.snapshotParity()).assertTrue();
    });

    /**
     * @tc.name   longRunResetAfterRunConvergesEmpty
     * @tc.desc   Resetting the store after the run and reloading leaves both holders empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('longRunResetAfterRunConvergesEmpty', 0, () => {
      runner.run(120);
      store.reset();
      const cachedBefore: number = manager.getContacts().length;
      manager.setContacts(store.query(true));
      logStep('reset-converge', String(cachedBefore) + '->' + String(manager.getContacts().length));
      expect(cachedBefore).assertEqual(10);
      expect(manager.getContacts().length).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(store.initCalls).assertEqual(0);
      expect(store.batchCalls).assertEqual(0);
    });

    /**
     * @tc.name   longRunExpectedCountFormula
     * @tc.desc   The expected count helper always equals seed plus adds minus deleted rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('longRunExpectedCountFormula', 0, () => {
      runner.run(60);
      const midExpected: number = runner.expectedCount();
      const midActual: number = store.rowCount();
      runner.run(60);
      const endExpected: number = runner.expectedCount();
      logStep('expected-formula', String(midExpected) + '/' + String(endExpected));
      expect(midExpected).assertEqual(midActual);
      expect(endExpected).assertEqual(store.rowCount());
      expect(endExpected).assertEqual(10 + runner.added - runner.deletedRows);
      expect(runner.deletedRows).assertEqual(runner.deleted);
    });

    /**
     * @tc.name   longRunCheckpointLabelsAreOrdered
     * @tc.desc   Checkpoint labels ascend in round order and stay unique across the run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('longRunCheckpointLabelsAreOrdered', 0, () => {
      runner.run(120);
      const labels: string[] = runner.checkpoints;
      logStep('labels', joined(labels, ','));
      expect(labels.length).assertEqual(4);
      expect(labels[0]).assertEqual('c0');
      expect(labels[1]).assertEqual('c30');
      expect(labels[2]).assertEqual('c60');
      expect(uniqueStrings(labels).length).assertEqual(4);
      expect(labels[3]).assertEqual('c90');
    });

    /**
     * @tc.name   longRunBatchCounterAfterRun
     * @tc.desc   Only the initial seed counts as a batch, so the counter stays at one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('longRunBatchCounterAfterRun', 0, () => {
      runner.run(120);
      logStep('batch-counter', String(store.batchCalls));
      expect(store.batchCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(10);
      expect(store.queryCalls).assertEqual(0);
      expect(store.initialized).assertTrue();
    });

    /**
     * @tc.name   longRunDuplicateDetectedByMetrics
     * @tc.desc   One appended duplicate after the run is counted once by the metrics helper.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongRunStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('longRunDuplicateDetectedByMetrics', 0, () => {
      runner.run(120);
      const duplicate: Contact = cloneContact(store.rows[0]);
      store.insert(true, duplicate, CONFLICT_REPLACE);
      manager.addContact(cloneContact(duplicate));
      const metrics: ContactMetrics = ContactMetrics.from(store.rows);
      logStep('duplicate-metric', String(metrics.duplicateNames));
      expect(metrics.total).assertEqual(11);
      expect(metrics.uniqueNames).assertEqual(10);
      expect(metrics.duplicateNames).assertEqual(1);
      expect(store.rowCount()).assertEqual(manager.getContacts().length);
      expect(sameStringArray(store.names(), contactNames(manager.getContacts()))).assertTrue();
    });
  });
}
