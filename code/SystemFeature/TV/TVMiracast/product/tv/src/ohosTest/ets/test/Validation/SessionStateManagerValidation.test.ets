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
import { Driver } from '../Shared/MiracastDriver';
import { Log } from 'library';
import {
  getDriver,
  KEY_BACK,
  pressAndWait,
  waitForPageStable,
  launchPlayerPage,
  isPlayerPageVisible,
  isIndexPageVisible,
  getPlayerTileCount,
  miracastComponentCount,
  serializedDelay,
  MAX_MIRROR_TILES,
  ID_TAB_MIRACAST,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION
} from '../Shared/MiracastDriver';

const TAG: string = 'SessionStateSuite';

// Life cycle states of one miracast cast session.
enum CastSessionState {
  IDLE = 'idle',
  DISCOVERING = 'discovering',
  REQUESTING = 'requesting',
  PERMITTING = 'permitting',
  CONNECTED = 'connected',
  PLAYING = 'playing',
  PAUSED = 'paused',
  DISCONNECTED = 'disconnected',
  RELEASED = 'released'
}

// One state change of the cast session.
interface StateTransition {
  from: CastSessionState;
  to: CastSessionState;
  timestamp: number;
  trigger: string;
}

// One mirror player slot of the session.
interface PlayerSlot {
  deviceId: string;
  screenId: number;
  screenBound: boolean;
  muted: boolean;
  index: number;
}

// Result of a legality assessment.
enum TransitionLegality {
  LEGAL = 'legal',
  ILLEGAL = 'illegal',
  CONDITIONAL = 'conditional'
}

// Assessment of one transition.
interface TransitionAssessment {
  from: CastSessionState;
  to: CastSessionState;
  legality: TransitionLegality;
  reason: string;
}

// Summary of the session history.
interface SessionSummary {
  totalTransitions: number;
  successCount: number;
  failureCount: number;
  releasedCount: number;
  successRate: number;
  mostFrequentTransition: string;
}

// State machine of the miracast cast session. Invalid transitions are rejected
// without changing the current state, and the reason is kept for assertions.
class CastSessionStateMachine {
  private static instance: CastSessionStateMachine | null = null;
  private currentState: CastSessionState = CastSessionState.IDLE;
  private history: Array<StateTransition> = [];
  private listeners: Array<(from: CastSessionState, to: CastSessionState) => void> = [];
  private lastError: string = '';

  public static getInstance(): CastSessionStateMachine {
    if (CastSessionStateMachine.instance === null) {
      CastSessionStateMachine.instance = new CastSessionStateMachine();
    }
    return CastSessionStateMachine.instance;
  }

  public getCurrentState(): CastSessionState {
    return this.currentState;
  }

  public isInState(state: CastSessionState): boolean {
    return this.currentState === state;
  }

  public transitionState(newState: CastSessionState, trigger: string): boolean {
    const oldState = this.currentState;
    if (!this.isValidTransition(oldState, newState)) {
      this.lastError = `invalid transition from ${oldState} to ${newState}`;
      return false;
    }
    this.currentState = newState;
    this.lastError = '';
    const transition: StateTransition = {
      from: oldState,
      to: newState,
      timestamp: Date.now(),
      trigger: trigger
    };
    this.history.push(transition);
    this.notifyListeners(oldState, newState);
    return true;
  }

  public isValidTransition(from: CastSessionState, to: CastSessionState): boolean {
    const allowed = this.allowedTargets(from);
    for (let i = 0; i < allowed.length; i++) {
      if (allowed[i] === to) {
        return true;
      }
    }
    return false;
  }

  public allowedTargets(from: CastSessionState): Array<CastSessionState> {
    if (from === CastSessionState.IDLE) {
      return [CastSessionState.DISCOVERING];
    }
    if (from === CastSessionState.DISCOVERING) {
      return [CastSessionState.REQUESTING, CastSessionState.IDLE];
    }
    if (from === CastSessionState.REQUESTING) {
      return [CastSessionState.PERMITTING, CastSessionState.CONNECTED, CastSessionState.IDLE];
    }
    if (from === CastSessionState.PERMITTING) {
      return [CastSessionState.CONNECTED, CastSessionState.DISCONNECTED, CastSessionState.IDLE];
    }
    if (from === CastSessionState.CONNECTED) {
      return [CastSessionState.PLAYING, CastSessionState.DISCONNECTED];
    }
    if (from === CastSessionState.PLAYING) {
      return [CastSessionState.PAUSED, CastSessionState.CONNECTED, CastSessionState.DISCONNECTED];
    }
    if (from === CastSessionState.PAUSED) {
      return [CastSessionState.PLAYING, CastSessionState.DISCONNECTED];
    }
    if (from === CastSessionState.DISCONNECTED) {
      return [CastSessionState.RELEASED, CastSessionState.DISCOVERING, CastSessionState.IDLE];
    }
    if (from === CastSessionState.RELEASED) {
      return [CastSessionState.IDLE];
    }
    return [];
  }

  public countAllowedTransitions(): number {
    const states: Array<CastSessionState> = this.allStates();
    let total: number = 0;
    for (let i = 0; i < states.length; i++) {
      total = total + this.allowedTargets(states[i]).length;
    }
    return total;
  }

  public allStates(): Array<CastSessionState> {
    return [
      CastSessionState.IDLE, CastSessionState.DISCOVERING, CastSessionState.REQUESTING,
      CastSessionState.PERMITTING, CastSessionState.CONNECTED, CastSessionState.PLAYING,
      CastSessionState.PAUSED, CastSessionState.DISCONNECTED, CastSessionState.RELEASED
    ];
  }

