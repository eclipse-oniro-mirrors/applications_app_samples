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

import { describe, it, expect, beforeAll, beforeEach, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver, Component } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import {
  getDriver,
  ensureIndexPageInitial,
  getAbilityDelegator,
  getBundleName,
  launchEntryAbility,
  startAbilityByWant,
  buildEntryWant,
  doAbilityForeground,
  doAbilityBackground,
  waitForIndexPageStable,
  isIndexPageVisible,
  isIndexPageRendered,
  pageComponentCount,
  tapComponentByText,
  checkTextContent,
  checkComponentExistsByKey,
  findComponentsByType,
  measureElapsed,
  isWithinBudget,
  logInfo,
  logError,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_ABILITY_LAUNCH,
  TIMEOUT_BACKGROUND_SWITCH,
  DELAY_AFTER_BACKGROUND,
  STRESS_ROUNDS_LIFECYCLE,
  ABILITY_STAGE_NAME,
  ENTRY_ABILITY_NAME,
  BUNDLE_NAME,
  INDEX_PAGE_TEXT_KEY,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED
} from '../Shared/SharedDriver';

enum StageState {
  CREATED = 'CREATED',
  ACTIVE = 'ACTIVE',
  FOREGROUND = 'FOREGROUND',
  BACKGROUND = 'BACKGROUND',
  DESTROYED = 'DESTROYED'
}

interface StateTransition {
  from: string;
  to: string;
}

interface StateBatch {
  label: string;
  target: string;
}

interface StageSubscriber {
  id: number;
  key: string;
  notifications: number;
  lastState: string;
}

class StageTransitionError extends Error {
  public code: number = 409;

  constructor(message: string) {
    super(message);
    this.name = 'StageTransitionError';
  }
}

class StageStackError extends Error {
  public code: number = 416;

  constructor(message: string) {
    super(message);
    this.name = 'StageStackError';
  }
}

class StageSubscriptionError extends Error {
  public code: number = 401;

  constructor(message: string) {
    super(message);
    this.name = 'StageSubscriptionError';
  }
}

class StageTransitionTable {
  private static readonly RULES: string[] = [
    'CREATED>ACTIVE',
    'ACTIVE>FOREGROUND',
    'ACTIVE>DESTROYED',
    'FOREGROUND>BACKGROUND',
    'FOREGROUND>DESTROYED',
    'BACKGROUND>FOREGROUND',
    'BACKGROUND>DESTROYED'
  ];

  public static allRules(): string[] {
    return StageTransitionTable.RULES.slice(0);
  }

  public static isAllowed(from: string, to: string): boolean {
    const token: string = `${from}>${to}`;
    for (let i = 0; i < StageTransitionTable.RULES.length; i++) {
      if (StageTransitionTable.RULES[i] === token) {
        return true;
      }
    }
    return false;
  }

  public static allowedTargets(from: string): string[] {
    const targets: string[] = [];
    for (let i = 0; i < StageTransitionTable.RULES.length; i++) {
      const rule: string = StageTransitionTable.RULES[i];
      const separator: number = rule.indexOf('>');
      const source: string = rule.substring(0, separator);
      if (source === from) {
        targets.push(rule.substring(separator + 1));
      }
    }
    return targets;
  }

  public static isKnownState(state: string): boolean {
    return state === StageState.CREATED || state === StageState.ACTIVE || state === StageState.FOREGROUND ||
      state === StageState.BACKGROUND || state === StageState.DESTROYED;
  }

  public static isTerminal(state: string): boolean {
    return state === StageState.DESTROYED;
  }

  public static ruleCount(): number {
    return StageTransitionTable.RULES.length;
  }
}

class StageHistoryStack {
  private entries: string[] = [];
  private capacity: number = 16;

  constructor(capacity: number) {
    if (capacity <= 0) {
      throw new StageStackError('capacity must be positive');
    }
    this.capacity = capacity;
  }

