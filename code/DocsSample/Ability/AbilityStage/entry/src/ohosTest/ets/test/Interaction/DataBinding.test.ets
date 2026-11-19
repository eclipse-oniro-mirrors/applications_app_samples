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
import { Driver, ON, Component } from '@ohos.UiTest';
import {
  getDriver,
  ensureIndexPageInitial,
  logInfo,
  logError,
  launchEntryAbility,
  waitForIndexPageStable,
  waitForTextVisible,
  checkTextContent,
  checkComponentExistsByKey,
  tapComponentByText,
  collectAllTexts,
  runSerializedUiOperation,
  isIndexPageVisible,
  INDEX_PAGE_TEXT_KEY,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  DELAY_TOUCH_EVENT,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_TEXT_APPEAR
} from '../Shared/SharedDriver';

const INITIAL_TEXT_LENGTH: number = 11;

const CLICKED_TEXT_LENGTH: number = 7;

const HISTORY_CAPACITY: number = 8;

class BindingValueError extends Error {
  private readonly rejectedValue: string;

  constructor(rejectedValue: string) {
    super(`binding value rejected: ${rejectedValue}`);
    this.name = 'BindingValueError';
    this.rejectedValue = rejectedValue;
  }

  public getRejectedValue(): string {
    return this.rejectedValue;
  }
}

class ValueSnapshot {
  private readonly value: string;
  private readonly revision: number;

  constructor(value: string, revision: number) {
    this.value = value;
    this.revision = revision;
  }

  public getValue(): string {
    return this.value;
  }

  public getRevision(): number {
    return this.revision;
  }
}

class BindingListener {
  private readonly listenerId: string;
  private notifications: number = 0;
  private lastValue: string = '';
  private observedValues: string[] = [];

  constructor(listenerId: string) {
    this.listenerId = listenerId;
  }

  public getListenerId(): string {
    return this.listenerId;
  }

  public onValueChanged(value: string): void {
    this.notifications++;
    this.lastValue = value;
    this.observedValues.push(value);
  }

  public getNotifications(): number {
    return this.notifications;
  }

  public getLastValue(): string {
    return this.lastValue;
  }

  public getObservedValues(): string[] {
    return this.observedValues;
  }

  public reset(): void {
    this.notifications = 0;
    this.lastValue = '';
    this.observedValues = [];
  }
}

class ObservableValue {
  private value: string;
  private readonly initialValue: string;
  private revision: number = 0;
  private listeners: BindingListener[] = [];
  private history: string[] = [];

  constructor(initialValue: string) {
    if (initialValue.length === 0) {
      throw new BindingValueError(initialValue);
    }
    this.initialValue = initialValue;
    this.value = initialValue;
    this.history.push(initialValue);
  }

  public getValue(): string {
    return this.value;
  }

  public getInitialValue(): string {
    return this.initialValue;
  }

  public getRevision(): number {
    return this.revision;
  }

  public getHistory(): string[] {
    return this.history;
  }

  public getHistoryDepth(): number {
    return this.history.length;
  }

  public subscribe(listener: BindingListener): void {
    for (let i = 0; i < this.listeners.length; i++) {
      if (this.listeners[i].getListenerId() === listener.getListenerId()) {
        return;
      }
    }
    this.listeners.push(listener);
  }

  public getListenerCount(): number {
    return this.listeners.length;
  }

  private notify(value: string): void {
    for (let i = 0; i < this.listeners.length; i++) {
      this.listeners[i].onValueChanged(value);
    }
  }

  public setValue(nextValue: string): boolean {
    if (nextValue.length === 0) {
      throw new BindingValueError(nextValue);
    }
    if (nextValue === this.value) {
      return false;
    }
    this.value = nextValue;
    this.revision++;
    this.history.push(nextValue);
    if (this.history.length > HISTORY_CAPACITY) {
      this.history.shift();
    }
    this.notify(nextValue);
    return true;
  }