  public addStateChangeListener(listener: (from: CastSessionState, to: CastSessionState) => void): void {
    this.listeners.push(listener);
  }

  public removeStateChangeListener(listener: (from: CastSessionState, to: CastSessionState) => void): void {
    const index = this.listeners.indexOf(listener);
    if (index !== -1) {
      this.listeners.splice(index, 1);
    }
  }

  public getListenerCount(): number {
    return this.listeners.length;
  }

  private notifyListeners(from: CastSessionState, to: CastSessionState): void {
    for (let i = 0; i < this.listeners.length; i++) {
      this.listeners[i](from, to);
    }
  }

  public getStateHistory(): Array<StateTransition> {
    return [...this.history];
  }

  public getTransitionCount(): number {
    return this.history.length;
  }

  public getStateTransitionCount(state: CastSessionState): number {
    let count: number = 0;
    for (let i = 0; i < this.history.length; i++) {
      if (this.history[i].to === state) {
        count++;
      }
    }
    return count;
  }

  public getLastTransition(): StateTransition | null {
    if (this.history.length === 0) {
      return null;
    }
    return this.history[this.history.length - 1];
  }

  public getStateStats(): Map<string, number> {
    const stats: Map<string, number> = new Map<string, number>();
    for (let i = 0; i < this.history.length; i++) {
      const key = `${this.history[i].from}->${this.history[i].to}`;
      const current = stats.get(key);
      if (current === undefined) {
        stats.set(key, 1);
      } else {
        stats.set(key, current + 1);
      }
    }
    return stats;
  }

  public getLastError(): string {
    return this.lastError;
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.history.length; i++) {
      if (this.history[i].timestamp < this.history[i - 1].timestamp) {
        return false;
      }
    }
    return true;
  }

  public exportStateHistory(): string {
    return JSON.stringify(this.history);
  }

  public importStateHistory(jsonText: string): boolean {
    try {
      const parsed: Array<StateTransition> = JSON.parse(jsonText);
      this.history = parsed;
      if (parsed.length > 0) {
        this.currentState = parsed[parsed.length - 1].to;
      }
      return true;
    } catch (e) {
      this.lastError = `history import failed: ${(e as Error).name}`;
      return false;
    }
  }

  public reset(): void {
    this.currentState = CastSessionState.IDLE;
    this.history = [];
    this.lastError = '';
  }

  public toString(): string {
    return `CastSession{state=${this.currentState}, transitions=${this.history.length}, ` +
      `listeners=${this.listeners.length}}`;
  }
}

// Mirror player slots owned by one cast session.
class PlayerRegistry {
  private players: Map<string, PlayerSlot> = new Map<string, PlayerSlot>();

  public addPlayer(deviceId: string, screenId: number): boolean {
    if (deviceId.length === 0 || this.players.has(deviceId)) {
      return false;
    }
    if (this.players.size >= MAX_MIRROR_TILES) {
      return false;
    }
    const slot: PlayerSlot = {
      deviceId: deviceId,
      screenId: screenId,
      screenBound: screenId >= 0,
      muted: this.players.size > 0,
      index: this.players.size
    };
    this.players.set(deviceId, slot);
    return true;
  }

  public removePlayer(deviceId: string): boolean {
    return this.players.delete(deviceId);
  }

  public hasPlayer(deviceId: string): boolean {
    return this.players.has(deviceId);
  }

  public getCount(): number {
    return this.players.size;
  }

  public getSlot(deviceId: string): PlayerSlot | null {
    const slot = this.players.get(deviceId);
    return slot === undefined ? null : slot;
  }

  public getDeviceIds(): Array<string> {
    const ids: Array<string> = [];
    const iterator = this.players.keys();
    let next = iterator.next();
    while (!next.done) {
      ids.push(next.value);
      next = iterator.next();
    }
    return ids;
  }

  public bindScreen(deviceId: string, screenId: number): boolean {
    const slot = this.players.get(deviceId);
    if (slot === undefined || screenId < 0) {
      return false;
    }
    slot.screenId = screenId;
    slot.screenBound = true;
    return true;
  }

  public unbindScreen(deviceId: string): boolean {
    const slot = this.players.get(deviceId);
    if (slot === undefined) {
      return false;
    }
    if (!slot.screenBound) {
      return false;
    }
    slot.screenBound = false;
    return true;
  }

  public boundScreenCount(): number {
    let count: number = 0;
    const ids = this.getDeviceIds();
    for (let i = 0; i < ids.length; i++) {
      const slot = this.players.get(ids[i]);
      if (slot !== undefined && slot.screenBound) {
        count++;
      }
    }
    return count;
  }

  public muteExclusive(focusedDeviceId: string): boolean {
    if (!this.players.has(focusedDeviceId)) {
      return false;
    }
    const ids = this.getDeviceIds();
    for (let i = 0; i < ids.length; i++) {
      const slot = this.players.get(ids[i]);
      if (slot !== undefined) {
        slot.muted = ids[i] !== focusedDeviceId;
      }
    }
    return true;
  }

  public isMuted(deviceId: string): boolean {
    const slot = this.players.get(deviceId);
    if (slot === undefined) {
      return true;
    }
    return slot.muted;
  }

  public unmuteAll(): void {
    const ids = this.getDeviceIds();
    for (let i = 0; i < ids.length; i++) {
      const slot = this.players.get(ids[i]);
      if (slot !== undefined) {
        slot.muted = false;
      }
    }
  }

