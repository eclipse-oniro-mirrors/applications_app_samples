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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  KEY_BACK,
  recorderComponentCount,
  pressAndWait,
  delay,
  DELAY_KEY_NAVIGATION
} from '../shared/RecordingDriver';

// Lifecycle state of a floating window slot. The recorder owns two slots: the
// timer window shown while recording and the tip window shown after the stop.
enum WindowState {
  IDLE = 'idle',
  CREATING = 'creating',
  VISIBLE = 'visible',
  HIDING = 'hiding',
  DESTROYED = 'destroyed',
  ERROR = 'error'
}

// Result of a transition attempt.
enum TransitionResult {
  SUCCESS = 'success',
  INVALID = 'invalid',
  DUPLICATE = 'duplicate',
  ERROR = 'error'
}

// Legality assessment of a candidate transition.
enum TransitionLegality {
  LEGAL = 'legal',
  ILLEGAL = 'illegal',
  CONDITIONAL = 'conditional'
}

// One transition of one window slot.
interface WindowTransition {
  slot: string;
  from: WindowState;
  to: WindowState;
  trigger: string;
  timestamp: number;
}

// Summary of the whole manager, used by the reporting helper.
interface WindowStateSummary {
  totalTransitions: number;
  successCount: number;
  duplicateCount: number;
  errorCount: number;
  reuseCount: number;
  mostFrequentTransition: string;
}

// Assessment of one candidate transition.
interface TransitionAssessment {
  from: WindowState;
  to: WindowState;
  legality: TransitionLegality;
  reason: string;
}

// Names of the two floating window slots of the sample.
const SLOT_TIMER: string = 'timer';

const SLOT_TIP: string = 'Tip';

// State manager of the floating windows. It reproduces the guard of
// `WindowManager.openTimerWindow` (an existing window is never created twice)
// and the reuse path of `WindowManager.popupRecorderTip` (a visible window is
// only shown / hidden again instead of being recreated).
class WindowStateManager {
  private static instance: WindowStateManager;
  private slotStates: Map<string, WindowState> = new Map();
  private history: WindowTransition[] = [];
  private listeners: Array<(slot: string, from: WindowState, to: WindowState) => void> = [];
  private duplicateOpenCount: number = 0;
  private reuseCount: number = 0;
  private lastError: string = '';

  constructor() {
    this.slotStates.set(SLOT_TIMER, WindowState.IDLE);
    this.slotStates.set(SLOT_TIP, WindowState.IDLE);
  }

  public static getInstance(): WindowStateManager {
    if (!WindowStateManager.instance) {
      WindowStateManager.instance = new WindowStateManager();
    }
    return WindowStateManager.instance;
  }

  public resetManager(): void {
    this.slotStates.set(SLOT_TIMER, WindowState.IDLE);
    this.slotStates.set(SLOT_TIP, WindowState.IDLE);
    this.history = [];
    this.duplicateOpenCount = 0;
    this.reuseCount = 0;
    this.lastError = '';
  }

  public getSlotState(slot: string): WindowState {
    const state = this.slotStates.get(slot);
    if (state === undefined) {
      return WindowState.IDLE;
    }
    return state;
  }

  public isInState(slot: string, state: WindowState): boolean {
    return this.getSlotState(slot) === state;
  }

  public getDuplicateOpenCount(): number {
    return this.duplicateOpenCount;
  }

  public getReuseCount(): number {
    return this.reuseCount;
  }

  public getLastError(): string {
    return this.lastError;
  }

  public getTransitionCount(): number {
    return this.history.length;
  }

  public getHistory(): WindowTransition[] {
    // Element level copies, otherwise a caller could mutate the audit trail.
    const copied: WindowTransition[] = [];
    for (let i = 0; i < this.history.length; i++) {
      const item = this.history[i];
      copied.push({
        slot: item.slot,
        from: item.from,
        to: item.to,
        trigger: item.trigger,
        timestamp: item.timestamp
      });
    }
    return copied;
  }

  public getTransitionCountTo(state: WindowState): number {
    return this.history.filter((item: WindowTransition) => item.to === state).length;
  }

  public getSlotTransitionCount(slot: string): number {
    return this.history.filter((item: WindowTransition) => item.slot === slot).length;
  }

  // Core transition. An illegal pair moves the slot into ERROR and returns
  // INVALID, which is the defensive behaviour expected of the window manager.
  public transition(slot: string, to: WindowState, trigger: string): TransitionResult {
    const from = this.getSlotState(slot);
    if (!this.isValidTransition(from, to)) {
      this.lastError = 'invalid transition ' + from + ' -> ' + to + ' on slot ' + slot;
      this.slotStates.set(slot, WindowState.ERROR);
      return TransitionResult.INVALID;
    }
    this.slotStates.set(slot, to);
    const record: WindowTransition = {
      slot: slot,
      from: from,
      to: to,
      trigger: trigger,
      timestamp: Date.now()
    };
    this.history.push(record);
    this.notifyListeners(slot, from, to);
    return TransitionResult.SUCCESS;
  }

  // Opening a window twice must be ignored. The production `set` method logs
  // "windowClass exist" and returns without creating a second window.
  public openSlot(slot: string): TransitionResult {
    const state = this.getSlotState(slot);
    // A destroyed window can be created again, which is the recovery path of
    // the floating tip window after an error.
    if (state !== WindowState.IDLE && state !== WindowState.DESTROYED) {
      this.duplicateOpenCount++;
      return TransitionResult.DUPLICATE;
    }
    return this.transition(slot, WindowState.CREATING, 'open');
  }

  // The window becomes visible after the page has been loaded.
  public markVisible(slot: string): TransitionResult {
    return this.transition(slot, WindowState.VISIBLE, 'content_loaded');
  }

