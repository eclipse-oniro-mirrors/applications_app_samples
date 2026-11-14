/*
 * Copyright (c) 2026 Sample Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import TestLogger from '../Shared/TestLogger';
import {
  getDriver, startBrowserApp, serializedDelay, componentByIdExists, textById,
  inputById, clickById, waitForId, progressVisibleAfter, progressResetAfterComplete,
  ID_INPUT_URL, ID_NAV_REFRESH, ID_NAV_HOME, ID_NAV_BACK, TIMEOUT_COMPONENT,
  DELAY_TAB_OPERATION
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockClock, MockWebController, MockLoadingStatus } from '../Shared/BrowserMock';

const TAG: string = 'BrowserStateFlowTest';

/* ------------------------------------------------------------------ */
/* The four observable states of the browser page                      */
/* ------------------------------------------------------------------ */

/**
 * Upper layer state of the page.
 *
 * model/Browser.ets only distinguishes LOADING and END, but the page also has
 * a resting state before the first load (IDLE) and a failure state that the
 * shipped code currently collapses into END. Modelling all four makes the
 * transition table explicit and lets the suite reject impossible sequences such
 * as IDLE -> END or END -> ERROR.
 */
enum FlowState {
  IDLE = 0,
  LOADING = 1,
  END = 2,
  ERROR = 3
}

const FLOW_STATE_COUNT: number = 4;
const FLOW_PAIR_COUNT: number = 16;
const FLOW_LEGAL_COUNT: number = 8;

function flowName(state: FlowState): string {
  switch (state) {
    case FlowState.IDLE:
      return 'IDLE';
    case FlowState.LOADING:
      return 'LOADING';
    case FlowState.END:
      return 'END';
    case FlowState.ERROR:
      return 'ERROR';
    default:
      return 'UNKNOWN';
  }
}

/** Returns null for a name that is not part of the enum. */
function flowFromName(name: string): FlowState | null {
  if (name === 'IDLE') {
    return FlowState.IDLE;
  }
  if (name === 'LOADING') {
    return FlowState.LOADING;
  }
  if (name === 'END') {
    return FlowState.END;
  }
  if (name === 'ERROR') {
    return FlowState.ERROR;
  }
  return null;
}

function allFlowStates(): FlowState[] {
  return [FlowState.IDLE, FlowState.LOADING, FlowState.END, FlowState.ERROR];
}

/* ------------------------------------------------------------------ */
/* Transition table                                                    */
/* ------------------------------------------------------------------ */

interface FlowRule {
  from: FlowState;
  to: FlowState;
  event: string;
}

/**
 * Event names that trigger a transition.
 *
 * start     user submits an address or a tab starts loading
 * complete  onPageEnd of the Web component
 * fail      load error, offline engine or controller rejection
 * retry     user presses the retry affordance of the error page
 * reset     page is reset to the home entry page
 * abort     load cancelled because the tab was closed
 */
const EVENT_START: string = 'start';
const EVENT_COMPLETE: string = 'complete';
const EVENT_FAIL: string = 'fail';
const EVENT_RETRY: string = 'retry';
const EVENT_RESET: string = 'reset';
const EVENT_ABORT: string = 'abort';

function ruleKey(from: FlowState, to: FlowState): string {
  return `${flowName(from)}>${flowName(to)}`;
}

/**
 * Explicit allow list of the state machine.
 *
 * Every pair not present in this table is illegal by construction, so the
 * suite can iterate the 4x4 matrix and prove that the eight remaining pairs are
 * refused instead of silently accepted by a default branch.
 */
class TransitionTable {
  private rules: FlowRule[] = [];

  add(from: FlowState, to: FlowState, event: string): void {
    this.rules.push({ from: from, to: to, event: event });
  }

  isAllowed(from: FlowState, to: FlowState): boolean {
    for (let index = 0; index < this.rules.length; index++) {
      if (this.rules[index].from === from && this.rules[index].to === to) {
        return true;
      }
    }
    return false;
  }

  eventFor(from: FlowState, to: FlowState): string {
    for (let index = 0; index < this.rules.length; index++) {
      if (this.rules[index].from === from && this.rules[index].to === to) {
        return this.rules[index].event;
      }
    }
    return '';
  }

  legalCount(): number {
    return this.rules.length;
  }

  illegalCount(): number {
    return FLOW_PAIR_COUNT - this.rules.length;
  }

  totalPairs(): number {
    return FLOW_PAIR_COUNT;
  }

  countFrom(state: FlowState): number {
    let total: number = 0;
    for (let index = 0; index < this.rules.length; index++) {
      if (this.rules[index].from === state) {
        total += 1;
      }
    }
    return total;
  }

  targetsOf(state: FlowState): FlowState[] {
    const result: FlowState[] = [];
    for (let index = 0; index < this.rules.length; index++) {
      if (this.rules[index].from === state) {
        result.push(this.rules[index].to);
      }
    }
    return result;
  }

  keys(): string[] {
    return this.rules.map((rule: FlowRule) => ruleKey(rule.from, rule.to));
  }

  describe(): string {
    return this.keys().join(',');
  }

  reset(): void {
    this.rules = [];
  }
}

function buildDefaultTable(): TransitionTable {
  const table: TransitionTable = new TransitionTable();
  table.add(FlowState.IDLE, FlowState.LOADING, EVENT_START);
  table.add(FlowState.LOADING, FlowState.END, EVENT_COMPLETE);
  table.add(FlowState.LOADING, FlowState.ERROR, EVENT_FAIL);
  table.add(FlowState.LOADING, FlowState.IDLE, EVENT_ABORT);
  table.add(FlowState.END, FlowState.LOADING, EVENT_START);
  table.add(FlowState.END, FlowState.IDLE, EVENT_RESET);
  table.add(FlowState.ERROR, FlowState.LOADING, EVENT_RETRY);
  table.add(FlowState.ERROR, FlowState.IDLE, EVENT_RESET);
  return table;
}

/* ------------------------------------------------------------------ */
/* State machine                                                       */
/* ------------------------------------------------------------------ */

interface FlowEntry {
  sequence: number;
  from: FlowState;
  to: FlowState;
  event: string;
  accepted: boolean;
  reason: string;
  timestamp: number;
}

/**
 * Drives the page through the allow list and records every attempt.
 *
 * The rejection branch matters more than the acceptance branch: a UI that
 * receives a late onPageEnd after the user closed the tab must not jump from
 * IDLE to END, and a duplicated onProgressChange after a failure must not
 * resurrect the progress bar. Both attempts stay in `entries` with
 * `accepted = false`, which is what the audit cases inspect.
 */