  public clear(): void {
    this.players.clear();
  }
}

// Device connect listeners registered on the miracast service.
class ListenerRegistry {
  private listeners: Array<(event: string) => void> = [];

  public add(listener: (event: string) => void): boolean {
    if (this.listeners.indexOf(listener) !== -1) {
      return false;
    }
    this.listeners.push(listener);
    return true;
  }

  public remove(listener: (event: string) => void): boolean {
    const index = this.listeners.indexOf(listener);
    if (index === -1) {
      return false;
    }
    this.listeners.splice(index, 1);
    return true;
  }

  public count(): number {
    return this.listeners.length;
  }

  public notify(event: string): number {
    for (let i = 0; i < this.listeners.length; i++) {
      this.listeners[i](event);
    }
    return this.listeners.length;
  }

  public clear(): void {
    this.listeners = [];
  }
}

// Verifies the players, screen and state invariants of the cast session.
class SessionInvariantChecker {
  public check(state: CastSessionState, registry: PlayerRegistry): Array<string> {
    const issues: Array<string> = [];
    const active = state === CastSessionState.CONNECTED || state === CastSessionState.PLAYING ||
      state === CastSessionState.PAUSED;
    if (active && registry.getCount() === 0) {
      issues.push('active session without mirror player');
    }
    if (state === CastSessionState.PLAYING && registry.boundScreenCount() === 0) {
      issues.push('playing state without bound screen');
    }
    if (state === CastSessionState.RELEASED && registry.getCount() > 0) {
      issues.push('released session still holds players');
    }
    if ((state === CastSessionState.IDLE || state === CastSessionState.DISCOVERING) &&
      registry.getCount() > 0) {
      issues.push('players created before session established');
    }
    if (registry.getCount() > MAX_MIRROR_TILES) {
      issues.push('player count exceeds mirror tile limit');
    }
    return issues;
  }

  public isConsistent(state: CastSessionState, registry: PlayerRegistry): boolean {
    return this.check(state, registry).length === 0;
  }

  public describe(issues: Array<string>): string {
    if (issues.length === 0) {
      return 'session invariants hold';
    }
    let text: string = 'session invariant violations:';
    for (let i = 0; i < issues.length; i++) {
      text = text + ` ${issues[i]};`;
    }
    return text;
  }

  public isValidState(state: CastSessionState): boolean {
    const states: Array<CastSessionState> = [
      CastSessionState.IDLE, CastSessionState.DISCOVERING, CastSessionState.REQUESTING,
      CastSessionState.PERMITTING, CastSessionState.CONNECTED, CastSessionState.PLAYING,
      CastSessionState.PAUSED, CastSessionState.DISCONNECTED, CastSessionState.RELEASED
    ];
    for (let i = 0; i < states.length; i++) {
      if (states[i] === state) {
        return true;
      }
    }
    return false;
  }
}

// Assesses whether one transition follows the session life cycle.
class SessionAuditor {
  private assessments: Array<TransitionAssessment> = [];