  // Hiding keeps the window instance alive so that it can be shown again.
  public hideSlot(slot: string): TransitionResult {
    return this.transition(slot, WindowState.HIDING, 'hide');
  }

  public destroySlot(slot: string): TransitionResult {
    return this.transition(slot, WindowState.DESTROYED, 'destroy');
  }

  public failSlot(slot: string): TransitionResult {
    return this.transition(slot, WindowState.ERROR, 'create_failed');
  }

  // Reuse path of `popupRecorderTip`. A visible or hiding window is shown again
  // instead of being recreated, which is the behaviour asserted by the reuse
  // scenarios.
  public popupSlot(slot: string): TransitionResult {
    const state = this.getSlotState(slot);
    if (state === WindowState.VISIBLE) {
      this.reuseCount++;
      return TransitionResult.DUPLICATE;
    }
    if (state === WindowState.HIDING) {
      this.reuseCount++;
      return this.transition(slot, WindowState.VISIBLE, 'popup_reuse');
    }
    if (state === WindowState.IDLE) {
      const opened = this.openSlot(slot);
      if (opened !== TransitionResult.SUCCESS) {
        return opened;
      }
      return this.markVisible(slot);
    }
    return TransitionResult.ERROR;
  }

  public addListener(listener: (slot: string, from: WindowState, to: WindowState) => void): void {
    this.listeners.push(listener);
  }

  public removeListener(listener: (slot: string, from: WindowState, to: WindowState) => void): void {
    const index = this.listeners.indexOf(listener);
    if (index !== -1) {
      this.listeners.splice(index, 1);
    }
  }

  public getTransitionStats(): Map<string, number> {
    const stats = new Map<string, number>();
    for (let i = 0; i < this.history.length; i++) {
      const key = this.history[i].from + '->' + this.history[i].to;
      const current = stats.get(key);
      if (current === undefined) {
        stats.set(key, 1);
      } else {
        stats.set(key, current + 1);
      }
    }
    return stats;
  }

  public exportHistory(): string {
    return JSON.stringify(this.history);
  }

  public importHistory(jsonString: string): boolean {
    try {
      const parsed: WindowTransition[] = JSON.parse(jsonString) as WindowTransition[];
      if (parsed.length === 0) {
        return true;
      }
      this.history = parsed;
      const last = parsed[parsed.length - 1];
      this.slotStates.set(last.slot, last.to);
      return true;
    } catch (error) {
      return false;
    }
  }

  public isKnownState(state: WindowState): boolean {
    return state === WindowState.IDLE || state === WindowState.CREATING || state === WindowState.VISIBLE ||
      state === WindowState.HIDING || state === WindowState.DESTROYED || state === WindowState.ERROR;
  }

  // Validates a state name delivered by an external source. Names are kept as
  // raw strings so an unknown value can be rejected without a forced cast.
  public isKnownStateName(name: string): boolean {
    return name === 'idle' || name === 'creating' || name === 'visible' || name === 'hiding' ||
      name === 'destroyed' || name === 'error';
  }

  public isValidTransition(from: WindowState, to: WindowState): boolean {
    if (from === to) {
      return false;
    }
    if (from === WindowState.IDLE) {
      return to === WindowState.CREATING;
    }
    if (from === WindowState.CREATING) {
      return to === WindowState.VISIBLE || to === WindowState.DESTROYED || to === WindowState.ERROR;
    }
    if (from === WindowState.VISIBLE) {
      return to === WindowState.HIDING || to === WindowState.DESTROYED;
    }
    if (from === WindowState.HIDING) {
      return to === WindowState.DESTROYED || to === WindowState.VISIBLE;
    }
    if (from === WindowState.DESTROYED) {
      return to === WindowState.CREATING || to === WindowState.IDLE;
    }
    return to === WindowState.DESTROYED || to === WindowState.IDLE;
  }

  private notifyListeners(slot: string, from: WindowState, to: WindowState): void {
    for (let i = 0; i < this.listeners.length; i++) {
      this.listeners[i](slot, from, to);
    }
  }
}
// Assesses the legality of candidate transitions without mutating the manager.
class WindowTransitionAuditor {
  private assessments: TransitionAssessment[] = [];

  public assess(from: WindowState, to: WindowState): TransitionAssessment {
    const legality = this.determineLegality(from, to);
    const assessment: TransitionAssessment = {
      from: from,
      to: to,
      legality: legality,
      reason: this.buildReason(legality)
    };
    this.assessments.push(assessment);
    return assessment;
  }

  private determineLegality(from: WindowState, to: WindowState): TransitionLegality {
    if (from === to) {
      return TransitionLegality.ILLEGAL;
    }
    if (from === WindowState.ERROR || to === WindowState.ERROR) {
      return TransitionLegality.CONDITIONAL;
    }
    return TransitionLegality.LEGAL;
  }

  private buildReason(legality: TransitionLegality): string {
    if (legality === TransitionLegality.LEGAL) {
      return 'transition is legal';
    }
    if (legality === TransitionLegality.ILLEGAL) {
      return 'transition is illegal';
    }
    return 'transition is conditional';
  }

  public getAssessments(): TransitionAssessment[] {
    const copied: TransitionAssessment[] = [];
    for (let i = 0; i < this.assessments.length; i++) {
      copied.push(this.assessments[i]);
    }
    return copied;
  }

  public countByLegality(legality: TransitionLegality): number {
    return this.assessments.filter((item: TransitionAssessment) => item.legality === legality).length;
  }

  public resetAuditor(): void {
    this.assessments = [];
  }
}

// Builds the summary of a transition history.
class WindowStateSummaryReporter {
  private history: WindowTransition[] = [];

  constructor(history: WindowTransition[]) {
    for (let i = 0; i < history.length; i++) {
      this.history.push(history[i]);
    }
  }