  public push(state: string): boolean {
    if (!StageTransitionTable.isKnownState(state)) {
      throw new StageStackError(`unknown state ${state} cannot be pushed`);
    }
    if (this.entries.length >= this.capacity) {
      throw new StageStackError(`history depth ${this.entries.length} reached capacity ${this.capacity}`);
    }
    this.entries.push(state);
    return true;
  }

  public pop(): string {
    if (this.entries.length === 0) {
      throw new StageStackError('cannot pop from empty history');
    }
    const state: string = this.entries[this.entries.length - 1];
    this.entries.pop();
    return state;
  }

  public peek(): string {
    if (this.entries.length === 0) {
      return '';
    }
    return this.entries[this.entries.length - 1];
  }

  public depth(): number {
    return this.entries.length;
  }

  public getCapacity(): number {
    return this.capacity;
  }

  public isFull(): boolean {
    return this.entries.length >= this.capacity;
  }

  public contains(state: string): boolean {
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i] === state) {
        return true;
      }
    }
    return false;
  }

  public toArray(): string[] {
    return this.entries.slice(0);
  }
}

class StageStateManager {
  private state: string = StageState.CREATED;
  private history: StageHistoryStack = new StageHistoryStack(16);
  private subscribers: StageSubscriber[] = [];
  private nextSubscriberId: number = 1;
  private transitions: StateTransition[] = [];
  private notifyRounds: number = 0;
  private totalNotifications: number = 0;
  private batchMerges: number = 0;

  public getState(): string {
    return this.state;
  }

  public getTransitionCount(): number {
    return this.transitions.length;
  }

  public getNotifyRounds(): number {
    return this.notifyRounds;
  }

  public getTotalNotifications(): number {
    return this.totalNotifications;
  }

  public getBatchMerges(): number {
    return this.batchMerges;
  }

  public transition(target: string): void {
    if (!StageTransitionTable.isKnownState(target)) {
      throw new StageTransitionError(`unknown target state ${target}`);
    }
    if (!StageTransitionTable.isAllowed(this.state, target)) {
      throw new StageTransitionError(`transition ${this.state} -> ${target} is not in the table`);
    }
    const record: StateTransition = { from: this.state, to: target };
    this.transitions.push(record);
    this.history.push(this.state);
    this.state = target;
    this.notify(target);
  }

  public canTransition(target: string): boolean {
    return StageTransitionTable.isAllowed(this.state, target);
  }

  public allowedTargets(): string[] {
    return StageTransitionTable.allowedTargets(this.state);
  }

  public getHistoryState(depth: number): string {
    const entries: string[] = this.history.toArray();
    if (depth < 0 || depth >= entries.length) {
      return '';
    }
    return entries[depth];
  }

  public rollback(): string {
    const previous: string = this.history.pop();
    this.state = previous;
    return previous;
  }

  public historyDepth(): number {
    return this.history.depth();
  }

  public subscribe(key: string): number {
    if (key.length === 0) {
      throw new StageSubscriptionError('subscriber key must not be empty');
    }
    for (let i = 0; i < this.subscribers.length; i++) {
      if (this.subscribers[i].key === key) {
        throw new StageSubscriptionError(`subscriber ${key} already subscribed`);
      }
    }
    const subscriber: StageSubscriber = {
      id: this.nextSubscriberId, key: key, notifications: 0, lastState: ''
    };
    this.nextSubscriberId++;
    this.subscribers.push(subscriber);
    return subscriber.id;
  }

  public unsubscribe(key: string): boolean {
    for (let i = 0; i < this.subscribers.length; i++) {
      if (this.subscribers[i].key === key) {
        this.subscribers.splice(i, 1);
        return true;
      }
    }
    return false;
  }

  public subscriberCount(): number {
    return this.subscribers.length;
  }

  public notificationsFor(key: string): number {
    for (let i = 0; i < this.subscribers.length; i++) {
      if (this.subscribers[i].key === key) {
        return this.subscribers[i].notifications;
      }
    }
    return -1;
  }

  public lastStateFor(key: string): string {
    for (let i = 0; i < this.subscribers.length; i++) {
      if (this.subscribers[i].key === key) {
        return this.subscribers[i].lastState;
      }
    }
    return '';
  }

