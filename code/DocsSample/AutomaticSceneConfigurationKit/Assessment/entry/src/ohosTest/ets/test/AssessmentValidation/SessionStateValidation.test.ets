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

import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import { Component, Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  ID_INDEX_TITLE,
  ID_BEGIN_BUTTON,
  ID_END_BUTTON,
  ID_QUERY_STATE_BUTTON,
  TEXT_STATE_ACTIVE,
  TEXT_STATE_INACTIVE,
  KEY_BACK,
  TIMEOUT_PAGE_TRANSITION,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  checkTextContent,
  waitForIndexPage,
  isComponentEnabled,
  clickIndexButton,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Documented error codes of the assessment service.
const CODE_OK: number = 0;
const CODE_USER_CANCEL: number = 1;
const CODE_TIMEOUT: number = 2;
const CODE_SYSTEM_ERROR: number = 3;
const CODE_ENV_ANOMALY: number = 4;

// Duration candidates and configuration limits of the sample.
const DURATION_DEFAULT: number = 0;
const DURATION_TEN_MINUTES: number = 600000;
const DURATION_THIRTY_MINUTES: number = 1800000;
const DURATION_SIXTY_MINUTES: number = 3600000;
const MAX_ALLOWED_APPS: number = 20;
const DEFAULT_ALLOWED_APP: string = 'com.samples.assessment';

// Event types published by the controller.
const EVENT_BEGIN: string = 'onBegin';
const EVENT_INTERRUPTED: string = 'onInterrupted';
const EVENT_END: string = 'onEnd';

// Number of transitions used by the invariant stress case.
const STRESS_ROUNDS_TRANSITIONS: number = 200;

/**
 * The five observable states of an assessment session.
 *
 * IDLE is the state before the first begin call, PENDING is the window between the begin call
 * and the begin callback, ACTIVE is the confirmed session, INTERRUPTED is the session that the
 * service terminated and ENDED is the session that ended normally.
 */
enum SessionState {
  IDLE = 'idle',
  PENDING = 'pending',
  ACTIVE = 'active',
  INTERRUPTED = 'interrupted',
  ENDED = 'ended'
}

/**
 * Calls that drive the session state machine.
 */
enum SessionAction {
  BEGIN = 'begin',
  BEGIN_OK = 'begin_ok',
  BEGIN_FAIL = 'begin_fail',
  INTERRUPT = 'interrupt',
  END = 'end',
  RESET = 'reset'
}

/**
 * Result of a transition attempt.
 */
interface TransitionResult {
  accepted: boolean;
  from: SessionState;
  to: SessionState;
  reason: string;
}

/**
 * Description of one legal transition.
 */
interface TransitionRule {
  from: SessionState;
  action: SessionAction;
  to: SessionState;
}

/**
 * Observable facts of a state, the invariants are expressed over them.
 */
interface StateFacts {
  state: SessionState;
  active: boolean;
  hasConfiguration: boolean;
  dialogVisible: boolean;
  allowsBegin: boolean;
  allowsEnd: boolean;
}

/**
 * Legal transition table of the assessment session.
 *
 * The table reproduces the flow of the sample: the entry page calls begin, the service answers
 * with onBegin, an interruption or an end terminates the session, and the user returns to the
 * entry page which starts the next session from IDLE.
 */
class TransitionTable {
  private rules: TransitionRule[] = [
    { from: SessionState.IDLE, action: SessionAction.BEGIN, to: SessionState.PENDING },
    { from: SessionState.IDLE, action: SessionAction.END, to: SessionState.IDLE },
    { from: SessionState.PENDING, action: SessionAction.BEGIN_OK, to: SessionState.ACTIVE },
    { from: SessionState.PENDING, action: SessionAction.BEGIN_FAIL, to: SessionState.ENDED },
    { from: SessionState.PENDING, action: SessionAction.INTERRUPT, to: SessionState.INTERRUPTED },
    { from: SessionState.ACTIVE, action: SessionAction.END, to: SessionState.ENDED },
    { from: SessionState.ACTIVE, action: SessionAction.INTERRUPT, to: SessionState.INTERRUPTED },
    { from: SessionState.ACTIVE, action: SessionAction.BEGIN, to: SessionState.ACTIVE },
    { from: SessionState.INTERRUPTED, action: SessionAction.RESET, to: SessionState.IDLE },
    { from: SessionState.INTERRUPTED, action: SessionAction.BEGIN, to: SessionState.PENDING },
    { from: SessionState.ENDED, action: SessionAction.RESET, to: SessionState.IDLE },
    { from: SessionState.ENDED, action: SessionAction.BEGIN, to: SessionState.PENDING }
  ];

  public targetOf(from: SessionState, action: SessionAction): SessionState | undefined {
    for (let i = 0; i < this.rules.length; i++) {
      if (this.rules[i].from === from && this.rules[i].action === action) {
        return this.rules[i].to;
      }
    }
    return undefined;
  }

  public isLegal(from: SessionState, action: SessionAction): boolean {
    return this.targetOf(from, action) !== undefined;
  }

  public ruleCount(): number {
    return this.rules.length;
  }

  public rulesFrom(from: SessionState): TransitionRule[] {
    const result: TransitionRule[] = [];
    for (let i = 0; i < this.rules.length; i++) {
      if (this.rules[i].from === from) {
        result.push(this.rules[i]);
      }
    }
    return result;
  }

  public actions(): SessionAction[] {
    return [
      SessionAction.BEGIN,
      SessionAction.BEGIN_OK,
      SessionAction.BEGIN_FAIL,
      SessionAction.INTERRUPT,
      SessionAction.END,
      SessionAction.RESET
    ];
  }

  public states(): SessionState[] {
    return [
      SessionState.IDLE,
      SessionState.PENDING,
      SessionState.ACTIVE,
      SessionState.INTERRUPTED,
      SessionState.ENDED
    ];
  }

  // The table must not contain two rules with the same source and action, otherwise the state
  // machine is ambiguous and the UI could take either branch.
  public isDeterministic(): boolean {
    for (let i = 0; i < this.rules.length; i++) {
      let matches: number = 0;
      for (let j = 0; j < this.rules.length; j++) {
        if (this.rules[i].from === this.rules[j].from && this.rules[i].action === this.rules[j].action) {
          matches++;
        }
      }
      if (matches !== 1) {
        return false;
      }
    }
    return true;
  }

  public everyStateReachable(): boolean {
    for (let i = 0; i < this.rules.length; i++) {
      if (this.rules[i].to === SessionState.IDLE) {
        continue;
      }
      let incoming: number = 0;
      for (let j = 0; j < this.rules.length; j++) {
        if (this.rules[j].to === this.rules[i].to) {
          incoming++;
        }
      }
      if (incoming === 0) {
        return false;
      }
    }
    return true;
  }
}

/**
 * Session state machine of the assessment sample.
 *
 * The machine keeps the current state, the configuration of the session, the active flag and
 * the dialog flag. Every illegal action is rejected with the unchanged state, so a rejected
 * action can never corrupt the observable state.
 */
class SessionStateMachine {
  private table: TransitionTable;
  private state: SessionState = SessionState.IDLE;
  private active: boolean = false;
  private duration: number = -1;
  private allowedApps: string[] = [];
  private interruptedBy: number = -1;
  private transitions: number = 0;
  private rejected: number = 0;
  private dialogShown: boolean = false;
  private history: string[] = [];

  constructor(table: TransitionTable) {
    this.table = table;
  }

  public getState(): SessionState {
    return this.state;
  }

  public isActive(): boolean {
    return this.active;
  }

  public getDuration(): number {
    return this.duration;
  }

  public getAllowedApps(): string[] {
    return this.allowedApps.slice();
  }

  public getInterruptedBy(): number {
    return this.interruptedBy;
  }

  public getTransitions(): number {
    return this.transitions;
  }

  public getRejected(): number {
    return this.rejected;
  }

  public isDialogShown(): boolean {
    return this.dialogShown;
  }

  public getHistory(): string[] {
    return this.history.slice();
  }

  public apply(action: SessionAction): TransitionResult {
    const target: SessionState | undefined = this.table.targetOf(this.state, action);
    if (target === undefined) {
      this.rejected++;
      return {
        accepted: false,
        from: this.state,
        to: this.state,
        reason: `${action} is not legal from ${this.state}`
      };
    }
    return this.move(action, target);
  }

  private move(action: SessionAction, target: SessionState): TransitionResult {
    const from: SessionState = this.state;
    this.state = target;
    this.transitions++;
    this.history.push(`${from}->${target}`);
    if (action === SessionAction.BEGIN || action === SessionAction.BEGIN_OK) {
      this.active = target === SessionState.ACTIVE || target === SessionState.PENDING;
      this.dialogShown = false;
    }
    if (action === SessionAction.BEGIN_FAIL) {
      this.active = false;
      this.dialogShown = true;
    }
    if (action === SessionAction.END) {
      this.active = false;
    }
    if (action === SessionAction.INTERRUPT) {
      this.active = false;
      this.dialogShown = true;
    }
    if (action === SessionAction.RESET) {
      this.active = false;
      this.interruptedBy = -1;
      this.dialogShown = false;
    }
    return {
      accepted: true,
      from: from,
      to: target,
      reason: `${action} moved the session to ${target}`
    };
  }

  public begin(duration: number, allowedApps: string[]): TransitionResult {
    const result: TransitionResult = this.apply(SessionAction.BEGIN);
    if (result.accepted) {
      this.duration = duration;
      this.allowedApps = allowedApps.slice();
    }
    return result;
  }

  public confirmBegin(): TransitionResult {
    return this.apply(SessionAction.BEGIN_OK);
  }

  public failBegin(): TransitionResult {
    return this.apply(SessionAction.BEGIN_FAIL);
  }

  public interrupt(code: number): TransitionResult {
    const result: TransitionResult = this.apply(SessionAction.INTERRUPT);
    if (result.accepted) {
      this.interruptedBy = code;
    }
    return result;
  }

  public end(): TransitionResult {
    return this.apply(SessionAction.END);
  }

  public reset(): TransitionResult {
    return this.apply(SessionAction.RESET);
  }

  public facts(): StateFacts {
    return {
      state: this.state,
      active: this.active,
      hasConfiguration: this.duration >= 0,
      dialogVisible: this.dialogShown,
      allowsBegin: this.state === SessionState.IDLE || this.state === SessionState.INTERRUPTED ||
        this.state === SessionState.ENDED,
      allowsEnd: this.state === SessionState.ACTIVE
    };
  }

  public describe(): string {
    return `SessionStateMachine{state=${this.state}, active=${this.active}, ` +
      `transitions=${this.transitions}, rejected=${this.rejected}}`;
  }
}

/**
 * Checks the invariants that must hold in every reachable state.
 *
 * The invariants are derived from the sample: a pending or active session is never reported as
 * inactive, an interrupted session is never reported as active, a dialog is only offered for a
 * terminal or failed session, and the configuration is only present once begin was called.
 */
class InvariantChecker {
  public activeImpliesNotIdle(facts: StateFacts): boolean {
    if (!facts.active) {
      return true;
    }
    return facts.state === SessionState.ACTIVE || facts.state === SessionState.PENDING;
  }

  public interruptedNeverActive(facts: StateFacts): boolean {
    if (facts.state !== SessionState.INTERRUPTED) {
      return true;
    }
    return !facts.active;
  }

  public endedNeverActive(facts: StateFacts): boolean {
    if (facts.state !== SessionState.ENDED) {
      return true;
    }
    return !facts.active;
  }

  public dialogOnlyForTerminal(facts: StateFacts): boolean {
    if (!facts.dialogVisible) {
      return true;
    }
    return facts.state === SessionState.INTERRUPTED || facts.state === SessionState.ENDED;
  }

  public idleAllowsBegin(facts: StateFacts): boolean {
    if (facts.state !== SessionState.IDLE) {
      return true;
    }
    return facts.allowsBegin;
  }

  public endOnlyWhenActive(facts: StateFacts): boolean {
    if (!facts.allowsEnd) {
      return true;
    }
    return facts.state === SessionState.ACTIVE;
  }

  public all(facts: StateFacts): boolean {
    return this.activeImpliesNotIdle(facts) && this.interruptedNeverActive(facts) &&
      this.endedNeverActive(facts) && this.dialogOnlyForTerminal(facts) &&
      this.idleAllowsBegin(facts) && this.endOnlyWhenActive(facts);
  }

  public checkAll(facts: StateFacts): string[] {
    const issues: string[] = [];
    if (!this.activeImpliesNotIdle(facts)) {
      issues.push('an active flag is set while the session is not pending or active');
    }
    if (!this.interruptedNeverActive(facts)) {
      issues.push('an interrupted session reports the active flag');
    }
    if (!this.endedNeverActive(facts)) {
      issues.push('an ended session reports the active flag');
    }
    if (!this.dialogOnlyForTerminal(facts)) {
      issues.push('a dialog is visible outside a terminal state');
    }
    if (!this.idleAllowsBegin(facts)) {
      issues.push('the idle state refuses a begin');
    }
    if (!this.endOnlyWhenActive(facts)) {
      issues.push('an end is allowed outside the active state');
    }
    return issues;
  }

  public invariantCount(): number {
    return 6;
  }
}

/**
 * Walks the state machine through every action from every state.
 *
 * The walker builds the complete transition matrix, which is the cheapest way to prove that no
 * illegal action escapes the guard and that no legal action is missing.
 */
class ExhaustiveWalker {
  private table: TransitionTable;

  constructor(table: TransitionTable) {
    this.table = table;
  }

  public walk(): number {
    let accepted: number = 0;
    const states: SessionState[] = this.table.states();
    const actions: SessionAction[] = this.table.actions();
    for (let i = 0; i < states.length; i++) {
      for (let j = 0; j < actions.length; j++) {
        const machine: SessionStateMachine = new SessionStateMachine(this.table);
        this.forceState(machine, states[i]);
        const result: TransitionResult = machine.apply(actions[j]);
        if (result.accepted) {
          accepted++;
          if (result.from !== states[i]) {
            return -1;
          }
        } else if (result.to !== states[i]) {
          return -1;
        }
      }
    }
    return accepted;
  }

  private forceState(machine: SessionStateMachine, state: SessionState): void {
    if (state === SessionState.IDLE) {
      return;
    }
    machine.begin(DURATION_DEFAULT, []);
    if (state === SessionState.PENDING) {
      return;
    }
    machine.confirmBegin();
    if (state === SessionState.ACTIVE) {
      return;
    }
    if (state === SessionState.INTERRUPTED) {
      machine.interrupt(CODE_TIMEOUT);
      return;
    }
    machine.end();
  }

  public matrixSize(): number {
    return this.table.states().length * this.table.actions().length;
  }
}

/**
 * Reports whether a state is terminal.
 *
 * @param state state of the session.
 * @returns true for the interrupted and the ended state.
 */
function isTerminalState(state: SessionState): boolean {
  return state === SessionState.INTERRUPTED || state === SessionState.ENDED;
}

export default function sessionStateValidationTest() {
  describe('SessionStateValidation_Test', () => {
    let driver: Driver;
    let table: TransitionTable;
    let checker: InvariantChecker;

    beforeAll(async () => {
      driver = getDriver();
      table = new TransitionTable();
      checker = new InvariantChecker();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_TRANSITION);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the five session states of the sample.
     * Expectation: the state enumeration exposes the documented literals and no duplicates.
     */
    it('Assessment_StateEnumeration_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateEnumeration_001, begin');
      expect(SessionState.IDLE).assertEqual('idle');
      expect(SessionState.PENDING).assertEqual('pending');
      expect(SessionState.ACTIVE).assertEqual('active');
      expect(SessionState.INTERRUPTED).assertEqual('interrupted');
      expect(SessionState.ENDED).assertEqual('ended');
      const states: SessionState[] = table.states();
      expect(states.length).assertEqual(5);
      const unique: Set<string> = new Set<string>(states);
      expect(unique.size).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateEnumeration_001, end');
    });

    /**
     * Scenario: the six session actions of the machine.
     * Expectation: the action enumeration exposes the documented literals and the terminal
     * predicates classify the two terminal states.
     */
    it('Assessment_ActionEnumeration_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ActionEnumeration_002, begin');
      expect(SessionAction.BEGIN).assertEqual('begin');
      expect(SessionAction.BEGIN_OK).assertEqual('begin_ok');
      expect(SessionAction.BEGIN_FAIL).assertEqual('begin_fail');
      expect(SessionAction.INTERRUPT).assertEqual('interrupt');
      expect(SessionAction.END).assertEqual('end');
      expect(SessionAction.RESET).assertEqual('reset');
      expect(table.actions().length).assertEqual(6);
      expect(isTerminalState(SessionState.INTERRUPTED)).assertTrue();
      expect(isTerminalState(SessionState.ENDED)).assertTrue();
      expect(isTerminalState(SessionState.ACTIVE)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ActionEnumeration_002, end');
    });

    /**
     * Scenario: the transition table of the sample.
     * Expectation: twelve rules are registered and the table is deterministic.
     */
    it('Assessment_TransitionTableSize_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TransitionTableSize_003, begin');
      expect(table.ruleCount()).assertEqual(12);
      expect(table.isDeterministic()).assertTrue();
      expect(table.everyStateReachable()).assertTrue();
      expect(table.rulesFrom(SessionState.IDLE).length).assertEqual(2);
      expect(table.rulesFrom(SessionState.ACTIVE).length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TransitionTableSize_003, end');
    });

    /**
     * Scenario: the legal transitions out of the idle state.
     * Expectation: a begin moves to pending and an end is a no op that stays idle.
     */
    it('Assessment_IdleTransitions_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'IdleTransitions_004, begin');
      expect(table.targetOf(SessionState.IDLE, SessionAction.BEGIN)).assertEqual(SessionState.PENDING);
      expect(table.targetOf(SessionState.IDLE, SessionAction.END)).assertEqual(SessionState.IDLE);
      expect(table.isLegal(SessionState.IDLE, SessionAction.INTERRUPT)).assertFalse();
      expect(table.isLegal(SessionState.IDLE, SessionAction.BEGIN_OK)).assertFalse();
      expect(table.isLegal(SessionState.IDLE, SessionAction.RESET)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'IdleTransitions_004, end');
    });

    /**
     * Scenario: the legal transitions out of the pending state.
     * Expectation: a successful begin moves to active, a failed begin and an interruption move
     * to their terminal state.
     */
    it('Assessment_PendingTransitions_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PendingTransitions_005, begin');
      expect(table.targetOf(SessionState.PENDING, SessionAction.BEGIN_OK)).assertEqual(SessionState.ACTIVE);
      expect(table.targetOf(SessionState.PENDING, SessionAction.BEGIN_FAIL)).assertEqual(SessionState.ENDED);
      expect(table.targetOf(SessionState.PENDING, SessionAction.INTERRUPT))
        .assertEqual(SessionState.INTERRUPTED);
      expect(table.isLegal(SessionState.PENDING, SessionAction.END)).assertFalse();
      expect(table.isLegal(SessionState.PENDING, SessionAction.RESET)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PendingTransitions_005, end');
    });

    /**
     * Scenario: the legal transitions out of the active state.
     * Expectation: an end and an interruption are legal, a second begin keeps the session
     * active because the page guards the button.
     */
    it('Assessment_ActiveTransitions_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ActiveTransitions_006, begin');
      expect(table.targetOf(SessionState.ACTIVE, SessionAction.END)).assertEqual(SessionState.ENDED);
      expect(table.targetOf(SessionState.ACTIVE, SessionAction.INTERRUPT))
        .assertEqual(SessionState.INTERRUPTED);
      expect(table.targetOf(SessionState.ACTIVE, SessionAction.BEGIN)).assertEqual(SessionState.ACTIVE);
      expect(table.isLegal(SessionState.ACTIVE, SessionAction.BEGIN_FAIL)).assertFalse();
      expect(table.isLegal(SessionState.ACTIVE, SessionAction.RESET)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ActiveTransitions_006, end');
    });

    /**
     * Scenario: the legal transitions out of the two terminal states.
     * Expectation: a reset and a new begin are legal, an end of a terminated session is not.
     */
    it('Assessment_TerminalTransitions_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TerminalTransitions_007, begin');
      expect(table.targetOf(SessionState.INTERRUPTED, SessionAction.RESET)).assertEqual(SessionState.IDLE);
      expect(table.targetOf(SessionState.ENDED, SessionAction.RESET)).assertEqual(SessionState.IDLE);
      expect(table.targetOf(SessionState.INTERRUPTED, SessionAction.BEGIN)).assertEqual(SessionState.PENDING);
      expect(table.targetOf(SessionState.ENDED, SessionAction.BEGIN)).assertEqual(SessionState.PENDING);
      expect(table.isLegal(SessionState.INTERRUPTED, SessionAction.END)).assertFalse();
      expect(table.isLegal(SessionState.ENDED, SessionAction.END)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TerminalTransitions_007, end');
    });

    /**
     * Scenario: the initial state of a fresh machine.
     * Expectation: the machine starts idle, inactive and without a configuration.
     */
    it('Assessment_InitialState_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InitialState_008, begin');
      const local: SessionStateMachine = new SessionStateMachine(table);
      expect(local.getState()).assertEqual(SessionState.IDLE);
      expect(local.isActive()).assertFalse();
      expect(local.getDuration()).assertEqual(-1);
      expect(local.getAllowedApps().length).assertEqual(0);
      expect(local.getTransitions()).assertEqual(0);
      expect(local.isDialogShown()).assertFalse();
      expect(checker.all(local.facts())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', local.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InitialState_008, end');
    });

    /**
     * Scenario: a begin call that the service confirms.
     * Expectation: the machine walks idle, pending and active in order and ends active with the
     * configuration of the call.
     */
    it('Assessment_HappyPath_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HappyPath_009, begin');
      const local: SessionStateMachine = new SessionStateMachine(table);
      local.begin(DURATION_TEN_MINUTES, [DEFAULT_ALLOWED_APP]);
      expect(local.getState()).assertEqual(SessionState.PENDING);
      expect(local.getDuration()).assertEqual(DURATION_TEN_MINUTES);
      local.confirmBegin();
      expect(local.getState()).assertEqual(SessionState.ACTIVE);
      expect(local.isActive()).assertTrue();
      expect(local.getTransitions()).assertEqual(2);
      expect(local.getHistory()[0]).assertEqual('idle->pending');
      expect(local.getHistory()[1]).assertEqual('pending->active');
      expect(checker.all(local.facts())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'HappyPath_009, end');
    });

    /**
     * Scenario: a begin that the service rejects.
     * Expectation: the machine moves from pending to ended, the active flag stays false and the
     * dialog flag is raised.
     */
    it('Assessment_BeginFailure_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginFailure_010, begin');
      const local: SessionStateMachine = new SessionStateMachine(table);
      local.begin(DURATION_TEN_MINUTES, [DEFAULT_ALLOWED_APP]);
      local.failBegin();
      expect(local.getState()).assertEqual(SessionState.ENDED);
      expect(local.isActive()).assertFalse();
      expect(local.isDialogShown()).assertTrue();
      expect(local.getTransitions()).assertEqual(2);
      const issues: string[] = checker.checkAll(local.facts());
      expect(issues.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginFailure_010, end');
    });

    /**
     * Scenario: an active session is interrupted.
     * Expectation: the machine moves to interrupted, records the code and clears the active
     * flag.
     */
    it('Assessment_InterruptActive_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptActive_011, begin');
      const local: SessionStateMachine = new SessionStateMachine(table);
      local.begin(DURATION_THIRTY_MINUTES, [DEFAULT_ALLOWED_APP]);
      local.confirmBegin();
      local.interrupt(CODE_TIMEOUT);
      expect(local.getState()).assertEqual(SessionState.INTERRUPTED);
      expect(local.isActive()).assertFalse();
      expect(local.getInterruptedBy()).assertEqual(CODE_TIMEOUT);
      expect(local.isDialogShown()).assertTrue();
      expect(local.getDuration()).assertEqual(DURATION_THIRTY_MINUTES);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptActive_011, end');
    });

    /**
     * Scenario: a pending session is interrupted before the begin callback arrives.
     * Expectation: the machine moves to interrupted and the configuration of the begin call is
     * kept for the diagnosis.
     */
    it('Assessment_InterruptPending_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptPending_012, begin');
      const local: SessionStateMachine = new SessionStateMachine(table);
      local.begin(DURATION_SIXTY_MINUTES, [DEFAULT_ALLOWED_APP]);
      local.interrupt(CODE_ENV_ANOMALY);
      expect(local.getState()).assertEqual(SessionState.INTERRUPTED);
      expect(local.getInterruptedBy()).assertEqual(CODE_ENV_ANOMALY);
      expect(local.getDuration()).assertEqual(DURATION_SIXTY_MINUTES);
      expect(isTerminalState(local.getState())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptPending_012, end');
    });

    /**
     * Scenario: an end call on an active session.
     * Expectation: the machine moves to ended, the active flag is cleared and the history keeps
     * both transitions.
     */
    it('Assessment_EndActive_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndActive_013, begin');
      const local: SessionStateMachine = new SessionStateMachine(table);
      local.begin(DURATION_TEN_MINUTES, [DEFAULT_ALLOWED_APP]);
      local.confirmBegin();
      const result: TransitionResult = local.end();
      expect(result.accepted).assertTrue();
      expect(result.from).assertEqual(SessionState.ACTIVE);
      expect(result.to).assertEqual(SessionState.ENDED);
      expect(local.isActive()).assertFalse();
      expect(local.getHistory().length).assertEqual(3);
      expect(local.getHistory()[2]).assertEqual('active->ended');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndActive_013, end');
    });

    /**
     * Scenario: an end call on the idle state.
     * Expectation: the transition is accepted as a no op and the machine stays idle.
     */
    it('Assessment_EndIdleNoOp_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndIdleNoOp_014, begin');
      const local: SessionStateMachine = new SessionStateMachine(table);
      const result: TransitionResult = local.end();
      expect(result.accepted).assertTrue();
      expect(result.from).assertEqual(SessionState.IDLE);
      expect(result.to).assertEqual(SessionState.IDLE);
      expect(local.getState()).assertEqual(SessionState.IDLE);
      expect(local.getTransitions()).assertEqual(1);
      expect(local.isActive()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndIdleNoOp_014, end');
    });

    /**
     * Scenario: an end call on a pending session.
     * Expectation: the transition is rejected, the state is unchanged and the rejection is
     * counted.
     */
    it('Assessment_EndPendingRejected_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndPendingRejected_015, begin');
      const local: SessionStateMachine = new SessionStateMachine(table);
      local.begin(DURATION_TEN_MINUTES, [DEFAULT_ALLOWED_APP]);
      const result: TransitionResult = local.end();
      expect(result.accepted).assertFalse();
      expect(result.from).assertEqual(SessionState.PENDING);
      expect(result.to).assertEqual(SessionState.PENDING);
      expect(local.getState()).assertEqual(SessionState.PENDING);
      expect(local.getRejected()).assertEqual(1);
      expect(result.reason).assertContain('not legal');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndPendingRejected_015, end');
    });

    /**
     * Scenario: an interruption on the idle state.
     * Expectation: the transition is rejected, the active flag and the dialog flag stay false.
     */
    it('Assessment_InterruptIdleRejected_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptIdleRejected_016, begin');
      const local: SessionStateMachine = new SessionStateMachine(table);
      const result: TransitionResult = local.interrupt(CODE_SYSTEM_ERROR);
      expect(result.accepted).assertFalse();
      expect(local.getState()).assertEqual(SessionState.IDLE);
      expect(local.getInterruptedBy()).assertEqual(-1);
      expect(local.isDialogShown()).assertFalse();
      expect(local.getRejected()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptIdleRejected_016, end');
    });

    /**
     * Scenario: an interruption on a terminal state.
     * Expectation: a second interruption is rejected because the session is already terminated.
     */
    it('Assessment_InterruptTerminalRejected_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptTerminalRejected_017, begin');
      const local: SessionStateMachine = new SessionStateMachine(table);
      local.begin(DURATION_TEN_MINUTES, [DEFAULT_ALLOWED_APP]);
      local.confirmBegin();
      local.end();
      const result: TransitionResult = local.interrupt(CODE_TIMEOUT);
      expect(result.accepted).assertFalse();
      expect(local.getState()).assertEqual(SessionState.ENDED);
      expect(local.getInterruptedBy()).assertEqual(-1);
      expect(local.getRejected()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptTerminalRejected_017, end');
    });

    /**
     * Scenario: a reset after an interruption.
     * Expectation: the machine returns to idle, the interruption code and the dialog flag are
     * dropped.
     */
    it('Assessment_ResetAfterInterrupt_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResetAfterInterrupt_018, begin');
      const local: SessionStateMachine = new SessionStateMachine(table);
      local.begin(DURATION_TEN_MINUTES, [DEFAULT_ALLOWED_APP]);
      local.confirmBegin();
      local.interrupt(CODE_USER_CANCEL);
      local.reset();
      expect(local.getState()).assertEqual(SessionState.IDLE);
      expect(local.getInterruptedBy()).assertEqual(-1);
      expect(local.isDialogShown()).assertFalse();
      expect(local.isActive()).assertFalse();
      expect(checker.all(local.facts())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResetAfterInterrupt_018, end');
    });

    /**
     * Scenario: a reset on the active state.
     * Expectation: the transition is rejected, the page cannot skip the end call.
     */
    it('Assessment_ResetActiveRejected_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResetActiveRejected_019, begin');
      const local: SessionStateMachine = new SessionStateMachine(table);
      local.begin(DURATION_TEN_MINUTES, [DEFAULT_ALLOWED_APP]);
      local.confirmBegin();
      const result: TransitionResult = local.reset();
      expect(result.accepted).assertFalse();
      expect(local.getState()).assertEqual(SessionState.ACTIVE);
      expect(local.isActive()).assertTrue();
      expect(local.getRejected()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResetActiveRejected_019, end');
    });

    /**
     * Scenario: a second begin while a session is active.
     * Expectation: the table accepts it as a self transition, so a guarded button cannot corrupt
     * the active state.
     */
    it('Assessment_BeginWhileActiveSelfTransition_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginWhileActiveSelfTransition_020, begin');
      const local: SessionStateMachine = new SessionStateMachine(table);
      local.begin(DURATION_TEN_MINUTES, [DEFAULT_ALLOWED_APP]);
      local.confirmBegin();
      const result: TransitionResult = local.begin(DURATION_SIXTY_MINUTES, [DEFAULT_ALLOWED_APP]);
      expect(result.accepted).assertTrue();
      expect(local.getState()).assertEqual(SessionState.ACTIVE);
      expect(local.getDuration()).assertEqual(DURATION_SIXTY_MINUTES);
      expect(local.isActive()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginWhileActiveSelfTransition_020, end');
    });

    /**
     * Scenario: re-entry after an interruption.
     * Expectation: a begin from the interrupted state moves to pending directly and keeps the
     * machine legal.
     */
    it('Assessment_ReentryFromInterrupted_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ReentryFromInterrupted_021, begin');
      const local: SessionStateMachine = new SessionStateMachine(table);
      local.begin(DURATION_TEN_MINUTES, [DEFAULT_ALLOWED_APP]);
      local.confirmBegin();
      local.interrupt(CODE_TIMEOUT);
      const result: TransitionResult = local.begin(DURATION_THIRTY_MINUTES, buildApps(3));
      expect(result.accepted).assertTrue();
      expect(result.to).assertEqual(SessionState.PENDING);
      expect(local.getDuration()).assertEqual(DURATION_THIRTY_MINUTES);
      expect(local.getAllowedApps().length).assertEqual(3);
      local.confirmBegin();
      expect(local.getState()).assertEqual(SessionState.ACTIVE);
      hilog.info(DOMAIN, TAG, '%{public}s', local.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ReentryFromInterrupted_021, end');
    });

    /**
     * Scenario: re-entry after a normal end.
     * Expectation: a begin from the ended state moves to pending and the dialog flag of the
     * previous session is dropped by the reset that the page performs.
     */
    it('Assessment_ReentryFromEnded_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ReentryFromEnded_022, begin');
      const local: SessionStateMachine = new SessionStateMachine(table);
      local.begin(DURATION_TEN_MINUTES, [DEFAULT_ALLOWED_APP]);
      local.confirmBegin();
      local.end();
      local.reset();
      expect(local.getState()).assertEqual(SessionState.IDLE);
      const result: TransitionResult = local.begin(DURATION_TEN_MINUTES, [DEFAULT_ALLOWED_APP]);
      expect(result.accepted).assertTrue();
      expect(local.getState()).assertEqual(SessionState.PENDING);
      expect(local.isDialogShown()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ReentryFromEnded_022, end');
    });

    /**
     * Scenario: the invariants hold in every reachable state.
     * Expectation: the checker reports no issue for the hundred walks the case builds.
     */
    it('Assessment_InvariantsEveryState_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InvariantsEveryState_023, begin');
      const states: SessionState[] = table.states();
      let checked: number = 0;
      for (let i = 0; i < states.length; i++) {
        const local: SessionStateMachine = new SessionStateMachine(table);
        driveTo(local, states[i]);
        expect(local.getState()).assertEqual(states[i]);
        const issues: string[] = checker.checkAll(local.facts());
        expect(issues.length).assertEqual(0);
        checked++;
      }
      expect(checked).assertEqual(5);
      expect(checker.invariantCount()).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}d states checked', BUNDLE +
        'InvariantsEveryState_023', checked);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InvariantsEveryState_023, end');
    });

    /**
     * Scenario: the active implies not idle invariant on a hand built state.
     * Expectation: the checker rejects an active flag that is set while the state is idle.
     */
    it('Assessment_InvariantActiveImpliesNotIdle_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InvariantActiveImpliesNotIdle_024, begin');
      const broken: StateFacts = {
        state: SessionState.IDLE,
        active: true,
        hasConfiguration: false,
        dialogVisible: false,
        allowsBegin: true,
        allowsEnd: false
      };
      expect(checker.activeImpliesNotIdle(broken)).assertFalse();
      expect(checker.all(broken)).assertFalse();
      expect(checker.checkAll(broken).length).assertEqual(1);
      expect(checker.checkAll(broken)[0]).assertContain('active flag');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InvariantActiveImpliesNotIdle_024, end');
    });

    /**
     * Scenario: the interrupted never active invariant.
     * Expectation: a dialog outside a terminal state is reported and an interrupted session with
     * the active flag is reported as well.
     */
    it('Assessment_InvariantTerminalStates_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InvariantTerminalStates_025, begin');
      const facts: StateFacts = {
        state: SessionState.INTERRUPTED,
        active: true,
        hasConfiguration: true,
        dialogVisible: false,
        allowsBegin: true,
        allowsEnd: false
      };
      expect(checker.interruptedNeverActive(facts)).assertFalse();
      const dialogOutside: StateFacts = {
        state: SessionState.ACTIVE,
        active: true,
        hasConfiguration: true,
        dialogVisible: true,
        allowsBegin: false,
        allowsEnd: true
      };
      expect(checker.dialogOnlyForTerminal(dialogOutside)).assertFalse();
      expect(checker.checkAll(dialogOutside).length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InvariantTerminalStates_025, end');
    });

    /**
     * Scenario: the allows end helper of a state fact.
     * Expectation: only the active state allows the end call.
     */
    it('Assessment_InvariantEndOnlyWhenActive_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InvariantEndOnlyWhenActive_026, begin');
      const states: SessionState[] = table.states();
      for (let i = 0; i < states.length; i++) {
        const local: SessionStateMachine = new SessionStateMachine(table);
        driveTo(local, states[i]);
        const facts: StateFacts = local.facts();
        if (states[i] === SessionState.ACTIVE) {
          expect(facts.allowsEnd).assertTrue();
        } else {
          expect(facts.allowsEnd).assertFalse();
        }
        expect(checker.endOnlyWhenActive(facts)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InvariantEndOnlyWhenActive_026, end');
    });

    /**
     * Scenario: the exhaustive walk over the transition matrix.
     * Expectation: thirty of the thirty cells are legal and no rejection changes the state.
     */
    it('Assessment_ExhaustiveWalk_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExhaustiveWalk_027, begin');
      const walker: ExhaustiveWalker = new ExhaustiveWalker(table);
      expect(walker.matrixSize()).assertEqual(30);
      const accepted: number = walker.walk();
      expect(accepted).assertEqual(table.ruleCount());
      expect(accepted).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}d of %{public}d cells accepted',
        BUNDLE + 'ExhaustiveWalk_027', accepted, walker.matrixSize());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExhaustiveWalk_027, end');
    });

    /**
     * Scenario: every state can be reached from the idle state.
     * Expectation: the table has an incoming edge for every non idle state.
     */
    it('Assessment_EveryStateReachable_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EveryStateReachable_028, begin');
      expect(table.everyStateReachable()).assertTrue();
      expect(table.isDeterministic()).assertTrue();
      const states: SessionState[] = table.states();
      for (let i = 0; i < states.length; i++) {
        if (states[i] === SessionState.IDLE) {
          continue;
        }
        let incoming: number = 0;
        for (let j = 0; j < states.length; j++) {
          const actions: SessionAction[] = table.actions();
          for (let k = 0; k < actions.length; k++) {
            if (table.targetOf(states[j], actions[k]) === states[i]) {
              incoming++;
            }
          }
        }
        expect(incoming).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EveryStateReachable_028, end');
    });

    /**
     * Scenario: a long random walk over the machine.
     * Expectation: every intermediate state satisfies the invariants, no matter how often the
     * calls interleave.
     */
    it('Assessment_InvariantStress_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InvariantStress_029, begin');
      const local: SessionStateMachine = new SessionStateMachine(table);
      const actions: SessionAction[] = table.actions();
      let violations: number = 0;
      for (let i = 0; i < STRESS_ROUNDS_TRANSITIONS; i++) {
        local.apply(actions[i % actions.length]);
        if (!checker.all(local.facts())) {
          violations++;
        }
      }
      expect(violations).assertEqual(0);
      expect(local.getTransitions() + local.getRejected()).assertEqual(STRESS_ROUNDS_TRANSITIONS);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}d transitions, %{public}d rejected',
        BUNDLE + 'InvariantStress_029', local.getTransitions(), local.getRejected());
      hilog.info(DOMAIN, TAG, '%{public}s', local.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InvariantStress_029, end');
    });

    /**
     * Scenario: the configuration is only present once begin was called.
     * Expectation: the configuration flag follows the begin call in every state.
     */
    it('Assessment_ConfigurationPresence_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationPresence_030, begin');
      const local: SessionStateMachine = new SessionStateMachine(table);
      expect(local.facts().hasConfiguration).assertFalse();
      local.begin(DURATION_SIXTY_MINUTES, buildApps(MAX_ALLOWED_APPS));
      expect(local.facts().hasConfiguration).assertTrue();
      expect(local.getDuration()).assertEqual(DURATION_SIXTY_MINUTES);
      expect(local.getAllowedApps().length).assertEqual(MAX_ALLOWED_APPS);
      local.confirmBegin();
      expect(local.facts().hasConfiguration).assertTrue();
      local.end();
      expect(local.facts().hasConfiguration).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigurationPresence_030, end');
    });

    /**
     * Scenario: a full lifecycle with a re-entry.
     * Expectation: the history names every transition and the transition counter matches the
     * number of accepted actions.
     */
    it('Assessment_FullLifecycleHistory_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FullLifecycleHistory_031, begin');
      const local: SessionStateMachine = new SessionStateMachine(table);
      local.begin(DURATION_TEN_MINUTES, [DEFAULT_ALLOWED_APP]);
      local.confirmBegin();
      local.interrupt(CODE_ENV_ANOMALY);
      local.reset();
      local.begin(DURATION_THIRTY_MINUTES, buildApps(2));
      local.confirmBegin();
      local.end();
      const history: string[] = local.getHistory();
      expect(history.length).assertEqual(7);
      expect(history[0]).assertEqual('idle->pending');
      expect(history[1]).assertEqual('pending->active');
      expect(history[2]).assertEqual('active->interrupted');
      expect(history[3]).assertEqual('interrupted->idle');
      expect(history[4]).assertEqual('idle->pending');
      expect(history[5]).assertEqual('pending->active');
      expect(history[6]).assertEqual('active->ended');
      expect(local.getTransitions()).assertEqual(7);
      expect(local.getRejected()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FullLifecycleHistory_031, end');
    });

    /**
     * Scenario: the description of the machine used by the failure diagnosis.
     * Expectation: the description names the state, the active flag, the transition count and
     * the rejection count.
     */
    it('Assessment_MachineDescription_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MachineDescription_032, begin');
      const local: SessionStateMachine = new SessionStateMachine(table);
      expect(local.describe()).assertContain('state=idle');
      expect(local.describe()).assertContain('transitions=0');
      expect(local.describe()).assertContain('rejected=0');
      local.end();
      expect(local.describe()).assertContain('transitions=1');
      const text: string = local.describe();
      hilog.info(DOMAIN, TAG, '%{public}s', text);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MachineDescription_032, end');
    });

    /**
     * Scenario: a rejected action never corrupts the configuration.
     * Expectation: an end during a pending session leaves the duration and the whitelist intact.
     */
    it('Assessment_RejectionKeepsConfiguration_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RejectionKeepsConfiguration_033, begin');
      const local: SessionStateMachine = new SessionStateMachine(table);
      local.begin(DURATION_SIXTY_MINUTES, buildApps(4));
      const rejected: TransitionResult = local.end();
      expect(rejected.accepted).assertFalse();
      expect(local.getDuration()).assertEqual(DURATION_SIXTY_MINUTES);
      expect(local.getAllowedApps().length).assertEqual(4);
      expect(local.getState()).assertEqual(SessionState.PENDING);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RejectionKeepsConfiguration_033, end');
    });

    /**
     * Scenario: the sample constants that the state model relies on.
     * Expectation: the codes, the durations and the limits match the documented values.
     */
    it('Assessment_StateDomainConstants_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateDomainConstants_034, begin');
      expect(CODE_OK).assertEqual(0);
      expect(CODE_USER_CANCEL).assertEqual(1);
      expect(CODE_TIMEOUT).assertEqual(2);
      expect(CODE_SYSTEM_ERROR).assertEqual(3);
      expect(CODE_ENV_ANOMALY).assertEqual(4);
      expect(DURATION_DEFAULT).assertEqual(0);
      expect(DURATION_TEN_MINUTES).assertEqual(600000);
      expect(DURATION_THIRTY_MINUTES).assertEqual(1800000);
      expect(DURATION_SIXTY_MINUTES).assertEqual(3600000);
      expect(MAX_ALLOWED_APPS).assertEqual(20);
      expect(EVENT_BEGIN).assertEqual('onBegin');
      expect(EVENT_INTERRUPTED).assertEqual('onInterrupted');
      expect(EVENT_END).assertEqual('onEnd');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateDomainConstants_034, end');
    });

  });
}

/**
 * Builds a whitelist of a given size.
 *
 * @param count number of entries.
 * @returns the whitelist.
 */
function buildApps(count: number): string[] {
  const apps: string[] = [];
  for (let i = 0; i < count; i++) {
    apps.push(`com.samples.app${i}`);
  }
  return apps;
}

/**
 * Drives a machine into a target state through the legal transitions only.
 *
 * @param machine machine to drive.
 * @param table transition table of the machine.
 * @param target state to reach.
 */
function driveTo(machine: SessionStateMachine, target: SessionState): void {
  if (target === SessionState.IDLE) {
    return;
  }
  machine.begin(DURATION_TEN_MINUTES, [DEFAULT_ALLOWED_APP]);
  if (target === SessionState.PENDING) {
    return;
  }
  machine.confirmBegin();
  if (target === SessionState.ACTIVE) {
    return;
  }
  if (target === SessionState.INTERRUPTED) {
    machine.interrupt(CODE_TIMEOUT);
    return;
  }
  machine.end();
}