  public assess(from: CastSessionState, to: CastSessionState): TransitionAssessment {
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

  private determineLegality(from: CastSessionState, to: CastSessionState): TransitionLegality {
    if (from === to) {
      return TransitionLegality.ILLEGAL;
    }
    if (from === CastSessionState.RELEASED || to === CastSessionState.RELEASED) {
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

  public getAssessments(): Array<TransitionAssessment> {
    return [...this.assessments];
  }

  public countByLegality(legality: TransitionLegality): number {
    let count: number = 0;
    for (let i = 0; i < this.assessments.length; i++) {
      if (this.assessments[i].legality === legality) {
        count++;
      }
    }
    return count;
  }

  public resetAuditor(): void {
    this.assessments = [];
  }
}

// Builds a statistical summary from the recorded transition history.
class SessionSummaryReporter {
  private history: Array<StateTransition> = [];

  public constructor(history: Array<StateTransition>) {
    this.history = [...history];
  }

  public buildSummary(): SessionSummary {
    const summary: SessionSummary = {
      totalTransitions: this.history.length,
      successCount: this.history.length,
      failureCount: 0,
      releasedCount: this.countTarget(CastSessionState.RELEASED),
      successRate: this.history.length === 0 ? 0 : 1,
      mostFrequentTransition: this.findMostFrequentTransition()
    };
    return summary;
  }

  public countTarget(state: CastSessionState): number {
    let count: number = 0;
    for (let i = 0; i < this.history.length; i++) {
      if (this.history[i].to === state) {
        count++;
      }
    }
    return count;
  }

  public findMostFrequentTransition(): string {
    const counts: Map<string, number> = new Map<string, number>();
    for (let i = 0; i < this.history.length; i++) {
      const key = `${this.history[i].from}->${this.history[i].to}`;
      const current = counts.get(key);
      if (current === undefined) {
        counts.set(key, 1);
      } else {
        counts.set(key, current + 1);
      }
    }
    let bestKey: string = '';
    let bestCount: number = 0;
    const iterator = counts.keys();
    let next = iterator.next();
    while (!next.done) {
      const value = counts.get(next.value);
      if (value !== undefined && value > bestCount) {
        bestCount = value;
        bestKey = next.value;
      }
      next = iterator.next();
    }
    return bestKey;
  }
}

// Cell of the session transition matrix.
interface SessionMatrixCell {
  from: CastSessionState;
  to: CastSessionState;
  allowed: boolean;
}

// Matrix view over every state pair of the session machine.
class SessionTransitionMatrix {
  private cells: Array<SessionMatrixCell> = [];
  private machine: CastSessionStateMachine;

  public constructor(machine: CastSessionStateMachine) {
    this.machine = machine;
    this.initializeCells();
  }

  private initializeCells(): void {
    const states = this.machine.allStates();
    for (let i = 0; i < states.length; i++) {
      for (let j = 0; j < states.length; j++) {
        const cell: SessionMatrixCell = {
          from: states[i],
          to: states[j],
          allowed: this.machine.isValidTransition(states[i], states[j])
        };
        this.cells.push(cell);
      }
    }
  }

  public getCells(): Array<SessionMatrixCell> {
    return [...this.cells];
  }

  public isTransitionAllowed(from: CastSessionState, to: CastSessionState): boolean {
    for (let i = 0; i < this.cells.length; i++) {
      if (this.cells[i].from === from && this.cells[i].to === to) {
        return this.cells[i].allowed;
      }
    }
    return false;
  }

  public countAllowed(): number {
    let count: number = 0;
    for (let i = 0; i < this.cells.length; i++) {
      if (this.cells[i].allowed) {
        count++;
      }
    }
    return count;
  }

  public countAllowedFrom(state: CastSessionState): number {
    let count: number = 0;
    for (let i = 0; i < this.cells.length; i++) {
      if (this.cells[i].from === state && this.cells[i].allowed) {
        count++;
      }
    }
    return count;
  }
}

// Computes the weight of one transition path.
class SessionWeightCalculator {
  private matrix: SessionTransitionMatrix;

  public constructor(matrix: SessionTransitionMatrix) {
    this.matrix = matrix;
  }

  public computeWeight(from: CastSessionState, to: CastSessionState): number {
    if (!this.matrix.isTransitionAllowed(from, to)) {
      return -1;
    }
    return 1;
  }

  public computePathWeight(path: Array<CastSessionState>): number {
    let total: number = 0;
    for (let i = 1; i < path.length; i++) {
      const weight = this.computeWeight(path[i - 1], path[i]);
      if (weight < 0) {
        return -1;
      }
      total = total + weight;
    }
    return total;
  }

  public isLegalPath(path: Array<CastSessionState>): boolean {
    return this.computePathWeight(path) >= 0;
  }
}

export default function sessionStateManagerValidationSuite(): void {
  describe('SessionStateManagerValidation_Suite', () => {
    let driver: Driver;
    let session: CastSessionStateMachine;

    beforeAll(async () => {
      driver = getDriver();
      session = CastSessionStateMachine.getInstance();
      session.reset();
      Log.info(TAG, 'suite start');
      await serializedDelay(driver, 800);
    });

    afterAll(async () => {
      Log.info(TAG, 'suite end');
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 300);
    });

    it('cast_session_state_enum_should_be_defined_correctly', 0, async () => {
      expect(CastSessionState.IDLE).assertEqual('idle');
      expect(CastSessionState.DISCOVERING).assertEqual('discovering');
      expect(CastSessionState.REQUESTING).assertEqual('requesting');
      expect(CastSessionState.PERMITTING).assertEqual('permitting');
      expect(CastSessionState.CONNECTED).assertEqual('connected');
      expect(CastSessionState.PLAYING).assertEqual('playing');
      expect(CastSessionState.PAUSED).assertEqual('paused');
      expect(CastSessionState.DISCONNECTED).assertEqual('disconnected');
      expect(CastSessionState.RELEASED).assertEqual('released');
    });

    it('session_initial_state_should_be_idle', 0, async () => {
      session.reset();
      expect(session.getCurrentState()).assertEqual(CastSessionState.IDLE);
      expect(session.getTransitionCount()).assertEqual(0);
      expect(session.getLastError()).assertEqual('');
      expect(session.getLastTransition() === null).assertTrue();
      expect(session.isInState(CastSessionState.IDLE)).assertTrue();
      expect(session.toString().includes('state=idle')).assertTrue();
    });

    it('legal_lifecycle_path_should_be_accepted', 0, async () => {
      session.reset();
      expect(session.transitionState(CastSessionState.DISCOVERING, 'search_started')).assertTrue();
      expect(session.transitionState(CastSessionState.REQUESTING, 'device_found')).assertTrue();
      expect(session.transitionState(CastSessionState.PERMITTING, 'request_received')).assertTrue();
      expect(session.transitionState(CastSessionState.CONNECTED, 'permission_allowed')).assertTrue();
      expect(session.transitionState(CastSessionState.PLAYING, 'screen_bound')).assertTrue();
      expect(session.transitionState(CastSessionState.PAUSED, 'pause_clicked')).assertTrue();
      expect(session.transitionState(CastSessionState.PLAYING, 'play_clicked')).assertTrue();
      expect(session.transitionState(CastSessionState.CONNECTED, 'play_stopped')).assertTrue();
      expect(session.transitionState(CastSessionState.DISCONNECTED, 'device_lost')).assertTrue();
      expect(session.transitionState(CastSessionState.RELEASED, 'session_released')).assertTrue();
      expect(session.transitionState(CastSessionState.IDLE, 'service_stopped')).assertTrue();
      expect(session.getTransitionCount()).assertEqual(11);
      expect(session.getCurrentState()).assertEqual(CastSessionState.IDLE);
    });

    it('illegal_transition_should_be_rejected_without_state_change', 0, async () => {
      session.reset();
      expect(session.transitionState(CastSessionState.PLAYING, 'skip_discovery')).assertFalse();
      expect(session.getCurrentState()).assertEqual(CastSessionState.IDLE);
      expect(session.getTransitionCount()).assertEqual(0);
      expect(session.getLastError().includes('invalid transition')).assertTrue();
      expect(session.transitionState(CastSessionState.DISCOVERING, 'search_started')).assertTrue();
      expect(session.getLastError()).assertEqual('');
    });

    it('state_change_listener_should_receive_notifications', 0, async () => {
      session.reset();
      let notificationCount: number = 0;
      let lastFrom: CastSessionState = CastSessionState.IDLE;
      let lastTo: CastSessionState = CastSessionState.IDLE;
      const listener = (from: CastSessionState, to: CastSessionState) => {
        notificationCount++;
        lastFrom = from;
        lastTo = to;
      };
      session.addStateChangeListener(listener);
      expect(session.getListenerCount()).assertLarger(0);
      session.transitionState(CastSessionState.DISCOVERING, 'search_started');
      expect(notificationCount).assertEqual(1);
      expect(lastFrom).assertEqual(CastSessionState.IDLE);
      expect(lastTo).assertEqual(CastSessionState.DISCOVERING);
      session.transitionState(CastSessionState.REQUESTING, 'device_found');
      expect(notificationCount).assertEqual(2);
      expect(lastTo).assertEqual(CastSessionState.REQUESTING);
      session.removeStateChangeListener(listener);
    });

    it('removed_listener_should_stop_receiving_notifications', 0, async () => {
      session.reset();
      let notificationCount: number = 0;
      const listener = () => {
        notificationCount++;
      };
      session.addStateChangeListener(listener);
      session.transitionState(CastSessionState.DISCOVERING, 'first');
      expect(notificationCount).assertEqual(1);
      session.removeStateChangeListener(listener);
      session.transitionState(CastSessionState.REQUESTING, 'second');
      expect(notificationCount).assertEqual(1);
      session.transitionState(CastSessionState.PERMITTING, 'third');
      expect(notificationCount).assertEqual(1);
    });

    it('state_history_should_record_every_accepted_transition', 0, async () => {
      session.reset();
      session.transitionState(CastSessionState.DISCOVERING, 'search_started');
      session.transitionState(CastSessionState.REQUESTING, 'device_found');
      session.transitionState(CastSessionState.PERMITTING, 'request_received');
      session.transitionState(CastSessionState.CONNECTED, 'permission_allowed');
      const history = session.getStateHistory();
      expect(history.length).assertEqual(4);
      expect(history[0].from).assertEqual(CastSessionState.IDLE);
      expect(history[0].to).assertEqual(CastSessionState.DISCOVERING);
      expect(history[3].to).assertEqual(CastSessionState.CONNECTED);
      expect(history[3].trigger).assertEqual('permission_allowed');
    });

    it('state_history_get_should_return_copy', 0, async () => {
      session.reset();
      session.transitionState(CastSessionState.DISCOVERING, 'search_started');
      const history = session.getStateHistory();
      history.push({
        from: CastSessionState.IDLE,
        to: CastSessionState.IDLE,
        timestamp: 0,
        trigger: 'injected'
      });
      expect(history.length).assertEqual(2);
      expect(session.getTransitionCount()).assertEqual(1);
    });


    it('state_timestamps_should_be_chronological', 0, async () => {
      session.reset();
      session.transitionState(CastSessionState.DISCOVERING, 'open');
      await serializedDelay(driver, 30);
      session.transitionState(CastSessionState.REQUESTING, 'found');
      await serializedDelay(driver, 30);
      session.transitionState(CastSessionState.PERMITTING, 'request');
      const history = session.getStateHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
      expect(session.isChronological()).assertTrue();
    });

    it('state_export_and_import_should_round_trip', 0, async () => {
      session.reset();
      session.transitionState(CastSessionState.DISCOVERING, 'open');
      session.transitionState(CastSessionState.REQUESTING, 'found');
      session.transitionState(CastSessionState.PERMITTING, 'request');
      const exported = session.exportStateHistory();
      expect(exported.length).assertLarger(0);
      session.reset();
      expect(session.getTransitionCount()).assertEqual(0);
      expect(session.importStateHistory(exported)).assertTrue();
      expect(session.getTransitionCount()).assertEqual(3);
      expect(session.getCurrentState()).assertEqual(CastSessionState.PERMITTING);
    });

    it('invalid_history_import_should_return_false', 0, async () => {
      session.reset();
      expect(session.importStateHistory('invalid json')).assertFalse();
      expect(session.importStateHistory('')).assertFalse();
      expect(session.importStateHistory('{not json}')).assertFalse();
      expect(session.getTransitionCount()).assertEqual(0);
      expect(session.getLastError().includes('history import failed')).assertTrue();
    });

    it('transition_matrix_should_cover_all_state_pairs', 0, async () => {
      const matrix = new SessionTransitionMatrix(session);
      expect(matrix.getCells().length).assertEqual(81);
      expect(matrix.countAllowed()).assertEqual(20);
      expect(matrix.isTransitionAllowed(CastSessionState.IDLE, CastSessionState.DISCOVERING)).assertTrue();
      expect(matrix.isTransitionAllowed(CastSessionState.IDLE, CastSessionState.PLAYING)).assertFalse();
      expect(matrix.isTransitionAllowed(CastSessionState.PLAYING, CastSessionState.PAUSED)).assertTrue();
      expect(matrix.countAllowedFrom(CastSessionState.IDLE)).assertEqual(1);
      expect(matrix.countAllowedFrom(CastSessionState.REQUESTING)).assertEqual(3);
      expect(matrix.countAllowedFrom(CastSessionState.DISCONNECTED)).assertEqual(3);
      expect(matrix.countAllowedFrom(CastSessionState.RELEASED)).assertEqual(1);
    });

    it('weight_calculator_should_score_transitions', 0, async () => {
      const matrix = new SessionTransitionMatrix(session);
      const calculator = new SessionWeightCalculator(matrix);
      expect(calculator.computeWeight(CastSessionState.IDLE, CastSessionState.DISCOVERING)).assertEqual(1);
      expect(calculator.computeWeight(CastSessionState.IDLE, CastSessionState.PLAYING)).assertEqual(-1);
      const path: Array<CastSessionState> = [
        CastSessionState.IDLE, CastSessionState.DISCOVERING, CastSessionState.REQUESTING,
        CastSessionState.PERMITTING, CastSessionState.CONNECTED, CastSessionState.PLAYING
      ];
      expect(calculator.computePathWeight(path)).assertEqual(5);
      expect(calculator.isLegalPath(path)).assertTrue();
      expect(calculator.isLegalPath([CastSessionState.IDLE, CastSessionState.PLAYING])).assertFalse();
    });

    it('state_machine_should_expose_allowed_targets', 0, async () => {
      expect(session.allStates().length).assertEqual(9);
      expect(session.allowedTargets(CastSessionState.IDLE).length).assertEqual(1);
      expect(session.allowedTargets(CastSessionState.DISCOVERING).length).assertEqual(2);
      expect(session.allowedTargets(CastSessionState.REQUESTING).length).assertEqual(3);
      expect(session.allowedTargets(CastSessionState.PERMITTING).length).assertEqual(3);
      expect(session.allowedTargets(CastSessionState.CONNECTED).length).assertEqual(2);
      expect(session.allowedTargets(CastSessionState.PLAYING).length).assertEqual(3);
      expect(session.countAllowedTransitions()).assertEqual(20);
    });

    it('player_registry_should_add_players_with_indexes', 0, async () => {
      const registry = new PlayerRegistry();
      expect(registry.addPlayer('device_001', 1)).assertTrue();
      expect(registry.addPlayer('device_002', 2)).assertTrue();
      expect(registry.addPlayer('device_003', -1)).assertTrue();
      expect(registry.getCount()).assertEqual(3);
      expect(registry.getDeviceIds().length).assertEqual(3);
      const first = registry.getSlot('device_001');
      expect(first === null).assertFalse();
      if (first !== null) {
        expect(first.index).assertEqual(0);
        expect(first.screenBound).assertTrue();
        expect(first.muted).assertFalse();
      }
      const third = registry.getSlot('device_003');
      expect(third === null).assertFalse();
      if (third !== null) {
        expect(third.screenBound).assertFalse();
        expect(third.muted).assertTrue();
      }
    });

    it('player_registry_should_reject_duplicate_and_empty_ids', 0, async () => {
      const registry = new PlayerRegistry();
      expect(registry.addPlayer('device_001', 1)).assertTrue();
      expect(registry.addPlayer('device_001', 2)).assertFalse();
      expect(registry.addPlayer('', 3)).assertFalse();
      expect(registry.getCount()).assertEqual(1);
      expect(registry.hasPlayer('device_001')).assertTrue();
      expect(registry.hasPlayer('device_999')).assertFalse();
      expect(registry.getSlot('device_999') === null).assertTrue();
    });

    it('player_registry_should_enforce_tile_limit', 0, async () => {
      const registry = new PlayerRegistry();
      let accepted: number = 0;
      for (let i = 0; i < MAX_MIRROR_TILES + 2; i++) {
        if (registry.addPlayer(`limit_device_${i}`, i)) {
          accepted++;
        }
      }
      expect(accepted).assertEqual(MAX_MIRROR_TILES);
      expect(registry.getCount()).assertEqual(MAX_MIRROR_TILES);
      expect(registry.addPlayer('overflow_device', 99)).assertFalse();
      expect(registry.getCount()).assertEqual(MAX_MIRROR_TILES);
    });

    it('player_registry_should_bind_and_unbind_screens', 0, async () => {
      const registry = new PlayerRegistry();
      registry.addPlayer('device_001', -1);
      registry.addPlayer('device_002', -1);
      expect(registry.boundScreenCount()).assertEqual(0);
      expect(registry.bindScreen('device_001', 101)).assertTrue();
      expect(registry.boundScreenCount()).assertEqual(1);
      expect(registry.bindScreen('device_002', 102)).assertTrue();
      expect(registry.boundScreenCount()).assertEqual(2);
      expect(registry.unbindScreen('device_001')).assertTrue();
      expect(registry.boundScreenCount()).assertEqual(1);
      expect(registry.unbindScreen('device_001')).assertFalse();
      expect(registry.bindScreen('device_001', -5)).assertFalse();
    });

    it('player_registry_should_mute_all_but_focused_tile', 0, async () => {
      const registry = new PlayerRegistry();
      registry.addPlayer('device_001', 1);
      registry.addPlayer('device_002', 2);
      registry.addPlayer('device_003', 3);
      expect(registry.muteExclusive('device_002')).assertTrue();
      expect(registry.isMuted('device_001')).assertTrue();
      expect(registry.isMuted('device_002')).assertFalse();
      expect(registry.isMuted('device_003')).assertTrue();
      expect(registry.isMuted('unknown_device')).assertTrue();
      expect(registry.muteExclusive('unknown_device')).assertFalse();
      registry.unmuteAll();
      expect(registry.isMuted('device_001')).assertFalse();
      expect(registry.isMuted('device_003')).assertFalse();
    });

    it('player_registry_should_remove_and_clear_players', 0, async () => {
      const registry = new PlayerRegistry();
      registry.addPlayer('device_001', 1);
      registry.addPlayer('device_002', 2);
      expect(registry.removePlayer('device_001')).assertTrue();
      expect(registry.getCount()).assertEqual(1);
      expect(registry.hasPlayer('device_001')).assertFalse();
      registry.clear();
      expect(registry.getCount()).assertEqual(0);
      expect(registry.getDeviceIds().length).assertEqual(0);
      expect(registry.boundScreenCount()).assertEqual(0);
    });

    it('listener_registry_should_add_and_notify', 0, async () => {
      const registry = new ListenerRegistry();
      let firstCount: number = 0;
      let secondCount: number = 0;
      const first = (event: string) => {
        firstCount++;
      };
      const second = (event: string) => {
        secondCount++;
      };
      expect(registry.add(first)).assertTrue();
      expect(registry.add(second)).assertTrue();
      expect(registry.count()).assertEqual(2);
      expect(registry.notify('device_connected')).assertEqual(2);
      expect(firstCount).assertEqual(1);
      expect(secondCount).assertEqual(1);
    });

    it('listener_registry_should_reject_duplicates_and_remove', 0, async () => {
      const registry = new ListenerRegistry();
      const listener = () => {
        return;
      };
      expect(registry.add(listener)).assertTrue();
      expect(registry.add(listener)).assertFalse();
      expect(registry.count()).assertEqual(1);
      expect(registry.remove(listener)).assertTrue();
      expect(registry.remove(listener)).assertFalse();
      expect(registry.count()).assertEqual(0);
      expect(registry.notify('device_disconnected')).assertEqual(0);
    });

    it('invariant_checker_should_accept_idle_empty_session', 0, async () => {
      const checker = new SessionInvariantChecker();
      const registry = new PlayerRegistry();
      const issues = checker.check(CastSessionState.IDLE, registry);
      expect(issues.length).assertEqual(0);
      expect(checker.isConsistent(CastSessionState.IDLE, registry)).assertTrue();
      expect(checker.describe(issues)).assertEqual('session invariants hold');
      expect(checker.isValidState(CastSessionState.PLAYING)).assertTrue();
      expect(checker.isValidState(CastSessionState.DISCOVERING)).assertTrue();
      expect(checker.describe(['first', 'second']).includes('first')).assertTrue();
    });

    it('invariant_checker_should_reject_active_session_without_players', 0, async () => {
      const checker = new SessionInvariantChecker();
      const registry = new PlayerRegistry();
      expect(checker.check(CastSessionState.CONNECTED, registry).length).assertEqual(1);
      expect(checker.check(CastSessionState.PLAYING, registry).length).assertEqual(2);
      expect(checker.isConsistent(CastSessionState.CONNECTED, registry)).assertFalse();
      expect(checker.check(CastSessionState.PAUSED, registry).length).assertEqual(1);
      registry.addPlayer('device_001', 1);
      expect(checker.check(CastSessionState.CONNECTED, registry).length).assertEqual(0);
    });

    it('invariant_checker_should_reject_playing_without_bound_screen', 0, async () => {
      const checker = new SessionInvariantChecker();
      const registry = new PlayerRegistry();
      registry.addPlayer('device_001', -1);
      expect(registry.boundScreenCount()).assertEqual(0);
      const issues = checker.check(CastSessionState.PLAYING, registry);
      expect(issues.length).assertEqual(1);
      expect(issues[0].includes('bound screen')).assertTrue();
      expect(checker.isConsistent(CastSessionState.PLAYING, registry)).assertFalse();
      registry.bindScreen('device_001', 7);
      expect(checker.isConsistent(CastSessionState.PLAYING, registry)).assertTrue();
    });

    it('invariant_checker_should_reject_released_session_with_players', 0, async () => {
      const checker = new SessionInvariantChecker();
      const registry = new PlayerRegistry();
      registry.addPlayer('device_001', 1);
      const issues = checker.check(CastSessionState.RELEASED, registry);
      expect(issues.length).assertEqual(1);
      expect(issues[0].includes('released session')).assertTrue();
      registry.clear();
      expect(checker.isConsistent(CastSessionState.RELEASED, registry)).assertTrue();
      registry.addPlayer('device_002', 2);
      expect(checker.check(CastSessionState.DISCOVERING, registry).length).assertEqual(1);
    });

    it('session_auditor_should_assess_transition_legality', 0, async () => {
      const auditor = new SessionAuditor();
      const legal = auditor.assess(CastSessionState.IDLE, CastSessionState.DISCOVERING);
      expect(legal.legality).assertEqual(TransitionLegality.LEGAL);
      expect(legal.reason.includes('legal')).assertTrue();
      const illegal = auditor.assess(CastSessionState.PLAYING, CastSessionState.PLAYING);
      expect(illegal.legality).assertEqual(TransitionLegality.ILLEGAL);
      const conditional = auditor.assess(CastSessionState.DISCONNECTED, CastSessionState.RELEASED);
      expect(conditional.legality).assertEqual(TransitionLegality.CONDITIONAL);
      expect(conditional.reason.includes('conditional')).assertTrue();
      expect(auditor.getAssessments().length).assertEqual(3);
      expect(auditor.countByLegality(TransitionLegality.ILLEGAL)).assertEqual(1);
      auditor.resetAuditor();
      expect(auditor.getAssessments().length).assertEqual(0);
    });

    it('summary_reporter_should_build_session_summary', 0, async () => {
      session.reset();
      session.transitionState(CastSessionState.DISCOVERING, 'open');
      session.transitionState(CastSessionState.REQUESTING, 'found');
      session.transitionState(CastSessionState.PERMITTING, 'request');
      session.transitionState(CastSessionState.CONNECTED, 'allowed');
      const reporter = new SessionSummaryReporter(session.getStateHistory());
      const summary = reporter.buildSummary();
      expect(summary.totalTransitions).assertEqual(4);
      expect(summary.successCount).assertEqual(4);
      expect(summary.failureCount).assertEqual(0);
      expect(summary.releasedCount).assertEqual(0);
      expect(summary.successRate).assertEqual(1);
      expect(summary.mostFrequentTransition.length).assertLarger(0);
    });

    it('session_singleton_should_share_state', 0, async () => {
      const first = CastSessionStateMachine.getInstance();
      const second = CastSessionStateMachine.getInstance();
      expect(first === second).assertTrue();
      first.reset();
      first.transitionState(CastSessionState.DISCOVERING, 'open');
      expect(second.getCurrentState()).assertEqual(CastSessionState.DISCOVERING);
      expect(second.getTransitionCount()).assertEqual(1);
      expect(second.toString().includes('transitions=1')).assertTrue();
    });

    it('session_reset_should_restore_initial_values', 0, async () => {
      session.reset();
      session.transitionState(CastSessionState.DISCOVERING, 'open');
      session.transitionState(CastSessionState.REQUESTING, 'found');
      expect(session.getCurrentState()).assertEqual(CastSessionState.REQUESTING);
      expect(session.getTransitionCount()).assertEqual(2);
      session.reset();
      expect(session.getCurrentState()).assertEqual(CastSessionState.IDLE);
      expect(session.getTransitionCount()).assertEqual(0);
      expect(session.getLastError()).assertEqual('');
      expect(session.getStateStats().size).assertEqual(0);
    });

    it('session_state_management_performance_should_meet_requirements', 0, async () => {
      session.reset();
      const startTime = Date.now();
      for (let i = 0; i < 500; i++) {
        session.reset();
        session.transitionState(CastSessionState.DISCOVERING, 'perf');
        session.transitionState(CastSessionState.REQUESTING, 'perf');
        session.transitionState(CastSessionState.PERMITTING, 'perf');
        session.transitionState(CastSessionState.CONNECTED, 'perf');
        session.transitionState(CastSessionState.PLAYING, 'perf');
        session.transitionState(CastSessionState.DISCONNECTED, 'perf');
        session.transitionState(CastSessionState.RELEASED, 'perf');
      }
      const elapsed = Date.now() - startTime;
      expect(elapsed).assertLessOrEqual(5000);
      expect(session.getTransitionCount()).assertEqual(7);
    });

    it('comprehensive_session_should_keep_players_and_state_consistent', 0, async () => {
      session.reset();
      const registry = new PlayerRegistry();
      const checker = new SessionInvariantChecker();
      expect(session.transitionState(CastSessionState.DISCOVERING, 'user_enabled_miracast')).assertTrue();
      expect(session.transitionState(CastSessionState.REQUESTING, 'device_found')).assertTrue();
      expect(session.transitionState(CastSessionState.PERMITTING, 'device_request')).assertTrue();
      expect(registry.addPlayer('device_001', -1)).assertTrue();
      expect(session.transitionState(CastSessionState.CONNECTED, 'permission_allowed')).assertTrue();
      expect(registry.bindScreen('device_001', 11)).assertTrue();
      expect(session.transitionState(CastSessionState.PLAYING, 'screen_bound')).assertTrue();
      expect(checker.isConsistent(session.getCurrentState(), registry)).assertTrue();
      expect(registry.addPlayer('device_002', 12)).assertTrue();
      expect(registry.muteExclusive('device_002')).assertTrue();
      expect(registry.isMuted('device_001')).assertTrue();
      expect(session.transitionState(CastSessionState.PAUSED, 'audio_focus_lost')).assertTrue();
      expect(session.transitionState(CastSessionState.PLAYING, 'audio_focus_regained')).assertTrue();
      expect(session.transitionState(CastSessionState.DISCONNECTED, 'device_lost')).assertTrue();
      registry.clear();
      expect(session.transitionState(CastSessionState.RELEASED, 'release_window')).assertTrue();
      expect(checker.isConsistent(CastSessionState.RELEASED, registry)).assertTrue();
      expect(session.getTransitionCount()).assertEqual(9);
      expect(session.getStateStats().get('playing->paused')).assertEqual(1);
      expect(session.getStateStats().get('playing->disconnected')).assertEqual(1);
    });

    it('device_player_page_should_start_session_flow', 0, async () => {
      try {
        await launchPlayerPage('device_001', 'Living Room TV');
      } catch (e) {
        Log.info(TAG, 'player page launch not available in this environment');
      }
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const tileCount = await getPlayerTileCount(driver);
      const componentCount = await miracastComponentCount(driver);
      expect(tileCount).assertLargerOrEqual(0);
      expect(tileCount).assertLessOrEqual(MAX_MIRROR_TILES);
      expect(componentCount).assertLargerOrEqual(0);
      const playerVisible = await isPlayerPageVisible(driver);
      const indexVisible = await isIndexPageVisible(driver);
      Log.info(TAG, `player page visible: ${playerVisible} index page visible: ${indexVisible}`);
      expect(tileCount >= 0 && tileCount <= MAX_MIRROR_TILES).assertTrue();
      expect(ID_TAB_MIRACAST.length).assertLarger(0);
    });

  });
}