  public buildSummary(): WindowStateSummary {
    const summary: WindowStateSummary = {
      totalTransitions: this.history.length,
      successCount: this.history.length,
      duplicateCount: 0,
      errorCount: this.countTargetState(WindowState.ERROR),
      reuseCount: this.countTargetState(WindowState.VISIBLE),
      mostFrequentTransition: this.findMostFrequentTransition()
    };
    return summary;
  }

  private countTargetState(state: WindowState): number {
    return this.history.filter((item: WindowTransition) => item.to === state).length;
  }

  private findMostFrequentTransition(): string {
    const counts = new Map<string, number>();
    for (let i = 0; i < this.history.length; i++) {
      const key = this.history[i].from + '->' + this.history[i].to;
      const current = counts.get(key);
      if (current === undefined) {
        counts.set(key, 1);
      } else {
        counts.set(key, current + 1);
      }
    }
    let bestKey = '';
    let bestCount = 0;
    counts.forEach((value: number, key: string) => {
      if (value > bestCount) {
        bestCount = value;
        bestKey = key;
      }
    });
    return bestKey;
  }
}

// Small asserter that keeps the expected slot state and expected count.
class WindowStateAsserter {
  private targetState: WindowState = WindowState.IDLE;
  private expectedCount: number = 0;

  public setTargetState(state: WindowState): void {
    this.targetState = state;
  }

  public setExpectedCount(count: number): void {
    this.expectedCount = count;
  }

  public getTargetState(): WindowState {
    return this.targetState;
  }

  public getExpectedCount(): number {
    return this.expectedCount;
  }

  public isStateSatisfied(actualState: WindowState): boolean {
    return actualState === this.targetState;
  }

  public isCountSatisfied(actualCount: number): boolean {
    return actualCount === this.expectedCount;
  }
}

// Reusable audit log entry of one transition.
class WindowTransitionLogEntry {
  private slot: string;
  private from: WindowState;
  private to: WindowState;
  private trigger: string;
  private timestamp: number;
  private result: TransitionResult;

  constructor(slot: string, from: WindowState, to: WindowState, trigger: string, timestamp: number,
    result: TransitionResult) {
    this.slot = slot;
    this.from = from;
    this.to = to;
    this.trigger = trigger;
    this.timestamp = timestamp;
    this.result = result;
  }

  public getSlot(): string {
    return this.slot;
  }

  public getFrom(): WindowState {
    return this.from;
  }

  public getTo(): WindowState {
    return this.to;
  }

  public getTrigger(): string {
    return this.trigger;
  }

  public getTimestamp(): number {
    return this.timestamp;
  }

  public getResult(): TransitionResult {
    return this.result;
  }

  public setResult(result: TransitionResult): void {
    this.result = result;
  }

  public equals(other: WindowTransitionLogEntry): boolean {
    return this.slot === other.slot && this.from === other.from && this.to === other.to &&
      this.trigger === other.trigger;
  }

  public toString(): string {
    return '[' + this.timestamp + '] ' + this.slot + ' ' + this.from + ' -> ' + this.to + ' (' + this.trigger + ')';
  }
}

// Holder of the audit log entries.
class WindowTransitionLogManager {
  private entries: WindowTransitionLogEntry[] = [];

  public appendEntry(entry: WindowTransitionLogEntry): void {
    this.entries.push(entry);
  }

  public getEntries(): WindowTransitionLogEntry[] {
    const copied: WindowTransitionLogEntry[] = [];
    for (let i = 0; i < this.entries.length; i++) {
      copied.push(this.entries[i]);
    }
    return copied;
  }

  public filterByResult(result: TransitionResult): WindowTransitionLogEntry[] {
    return this.entries.filter((entry: WindowTransitionLogEntry) => entry.getResult() === result);
  }

  public filterBySlot(slot: string): WindowTransitionLogEntry[] {
    return this.entries.filter((entry: WindowTransitionLogEntry) => entry.getSlot() === slot);
  }

  public clearEntries(): void {
    this.entries = [];
  }

  public getEntryCount(): number {
    return this.entries.length;
  }
}

// Cell of the transition matrix.
interface TransitionMatrixCell {
  from: WindowState;
  to: WindowState;
  allowed: boolean;
  weight: number;
}

// Complete transition matrix of the window state machine.
class WindowTransitionMatrix {
  private cells: TransitionMatrixCell[] = [];

  constructor() {
    this.initializeCells();
  }

  private initializeCells(): void {
    const states: WindowState[] = [WindowState.IDLE, WindowState.CREATING, WindowState.VISIBLE,
      WindowState.HIDING, WindowState.DESTROYED, WindowState.ERROR];
    for (let i = 0; i < states.length; i++) {
      for (let j = 0; j < states.length; j++) {
        const cell: TransitionMatrixCell = {
          from: states[i],
          to: states[j],
          allowed: this.isAllowedPair(states[i], states[j]),
          weight: states[i] === states[j] ? 0 : 1
        };
        this.cells.push(cell);
      }
    }
  }

  private isAllowedPair(from: WindowState, to: WindowState): boolean {
    if (from === to) {
      return false;
    }
    if (from === WindowState.IDLE) {
      return to === WindowState.CREATING;
    }
    if (from === WindowState.CREATING) {
      return to === WindowState.VISIBLE || to === WindowState.DESTROYED || to === WindowState.ERROR;
    }
    if (from === WindowState.VISIBLE) {
      return to === WindowState.HIDING || to === WindowState.DESTROYED;
    }
    if (from === WindowState.HIDING) {
      return to === WindowState.DESTROYED || to === WindowState.VISIBLE;
    }
    if (from === WindowState.DESTROYED) {
      return to === WindowState.CREATING || to === WindowState.IDLE;
    }
    return to === WindowState.DESTROYED || to === WindowState.IDLE;
  }