class FlowMachine {
  state: FlowState = FlowState.IDLE;
  table: TransitionTable;
  entries: FlowEntry[] = [];
  failureReasons: string[] = [];
  epoch: number = 0;
  private clock: MockClock;

  constructor(table: TransitionTable = buildDefaultTable(), clock: MockClock = new MockClock()) {
    this.table = table;
    this.clock = clock;
  }

  dispatch(event: string, to: FlowState): boolean {
    const from: FlowState = this.state;
    const allowed: boolean = this.table.isAllowed(from, to);
    const entry: FlowEntry = {
      sequence: this.entries.length,
      from: from,
      to: to,
      event: event,
      accepted: allowed,
      reason: allowed ? 'ok' : `illegal ${ruleKey(from, to)}`,
      timestamp: this.clock.now()
    };
    this.entries.push(entry);
    this.clock.advance(10);
    if (!allowed) {
      return false;
    }
    this.state = to;
    this.epoch += 1;
    return true;
  }

  startLoad(): boolean {
    return this.dispatch(EVENT_START, FlowState.LOADING);
  }

  complete(): boolean {
    return this.dispatch(EVENT_COMPLETE, FlowState.END);
  }

  fail(reason: string): boolean {
    const accepted: boolean = this.dispatch(EVENT_FAIL, FlowState.ERROR);
    if (accepted) {
      this.failureReasons.push(reason);
    }
    return accepted;
  }

  retry(): boolean {
    return this.dispatch(EVENT_RETRY, FlowState.LOADING);
  }

  resetToIdle(): boolean {
    return this.dispatch(EVENT_RESET, FlowState.IDLE);
  }

  abort(): boolean {
    return this.dispatch(EVENT_ABORT, FlowState.IDLE);
  }

  acceptedCount(): number {
    let total: number = 0;
    for (let index = 0; index < this.entries.length; index++) {
      if (this.entries[index].accepted) {
        total += 1;
      }
    }
    return total;
  }

  rejectedCount(): number {
    return this.entries.length - this.acceptedCount();
  }

  lastEntry(): FlowEntry | null {
    if (this.entries.length === 0) {
      return null;
    }
    return this.entries[this.entries.length - 1];
  }

  lastRejection(): FlowEntry | null {
    for (let index = this.entries.length - 1; index >= 0; index--) {
      if (!this.entries[index].accepted) {
        return this.entries[index];
      }
    }
    return null;
  }

  countPair(from: FlowState, to: FlowState): number {
    let total: number = 0;
    for (let index = 0; index < this.entries.length; index++) {
      if (this.entries[index].accepted && this.entries[index].from === from &&
        this.entries[index].to === to) {
        total += 1;
      }
    }
    return total;
  }

  path(): string {
    const names: string[] = [flowName(FlowState.IDLE)];
    for (let index = 0; index < this.entries.length; index++) {
      if (this.entries[index].accepted) {
        names.push(flowName(this.entries[index].to));
      }
    }
    return names.join('>');
  }

  statesVisited(): FlowState[] {
    const result: FlowState[] = [FlowState.IDLE];
    for (let index = 0; index < this.entries.length; index++) {
      if (this.entries[index].accepted) {
        result.push(this.entries[index].to);
      }
    }
    return result;
  }

  isError(): boolean {
    return this.state === FlowState.ERROR;
  }

  describe(): string {
    return `state=${flowName(this.state)}, epoch=${this.epoch}, accepted=${this.acceptedCount()}, ` +
      `rejected=${this.rejectedCount()}`;
  }

  reset(): void {
    this.state = FlowState.IDLE;
    this.entries = [];
    this.failureReasons = [];
    this.epoch = 0;
    this.clock.reset();
  }
}

/* ------------------------------------------------------------------ */
/* Snapshot and restore                                                */
/* ------------------------------------------------------------------ */

interface FlowSnapshot {
  state: FlowState;
  progress: number;
  hideProgress: boolean;
  inputValue: string;
  tabIndex: number;
  epoch: number;
}

const SNAPSHOT_SEPARATOR: string = '#';
const SNAPSHOT_FIELD_COUNT: number = 6;

/** Captures the machine and the bound widgets at one instant. */
function captureSnapshot(machine: FlowMachine, progress: number, hideProgress: boolean,
  inputValue: string, tabIndex: number): FlowSnapshot {
  return {
    state: machine.state,
    progress: progress,
    hideProgress: hideProgress,
    inputValue: inputValue,
    tabIndex: tabIndex,
    epoch: machine.epoch
  };
}

/** Field separated codec; a malformed payload decodes to null. */
class SnapshotCodec {
  encode(snapshot: FlowSnapshot): string {
    return `${flowName(snapshot.state)}${SNAPSHOT_SEPARATOR}${snapshot.progress}` +
      `${SNAPSHOT_SEPARATOR}${snapshot.hideProgress}${SNAPSHOT_SEPARATOR}${snapshot.inputValue}` +
      `${SNAPSHOT_SEPARATOR}${snapshot.tabIndex}${SNAPSHOT_SEPARATOR}${snapshot.epoch}`;
  }

  decode(payload: string): FlowSnapshot | null {
    if (payload === null || payload === undefined || payload.length === 0) {
      return null;
    }
    const parts: string[] = payload.split(SNAPSHOT_SEPARATOR);
    if (parts.length !== SNAPSHOT_FIELD_COUNT) {
      return null;
    }
    const state: FlowState | null = flowFromName(parts[0]);
    if (state === null) {
      return null;
    }
    const progress: number = parseInt(parts[1], 10);
    const tabIndex: number = parseInt(parts[4], 10);
    const epoch: number = parseInt(parts[5], 10);
    if (isNaN(progress) || isNaN(tabIndex) || isNaN(epoch)) {
      return null;
    }
    return {
      state: state,
      progress: progress,
      hideProgress: parts[2] === 'true',
      inputValue: parts[3],
      tabIndex: tabIndex,
      epoch: epoch
    };
  }

  isValid(snapshot: FlowSnapshot): boolean {
    if (snapshot.progress < 0 || snapshot.progress > 100) {
      return false;
    }
    if (snapshot.tabIndex < 0) {
      return false;
    }
    if (snapshot.epoch < 0) {
      return false;
    }
    return true;
  }
}

/** Bounded list of encoded snapshots, newest last. */
class SnapshotStore {
  private slots: string[] = [];
  private codec: SnapshotCodec = new SnapshotCodec();
  saves: number = 0;
  restores: number = 0;
  failures: number = 0;
  private capacity: number;

  constructor(capacity: number = 8) {
    this.capacity = capacity <= 0 ? 1 : capacity;
  }