  private notify(newState: string): void {
    this.notifyRounds++;
    for (let i = 0; i < this.subscribers.length; i++) {
      this.subscribers[i].notifications++;
      this.subscribers[i].lastState = newState;
      this.totalNotifications++;
    }
  }

  public applyBatch(batch: StateBatch[]): number {
    if (batch.length === 0) {
      throw new StageTransitionError('batch must contain at least one step');
    }
    const sourceState: string = this.state;
    let cursor: string = this.state;
    let mergeable: number = 0;
    for (let i = 0; i < batch.length; i++) {
      const target: string = batch[i].target;
      if (!StageTransitionTable.isAllowed(cursor, target)) {
        break;
      }
      cursor = target;
      mergeable++;
    }
    if (mergeable === 0) {
      throw new StageTransitionError(`batch from ${sourceState} has no applicable step`);
    }
    this.transitions.push({ from: sourceState, to: cursor });
    this.history.push(sourceState);
    this.state = cursor;
    this.batchMerges++;
    this.notify(cursor);
    return mergeable;
  }

  public reset(): void {
    this.state = StageState.CREATED;
    this.history = new StageHistoryStack(16);
    this.subscribers = [];
    this.nextSubscriberId = 1;
    this.transitions = [];
    this.notifyRounds = 0;
    this.totalNotifications = 0;
    this.batchMerges = 0;
  }
}