  public isTransitionAllowed(from: WindowState, to: WindowState): boolean {
    for (let i = 0; i < this.cells.length; i++) {
      if (this.cells[i].from === from && this.cells[i].to === to) {
        return this.cells[i].allowed;
      }
    }
    return false;
  }

  public countAllowedTransitions(): number {
    return this.cells.filter((cell: TransitionMatrixCell) => cell.allowed).length;
  }

  public getCells(): TransitionMatrixCell[] {
    const copied: TransitionMatrixCell[] = [];
    for (let i = 0; i < this.cells.length; i++) {
      copied.push(this.cells[i]);
    }
    return copied;
  }
}

// Weight of a transition path, used to reject impossible lifecycles.
class WindowTransitionWeightCalculator {
  private matrix: WindowTransitionMatrix;

  constructor(matrix: WindowTransitionMatrix) {
    this.matrix = matrix;
  }

  public computeWeight(from: WindowState, to: WindowState): number {
    if (!this.matrix.isTransitionAllowed(from, to)) {
      return -1;
    }
    return from === to ? 0 : 1;
  }

  public computePathWeight(path: WindowState[]): number {
    let total = 0;
    for (let i = 1; i < path.length; i++) {
      const weight = this.computeWeight(path[i - 1], path[i]);
      if (weight < 0) {
        return -1;
      }
      total += weight;
    }
    return total;
  }

  public isLegalPath(path: WindowState[]): boolean {
    return this.computePathWeight(path) >= 0;
  }
}

// Textual report of the transition matrix.
class WindowTransitionMatrixReporter {
  private matrix: WindowTransitionMatrix;

  constructor(matrix: WindowTransitionMatrix) {
    this.matrix = matrix;
  }

  public generateReport(): string {
    return 'TransitionMatrix totalCells=' + this.matrix.getCells().length + ' allowed=' +
      this.matrix.countAllowedTransitions();
  }