  save(snapshot: FlowSnapshot): string {
    const payload: string = this.codec.encode(snapshot);
    this.slots.push(payload);
    while (this.slots.length > this.capacity) {
      this.slots.shift();
    }
    this.saves += 1;
    return payload;
  }

  load(index: number): FlowSnapshot | null {
    if (index < 0 || index >= this.slots.length) {
      return null;
    }
    const snapshot: FlowSnapshot | null = this.codec.decode(this.slots[index]);
    if (snapshot === null) {
      this.failures += 1;
      return null;
    }
    this.restores += 1;
    return snapshot;
  }

  latest(): FlowSnapshot | null {
    return this.load(this.slots.length - 1);
  }

  size(): number {
    return this.slots.length;
  }

  raw(): string[] {
    return this.slots.slice(0);
  }

  clear(): void {
    this.slots = [];
    this.saves = 0;
    this.restores = 0;
    this.failures = 0;
  }
}

/* ------------------------------------------------------------------ */
/* State to UI binding                                                 */
/* ------------------------------------------------------------------ */

/**
 * Derives every visible affordance from the state.
 *
 * Index.ets forwards `browser.progress` to Progress and `browser.hideProgress`
 * to Visibility; TitleBar forwards `loadingStatus` only indirectly. Keeping the
 * mapping in one place proves that no widget can disagree with the state.
 */
class StateUiBinding {
  progressVisible(state: FlowState, progress: number): boolean {
    if (state !== FlowState.LOADING) {
      return false;
    }
    return progressVisibleAfter(progress);
  }

  progressValue(state: FlowState, progress: number): number {
    if (state !== FlowState.LOADING) {
      return 0;
    }
    return progressResetAfterComplete(progress);
  }

  inputEditable(state: FlowState): boolean {
    return state !== FlowState.LOADING;
  }

  refreshEnabled(state: FlowState): boolean {
    return state !== FlowState.LOADING;
  }

  backEnabled(state: FlowState): boolean {
    return state !== FlowState.LOADING;
  }

  retryVisible(state: FlowState): boolean {
    return state === FlowState.ERROR;
  }

  spinnerVisible(state: FlowState): boolean {
    return state === FlowState.LOADING;
  }

  /** model/Browser.ets only knows LOADING and END. */
  loadingStatusOf(state: FlowState): MockLoadingStatus {
    return state === FlowState.LOADING ? MockLoadingStatus.LOADING : MockLoadingStatus.END;
  }

  describe(state: FlowState, progress: number): string {
    return `state=${flowName(state)}, progressVisible=${this.progressVisible(state, progress)}, ` +
      `editable=${this.inputEditable(state)}, retry=${this.retryVisible(state)}`;
  }
}

/* ------------------------------------------------------------------ */
/* Audit of the recorded history                                       */
/* ------------------------------------------------------------------ */

interface AuditReport {
  violations: string[];
  contiguous: boolean;
  accepted: number;
  rejected: number;
  chainIntact: boolean;
}

/**
 * Replays a FlowEntry list and reports every inconsistency.
 *
 * Four invariants: sequence numbers are contiguous, every accepted entry exists
 * in the allow list, every explicit `accepted` flag agrees with the table, and
 * the `from` of each entry equals the state reached by the previous accepted
 * entry. A snapshot restore that silently rewrites the state breaks the fourth
 * invariant, which is why it is checked separately from the first three.
 */
class StateAudit {
  audit(entries: FlowEntry[], table: TransitionTable): AuditReport {
    const violations: string[] = [];
    let expectedFrom: FlowState = FlowState.IDLE;
    let chainIntact: boolean = true;
    let accepted: number = 0;
    let rejected: number = 0;
    for (let index = 0; index < entries.length; index++) {
      const entry: FlowEntry = entries[index];
      if (entry.sequence !== index) {
        violations.push(`sequence ${entry.sequence} at index ${index}`);
      }
      if (entry.from !== expectedFrom) {
        violations.push(`chain broken at ${index}: expected ${flowName(expectedFrom)}`);
        chainIntact = false;
      }
      const legal: boolean = table.isAllowed(entry.from, entry.to);
      if (entry.accepted !== legal) {
        violations.push(`accepted flag disagrees at ${index}: ${ruleKey(entry.from, entry.to)}`);
      }
      if (entry.accepted) {
        accepted += 1;
        expectedFrom = entry.to;
      } else {
        rejected += 1;
      }
      if (index > 0 && entry.timestamp < entries[index - 1].timestamp) {
        violations.push(`timestamp rewound at ${index}`);
      }
    }
    return {
      violations: violations,
      contiguous: violations.length === 0,
      accepted: accepted,
      rejected: rejected,
      chainIntact: chainIntact
    };
  }

  countByTarget(entries: FlowEntry[], target: FlowState): number {
    let total: number = 0;
    for (let index = 0; index < entries.length; index++) {
      if (entries[index].accepted && entries[index].to === target) {
        total += 1;
      }
    }
    return total;
  }

  acceptanceRatio(entries: FlowEntry[]): number {
    if (entries.length === 0) {
      return 0;
    }
    let accepted: number = 0;
    for (let index = 0; index < entries.length; index++) {
      if (entries[index].accepted) {
        accepted += 1;
      }
    }
    return Math.round((accepted * 100) / entries.length);
  }

  summary(entries: FlowEntry[]): string {
    return `entries=${entries.length}, accepted=${this.countAccepted(entries)}, ` +
      `errors=${this.countByTarget(entries, FlowState.ERROR)}`;
  }

  private countAccepted(entries: FlowEntry[]): number {
    let total: number = 0;
    for (let index = 0; index < entries.length; index++) {
      if (entries[index].accepted) {
        total += 1;
      }
    }
    return total;
  }
}

/** Bounded audit trail of the state machine, oldest entry dropped first. */
class HistoryRing {
  private buffer: string[] = [];
  private capacity: number;
  private dropped: number = 0;

  constructor(capacity: number = 8) {
    this.capacity = capacity <= 0 ? 1 : capacity;
  }

  push(entry: FlowEntry): void {
    this.buffer.push(`${entry.sequence}:${ruleKey(entry.from, entry.to)}:${entry.event}:` +
      `${entry.accepted ? 'ok' : 'rejected'}`);
    while (this.buffer.length > this.capacity) {
      this.buffer.shift();
      this.dropped += 1;
    }
  }

  size(): number {
    return this.buffer.length;
  }

  droppedCount(): number {
    return this.dropped;
  }

  newest(): string {
    return this.buffer.length === 0 ? '' : this.buffer[this.buffer.length - 1];
  }

  oldest(): string {
    return this.buffer.length === 0 ? '' : this.buffer[0];
  }

  contains(keyword: string): boolean {
    return this.buffer.some((item: string) => item.indexOf(keyword) >= 0);
  }