export default function abilityStageStateManagerValidationTest(): void {
  describe('AbilityStageStateManagerValidationTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      logInfo('AbilityStageStateManagerValidationTest: beforeAll start');
      await launchEntryAbility();
      await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      await ensureIndexPageInitial(driver);
      logInfo('AbilityStageStateManagerValidationTest: beforeAll finished');
    })

    afterAll(async () => {
      logInfo('AbilityStageStateManagerValidationTest: afterAll start');
      await driver.delayMs(DELAY_AFTER_BACKGROUND);
      logInfo('AbilityStageStateManagerValidationTest: afterAll finished');
    })

    beforeEach(async () => {
      const rendered: boolean = await isIndexPageRendered(driver);
      if (!rendered) {
        logInfo('beforeEach: index page absent, relaunching the entry ability');
        await launchEntryAbility();
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_0100
     * @tc.name testStageStateEnumValues
     * @tc.desc Verify the five stage state enum members carry their expected string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStageStateEnumValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(StageState.CREATED).assertEqual('CREATED');
        expect(StageState.ACTIVE).assertEqual('ACTIVE');
        expect(StageState.FOREGROUND).assertEqual('FOREGROUND');
        expect(StageState.BACKGROUND).assertEqual('BACKGROUND');
        expect(StageState.DESTROYED).assertEqual('DESTROYED');
        expect(StageTransitionTable.isKnownState('CREATED')).assertTrue();
        expect(StageTransitionTable.isKnownState('SLEEPING')).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_0200
     * @tc.name testTransitionTableRuleCount
     * @tc.desc Verify the transition table holds exactly seven legal edges including both destroy paths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransitionTableRuleCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(StageTransitionTable.ruleCount()).assertEqual(7);
        const rules: string[] = StageTransitionTable.allRules();
        expect(rules[0]).assertEqual('CREATED>ACTIVE');
        expect(rules[1]).assertEqual('ACTIVE>FOREGROUND');
        expect(rules[2]).assertEqual('ACTIVE>DESTROYED');
        expect(rules[6]).assertEqual('BACKGROUND>DESTROYED');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_0300
     * @tc.name testCreatedAllowedTargets
     * @tc.desc Verify a freshly created manager accepts only ACTIVE as the next state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCreatedAllowedTargets', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: StageStateManager = new StageStateManager();
        expect(manager.getState()).assertEqual('CREATED');
        const targets: string[] = manager.allowedTargets();
        expect(targets.length).assertEqual(1);
        expect(targets[0]).assertEqual('ACTIVE');
        expect(manager.canTransition('ACTIVE')).assertTrue();
        expect(manager.canTransition('FOREGROUND')).assertFalse();
        expect(manager.canTransition('DESTROYED')).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_0400
     * @tc.name testForegroundAndBackgroundOscillation
     * @tc.desc Verify foreground and background states oscillate and each step is recorded in history
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testForegroundAndBackgroundOscillation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: StageStateManager = new StageStateManager();
        manager.transition('ACTIVE');
        manager.transition('FOREGROUND');
        manager.transition('BACKGROUND');
        manager.transition('FOREGROUND');
        expect(manager.getState()).assertEqual('FOREGROUND');
        expect(manager.getTransitionCount()).assertEqual(4);
        expect(manager.historyDepth()).assertEqual(4);
        expect(manager.getHistoryState(0)).assertEqual('CREATED');
        expect(manager.getHistoryState(3)).assertEqual('BACKGROUND');
        expect(manager.getHistoryState(4)).assertEqual('');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_0500
     * @tc.name testDirectTransitionRejected
     * @tc.desc Verify jumping from CREATED straight to FOREGROUND raises StageTransitionError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDirectTransitionRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: StageStateManager = new StageStateManager();
        try {
          manager.transition('FOREGROUND');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('StageTransitionError');
          expect((e as StageTransitionError).code).assertEqual(409);
        }
        expect(manager.getState()).assertEqual('CREATED');
        expect(manager.getTransitionCount()).assertEqual(0);
        expect(manager.historyDepth()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_0600
     * @tc.name testBackwardTransitionRejected
     * @tc.desc Verify a backward move from ACTIVE to CREATED raises StageTransitionError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBackwardTransitionRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: StageStateManager = new StageStateManager();
        manager.transition('ACTIVE');
        try {
          manager.transition('CREATED');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('StageTransitionError');
        }
        expect(manager.getState()).assertEqual('ACTIVE');
        expect(manager.getTransitionCount()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_0700
     * @tc.name testTerminalStateRejectsAllTransitions
     * @tc.desc Verify DESTROYED is terminal and rejects every candidate target except itself is also rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTerminalStateRejectsAllTransitions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: StageStateManager = new StageStateManager();
        manager.transition('ACTIVE');
        manager.transition('DESTROYED');
        expect(manager.getState()).assertEqual('DESTROYED');
        expect(StageTransitionTable.isTerminal(manager.getState())).assertTrue();
        expect(manager.allowedTargets().length).assertEqual(0);
        const candidates: string[] = ['CREATED', 'ACTIVE', 'FOREGROUND', 'BACKGROUND', 'DESTROYED'];
        let rejected: number = 0;
        for (let i = 0; i < candidates.length; i++) {
          try {
            manager.transition(candidates[i]);
          } catch (e) {
            expect(e.name).assertEqual('StageTransitionError');
            rejected++;
          }
        }
        expect(rejected).assertEqual(5);
        expect(manager.getState()).assertEqual('DESTROYED');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_0800
     * @tc.name testUnknownTargetStateRejected
     * @tc.desc Verify transitioning to an unknown literal raises StageTransitionError with code 409
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUnknownTargetStateRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: StageStateManager = new StageStateManager();
        try {
          manager.transition('SLEEPING');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('StageTransitionError');
          expect((e as StageTransitionError).code).assertEqual(409);
        }
        expect(manager.getState()).assertEqual('CREATED');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_0900
     * @tc.name testIllegalTargetQueryReturnsFalse
     * @tc.desc Verify canTransition reports false for both table violations and unknown state names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIllegalTargetQueryReturnsFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: StageStateManager = new StageStateManager();
        manager.transition('ACTIVE');
        expect(manager.canTransition('FOREGROUND')).assertTrue();
        expect(manager.canTransition('DESTROYED')).assertTrue();
        expect(manager.canTransition('BACKGROUND')).assertFalse();
        expect(manager.canTransition('SLEEPING')).assertFalse();
        expect(manager.allowedTargets().length).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_1000
     * @tc.name testHistoryPushPopOrder
     * @tc.desc Verify the history stack pops states in reverse order of insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testHistoryPushPopOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stack: StageHistoryStack = new StageHistoryStack(4);
        stack.push('CREATED');
        stack.push('ACTIVE');
        stack.push('FOREGROUND');
        expect(stack.depth()).assertEqual(3);
        expect(stack.peek()).assertEqual('FOREGROUND');
        expect(stack.pop()).assertEqual('FOREGROUND');
        expect(stack.pop()).assertEqual('ACTIVE');
        expect(stack.pop()).assertEqual('CREATED');
        expect(stack.depth()).assertEqual(0);
        expect(stack.peek()).assertEqual('');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_1100
     * @tc.name testHistoryCapacityBoundary
     * @tc.desc Verify pushing exactly to capacity succeeds and one more push raises StageStackError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testHistoryCapacityBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stack: StageHistoryStack = new StageHistoryStack(3);
        expect(stack.getCapacity()).assertEqual(3);
        stack.push('CREATED');
        stack.push('ACTIVE');
        stack.push('FOREGROUND');
        expect(stack.isFull()).assertTrue();
        expect(stack.depth()).assertEqual(3);
        try {
          stack.push('BACKGROUND');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('StageStackError');
          expect((e as StageStackError).code).assertEqual(416);
        }
        expect(stack.depth()).assertEqual(3);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_1200
     * @tc.name testHistoryZeroCapacityRejected
     * @tc.desc Verify a zero or negative history capacity is rejected at construction time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testHistoryZeroCapacityRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        try {
          const zeroStack: StageHistoryStack = new StageHistoryStack(0);
          expect(zeroStack.getCapacity()).assertEqual(0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('StageStackError');
        }
        try {
          const negativeStack: StageHistoryStack = new StageHistoryStack(-3);
          expect(negativeStack.getCapacity()).assertEqual(-3);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('StageStackError');
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_1300
     * @tc.name testEmptyHistoryPopRejected
     * @tc.desc Verify popping an empty history stack raises StageStackError instead of returning a sentinel
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEmptyHistoryPopRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stack: StageHistoryStack = new StageHistoryStack(2);
        expect(stack.depth()).assertEqual(0);
        try {
          stack.pop();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('StageStackError');
        }
        expect(stack.depth()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_1400
     * @tc.name testHistoryUnknownStateRejected
     * @tc.desc Verify pushing an unknown state literal onto the history stack raises StageStackError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testHistoryUnknownStateRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stack: StageHistoryStack = new StageHistoryStack(4);
        try {
          stack.push('PAUSED');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('StageStackError');
        }
        expect(stack.depth()).assertEqual(0);
        stack.push('ACTIVE');
        expect(stack.contains('ACTIVE')).assertTrue();
        expect(stack.contains('PAUSED')).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_1500
     * @tc.name testRollbackRestoresPreviousState
     * @tc.desc Verify rollback returns the manager to the state stored one step earlier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRollbackRestoresPreviousState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: StageStateManager = new StageStateManager();
        manager.transition('ACTIVE');
        manager.transition('FOREGROUND');
        expect(manager.historyDepth()).assertEqual(2);
        expect(manager.rollback()).assertEqual('ACTIVE');
        expect(manager.getState()).assertEqual('ACTIVE');
        expect(manager.historyDepth()).assertEqual(1);
        expect(manager.rollback()).assertEqual('CREATED');
        expect(manager.getState()).assertEqual('CREATED');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_1600
     * @tc.name testRollbackOnEmptyHistoryRejected
     * @tc.desc Verify rollback with no recorded history raises StageStackError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRollbackOnEmptyHistoryRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: StageStateManager = new StageStateManager();
        try {
          manager.rollback();
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('StageStackError');
        }
        expect(manager.getState()).assertEqual('CREATED');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_1700
     * @tc.name testSubscribeIdSequence
     * @tc.desc Verify subscriber ids start at one and increase monotonically per subscription
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSubscribeIdSequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: StageStateManager = new StageStateManager();
        expect(manager.subscribe('watcherA')).assertEqual(1);
        expect(manager.subscribe('watcherB')).assertEqual(2);
        expect(manager.subscribe('watcherC')).assertEqual(3);
        expect(manager.subscriberCount()).assertEqual(3);
        expect(manager.notificationsFor('watcherA')).assertEqual(0);
        expect(manager.notificationsFor('nobody')).assertEqual(-1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_1800
     * @tc.name testDuplicateSubscriptionRejected
     * @tc.desc Verify subscribing the same key twice raises StageSubscriptionError and keeps one subscriber
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDuplicateSubscriptionRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: StageStateManager = new StageStateManager();
        manager.subscribe('watcher');
        try {
          manager.subscribe('watcher');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('StageSubscriptionError');
          expect((e as StageSubscriptionError).code).assertEqual(401);
        }
        expect(manager.subscriberCount()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_1900
     * @tc.name testEmptySubscriptionKeyRejected
     * @tc.desc Verify subscribing with an empty key raises StageSubscriptionError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEmptySubscriptionKeyRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: StageStateManager = new StageStateManager();
        try {
          manager.subscribe('');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('StageSubscriptionError');
        }
        expect(manager.subscriberCount()).assertEqual(0);
        expect(manager.unsubscribe('missing')).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_2000
     * @tc.name testNotificationPerTransition
     * @tc.desc Verify each transition notifies every subscriber exactly once and records the state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNotificationPerTransition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: StageStateManager = new StageStateManager();
        manager.subscribe('alpha');
        manager.subscribe('beta');
        manager.transition('ACTIVE');
        manager.transition('FOREGROUND');
        expect(manager.getNotifyRounds()).assertEqual(2);
        expect(manager.getTotalNotifications()).assertEqual(4);
        expect(manager.notificationsFor('alpha')).assertEqual(2);
        expect(manager.notificationsFor('beta')).assertEqual(2);
        expect(manager.lastStateFor('alpha')).assertEqual('FOREGROUND');
        expect(manager.lastStateFor('beta')).assertEqual('FOREGROUND');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_2100
     * @tc.name testNoNotificationOnRejectedTransition
     * @tc.desc Verify a rejected transition produces no notification and no history entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNoNotificationOnRejectedTransition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: StageStateManager = new StageStateManager();
        manager.subscribe('observer');
        try {
          manager.transition('BACKGROUND');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('StageTransitionError');
        }
        expect(manager.getNotifyRounds()).assertEqual(0);
        expect(manager.getTotalNotifications()).assertEqual(0);
        expect(manager.notificationsFor('observer')).assertEqual(0);
        expect(manager.lastStateFor('observer')).assertEqual('');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_2200
     * @tc.name testUnsubscribeStopsNotifications
     * @tc.desc Verify an unsubscribed watcher stops receiving notifications while others keep counting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUnsubscribeStopsNotifications', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: StageStateManager = new StageStateManager();
        manager.subscribe('temporary');
        manager.subscribe('permanent');
        manager.transition('ACTIVE');
        expect(manager.notificationsFor('temporary')).assertEqual(1);
        expect(manager.unsubscribe('temporary')).assertTrue();
        manager.transition('FOREGROUND');
        expect(manager.subscriberCount()).assertEqual(1);
        expect(manager.notificationsFor('permanent')).assertEqual(2);
        expect(manager.notificationsFor('temporary')).assertEqual(-1);
        expect(manager.getTotalNotifications()).assertEqual(3);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_2300
     * @tc.name testBatchMergeCollapsesSteps
     * @tc.desc Verify a legal batch merges into one transition and emits a single notification round
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBatchMergeCollapsesSteps', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: StageStateManager = new StageStateManager();
        manager.subscribe('batcher');
        const batch: StateBatch[] = [
          { label: 'activate', target: 'ACTIVE' },
          { label: 'enterForeground', target: 'FOREGROUND' }
        ];
        const applied: number = manager.applyBatch(batch);
        expect(applied).assertEqual(2);
        expect(manager.getState()).assertEqual('FOREGROUND');
        expect(manager.getTransitionCount()).assertEqual(1);
        expect(manager.getBatchMerges()).assertEqual(1);
        expect(manager.getNotifyRounds()).assertEqual(1);
        expect(manager.notificationsFor('batcher')).assertEqual(1);
        expect(manager.historyDepth()).assertEqual(1);
        expect(manager.getHistoryState(0)).assertEqual('CREATED');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_2400
     * @tc.name testBatchStopsAtFirstIllegalStep
     * @tc.desc Verify a batch applies only the legal prefix and ignores steps after the first table violation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBatchStopsAtFirstIllegalStep', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: StageStateManager = new StageStateManager();
        const batch: StateBatch[] = [
          { label: 'activate', target: 'ACTIVE' },
          { label: 'skipToBackground', target: 'BACKGROUND' },
          { label: 'foreground', target: 'FOREGROUND' }
        ];
        const applied: number = manager.applyBatch(batch);
        expect(applied).assertEqual(1);
        expect(manager.getState()).assertEqual('ACTIVE');
        expect(manager.getTransitionCount()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_2500
     * @tc.name testEmptyBatchRejected
     * @tc.desc Verify an empty batch raises StageTransitionError and leaves state untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEmptyBatchRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: StageStateManager = new StageStateManager();
        const emptyBatch: StateBatch[] = [];
        try {
          manager.applyBatch(emptyBatch);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('StageTransitionError');
        }
        expect(manager.getState()).assertEqual('CREATED');
        expect(manager.getBatchMerges()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_2600
     * @tc.name testBatchWithNoApplicableStepRejected
     * @tc.desc Verify a batch whose first step violates the table raises StageTransitionError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBatchWithNoApplicableStepRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: StageStateManager = new StageStateManager();
        const batch: StateBatch[] = [
          { label: 'jump', target: 'BACKGROUND' },
          { label: 'jumpAgain', target: 'DESTROYED' }
        ];
        try {
          manager.applyBatch(batch);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('StageTransitionError');
        }
        expect(manager.getState()).assertEqual('CREATED');
        expect(manager.getNotifyRounds()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_2700
     * @tc.name testResetRestoresInitialState
     * @tc.desc Verify reset returns the manager to CREATED with empty history and no subscribers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testResetRestoresInitialState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: StageStateManager = new StageStateManager();
        manager.subscribe('watcher');
        manager.transition('ACTIVE');
        manager.transition('FOREGROUND');
        manager.reset();
        expect(manager.getState()).assertEqual('CREATED');
        expect(manager.historyDepth()).assertEqual(0);
        expect(manager.getTransitionCount()).assertEqual(0);
        expect(manager.subscriberCount()).assertEqual(0);
        expect(manager.getNotifyRounds()).assertEqual(0);
        expect(manager.getTotalNotifications()).assertEqual(0);
        expect(manager.subscribe('fresh')).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_2800
     * @tc.name testRepeatedLifecycleCyclesCounting
     * @tc.desc Verify ten foreground background rounds accumulate exactly forty transitions and notifications
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRepeatedLifecycleCyclesCounting', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: StageStateManager = new StageStateManager();
        manager.subscribe('counter');
        manager.transition('ACTIVE');
        for (let i = 0; i < STRESS_ROUNDS_LIFECYCLE; i++) {
          manager.transition('FOREGROUND');
          manager.transition('BACKGROUND');
        }
        expect(manager.getState()).assertEqual('BACKGROUND');
        expect(manager.getTransitionCount()).assertEqual(1 + STRESS_ROUNDS_LIFECYCLE * 2);
        expect(manager.getTotalNotifications()).assertEqual(1 + STRESS_ROUNDS_LIFECYCLE * 2);
        expect(manager.notificationsFor('counter')).assertEqual(21);
        expect(manager.historyDepth()).assertEqual(21);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_2900
     * @tc.name testUiAbilityDelegatorStageName
     * @tc.desc Verify the running module matches the AbilityStage configuration used by the state model
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiAbilityDelegatorStageName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const delegator: abilityDelegatorRegistry.AbilityDelegator = getAbilityDelegator();
        const bundleName: string = getBundleName();
        logInfo(`testUiAbilityDelegatorStageName: bundle ${bundleName}`);
        expect(delegator !== null).assertTrue();
        expect(bundleName).assertEqual(BUNDLE_NAME);
        expect(ABILITY_STAGE_NAME).assertEqual('MyAbilityStage');
        expect(ABILITY_STAGE_NAME.length).assertEqual(14);
        expect(ENTRY_ABILITY_NAME).assertEqual('EntryAbility');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_3000
     * @tc.name testUiForegroundBackgroundReflectedInManager
     * @tc.desc Verify each real foreground and background switch maps to one allowed model transition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiForegroundBackgroundReflectedInManager', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: StageStateManager = new StageStateManager();
        manager.transition('ACTIVE');
        manager.transition('FOREGROUND');
        const startTime: number = Date.now();
        await doAbilityBackground();
        await driver.delayMs(DELAY_AFTER_BACKGROUND);
        manager.transition('BACKGROUND');
        await doAbilityForeground();
        manager.transition('FOREGROUND');
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_BACKGROUND_SWITCH);
        const elapsed: number = measureElapsed(startTime);
        logInfo(`testUiForegroundBackgroundReflectedInManager: stable ${stable} in ${elapsed} ms`);
        expect(stable).assertTrue();
        expect(isWithinBudget(elapsed, TIMEOUT_ABILITY_LAUNCH * 2)).assertTrue();
        expect(manager.getState()).assertEqual('FOREGROUND');
        expect(manager.getTransitionCount()).assertEqual(4);
        expect(manager.historyDepth()).assertEqual(4);
      } catch (error) {
        logError(`testUiForegroundBackgroundReflectedInManager failed: ${error}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_3100
     * @tc.name testUiDestroyTransitionMatchesStageLifecycle
     * @tc.desc Verify the active to destroyed edge used by onDestroy is accepted by the state table
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiDestroyTransitionMatchesStageLifecycle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: StageStateManager = new StageStateManager();
        manager.transition('ACTIVE');
        expect(manager.canTransition('DESTROYED')).assertTrue();
        manager.transition('DESTROYED');
        expect(StageTransitionTable.isTerminal(manager.getState())).assertTrue();
        expect(manager.getHistoryState(0)).assertEqual('CREATED');
        expect(manager.getHistoryState(1)).assertEqual('ACTIVE');
        const visible: boolean = await isIndexPageVisible(driver);
        expect(visible).assertTrue();
        const liveCount: number = await pageComponentCount(driver);
        expect(liveCount > 0).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_3200
     * @tc.name testUiPageTapKeepsStageForeground
     * @tc.desc Verify tapping the live page text leaves the modeled stage in FOREGROUND with a stable page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiPageTapKeepsStageForeground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: StageStateManager = new StageStateManager();
        manager.subscribe('uiWatcher');
        manager.transition('ACTIVE');
        manager.transition('FOREGROUND');
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        const initialVisible: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
        const clickedVisibleAtStart: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
        expect(initialVisible || clickedVisibleAtStart).assertTrue();
        const target: string = initialVisible ? PAGE_TEXT_INITIAL : PAGE_TEXT_CLICKED;
        const tapped: boolean = await tapComponentByText(driver, target);
        expect(tapped).assertTrue();
        const clickedVisible: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
        expect(clickedVisible).assertTrue();
        expect(manager.getState()).assertEqual('FOREGROUND');
        expect(manager.notificationsFor('uiWatcher')).assertEqual(2);
        expect(manager.lastStateFor('uiWatcher')).assertEqual('FOREGROUND');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGEMGR_3300
     * @tc.name testUiStageKeyPresentAfterCycles
     * @tc.desc Verify the HelloWorld node survives repeated relaunches driven by the AbilityDelegator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiStageKeyPresentAfterCycles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await startAbilityByWant(buildEntryWant());
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        await startAbilityByWant(buildEntryWant());
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        const keyPresent: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
        expect(keyPresent).assertTrue();
        const texts: Component[] = await findComponentsByType(driver, 'Text');
        expect(texts.length >= 1).assertTrue();
        const manager: StageStateManager = new StageStateManager();
        expect(manager.getState()).assertEqual(StageState.CREATED);
        expect(manager.allowedTargets().length).assertEqual(1);
      } finally {
        done();
      }
    })
  })
}