  public reset(): boolean {
    if (this.value === this.initialValue) {
      return false;
    }
    this.value = this.initialValue;
    this.revision++;
    this.history.push(this.initialValue);
    this.notify(this.initialValue);
    return true;
  }

  public rollbackTo(index: number): string {
    if (index < 0 || index >= this.history.length) {
      throw new BindingValueError(`history index ${index}`);
    }
    const restored: string = this.history[index];
    this.value = restored;
    this.revision++;
    this.notify(restored);
    return restored;
  }

  public snapshot(): ValueSnapshot {
    return new ValueSnapshot(this.value, this.revision);
  }

  public getLastHistoryEntry(): string {
    if (this.history.length === 0) {
      return '';
    }
    return this.history[this.history.length - 1];
  }
}

class MessageBindingModel {
  private readonly binding: ObservableValue;

  constructor(initialMessage: string) {
    this.binding = new ObservableValue(initialMessage);
  }

  public getBinding(): ObservableValue {
    return this.binding;
  }

  public getBoundText(): string {
    return this.binding.getValue();
  }

  public isClickTransitionAllowed(): boolean {
    return this.binding.getValue() === PAGE_TEXT_INITIAL;
  }

  public applyClick(): boolean {
    if (!this.isClickTransitionAllowed()) {
      return false;
    }
    return this.binding.setValue(PAGE_TEXT_CLICKED);
  }

  public applyClickIdempotent(): boolean {
    const changed: boolean = this.binding.setValue(PAGE_TEXT_CLICKED);
    return changed;
  }

  public revert(): boolean {
    return this.binding.reset();
  }

  public expectedLength(): number {
    if (this.binding.getValue() === PAGE_TEXT_INITIAL) {
      return INITIAL_TEXT_LENGTH;
    }
    return CLICKED_TEXT_LENGTH;
  }
}

async function readLiveText(driver: Driver): Promise<string> {
  return await runSerializedUiOperation(async (): Promise<string> => {
    const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
    return await component.getText();
  });
}

async function ensureWelcome(driver: Driver): Promise<void> {
  const current: string = await readLiveText(driver);
  if (current !== PAGE_TEXT_CLICKED) {
    await runSerializedUiOperation(async (): Promise<void> => {
      const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
      await component.click();
      await driver.delayMs(DELAY_TOUCH_EVENT);
    });
    await waitForTextVisible(driver, PAGE_TEXT_CLICKED, TIMEOUT_TEXT_APPEAR);
  }
}