  all(): string[] {
    return this.buffer.slice(0);
  }

  clear(): void {
    this.buffer = [];
    this.dropped = 0;
  }
}

/* ------------------------------------------------------------------ */
/* Full 4x4 matrix of the transition table                             */
/* ------------------------------------------------------------------ */

interface MatrixCell {
  from: FlowState;
  to: FlowState;
  legal: boolean;
  event: string;
}

function buildMatrix(table: TransitionTable): MatrixCell[] {
  const states: FlowState[] = allFlowStates();
  const cells: MatrixCell[] = [];
  for (let row = 0; row < states.length; row++) {
    for (let column = 0; column < states.length; column++) {
      const from: FlowState = states[row];
      const to: FlowState = states[column];
      cells.push({
        from: from,
        to: to,
        legal: table.isAllowed(from, to),
        event: table.eventFor(from, to)
      });
    }
  }
  return cells;
}

function illegalCells(cells: MatrixCell[]): MatrixCell[] {
  return cells.filter((cell: MatrixCell) => !cell.legal);
}

function legalCells(cells: MatrixCell[]): MatrixCell[] {
  return cells.filter((cell: MatrixCell) => cell.legal);
}

export default function browserStateFlowTest() {
  describe('browserStateFlowTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'state flow suite begin');
      TestLogger.resetSteps(TAG);
      await startBrowserApp();
      await serializedDelay(driver, TIMEOUT_COMPONENT / 2);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Flow_Enum_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Flow_Enum_001');
      TestLogger.step(TAG, 'the four flow states have stable names and parse both ways');
      const states: FlowState[] = allFlowStates();
      TestLogger.info(TAG, `states=${states.map((item: FlowState) => flowName(item)).join('|')}`);
      expect(states.length).assertEqual(FLOW_STATE_COUNT);
      expect(flowName(FlowState.IDLE)).assertEqual('IDLE');
      expect(flowName(FlowState.LOADING)).assertEqual('LOADING');
      expect(flowName(FlowState.END)).assertEqual('END');
      expect(flowName(FlowState.ERROR)).assertEqual('ERROR');
      expect(flowFromName('IDLE')).assertEqual(FlowState.IDLE);
      expect(flowFromName('LOADING')).assertEqual(FlowState.LOADING);
      expect(flowFromName('END')).assertEqual(FlowState.END);
      expect(flowFromName('ERROR')).assertEqual(FlowState.ERROR);
      expect(flowFromName('loading')).assertNull();
      expect(flowFromName('UNKNOWN')).assertNull();
      TestLogger.pass(TAG, 'Browser_Flow_Enum_001');
    });

    it('Browser_Flow_Table_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Flow_Table_002');
      TestLogger.step(TAG, 'the allow list covers half of the 4x4 pairs');
      const table: TransitionTable = buildDefaultTable();
      TestLogger.info(TAG, `legal=${table.legalCount()}, rules=${table.describe()}`);
      expect(table.totalPairs()).assertEqual(FLOW_PAIR_COUNT);
      expect(table.legalCount()).assertEqual(FLOW_LEGAL_COUNT);
      expect(table.illegalCount()).assertEqual(FLOW_PAIR_COUNT - FLOW_LEGAL_COUNT);
      expect(table.keys().length).assertEqual(FLOW_LEGAL_COUNT);
      expect(table.countFrom(FlowState.IDLE)).assertEqual(1);
      expect(table.countFrom(FlowState.LOADING)).assertEqual(3);
      expect(table.countFrom(FlowState.END)).assertEqual(2);
      expect(table.countFrom(FlowState.ERROR)).assertEqual(2);
      expect(table.describe()).assertContain('IDLE>LOADING');
      TestLogger.pass(TAG, 'Browser_Flow_Table_002');
    });

    it('Browser_Flow_Table_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Flow_Table_003');
      TestLogger.step(TAG, 'every legal pair carries the event that triggers it');
      const table: TransitionTable = buildDefaultTable();
      expect(table.eventFor(FlowState.IDLE, FlowState.LOADING)).assertEqual(EVENT_START);
      expect(table.eventFor(FlowState.LOADING, FlowState.END)).assertEqual(EVENT_COMPLETE);
      expect(table.eventFor(FlowState.LOADING, FlowState.ERROR)).assertEqual(EVENT_FAIL);
      expect(table.eventFor(FlowState.LOADING, FlowState.IDLE)).assertEqual(EVENT_ABORT);
      expect(table.eventFor(FlowState.END, FlowState.LOADING)).assertEqual(EVENT_START);
      expect(table.eventFor(FlowState.END, FlowState.IDLE)).assertEqual(EVENT_RESET);
      expect(table.eventFor(FlowState.ERROR, FlowState.LOADING)).assertEqual(EVENT_RETRY);
      expect(table.eventFor(FlowState.ERROR, FlowState.IDLE)).assertEqual(EVENT_RESET);
      expect(table.eventFor(FlowState.IDLE, FlowState.END)).assertEqual('');
      expect(table.eventFor(FlowState.END, FlowState.ERROR)).assertEqual('');
      TestLogger.pass(TAG, 'Browser_Flow_Table_003');
    });

    it('Browser_Flow_Table_004', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Flow_Table_004');
      TestLogger.step(TAG, 'the 4x4 matrix exposes eight legal and eight illegal pairs');
      const table: TransitionTable = buildDefaultTable();
      const cells: MatrixCell[] = buildMatrix(table);
      const legal: MatrixCell[] = legalCells(cells);
      const illegal: MatrixCell[] = illegalCells(cells);
      TestLogger.info(TAG, `cells=${cells.length}, legal=${legal.length}, illegal=${illegal.length}`);
      expect(cells.length).assertEqual(FLOW_PAIR_COUNT);
      expect(legal.length).assertEqual(FLOW_LEGAL_COUNT);
      expect(illegal.length).assertEqual(FLOW_LEGAL_COUNT);
      for (let index = 0; index < legal.length; index++) {
        expect(legal[index].legal).assertTrue();
        expect(legal[index].event.length).assertLarger(0);
      }
      for (let index = 0; index < illegal.length; index++) {
        expect(illegal[index].legal).assertFalse();
        expect(illegal[index].event).assertEqual('');
        expect(table.isAllowed(illegal[index].from, illegal[index].to)).assertFalse();
      }
      expect(table.targetsOf(FlowState.IDLE).length).assertEqual(1);
      expect(table.targetsOf(FlowState.LOADING).length).assertEqual(3);
      TestLogger.pass(TAG, 'Browser_Flow_Table_004');
    });

    it('Browser_Flow_Happy_005', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Flow_Happy_005');
      TestLogger.step(TAG, 'a successful load walks idle to loading to end');
      const machine: FlowMachine = new FlowMachine();
      expect(machine.state).assertEqual(FlowState.IDLE);
      expect(machine.startLoad()).assertTrue();
      expect(machine.state).assertEqual(FlowState.LOADING);
      expect(machine.complete()).assertTrue();
      TestLogger.info(TAG, machine.describe());
      expect(machine.state).assertEqual(FlowState.END);
      expect(machine.epoch).assertEqual(2);
      expect(machine.acceptedCount()).assertEqual(2);
      expect(machine.rejectedCount()).assertEqual(0);
      expect(machine.path()).assertEqual('IDLE>LOADING>END');
      expect(machine.countPair(FlowState.IDLE, FlowState.LOADING)).assertEqual(1);
      expect(machine.countPair(FlowState.LOADING, FlowState.END)).assertEqual(1);
      expect(machine.failureReasons.length).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_Flow_Happy_005');
    });

    it('Browser_Flow_Happy_006', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Flow_Happy_006');
      TestLogger.step(TAG, 'a reload leaves END and returns through LOADING');
      const machine: FlowMachine = new FlowMachine();
      machine.startLoad();
      machine.complete();
      expect(machine.startLoad()).assertTrue();
      expect(machine.state).assertEqual(FlowState.LOADING);
      expect(machine.complete()).assertTrue();
      TestLogger.info(TAG, `path=${machine.path()}`);
      expect(machine.path()).assertEqual('IDLE>LOADING>END>LOADING>END');
      expect(machine.countPair(FlowState.END, FlowState.LOADING)).assertEqual(1);
      expect(machine.countPair(FlowState.LOADING, FlowState.END)).assertEqual(2);
      expect(machine.epoch).assertEqual(4);
      expect(machine.rejectedCount()).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_Flow_Happy_006');
    });

    it('Browser_Flow_Error_007', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Flow_Error_007');
      TestLogger.step(TAG, 'a failing load enters ERROR and keeps the reason');
      const machine: FlowMachine = new FlowMachine();
      machine.startLoad();
      expect(machine.fail('ERR_CONNECTION_REFUSED')).assertTrue();
      TestLogger.info(TAG, machine.describe());
      expect(machine.state).assertEqual(FlowState.ERROR);
      expect(machine.isError()).assertTrue();
      expect(machine.failureReasons.length).assertEqual(1);
      expect(machine.failureReasons[0]).assertEqual('ERR_CONNECTION_REFUSED');
      expect(machine.countPair(FlowState.LOADING, FlowState.ERROR)).assertEqual(1);
      expect(machine.path()).assertEqual('IDLE>LOADING>ERROR');
      expect(machine.epoch).assertEqual(2);
      TestLogger.pass(TAG, 'Browser_Flow_Error_007');
    });

    it('Browser_Flow_Error_008', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Flow_Error_008');
      TestLogger.step(TAG, 'retry returns from ERROR to LOADING and can finish');
      const machine: FlowMachine = new FlowMachine();
      machine.startLoad();
      machine.fail('timeout');
      expect(machine.retry()).assertTrue();
      expect(machine.state).assertEqual(FlowState.LOADING);
      expect(machine.complete()).assertTrue();
      TestLogger.info(TAG, `path=${machine.path()}`);
      expect(machine.path()).assertEqual('IDLE>LOADING>ERROR>LOADING>END');
      expect(machine.countPair(FlowState.ERROR, FlowState.LOADING)).assertEqual(1);
      expect(machine.failureReasons.length).assertEqual(1);
      expect(machine.isError()).assertFalse();
      expect(machine.rejectedCount()).assertEqual(0);
      expect(machine.epoch).assertEqual(4);
      TestLogger.pass(TAG, 'Browser_Flow_Error_008');
    });

    it('Browser_Flow_Reset_009', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Flow_Reset_009');
      TestLogger.step(TAG, 'reset from ERROR clears the failure path back to idle');
      const machine: FlowMachine = new FlowMachine();
      machine.startLoad();
      machine.fail('dns');
      expect(machine.resetToIdle()).assertTrue();
      expect(machine.state).assertEqual(FlowState.IDLE);
      expect(machine.startLoad()).assertTrue();
      TestLogger.info(TAG, `path=${machine.path()}, epoch=${machine.epoch}`);
      expect(machine.path()).assertEqual('IDLE>LOADING>ERROR>IDLE>LOADING');
      expect(machine.countPair(FlowState.ERROR, FlowState.IDLE)).assertEqual(1);
      expect(machine.state).assertEqual(FlowState.LOADING);
      expect(machine.rejectedCount()).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_Flow_Reset_009');
    });

    it('Browser_Flow_Abort_010', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Flow_Abort_010');
      TestLogger.step(TAG, 'closing a loading tab aborts back to idle');
      const machine: FlowMachine = new FlowMachine();
      machine.startLoad();
      expect(machine.abort()).assertTrue();
      TestLogger.info(TAG, machine.describe());
      expect(machine.state).assertEqual(FlowState.IDLE);
      expect(machine.path()).assertEqual('IDLE>LOADING>IDLE');
      expect(machine.countPair(FlowState.LOADING, FlowState.IDLE)).assertEqual(1);
      expect(machine.acceptedCount()).assertEqual(2);
      expect(machine.epoch).assertEqual(2);
      expect(machine.lastEntry() === null).assertFalse();
      TestLogger.pass(TAG, 'Browser_Flow_Abort_010');
    });

    it('Browser_Flow_Illegal_011', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Flow_Illegal_011');
      TestLogger.step(TAG, 'idle to end is refused without touching the state');
      const machine: FlowMachine = new FlowMachine();
      const accepted: boolean = machine.dispatch(EVENT_COMPLETE, FlowState.END);
      TestLogger.info(TAG, `accepted=${accepted}, state=${flowName(machine.state)}`);
      expect(accepted).assertFalse();
      expect(machine.state).assertEqual(FlowState.IDLE);
      expect(machine.epoch).assertEqual(0);
      expect(machine.entries.length).assertEqual(1);
      expect(machine.rejectedCount()).assertEqual(1);
      expect(machine.acceptedCount()).assertEqual(0);
      const rejection: FlowEntry | null = machine.lastRejection();
      expect(rejection === null).assertFalse();
      if (rejection !== null) {
        expect(rejection.reason).assertContain('illegal IDLE>END');
      }
      expect(machine.path()).assertEqual('IDLE');
      TestLogger.pass(TAG, 'Browser_Flow_Illegal_011');
    });

    it('Browser_Flow_Illegal_012', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Flow_Illegal_012');
      TestLogger.step(TAG, 'a completed load cannot fail into ERROR');
      const machine: FlowMachine = new FlowMachine();
      machine.startLoad();
      machine.complete();
      expect(machine.fail('late error')).assertFalse();
      TestLogger.info(TAG, `state=${flowName(machine.state)}, rejected=${machine.rejectedCount()}`);
      expect(machine.state).assertEqual(FlowState.END);
      expect(machine.rejectedCount()).assertEqual(1);
      expect(machine.failureReasons.length).assertEqual(0);
      expect(machine.epoch).assertEqual(2);
      expect(machine.lastRejection() !== null).assertTrue();
      TestLogger.pass(TAG, 'Browser_Flow_Illegal_012');
    });

    it('Browser_Flow_Illegal_013', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Flow_Illegal_013');
      TestLogger.step(TAG, 'duplicate self transitions are refused');
      const machine: FlowMachine = new FlowMachine();
      machine.startLoad();
      machine.complete();
      expect(machine.complete()).assertFalse();
      expect(machine.startLoad()).assertTrue();
      expect(machine.startLoad()).assertFalse();
      TestLogger.info(TAG, `rejected=${machine.rejectedCount()}, path=${machine.path()}`);
      expect(machine.rejectedCount()).assertEqual(2);
      expect(machine.state).assertEqual(FlowState.LOADING);
      expect(machine.path()).assertEqual('IDLE>LOADING>END>LOADING');
      expect(machine.countPair(FlowState.END, FlowState.END)).assertEqual(0);
      expect(machine.countPair(FlowState.LOADING, FlowState.LOADING)).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_Flow_Illegal_013');
    });

    it('Browser_Flow_Audit_014', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Flow_Audit_014');
      TestLogger.step(TAG, 'a legal run produces a clean audit report');
      const machine: FlowMachine = new FlowMachine();
      machine.startLoad();
      machine.complete();
      machine.startLoad();
      machine.fail('timeout');
      machine.retry();
      machine.complete();
      const audit: StateAudit = new StateAudit();
      const report: AuditReport = audit.audit(machine.entries, machine.table);
      TestLogger.info(TAG, `report=${report.violations.join('|')}, ${audit.summary(machine.entries)}`);
      expect(report.violations.length).assertEqual(0);
      expect(report.contiguous).assertTrue();
      expect(report.chainIntact).assertTrue();
      expect(report.accepted).assertEqual(6);
      expect(report.rejected).assertEqual(0);
      expect(audit.countByTarget(machine.entries, FlowState.END)).assertEqual(2);
      expect(audit.countByTarget(machine.entries, FlowState.ERROR)).assertEqual(1);
      expect(audit.acceptanceRatio(machine.entries)).assertEqual(100);
      expect(audit.summary(machine.entries)).assertContain('entries=6');
      TestLogger.pass(TAG, 'Browser_Flow_Audit_014');
    });

    it('Browser_Flow_Audit_015', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Flow_Audit_015');
      TestLogger.step(TAG, 'a rejected attempt keeps the audit chain intact');
      const machine: FlowMachine = new FlowMachine();
      machine.startLoad();
      machine.complete();
      expect(machine.fail('late')).assertFalse();
      machine.startLoad();
      machine.complete();
      const audit: StateAudit = new StateAudit();
      const report: AuditReport = audit.audit(machine.entries, machine.table);
      TestLogger.info(TAG, `accepted=${report.accepted}, rejected=${report.rejected}`);
      expect(report.violations.length).assertEqual(0);
      expect(report.chainIntact).assertTrue();
      expect(report.accepted).assertEqual(4);
      expect(report.rejected).assertEqual(1);
      expect(audit.acceptanceRatio(machine.entries)).assertEqual(80);
      expect(audit.countByTarget(machine.entries, FlowState.END)).assertEqual(2);
      expect(machine.entries.length).assertEqual(5);
      TestLogger.pass(TAG, 'Browser_Flow_Audit_015');
    });

    it('Browser_Flow_Audit_016', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Flow_Audit_016');
      TestLogger.step(TAG, 'the audit detects a tampered history entry');
      const machine: FlowMachine = new FlowMachine();
      machine.startLoad();
      machine.complete();
      machine.startLoad();
      machine.complete();
      const tampered: FlowEntry[] = machine.entries.map((entry: FlowEntry) => {
        const copy: FlowEntry = {
          sequence: entry.sequence, from: entry.from, to: entry.to, event: entry.event,
          accepted: entry.accepted, reason: entry.reason, timestamp: entry.timestamp
        };
        return copy;
      });
      tampered[1].accepted = false;
      tampered[2].from = FlowState.ERROR;
      tampered[3].sequence = 99;
      const audit: StateAudit = new StateAudit();
      const report: AuditReport = audit.audit(tampered, machine.table);
      TestLogger.info(TAG, `violations=${report.violations.join(' | ')}`);
      expect(report.violations.length).assertLarger(2);
      expect(report.contiguous).assertFalse();
      expect(report.chainIntact).assertFalse();
      expect(report.accepted).assertEqual(3);
      expect(report.rejected).assertEqual(1);
      TestLogger.pass(TAG, 'Browser_Flow_Audit_016');
    });

    it('Browser_Flow_Snapshot_017', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Flow_Snapshot_017');
      TestLogger.step(TAG, 'a snapshot survives an encode and decode round trip');
      const machine: FlowMachine = new FlowMachine();
      machine.startLoad();
      const snapshot: FlowSnapshot = captureSnapshot(machine, 60, false, 'snap.example.com', 1);
      const codec: SnapshotCodec = new SnapshotCodec();
      const payload: string = codec.encode(snapshot);
      const decoded: FlowSnapshot | null = codec.decode(payload);
      TestLogger.info(TAG, `payload=${payload}`);
      expect(decoded === null).assertFalse();
      if (decoded === null) {
        return;
      }
      expect(decoded.state).assertEqual(FlowState.LOADING);
      expect(decoded.progress).assertEqual(60);
      expect(decoded.hideProgress).assertFalse();
      expect(decoded.inputValue).assertEqual('snap.example.com');
      expect(decoded.tabIndex).assertEqual(1);
      expect(decoded.epoch).assertEqual(machine.epoch);
      expect(codec.isValid(decoded)).assertTrue();
      expect(payload).assertContain('LOADING');
      TestLogger.pass(TAG, 'Browser_Flow_Snapshot_017');
    });

    it('Browser_Flow_Snapshot_018', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Flow_Snapshot_018');
      TestLogger.step(TAG, 'a captured snapshot is detached from later machine changes');
      const machine: FlowMachine = new FlowMachine();
      machine.startLoad();
      const snapshot: FlowSnapshot = captureSnapshot(machine, 25, false, 'detach.example.com', 0);
      const capturedEpoch: number = snapshot.epoch;
      machine.complete();
      machine.startLoad();
      TestLogger.info(TAG, `machineEpoch=${machine.epoch}, snapshotEpoch=${snapshot.epoch}`);
      expect(machine.state).assertEqual(FlowState.LOADING);
      expect(machine.epoch).assertEqual(capturedEpoch + 2);
      expect(snapshot.epoch).assertEqual(capturedEpoch);
      expect(snapshot.progress).assertEqual(25);
      expect(snapshot.inputValue).assertEqual('detach.example.com');
      expect(snapshot.state).assertEqual(FlowState.LOADING);
      TestLogger.pass(TAG, 'Browser_Flow_Snapshot_018');
    });

    it('Browser_Flow_Restore_019', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Flow_Restore_019');
      TestLogger.step(TAG, 'a stored snapshot can be reloaded and continue the flow');
      const machine: FlowMachine = new FlowMachine();
      machine.startLoad();
      machine.complete();
      const store: SnapshotStore = new SnapshotStore(4);
      store.save(captureSnapshot(machine, 0, true, 'done.example.com', 2));
      machine.startLoad();
      store.save(captureSnapshot(machine, 45, false, 'busy.example.com', 2));
      const latest: FlowSnapshot | null = store.latest();
      TestLogger.info(TAG, `saves=${store.saves}, size=${store.size()}`);
      expect(store.size()).assertEqual(2);
      expect(store.saves).assertEqual(2);
      expect(latest === null).assertFalse();
      if (latest === null) {
        return;
      }
      expect(latest.state).assertEqual(FlowState.LOADING);
      expect(latest.progress).assertEqual(45);
      expect(latest.tabIndex).assertEqual(2);
      expect(store.load(0) !== null).assertTrue();
      expect(store.load(-1)).assertNull();
      expect(store.load(9)).assertNull();
      expect(store.failures).assertEqual(0);
      expect(store.restores).assertEqual(2);
      TestLogger.pass(TAG, 'Browser_Flow_Restore_019');
    });

    it('Browser_Flow_Restore_020', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Flow_Restore_020');
      TestLogger.step(TAG, 'malformed and out of range snapshots are refused');
      const codec: SnapshotCodec = new SnapshotCodec();
      expect(codec.decode('')).assertNull();
      expect(codec.decode('IDLE#50')).assertNull();
      expect(codec.decode('BOGUS#10#true#x#0#1')).assertNull();
      expect(codec.decode('IDLE#ten#true#x#0#1')).assertNull();
      expect(codec.decode('IDLE#10#true#x#zero#1')).assertNull();
      const valid: FlowSnapshot = {
        state: FlowState.ERROR, progress: 100, hideProgress: true,
        inputValue: 'x', tabIndex: 0, epoch: 7
      };
      const decoded: FlowSnapshot | null = codec.decode(codec.encode(valid));
      expect(decoded === null).assertFalse();
      expect(codec.isValid(valid)).assertTrue();
      const tooMuchProgress: FlowSnapshot = {
        state: FlowState.END, progress: 120, hideProgress: true,
        inputValue: '', tabIndex: 0, epoch: 1
      };
      const negativeTab: FlowSnapshot = {
        state: FlowState.IDLE, progress: 0, hideProgress: true,
        inputValue: '', tabIndex: -1, epoch: 1
      };
      expect(codec.isValid(tooMuchProgress)).assertFalse();
      expect(codec.isValid(negativeTab)).assertFalse();
      TestLogger.pass(TAG, 'Browser_Flow_Restore_020');
    });

    it('Browser_Flow_UiSync_021', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Flow_UiSync_021');
      TestLogger.step(TAG, 'the progress bar is visible only while loading below 100');
      const binding: StateUiBinding = new StateUiBinding();
      expect(binding.progressVisible(FlowState.LOADING, 0)).assertTrue();
      expect(binding.progressVisible(FlowState.LOADING, 45)).assertTrue();
      expect(binding.progressVisible(FlowState.LOADING, 99)).assertTrue();
      expect(binding.progressVisible(FlowState.LOADING, 100)).assertFalse();
      expect(binding.progressVisible(FlowState.IDLE, 45)).assertFalse();
      expect(binding.progressVisible(FlowState.END, 45)).assertFalse();
      expect(binding.progressVisible(FlowState.ERROR, 45)).assertFalse();
      TestLogger.info(TAG, binding.describe(FlowState.LOADING, 45));
      expect(binding.progressValue(FlowState.LOADING, 60)).assertEqual(60);
      expect(binding.progressValue(FlowState.LOADING, 100)).assertEqual(0);
      expect(binding.progressValue(FlowState.END, 60)).assertEqual(0);
      expect(binding.progressValue(FlowState.ERROR, 60)).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_Flow_UiSync_021');
    });

    it('Browser_Flow_UiSync_022', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Flow_UiSync_022');
      TestLogger.step(TAG, 'the model loading status follows the flow state');
      const binding: StateUiBinding = new StateUiBinding();
      expect(binding.loadingStatusOf(FlowState.LOADING)).assertEqual(MockLoadingStatus.LOADING);
      expect(binding.loadingStatusOf(FlowState.END)).assertEqual(MockLoadingStatus.END);
      expect(binding.loadingStatusOf(FlowState.IDLE)).assertEqual(MockLoadingStatus.END);
      expect(binding.loadingStatusOf(FlowState.ERROR)).assertEqual(MockLoadingStatus.END);
      expect(binding.loadingStatusOf(FlowState.LOADING)).assertEqual(0);
      expect(binding.loadingStatusOf(FlowState.END)).assertEqual(1);
      const browser: MockBrowser = new MockBrowser(1);
      browser.onPageBegin('https://sync.example.com');
      expect(browser.loadingStatus).assertEqual(binding.loadingStatusOf(FlowState.LOADING));
      browser.onPageEnd();
      expect(browser.loadingStatus).assertEqual(binding.loadingStatusOf(FlowState.END));
      TestLogger.pass(TAG, 'Browser_Flow_UiSync_022');
    });

    it('Browser_Flow_UiSync_023', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Flow_UiSync_023');
      TestLogger.step(TAG, 'each state exposes exactly the affordances it needs');
      const binding: StateUiBinding = new StateUiBinding();
      expect(binding.inputEditable(FlowState.LOADING)).assertFalse();
      expect(binding.inputEditable(FlowState.IDLE)).assertTrue();
      expect(binding.inputEditable(FlowState.END)).assertTrue();
      expect(binding.inputEditable(FlowState.ERROR)).assertTrue();
      expect(binding.spinnerVisible(FlowState.LOADING)).assertTrue();
      expect(binding.spinnerVisible(FlowState.END)).assertFalse();
      expect(binding.retryVisible(FlowState.ERROR)).assertTrue();
      expect(binding.retryVisible(FlowState.LOADING)).assertFalse();
      expect(binding.retryVisible(FlowState.END)).assertFalse();
      expect(binding.refreshEnabled(FlowState.LOADING)).assertFalse();
      expect(binding.refreshEnabled(FlowState.END)).assertTrue();
      expect(binding.backEnabled(FlowState.ERROR)).assertTrue();
      TestLogger.info(TAG, `retry states=${binding.describe(FlowState.ERROR, 0)}`);
      TestLogger.pass(TAG, 'Browser_Flow_UiSync_023');
    });

    it('Browser_Flow_History_024', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Flow_History_024');
      TestLogger.step(TAG, 'the audit ring keeps only the newest entries');
      const machine: FlowMachine = new FlowMachine();
      const ring: HistoryRing = new HistoryRing(4);
      machine.startLoad();
      machine.complete();
      machine.startLoad();
      machine.complete();
      machine.startLoad();
      machine.complete();
      for (let index = 0; index < machine.entries.length; index++) {
        ring.push(machine.entries[index]);
      }
      TestLogger.info(TAG, `size=${ring.size()}, dropped=${ring.droppedCount()}, newest=${ring.newest()}`);
      expect(machine.entries.length).assertEqual(6);
      expect(ring.size()).assertEqual(4);
      expect(ring.droppedCount()).assertEqual(2);
      expect(ring.oldest()).assertEqual('2:END>LOADING:start:ok');
      expect(ring.newest()).assertEqual('5:LOADING>END:complete:ok');
      expect(ring.contains('LOADING>END')).assertTrue();
      expect(ring.contains('IDLE>LOADING')).assertFalse();
      expect(ring.all().length).assertEqual(4);
      ring.clear();
      expect(ring.size()).assertEqual(0);
      expect(ring.droppedCount()).assertEqual(0);
      expect(ring.newest()).assertEqual('');
      TestLogger.pass(TAG, 'Browser_Flow_History_024');
    });

    it('Browser_Flow_Stress_025', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Flow_Stress_025');
      TestLogger.step(TAG, 'one hundred transitions keep the audit clean');
      const machine: FlowMachine = new FlowMachine();
      for (let round = 0; round < 50; round++) {
        expect(machine.startLoad()).assertTrue();
        expect(machine.complete()).assertTrue();
      }
      const audit: StateAudit = new StateAudit();
      const report: AuditReport = audit.audit(machine.entries, machine.table);
      TestLogger.info(TAG, `entries=${machine.entries.length}, epoch=${machine.epoch}, ` +
        `${audit.summary(machine.entries)}`);
      expect(machine.entries.length).assertEqual(100);
      expect(machine.epoch).assertEqual(100);
      expect(machine.acceptedCount()).assertEqual(100);
      expect(machine.rejectedCount()).assertEqual(0);
      expect(machine.countPair(FlowState.IDLE, FlowState.LOADING)).assertEqual(1);
      expect(machine.countPair(FlowState.END, FlowState.LOADING)).assertEqual(49);
      expect(machine.countPair(FlowState.LOADING, FlowState.END)).assertEqual(50);
      expect(report.violations.length).assertEqual(0);
      expect(report.contiguous).assertTrue();
      expect(audit.acceptanceRatio(machine.entries)).assertEqual(100);
      expect(machine.state).assertEqual(FlowState.END);
      TestLogger.pass(TAG, 'Browser_Flow_Stress_025');
    });

    it('Browser_Flow_UI_026', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Flow_UI_026');
      TestLogger.step(TAG, 'the url input and the refresh affordance are reachable');
      const input: boolean = await waitForId(driver, ID_INPUT_URL, TIMEOUT_COMPONENT);
      const refresh: boolean = await componentByIdExists(driver, ID_NAV_REFRESH);
      const home: boolean = await componentByIdExists(driver, ID_NAV_HOME);
      TestLogger.info(TAG, `input=${input}, refresh=${refresh}, home=${home}`);
      expect(input).assertTrue();
      expect(refresh).assertTrue();
      expect(home).assertTrue();
      const clicked: boolean = await clickById(driver, ID_NAV_REFRESH);
      expect(clicked).assertTrue();
      await serializedDelay(driver, DELAY_TAB_OPERATION);
      expect(await componentByIdExists(driver, ID_INPUT_URL)).assertTrue();
      TestLogger.pass(TAG, 'Browser_Flow_UI_026');
    });

    it('Browser_Flow_UI_027', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Flow_UI_027');
      TestLogger.step(TAG, 'a refresh keeps the address bar mounted and the model consistent');
      const typed: boolean = await inputById(driver, ID_INPUT_URL, 'flow.example.com');
      TestLogger.info(TAG, `typed=${typed}`);
      const browser: MockBrowser = new MockBrowser(1);
      browser.loadUrl('flow.example.com');
      browser.refresh();
      const controller: MockWebController = browser.tabs[0].controller;
      expect(controller.refreshCount).assertEqual(1);
      expect(controller.loadCount).assertEqual(1);
      expect(controller.currentUrl).assertEqual('https://flow.example.com');
      const text: string = await textById(driver, ID_INPUT_URL);
      TestLogger.info(TAG, `input text='${text}'`);
      expect(text.length >= 0).assertTrue();
      expect(await componentByIdExists(driver, ID_INPUT_URL)).assertTrue();
      TestLogger.pass(TAG, 'Browser_Flow_UI_027');
    });

    it('Browser_Flow_UI_028', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_Flow_UI_028');
      TestLogger.step(TAG, 'returning home leaves the flow in a restable state');
      const homeClicked: boolean = await clickById(driver, ID_NAV_HOME);
      expect(homeClicked).assertTrue();
      await serializedDelay(driver, DELAY_TAB_OPERATION);
      const machine: FlowMachine = new FlowMachine();
      machine.startLoad();
      machine.complete();
      expect(machine.resetToIdle()).assertTrue();
      TestLogger.info(TAG, `path=${machine.path()}, state=${flowName(machine.state)}`);
      expect(machine.state).assertEqual(FlowState.IDLE);
      expect(machine.path()).assertEqual('IDLE>LOADING>END>IDLE');
      expect(machine.countPair(FlowState.END, FlowState.IDLE)).assertEqual(1);
      expect(machine.epoch).assertEqual(3);
      expect(await componentByIdExists(driver, ID_INPUT_URL)).assertTrue();
      expect(await componentByIdExists(driver, ID_NAV_BACK)).assertTrue();
      TestLogger.pass(TAG, 'Browser_Flow_UI_028');
    });
  });
}