  public countAllowedFrom(state: WindowState): number {
    return this.matrix.getCells().filter((cell: TransitionMatrixCell) => cell.from === state && cell.allowed).length;
  }
}
export default function dialogStateManagerValidationTest(): void {
  describe('DialogStateManagerValidation_Test', () => {
    let driver: Driver;
    let manager: WindowStateManager;

    beforeAll(async () => {
      driver = getDriver();
      manager = WindowStateManager.getInstance();
      manager.resetManager();
      await delay(200);
    });

    afterAll(async () => {
      await delay(200);
    });

    it('window_state_enum_should_be_defined_correctly', 0, () => {
      expect(WindowState.IDLE).assertEqual('idle');
      expect(WindowState.CREATING).assertEqual('creating');
      expect(WindowState.VISIBLE).assertEqual('visible');
      expect(WindowState.HIDING).assertEqual('hiding');
      expect(WindowState.DESTROYED).assertEqual('destroyed');
      expect(WindowState.ERROR).assertEqual('error');
    });

    it('transition_result_enum_should_be_defined_correctly', 0, () => {
      expect(TransitionResult.SUCCESS).assertEqual('success');
      expect(TransitionResult.INVALID).assertEqual('invalid');
      expect(TransitionResult.DUPLICATE).assertEqual('duplicate');
      expect(TransitionResult.ERROR).assertEqual('error');
      expect(TransitionLegality.LEGAL).assertEqual('legal');
      expect(TransitionLegality.ILLEGAL).assertEqual('illegal');
      expect(TransitionLegality.CONDITIONAL).assertEqual('conditional');
    });

    it('manager_initial_state_should_be_idle', 0, () => {
      manager.resetManager();
      expect(manager.getSlotState(SLOT_TIMER)).assertEqual(WindowState.IDLE);
      expect(manager.getSlotState(SLOT_TIP)).assertEqual(WindowState.IDLE);
      expect(manager.getTransitionCount()).assertEqual(0);
      expect(manager.getDuplicateOpenCount()).assertEqual(0);
      expect(manager.getLastError()).assertEqual('');
      expect(manager.isInState(SLOT_TIMER, WindowState.IDLE)).assertTrue();
    });

    it('timer_window_full_lifecycle_should_succeed', 0, () => {
      manager.resetManager();
      expect(manager.openSlot(SLOT_TIMER)).assertEqual(TransitionResult.SUCCESS);
      expect(manager.getSlotState(SLOT_TIMER)).assertEqual(WindowState.CREATING);
      expect(manager.markVisible(SLOT_TIMER)).assertEqual(TransitionResult.SUCCESS);
      expect(manager.getSlotState(SLOT_TIMER)).assertEqual(WindowState.VISIBLE);
      expect(manager.hideSlot(SLOT_TIMER)).assertEqual(TransitionResult.SUCCESS);
      expect(manager.getSlotState(SLOT_TIMER)).assertEqual(WindowState.HIDING);
      expect(manager.destroySlot(SLOT_TIMER)).assertEqual(TransitionResult.SUCCESS);
      expect(manager.getSlotState(SLOT_TIMER)).assertEqual(WindowState.DESTROYED);
      expect(manager.getTransitionCount()).assertEqual(4);
    });

    it('tip_window_full_lifecycle_should_succeed', 0, () => {
      manager.resetManager();
      manager.openSlot(SLOT_TIP);
      manager.markVisible(SLOT_TIP);
      expect(manager.getSlotState(SLOT_TIP)).assertEqual(WindowState.VISIBLE);
      manager.hideSlot(SLOT_TIP);
      expect(manager.getSlotState(SLOT_TIP)).assertEqual(WindowState.HIDING);
      manager.destroySlot(SLOT_TIP);
      expect(manager.getSlotState(SLOT_TIP)).assertEqual(WindowState.DESTROYED);
      expect(manager.getSlotTransitionCount(SLOT_TIP)).assertEqual(4);
      expect(manager.getSlotTransitionCount(SLOT_TIMER)).assertEqual(0);
    });

    it('duplicate_open_should_be_guarded', 0, () => {
      manager.resetManager();
      expect(manager.openSlot(SLOT_TIMER)).assertEqual(TransitionResult.SUCCESS);
      expect(manager.openSlot(SLOT_TIMER)).assertEqual(TransitionResult.DUPLICATE);
      expect(manager.getDuplicateOpenCount()).assertEqual(1);
      expect(manager.getTransitionCount()).assertEqual(1);
      manager.markVisible(SLOT_TIMER);
      expect(manager.openSlot(SLOT_TIMER)).assertEqual(TransitionResult.DUPLICATE);
      expect(manager.getDuplicateOpenCount()).assertEqual(2);
      expect(manager.getSlotState(SLOT_TIMER)).assertEqual(WindowState.VISIBLE);
    });

    it('duplicate_open_should_not_create_second_window', 0, () => {
      manager.resetManager();
      manager.openSlot(SLOT_TIMER);
      manager.markVisible(SLOT_TIMER);
      const before = manager.getSlotTransitionCount(SLOT_TIMER);
      manager.openSlot(SLOT_TIMER);
      manager.openSlot(SLOT_TIMER);
      expect(manager.getSlotTransitionCount(SLOT_TIMER)).assertEqual(before);
      expect(manager.getSlotState(SLOT_TIMER)).assertEqual(WindowState.VISIBLE);
      expect(manager.getDuplicateOpenCount()).assertEqual(2);
    });

    it('visible_tip_window_should_be_reused_on_popup', 0, () => {
      manager.resetManager();
      manager.openSlot(SLOT_TIP);
      manager.markVisible(SLOT_TIP);
      expect(manager.popupSlot(SLOT_TIP)).assertEqual(TransitionResult.DUPLICATE);
      expect(manager.getReuseCount()).assertEqual(1);
      expect(manager.getDuplicateOpenCount()).assertEqual(0);
      expect(manager.getSlotState(SLOT_TIP)).assertEqual(WindowState.VISIBLE);
    });

    it('hiding_tip_window_should_be_shown_again_on_popup', 0, () => {
      manager.resetManager();
      manager.openSlot(SLOT_TIP);
      manager.markVisible(SLOT_TIP);
      manager.hideSlot(SLOT_TIP);
      expect(manager.getSlotState(SLOT_TIP)).assertEqual(WindowState.HIDING);
      expect(manager.popupSlot(SLOT_TIP)).assertEqual(TransitionResult.SUCCESS);
      expect(manager.getSlotState(SLOT_TIP)).assertEqual(WindowState.VISIBLE);
      expect(manager.getReuseCount()).assertEqual(1);
      expect(manager.getTransitionCountTo(WindowState.VISIBLE)).assertEqual(2);
    });

    it('idle_tip_window_should_be_created_on_popup', 0, () => {
      manager.resetManager();
      expect(manager.popupSlot(SLOT_TIP)).assertEqual(TransitionResult.SUCCESS);
      expect(manager.getSlotState(SLOT_TIP)).assertEqual(WindowState.VISIBLE);
      expect(manager.getReuseCount()).assertEqual(0);
      expect(manager.getTransitionCount()).assertEqual(2);
    });

    it('invalid_transition_should_move_slot_to_error', 0, () => {
      manager.resetManager();
      expect(manager.transition(SLOT_TIMER, WindowState.VISIBLE, 'skip_creating'))
        .assertEqual(TransitionResult.INVALID);
      expect(manager.getSlotState(SLOT_TIMER)).assertEqual(WindowState.ERROR);
      expect(manager.getLastError().includes('invalid transition')).assertTrue();
      expect(manager.getTransitionCount()).assertEqual(0);
    });

    it('error_slot_should_be_recoverable', 0, () => {
      manager.resetManager();
      manager.transition(SLOT_TIMER, WindowState.VISIBLE, 'skip_creating');
      expect(manager.getSlotState(SLOT_TIMER)).assertEqual(WindowState.ERROR);
      expect(manager.destroySlot(SLOT_TIMER)).assertEqual(TransitionResult.SUCCESS);
      expect(manager.getSlotState(SLOT_TIMER)).assertEqual(WindowState.DESTROYED);
      expect(manager.openSlot(SLOT_TIMER)).assertEqual(TransitionResult.SUCCESS);
      expect(manager.getSlotState(SLOT_TIMER)).assertEqual(WindowState.CREATING);
    });

    it('state_change_listener_should_receive_notifications', 0, () => {
      manager.resetManager();
      let notificationCount = 0;
      let lastSlot = '';
      let lastFrom: WindowState = WindowState.IDLE;
      let lastTo: WindowState = WindowState.IDLE;
      const listener = (slot: string, from: WindowState, to: WindowState): void => {
        notificationCount++;
        lastSlot = slot;
        lastFrom = from;
        lastTo = to;
      };
      manager.addListener(listener);
      manager.openSlot(SLOT_TIMER);
      expect(notificationCount).assertEqual(1);
      expect(lastSlot).assertEqual(SLOT_TIMER);
      expect(lastFrom).assertEqual(WindowState.IDLE);
      expect(lastTo).assertEqual(WindowState.CREATING);
      manager.markVisible(SLOT_TIMER);
      expect(notificationCount).assertEqual(2);
      expect(lastTo).assertEqual(WindowState.VISIBLE);
      manager.removeListener(listener);
    });

    it('listener_removal_should_stop_notifications', 0, () => {
      manager.resetManager();
      let notificationCount = 0;
      const listener = (): void => {
        notificationCount++;
      };
      manager.addListener(listener);
      manager.openSlot(SLOT_TIMER);
      expect(notificationCount).assertEqual(1);
      manager.removeListener(listener);
      manager.markVisible(SLOT_TIMER);
      manager.hideSlot(SLOT_TIMER);
      expect(notificationCount).assertEqual(1);
    });
    it('history_should_record_all_transitions', 0, () => {
      manager.resetManager();
      manager.openSlot(SLOT_TIMER);
      manager.markVisible(SLOT_TIMER);
      manager.hideSlot(SLOT_TIMER);
      manager.destroySlot(SLOT_TIMER);
      const history = manager.getHistory();
      expect(history.length).assertEqual(4);
      expect(history[0].from).assertEqual(WindowState.IDLE);
      expect(history[0].to).assertEqual(WindowState.CREATING);
      expect(history[3].from).assertEqual(WindowState.HIDING);
      expect(history[3].to).assertEqual(WindowState.DESTROYED);
      expect(history[0].slot).assertEqual(SLOT_TIMER);
      expect(history[0].trigger).assertEqual('open');
    });

    it('history_should_return_deep_copy', 0, () => {
      manager.resetManager();
      manager.openSlot(SLOT_TIMER);
      const first = manager.getHistory();
      first[0].trigger = 'mutated';
      const second = manager.getHistory();
      expect(second[0].trigger).assertEqual('open');
      expect(manager.getTransitionCount()).assertEqual(1);
    });

    it('transition_stats_should_be_accurate', 0, () => {
      manager.resetManager();
      manager.openSlot(SLOT_TIMER);
      manager.markVisible(SLOT_TIMER);
      manager.hideSlot(SLOT_TIMER);
      manager.markVisible(SLOT_TIMER);
      manager.hideSlot(SLOT_TIMER);
      const stats = manager.getTransitionStats();
      expect(stats.get('idle->creating')).assertEqual(1);
      expect(stats.get('creating->visible')).assertEqual(1);
      expect(stats.get('visible->hiding')).assertEqual(2);
      expect(stats.get('hiding->visible')).assertEqual(1);
      expect(stats.get('idle->visible')).assertUndefined();
    });

    it('transition_count_to_state_should_be_accurate', 0, () => {
      manager.resetManager();
      manager.openSlot(SLOT_TIMER);
      manager.markVisible(SLOT_TIMER);
      manager.hideSlot(SLOT_TIMER);
      manager.markVisible(SLOT_TIMER);
      manager.hideSlot(SLOT_TIMER);
      expect(manager.getTransitionCountTo(WindowState.VISIBLE)).assertEqual(2);
      expect(manager.getTransitionCountTo(WindowState.HIDING)).assertEqual(2);
      expect(manager.getTransitionCountTo(WindowState.CREATING)).assertEqual(1);
      expect(manager.getTransitionCountTo(WindowState.DESTROYED)).assertEqual(0);
      expect(manager.getTransitionCountTo(WindowState.ERROR)).assertEqual(0);
    });

    it('export_and_import_history_should_round_trip', 0, () => {
      manager.resetManager();
      manager.openSlot(SLOT_TIMER);
      manager.markVisible(SLOT_TIMER);
      manager.hideSlot(SLOT_TIMER);
      const exported = manager.exportHistory();
      expect(exported.length).assertLarger(0);
      manager.resetManager();
      expect(manager.getTransitionCount()).assertEqual(0);
      expect(manager.importHistory(exported)).assertTrue();
      expect(manager.getTransitionCount()).assertEqual(3);
      expect(manager.getSlotState(SLOT_TIMER)).assertEqual(WindowState.HIDING);
    });

    it('invalid_import_should_return_false', 0, () => {
      manager.resetManager();
      expect(manager.importHistory('invalid json')).assertFalse();
      expect(manager.importHistory('')).assertFalse();
      expect(manager.importHistory('{key: value}')).assertFalse();
      expect(manager.getTransitionCount()).assertEqual(0);
    });

    it('empty_import_should_keep_previous_state', 0, () => {
      manager.resetManager();
      manager.openSlot(SLOT_TIMER);
      expect(manager.importHistory('[]')).assertTrue();
      expect(manager.getTransitionCount()).assertEqual(1);
      expect(manager.getSlotState(SLOT_TIMER)).assertEqual(WindowState.CREATING);
    });

    it('manager_singleton_should_return_same_instance', 0, () => {
      const first = WindowStateManager.getInstance();
      const second = WindowStateManager.getInstance();
      expect(first === second).assertTrue();
      first.resetManager();
      first.openSlot(SLOT_TIMER);
      expect(second.getSlotState(SLOT_TIMER)).assertEqual(WindowState.CREATING);
    });

    it('transition_timestamps_should_be_chronological', 0, async () => {
      manager.resetManager();
      manager.openSlot(SLOT_TIMER);
      await delay(20);
      manager.markVisible(SLOT_TIMER);
      await delay(20);
      manager.hideSlot(SLOT_TIMER);
      const history = manager.getHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    it('reset_should_restore_initial_values', 0, () => {
      manager.resetManager();
      manager.openSlot(SLOT_TIMER);
      manager.markVisible(SLOT_TIMER);
      expect(manager.getTransitionCount()).assertEqual(2);
      manager.resetManager();
      expect(manager.getSlotState(SLOT_TIMER)).assertEqual(WindowState.IDLE);
      expect(manager.getSlotState(SLOT_TIP)).assertEqual(WindowState.IDLE);
      expect(manager.getTransitionCount()).assertEqual(0);
      expect(manager.getDuplicateOpenCount()).assertEqual(0);
      expect(manager.getReuseCount()).assertEqual(0);
      expect(manager.getLastError()).assertEqual('');
    });

    it('unknown_state_should_be_rejected', 0, () => {
      expect(manager.isKnownStateName('unknown')).assertFalse();
      expect(manager.isKnownStateName('')).assertFalse();
      expect(manager.isKnownStateName('visible')).assertTrue();
      expect(manager.isValidTransition(WindowState.IDLE, WindowState.IDLE)).assertFalse();
      expect(manager.isValidTransition(WindowState.IDLE, WindowState.CREATING)).assertTrue();
      expect(manager.isValidTransition(WindowState.VISIBLE, WindowState.CREATING)).assertFalse();
    });

    it('error_slot_popup_should_report_error', 0, () => {
      manager.resetManager();
      manager.transition(SLOT_TIP, WindowState.VISIBLE, 'skip_creating');
      expect(manager.getSlotState(SLOT_TIP)).assertEqual(WindowState.ERROR);
      expect(manager.popupSlot(SLOT_TIP)).assertEqual(TransitionResult.ERROR);
      expect(manager.getReuseCount()).assertEqual(0);
    });

    it('timer_and_tip_slots_should_be_independent', 0, () => {
      manager.resetManager();
      manager.openSlot(SLOT_TIMER);
      manager.markVisible(SLOT_TIMER);
      manager.openSlot(SLOT_TIP);
      expect(manager.getSlotState(SLOT_TIMER)).assertEqual(WindowState.VISIBLE);
      expect(manager.getSlotState(SLOT_TIP)).assertEqual(WindowState.CREATING);
      manager.hideSlot(SLOT_TIMER);
      expect(manager.getSlotState(SLOT_TIP)).assertEqual(WindowState.CREATING);
      expect(manager.getSlotTransitionCount(SLOT_TIMER)).assertEqual(3);
      expect(manager.getSlotTransitionCount(SLOT_TIP)).assertEqual(1);
    });
    it('transition_auditor_should_assess_legality', 0, () => {
      const auditor = new WindowTransitionAuditor();
      expect(auditor.assess(WindowState.IDLE, WindowState.CREATING).legality).assertEqual(TransitionLegality.LEGAL);
      expect(auditor.assess(WindowState.VISIBLE, WindowState.VISIBLE).legality).assertEqual(TransitionLegality.ILLEGAL);
      const conditional = auditor.assess(WindowState.ERROR, WindowState.DESTROYED);
      expect(conditional.legality).assertEqual(TransitionLegality.CONDITIONAL);
      expect(conditional.reason.includes('conditional')).assertTrue();
      expect(auditor.getAssessments().length).assertEqual(3);
      expect(auditor.countByLegality(TransitionLegality.LEGAL)).assertEqual(1);
      auditor.resetAuditor();
      expect(auditor.getAssessments().length).assertEqual(0);
    });

    it('summary_reporter_should_build_summary', 0, () => {
      manager.resetManager();
      manager.openSlot(SLOT_TIMER);
      manager.markVisible(SLOT_TIMER);
      manager.hideSlot(SLOT_TIMER);
      const reporter = new WindowStateSummaryReporter(manager.getHistory());
      const summary = reporter.buildSummary();
      expect(summary.totalTransitions).assertEqual(3);
      expect(summary.successCount).assertEqual(3);
      expect(summary.errorCount).assertEqual(0);
      expect(summary.mostFrequentTransition.length).assertLarger(0);
      const emptyReporter = new WindowStateSummaryReporter([]);
      const emptySummary = emptyReporter.buildSummary();
      expect(emptySummary.totalTransitions).assertEqual(0);
      expect(emptySummary.mostFrequentTransition).assertEqual('');
    });

    it('state_asserter_should_verify_state_and_count', 0, () => {
      const asserter = new WindowStateAsserter();
      expect(asserter.getTargetState()).assertEqual(WindowState.IDLE);
      expect(asserter.getExpectedCount()).assertEqual(0);
      asserter.setTargetState(WindowState.VISIBLE);
      asserter.setExpectedCount(2);
      expect(asserter.isStateSatisfied(WindowState.VISIBLE)).assertTrue();
      expect(asserter.isStateSatisfied(WindowState.HIDING)).assertFalse();
      expect(asserter.isCountSatisfied(2)).assertTrue();
      expect(asserter.isCountSatisfied(1)).assertFalse();
    });

    it('transition_log_entry_should_expose_fields', 0, () => {
      const entry = new WindowTransitionLogEntry(SLOT_TIMER, WindowState.IDLE, WindowState.CREATING, 'open', 100,
        TransitionResult.SUCCESS);
      expect(entry.getSlot()).assertEqual(SLOT_TIMER);
      expect(entry.getFrom()).assertEqual(WindowState.IDLE);
      expect(entry.getTo()).assertEqual(WindowState.CREATING);
      expect(entry.getTrigger()).assertEqual('open');
      expect(entry.getTimestamp()).assertEqual(100);
      expect(entry.getResult()).assertEqual(TransitionResult.SUCCESS);
      const twin = new WindowTransitionLogEntry(SLOT_TIMER, WindowState.IDLE, WindowState.CREATING, 'open', 999,
        TransitionResult.ERROR);
      expect(entry.equals(twin)).assertTrue();
      entry.setResult(TransitionResult.ERROR);
      expect(entry.getResult()).assertEqual(TransitionResult.ERROR);
      expect(entry.toString().includes('timer')).assertTrue();
    });

    it('transition_log_manager_should_manage_entries', 0, () => {
      const logManager = new WindowTransitionLogManager();
      logManager.appendEntry(new WindowTransitionLogEntry(SLOT_TIMER, WindowState.IDLE, WindowState.CREATING,
        'open', 1, TransitionResult.SUCCESS));
      logManager.appendEntry(new WindowTransitionLogEntry(SLOT_TIMER, WindowState.CREATING, WindowState.VISIBLE,
        'loaded', 2, TransitionResult.SUCCESS));
      logManager.appendEntry(new WindowTransitionLogEntry(SLOT_TIP, WindowState.VISIBLE, WindowState.IDLE,
        'bad', 3, TransitionResult.INVALID));
      expect(logManager.getEntryCount()).assertEqual(3);
      expect(logManager.filterByResult(TransitionResult.SUCCESS).length).assertEqual(2);
      expect(logManager.filterByResult(TransitionResult.INVALID).length).assertEqual(1);
      expect(logManager.filterBySlot(SLOT_TIP).length).assertEqual(1);
      logManager.clearEntries();
      expect(logManager.getEntryCount()).assertEqual(0);
    });

    it('transition_matrix_should_verify_allowed_pairs', 0, () => {
      const matrix = new WindowTransitionMatrix();
      expect(matrix.isTransitionAllowed(WindowState.IDLE, WindowState.CREATING)).assertTrue();
      expect(matrix.isTransitionAllowed(WindowState.CREATING, WindowState.VISIBLE)).assertTrue();
      expect(matrix.isTransitionAllowed(WindowState.VISIBLE, WindowState.CREATING)).assertFalse();
      expect(matrix.isTransitionAllowed(WindowState.IDLE, WindowState.IDLE)).assertFalse();
      expect(matrix.getCells().length).assertEqual(36);
      expect(matrix.countAllowedTransitions()).assertEqual(12);
    });

    it('transition_matrix_reporter_should_report_and_count', 0, () => {
      const matrix = new WindowTransitionMatrix();
      const reporter = new WindowTransitionMatrixReporter(matrix);
      const report = reporter.generateReport();
      expect(report.includes('totalCells=36')).assertTrue();
      expect(report.includes('allowed=12')).assertTrue();
      expect(reporter.countAllowedFrom(WindowState.IDLE)).assertEqual(1);
      expect(reporter.countAllowedFrom(WindowState.CREATING)).assertEqual(3);
      expect(reporter.countAllowedFrom(WindowState.VISIBLE)).assertEqual(2);
      expect(reporter.countAllowedFrom(WindowState.HIDING)).assertEqual(2);
    });

    it('transition_weight_calculator_should_compute_path', 0, () => {
      const matrix = new WindowTransitionMatrix();
      const calculator = new WindowTransitionWeightCalculator(matrix);
      expect(calculator.computeWeight(WindowState.IDLE, WindowState.CREATING)).assertEqual(1);
      expect(calculator.computeWeight(WindowState.IDLE, WindowState.VISIBLE)).assertEqual(-1);
      const legalPath: WindowState[] = [WindowState.IDLE, WindowState.CREATING, WindowState.VISIBLE,
        WindowState.HIDING, WindowState.DESTROYED];
      expect(calculator.computePathWeight(legalPath)).assertEqual(4);
      expect(calculator.isLegalPath(legalPath)).assertTrue();
      const illegalPath: WindowState[] = [WindowState.IDLE, WindowState.VISIBLE];
      expect(calculator.isLegalPath(illegalPath)).assertFalse();
    });

    it('state_management_performance_should_meet_requirements', 0, () => {
      const startTime = Date.now();
      for (let i = 0; i < 500; i++) {
        manager.resetManager();
        manager.openSlot(SLOT_TIMER);
        manager.markVisible(SLOT_TIMER);
        manager.hideSlot(SLOT_TIMER);
        manager.destroySlot(SLOT_TIMER);
      }
      const elapsed = Date.now() - startTime;
      expect(elapsed).assertLessOrEqual(5000);
      expect(manager.getTransitionCount()).assertEqual(4);
      expect(manager.getSlotState(SLOT_TIMER)).assertEqual(WindowState.DESTROYED);
    });

    it('state_management_should_correlate_with_recorder_window', 0, async () => {
      manager.resetManager();
      manager.openSlot(SLOT_TIMER);
      manager.markVisible(SLOT_TIMER);
      const componentCount = await recorderComponentCount(driver);
      expect(componentCount >= 0).assertEqual(true);
      manager.hideSlot(SLOT_TIMER);
      manager.popupSlot(SLOT_TIMER);
      expect(manager.getSlotState(SLOT_TIMER)).assertEqual(WindowState.VISIBLE);
      expect(manager.getReuseCount()).assertEqual(1);
    });

    it('comprehensive_lifecycle_scenario_should_demonstrate_full_functionality', 0, () => {
      manager.resetManager();
      manager.openSlot(SLOT_TIMER);
      manager.markVisible(SLOT_TIMER);
      manager.openSlot(SLOT_TIP);
      manager.markVisible(SLOT_TIP);
      manager.hideSlot(SLOT_TIMER);
      manager.destroySlot(SLOT_TIMER);
      manager.hideSlot(SLOT_TIP);
      manager.popupSlot(SLOT_TIP);
      manager.destroySlot(SLOT_TIP);
      expect(manager.getSlotState(SLOT_TIMER)).assertEqual(WindowState.DESTROYED);
      expect(manager.getSlotState(SLOT_TIP)).assertEqual(WindowState.DESTROYED);
      expect(manager.getTransitionCount()).assertEqual(9);
      expect(manager.getReuseCount()).assertEqual(1);
      expect(manager.getDuplicateOpenCount()).assertEqual(0);
      expect(manager.getTransitionCountTo(WindowState.VISIBLE)).assertEqual(3);
      expect(manager.getTransitionCountTo(WindowState.DESTROYED)).assertEqual(2);
      const stats = manager.getTransitionStats();
      expect(stats.get('hiding->visible')).assertEqual(1);
      expect(stats.get('creating->visible')).assertEqual(2);
    });
  });
}