export default function dataBindingTest(): void {
  describe('DataBindingTest', () => {
    let driver: Driver;


    beforeAll(async () => {
      driver = getDriver();
      logInfo('DataBindingTest: beforeAll start');
      await launchEntryAbility();
      await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      await ensureIndexPageInitial(driver);
      logInfo('DataBindingTest: beforeAll finished');
    })

    afterAll(async () => {
      logInfo('DataBindingTest: afterAll start');
      await driver.delayMs(100);
      logInfo('DataBindingTest: afterAll finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BINDING_0100
     * @tc.name testBindingInitialMessage
     * @tc.desc Verify a fresh binding holds Hello World with revision 0 and history depth 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBindingInitialMessage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: MessageBindingModel = new MessageBindingModel(PAGE_TEXT_INITIAL);
        expect(model.getBoundText()).assertEqual(PAGE_TEXT_INITIAL);
        expect(model.getBinding().getRevision()).assertEqual(0);
        expect(model.getBinding().getHistoryDepth()).assertEqual(1);
        expect(model.expectedLength()).assertEqual(INITIAL_TEXT_LENGTH);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BINDING_0200
     * @tc.name testBindingAssignWelcome
     * @tc.desc Verify assigning Welcome returns true, bumps revision to 1 and updates bound text length to 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBindingAssignWelcome', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: MessageBindingModel = new MessageBindingModel(PAGE_TEXT_INITIAL);
        const changed: boolean = model.getBinding().setValue(PAGE_TEXT_CLICKED);
        expect(changed).assertTrue();
        expect(model.getBoundText()).assertEqual(PAGE_TEXT_CLICKED);
        expect(model.getBinding().getRevision()).assertEqual(1);
        expect(model.expectedLength()).assertEqual(CLICKED_TEXT_LENGTH);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BINDING_0300
     * @tc.name testBindingClickTransition
     * @tc.desc Verify the click transition moves Hello World to Welcome once and is refused on the second click
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBindingClickTransition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: MessageBindingModel = new MessageBindingModel(PAGE_TEXT_INITIAL);
        expect(model.isClickTransitionAllowed()).assertTrue();
        expect(model.applyClick()).assertTrue();
        expect(model.isClickTransitionAllowed()).assertFalse();
        expect(model.applyClick()).assertFalse();
        expect(model.getBinding().getRevision()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BINDING_0400
     * @tc.name testBindingRepeatedSameValue
     * @tc.desc Verify assigning Welcome five times after the first change keeps revision at 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBindingRepeatedSameValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: MessageBindingModel = new MessageBindingModel(PAGE_TEXT_INITIAL);
        model.getBinding().setValue(PAGE_TEXT_CLICKED);
        let repeatsChanged: number = 0;
        for (let i = 0; i < 5; i++) {
          if (model.getBinding().setValue(PAGE_TEXT_CLICKED)) {
            repeatsChanged++;
          }
        }
        expect(repeatsChanged).assertEqual(0);
        expect(model.getBinding().getRevision()).assertEqual(1);
        expect(model.getBinding().getHistoryDepth()).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BINDING_0500
     * @tc.name testBindingStateRollback
     * @tc.desc Verify reverting after a Welcome assignment restores Hello World and raises revision to 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBindingStateRollback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: MessageBindingModel = new MessageBindingModel(PAGE_TEXT_INITIAL);
        model.applyClick();
        const reverted: boolean = model.revert();
        expect(reverted).assertTrue();
        expect(model.getBoundText()).assertEqual(PAGE_TEXT_INITIAL);
        expect(model.getBinding().getRevision()).assertEqual(2);
        expect(model.expectedLength()).assertEqual(INITIAL_TEXT_LENGTH);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BINDING_0600
     * @tc.name testBindingRollbackWhenAlreadyInitial
     * @tc.desc Verify reverting an untouched binding performs no change and keeps revision at 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBindingRollbackWhenAlreadyInitial', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: MessageBindingModel = new MessageBindingModel(PAGE_TEXT_INITIAL);
        expect(model.revert()).assertFalse();
        expect(model.getBinding().getRevision()).assertEqual(0);
        expect(model.getBoundText()).assertEqual(PAGE_TEXT_INITIAL);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BINDING_0700
     * @tc.name testBindingHistorySequence
     * @tc.desc Verify the value history tracks initial, clicked and reverted states in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBindingHistorySequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: MessageBindingModel = new MessageBindingModel(PAGE_TEXT_INITIAL);
        model.applyClick();
        model.revert();
        const history: string[] = model.getBinding().getHistory();
        expect(history.length).assertEqual(3);
        expect(history[0]).assertEqual(PAGE_TEXT_INITIAL);
        expect(history[1]).assertEqual(PAGE_TEXT_CLICKED);
        expect(history[2]).assertEqual(PAGE_TEXT_INITIAL);
        expect(model.getBinding().getLastHistoryEntry()).assertEqual(PAGE_TEXT_INITIAL);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BINDING_0800
     * @tc.name testBindingEmptyValueRejected
     * @tc.desc Verify an empty string assignment throws BindingValueError and leaves the bound text unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBindingEmptyValueRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: MessageBindingModel = new MessageBindingModel(PAGE_TEXT_INITIAL);
        try {
          model.getBinding().setValue('');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BindingValueError');
        }
        expect(model.getBoundText()).assertEqual(PAGE_TEXT_INITIAL);
        expect(model.getBinding().getRevision()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BINDING_0900
     * @tc.name testBindingEmptyInitialRejected
     * @tc.desc Verify constructing a binding with an empty initial value throws BindingValueError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBindingEmptyInitialRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        let constructed: boolean = false;
        try {
          const model: MessageBindingModel = new MessageBindingModel('');
          constructed = model.getBoundText().length === 0;
        } catch (e) {
          expect(e.name).assertEqual('BindingValueError');
        }
        expect(constructed).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BINDING_1000
     * @tc.name testBindingListenerNotification
     * @tc.desc Verify a subscriber receives exactly one notification carrying Welcome for a single change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBindingListenerNotification', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: MessageBindingModel = new MessageBindingModel(PAGE_TEXT_INITIAL);
        const listener: BindingListener = new BindingListener('ui-render');
        model.getBinding().subscribe(listener);
        model.getBinding().setValue(PAGE_TEXT_CLICKED);
        expect(listener.getNotifications()).assertEqual(1);
        expect(listener.getLastValue()).assertEqual(PAGE_TEXT_CLICKED);
        expect(model.getBinding().getListenerCount()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BINDING_1100
     * @tc.name testBindingListenerSilentOnSameValue
     * @tc.desc Verify a subscriber gets no notification when the same value is assigned again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBindingListenerSilentOnSameValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: MessageBindingModel = new MessageBindingModel(PAGE_TEXT_INITIAL);
        const listener: BindingListener = new BindingListener('history');
        model.getBinding().subscribe(listener);
        model.getBinding().setValue(PAGE_TEXT_INITIAL);
        expect(listener.getNotifications()).assertEqual(0);
        expect(listener.getLastValue()).assertEqual('');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BINDING_1200
     * @tc.name testBindingListenerDeduplicated
     * @tc.desc Verify subscribing the same listener id three times keeps one registration and one delivery
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBindingListenerDeduplicated', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: MessageBindingModel = new MessageBindingModel(PAGE_TEXT_INITIAL);
        const listener: BindingListener = new BindingListener('dedup');
        model.getBinding().subscribe(listener);
        model.getBinding().subscribe(listener);
        model.getBinding().subscribe(listener);
        expect(model.getBinding().getListenerCount()).assertEqual(1);
        model.getBinding().setValue(PAGE_TEXT_CLICKED);
        expect(listener.getNotifications()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BINDING_1300
     * @tc.name testBindingListenerObservedSequence
     * @tc.desc Verify one subscriber records the distinct values Welcome then Hello World after revert
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBindingListenerObservedSequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: MessageBindingModel = new MessageBindingModel(PAGE_TEXT_INITIAL);
        const listener: BindingListener = new BindingListener('sequence');
        model.getBinding().subscribe(listener);
        model.applyClick();
        model.revert();
        const observed: string[] = listener.getObservedValues();
        expect(observed.length).assertEqual(2);
        expect(observed[0]).assertEqual(PAGE_TEXT_CLICKED);
        expect(observed[1]).assertEqual(PAGE_TEXT_INITIAL);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BINDING_1400
     * @tc.name testBindingSnapshotCapturesState
     * @tc.desc Verify a snapshot taken at revision 1 keeps Welcome even after the binding is reverted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBindingSnapshotCapturesState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: MessageBindingModel = new MessageBindingModel(PAGE_TEXT_INITIAL);
        model.applyClick();
        const snapshot: ValueSnapshot = model.getBinding().snapshot();
        model.revert();
        expect(snapshot.getValue()).assertEqual(PAGE_TEXT_CLICKED);
        expect(snapshot.getRevision()).assertEqual(1);
        expect(model.getBoundText()).assertEqual(PAGE_TEXT_INITIAL);
        expect(model.getBinding().getRevision()).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BINDING_1500
     * @tc.name testBindingIdempotentClick
     * @tc.desc Verify the idempotent click helper reports false on a second identical Welcome write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBindingIdempotentClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: MessageBindingModel = new MessageBindingModel(PAGE_TEXT_INITIAL);
        expect(model.applyClickIdempotent()).assertTrue();
        expect(model.applyClickIdempotent()).assertFalse();
        expect(model.getBinding().getRevision()).assertEqual(1);
        expect(model.getBinding().getHistoryDepth()).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BINDING_1600
     * @tc.name testBindingHistoryCapacityBounded
     * @tc.desc Verify the retained history never exceeds the capacity of 8 entries under 12 assignments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBindingHistoryCapacityBounded', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: MessageBindingModel = new MessageBindingModel(PAGE_TEXT_INITIAL);
        for (let i = 0; i < 12; i++) {
          model.getBinding().setValue(`message-${i}`);
        }
        expect(model.getBinding().getHistoryDepth()).assertEqual(HISTORY_CAPACITY);
        expect(model.getBinding().getRevision()).assertEqual(12);
        expect(model.getBinding().getLastHistoryEntry()).assertEqual('message-11');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BINDING_1700
     * @tc.name testBindingRollbackOutOfRangeRejected
     * @tc.desc Verify a negative history index throws BindingValueError and keeps the current value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBindingRollbackOutOfRangeRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: MessageBindingModel = new MessageBindingModel(PAGE_TEXT_INITIAL);
        model.applyClick();
        try {
          model.getBinding().rollbackTo(-1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BindingValueError');
        }
        expect(model.getBoundText()).assertEqual(PAGE_TEXT_CLICKED);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BINDING_1800
     * @tc.name testBindingRollbackToHistoryEntry
     * @tc.desc Verify rolling back to history index 0 restores Hello World while keeping revision accounting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBindingRollbackToHistoryEntry', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const model: MessageBindingModel = new MessageBindingModel(PAGE_TEXT_INITIAL);
        model.applyClick();
        const restored: string = model.getBinding().rollbackTo(0);
        expect(restored).assertEqual(PAGE_TEXT_INITIAL);
        expect(model.getBoundText()).assertEqual(PAGE_TEXT_INITIAL);
        expect(model.getBinding().getRevision()).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BINDING_1900
     * @tc.name testBindingRealUiIdReachable
     * @tc.desc Verify the live page exposes the HelloWorld id and its text is one of the two bound states
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBindingRealUiIdReachable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        const idExists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
        expect(idExists).assertTrue();
        const boundText: string = await runSerializedUiOperation(
          async (): Promise<string> => {
            const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
            return await component.getText();
          });
        const isBoundState: boolean = boundText === PAGE_TEXT_INITIAL || boundText === PAGE_TEXT_CLICKED;
        expect(isBoundState).assertTrue();
        logInfo(`testBindingRealUiIdReachable: bound text ${boundText}`);
      } catch (e) {
        logError(`testBindingRealUiIdReachable failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BINDING_2000
     * @tc.name testBindingRealUiClickUpdatesText
     * @tc.desc Verify clicking the HelloWorld component drives the bound text to Welcome as read by getText
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBindingRealUiClickUpdatesText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        const beforeText: string = await runSerializedUiOperation(
          async (): Promise<string> => {
            const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
            return await component.getText();
          });
        const expectedBeforeLength: number =
          beforeText === PAGE_TEXT_INITIAL ? INITIAL_TEXT_LENGTH : CLICKED_TEXT_LENGTH;
        expect(beforeText.length).assertEqual(expectedBeforeLength);
        await runSerializedUiOperation(
          async (): Promise<void> => {
            const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
            await component.click();
            await driver.delayMs(DELAY_TOUCH_EVENT);
          });
        const afterText: string = await runSerializedUiOperation(
          async (): Promise<string> => {
            const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
            return await component.getText();
          });
        expect(afterText).assertEqual(PAGE_TEXT_CLICKED);
        expect(afterText.length).assertEqual(CLICKED_TEXT_LENGTH);
      } catch (e) {
        logError(`testBindingRealUiClickUpdatesText failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BINDING_2100
     * @tc.name testBindingRealUiWelcomeVisible
     * @tc.desc Verify the Welcome text is visible on the live page after the click binding has fired
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBindingRealUiWelcomeVisible', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await ensureWelcome(driver);
        const clickedVisible: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
        expect(clickedVisible).assertTrue();
        const initialVisible: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
        expect(initialVisible).assertFalse();
        logInfo(`testBindingRealUiWelcomeVisible: clicked ${clickedVisible} initial ${initialVisible}`);
      } catch (e) {
        logError(`testBindingRealUiWelcomeVisible failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BINDING_2200
     * @tc.name testBindingRealUiTapByText
     * @tc.desc Verify tapping the Welcome text through tapComponentByText keeps the bound state Welcome
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBindingRealUiTapByText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await ensureWelcome(driver);
        const tapped: boolean = await tapComponentByText(driver, PAGE_TEXT_CLICKED);
        expect(tapped).assertTrue();
        const stillVisible: boolean = await waitForTextVisible(driver, PAGE_TEXT_CLICKED, TIMEOUT_TEXT_APPEAR);
        expect(stillVisible).assertTrue();
        const initialAbsent: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
        expect(initialAbsent).assertFalse();
      } catch (e) {
        logError(`testBindingRealUiTapByText failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BINDING_2300
     * @tc.name testBindingRealUiCollectedTextMatchesState
     * @tc.desc Verify collected live texts include exactly the current bound message and never the stale one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBindingRealUiCollectedTextMatchesState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await ensureWelcome(driver);
        const texts: string[] = await collectAllTexts(driver);
        let clickedCount: number = 0;
        let initialCount: number = 0;
        for (let i = 0; i < texts.length; i++) {
          if (texts[i] === PAGE_TEXT_CLICKED) {
            clickedCount++;
          }
          if (texts[i] === PAGE_TEXT_INITIAL) {
            initialCount++;
          }
        }
        expect(clickedCount).assertEqual(1);
        expect(initialCount).assertEqual(0);
        logInfo(`testBindingRealUiCollectedTextMatchesState: ${texts.length} texts collected`);
      } catch (e) {
        logError(`testBindingRealUiCollectedTextMatchesState failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BINDING_2400
     * @tc.name testBindingRealUiStateTolerantEntry
     * @tc.desc Verify the live page is reachable and reports a known binding state at test entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBindingRealUiStateTolerantEntry', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const visible: boolean = await isIndexPageVisible(driver);
        expect(visible).assertTrue();
        const hasKnownState: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL) ||
          await checkTextContent(driver, PAGE_TEXT_CLICKED);
        expect(hasKnownState).assertTrue();
      } catch (e) {
        logError(`testBindingRealUiStateTolerantEntry failed: ${e}`);
        expect().assertFail();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BINDING_2500
     * @tc.name testBindingModelIndependentOfUi
     * @tc.desc Verify two model instances keep isolated revisions while the live page state is unaffected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBindingModelIndependentOfUi', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const first: MessageBindingModel = new MessageBindingModel(PAGE_TEXT_INITIAL);
        const second: MessageBindingModel = new MessageBindingModel(PAGE_TEXT_INITIAL);
        first.applyClick();
        first.applyClick();
        expect(first.getBinding().getRevision()).assertEqual(1);
        expect(second.getBinding().getRevision()).assertEqual(0);
        expect(second.getBoundText()).assertEqual(PAGE_TEXT_INITIAL);
        await ensureWelcome(driver);
        const stillVisible: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
        expect(stillVisible).assertTrue();
      } finally {
        done();
      }
    })
  })
}
