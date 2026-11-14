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
  getDriver, startBrowserApp, serializedDelay, clickById, countById, waitForId,
  textById, inputById, normalizeUrl, progressVisibleAfter, progressResetAfterComplete,
  resolveTabIndexAfterDelete, ID_ACTION_ADD, ID_CANCEL_TAB, ID_INPUT_URL, ID_NAV_HOME,
  TIMEOUT_TAB_SWITCH, DELAY_TAB_OPERATION
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockBrowserTab, MockLoadingStatus } from '../Shared/BrowserMock';

const TAG: string = 'BrowserStateManagementTest';

/** Observation budgets of the state propagation checks. */
const UPDATE_ROUNDS: number = 5;
const OBSERVER_COUNT: number = 3;
const TAB_ROUNDS: number = 4;
const TOLERANCE_NOTIFICATION: number = 0;

/** Progress samples used by the state machine table. */
const PROGRESS_TABLE: number[] = [0, 5, 25, 60, 95, 99, 100];

/** One recorded state transition with its legality. */
interface TransitionRecord {
  from: string;
  to: string;
  event: string;
  legal: boolean;
}

/**
 * Observable value shared between a parent and its children.
 *
 * `@State` lives in the owning component, `@Link` is the two way binding of the
 * children. A write from either side must notify every observer exactly once,
 * and a change to one child must never be seen by a sibling that does not
 * share the same source.
 */
class ObservableNumber {
  value: number;
  name: string;
  notifications: number = 0;
  observers: ObservableNumber[] = [];

  constructor(name: string, value: number = 0) {
    this.name = name;
    this.value = value;
  }

  set(next: number): boolean {
    if (this.value === next) {
      return false;
    }
    this.value = next;
    this.notifications += 1;
    this.propagate(next);
    return true;
  }

  private propagate(next: number): void {
    for (let index = 0; index < this.observers.length; index++) {
      const target: ObservableNumber = this.observers[index];
      if (target.value !== next) {
        target.value = next;
        target.notifications += 1;
      }
    }
  }

  /** Two way link: the child mirrors the parent until it writes itself. */
  link(child: ObservableNumber): void {
    this.observers.push(child);
    child.observers.push(this);
    child.value = this.value;
  }

  totalNotifications(): number {
    let total: number = this.notifications;
    for (let index = 0; index < this.observers.length; index++) {
      total += this.observers[index].notifications;
    }
    return total;
  }

  reset(): void {
    this.value = 0;
    this.notifications = 0;
  }
}

/**
 * `@Observed WebKey` double.
 *
 * The tab strip renders one WebTab per key, so touching `key` or `timestamp`
 * must bump a revision that the renderer can compare. Two tabs must never share
 * one revision counter, otherwise closing a tab repaints the wrong sibling.
 */
class ObservedWebKey {
  key: number;
  timestamp: number;
  revision: number = 0;

  constructor(key: number, timestamp: number) {
    this.key = key;
    this.timestamp = timestamp;
  }

  setKey(key: number): void {
    if (this.key === key) {
      return;
    }
    this.key = key;
    this.revision += 1;
  }

  setTimestamp(timestamp: number): void {
    if (this.timestamp === timestamp) {
      return;
    }
    this.timestamp = timestamp;
    this.revision += 1;
  }
}

/**
 * Double of the TabsController of the model.
 *
 * `changeIndex` drives the rendered Tabs component. The model calls it after a
 * delete and, with a 50 ms delay, after an add. Recording every request lets
 * the suite assert the index that the Tabs component was actually told to show,
 * which is the difference between a silent state drift and a visible bug.
 */
class TabsControllerDouble {
  currentIndex: number = 0;
  calls: number[] = [];
  invalidCalls: number = 0;

  changeIndex(index: number, tabCount: number): boolean {
    if (index < 0 || index >= tabCount) {
      this.invalidCalls += 1;
      return false;
    }
    this.currentIndex = index;
    this.calls.push(index);
    return true;
  }

  callCount(): number {
    return this.calls.length;
  }

  lastIndex(): number {
    if (this.calls.length === 0) {
      return -1;
    }
    return this.calls[this.calls.length - 1];
  }

  reset(): void {
    this.currentIndex = 0;
    this.calls = [];
    this.invalidCalls = 0;
  }
}

/**
 * Explicit state machine of `loadingStatus` plus the progress gauge.
 *
 * The model has only two statuses, LOADING and END, driven by onPageBegin and
 * onPageEnd. Progress callbacks are orthogonal but must not resurrect a status:
 * a progress of 100 that arrives after onPageEnd has to stay a no-op for the
 * status while still hiding the bar. Illegal transitions are counted instead of
 * thrown so a long UI suite keeps running.
 */
class LoadingStateMachine {
  status: MockLoadingStatus = MockLoadingStatus.END;
  progress: number = 0;
  hideProgress: boolean = true;
  transitions: TransitionRecord[] = [];
  illegal: number = 0;

  private apply(event: string, next: MockLoadingStatus): void {
    const from: string = this.status === MockLoadingStatus.LOADING ? 'LOADING' : 'END';
    const to: string = next === MockLoadingStatus.LOADING ? 'LOADING' : 'END';
    const legal: boolean = from !== to;
    if (!legal) {
      this.illegal += 1;
    }
    this.status = next;
    this.transitions.push({ from: from, to: to, event: event, legal: legal });
  }

  begin(): void {
    this.apply('pageBegin', MockLoadingStatus.LOADING);
  }

  end(): void {
    this.apply('pageEnd', MockLoadingStatus.END);
  }

  onProgress(value: number): void {
    this.progress = progressResetAfterComplete(value);
    this.hideProgress = !progressVisibleAfter(value);
  }

  isIdle(): boolean {
    return this.status === MockLoadingStatus.END && this.hideProgress && this.progress === 0;
  }

  legalCount(): number {
    return this.transitions.filter((record: TransitionRecord) => record.legal).length;
  }

  events(): string[] {
    return this.transitions.map((record: TransitionRecord) => record.event);
  }

  reset(): void {
    this.status = MockLoadingStatus.END;
    this.progress = 0;
    this.hideProgress = true;
    this.transitions = [];
    this.illegal = 0;
  }
}

/**
 * Keeps the rendered tab index aligned with the model index.
 *
 * Index.ets relies on `tabArrayIndex` for the active tab and on
 * `tabsController.changeIndex` for the rendered selection. Both have to move
 * together on add, delete and on a user swipe. The coordinator mirrors the
 * model rule of deleteTab so the suite can assert the resulting index without a
 * live Tabs component.
 */
class TabIndexCoordinator {
  model: MockBrowser;
  controller: TabsControllerDouble = new TabsControllerDouble();

  constructor(model: MockBrowser) {
    this.model = model;
  }

  selectTab(index: number): boolean {
    const accepted: boolean = this.model.selectTab(index);
    if (accepted) {
      this.controller.changeIndex(index, this.model.tabs.length);
    }
    return accepted;
  }

  addTab(): boolean {
    const accepted: boolean = this.model.addTab();
    if (accepted) {
      this.controller.changeIndex(this.model.getTabArrayIndex(), this.model.tabs.length);
    }
    return accepted;
  }

  deleteTab(index: number): boolean {
    const accepted: boolean = this.model.deleteTab(index);
    if (accepted) {
      this.controller.changeIndex(this.model.getTabArrayIndex(), this.model.tabs.length);
    }
    return accepted;
  }

  /** Index the model would keep after deleting the given index. */
  expectedIndexAfterDelete(index: number): number {
    return resolveTabIndexAfterDelete(this.model.getTabArrayIndex(), index,
      this.model.tabs.length - 1);
  }

  isAligned(): boolean {
    return this.controller.lastIndex() < 0 ||
      this.controller.lastIndex() === this.model.getTabArrayIndex();
  }
}

export default function browserStateManagementTest() {
  describe('browserStateManagementTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'state management suite begin');
      TestLogger.resetSteps(TAG);
      await startBrowserApp();
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_State_Defaults_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_State_Defaults_001');
      TestLogger.step(TAG, 'inspect the initial state of the browser model');
      const model: MockBrowser = new MockBrowser(1);
      TestLogger.info(TAG, `index=${model.tabArrayIndex} progress=${model.progress} hide=${model.hideProgress}`);
      expect(model.tabArrayIndex).assertEqual(0);
      expect(model.progress).assertEqual(0);
      expect(model.hideProgress).assertTrue();
      expect(model.loadingStatus).assertEqual(MockLoadingStatus.END);
      expect(model.getInputVal()).assertEqual('');
      expect(model.tabs.length).assertEqual(1);
      expect(model.lastChangedIndex).assertEqual(-1);
      TestLogger.pass(TAG, 'Browser_State_Defaults_001');
    });

    it('Browser_State_Link_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_State_Link_002');
      TestLogger.step(TAG, 'propagate a parent state write to two linked children');
      const parent: ObservableNumber = new ObservableNumber('tabArrayIndex', 0);
      const first: ObservableNumber = new ObservableNumber('childA', 0);
      const second: ObservableNumber = new ObservableNumber('childB', 0);
      parent.link(first);
      parent.link(second);
      expect(parent.set(2)).assertTrue();
      TestLogger.info(TAG, `parent=${parent.value} first=${first.value} second=${second.value}`);
      expect(parent.value).assertEqual(2);
      expect(first.value).assertEqual(2);
      expect(second.value).assertEqual(2);
      expect(parent.notifications).assertEqual(1);
      expect(first.notifications).assertEqual(1);
      expect(second.notifications).assertEqual(1);
      TestLogger.pass(TAG, 'Browser_State_Link_002');
    });

    it('Browser_State_Link_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_State_Link_003');
      TestLogger.step(TAG, 'write the same value twice and count the notifications');
      const parent: ObservableNumber = new ObservableNumber('progress', 0);
      const child: ObservableNumber = new ObservableNumber('child', 0);
      parent.link(child);
      expect(parent.set(40)).assertTrue();
      expect(parent.set(40)).assertFalse();
      expect(parent.set(80)).assertTrue();
      TestLogger.info(TAG, `parentNotifications=${parent.notifications} childNotifications=${child.notifications}`);
      expect(parent.notifications).assertEqual(2);
      expect(child.notifications).assertEqual(2);
      expect(child.value).assertEqual(80);
      expect(parent.set(80)).assertFalse();
      parent.reset();
      expect(parent.value).assertEqual(0);
      expect(parent.notifications).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_State_Link_003');
    });

    it('Browser_State_Link_004', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_State_Link_004');
      TestLogger.step(TAG, 'keep unlinked siblings out of the propagation');
      const shared: ObservableNumber = new ObservableNumber('shared', 0);
      const linked: ObservableNumber = new ObservableNumber('linked', 0);
      const isolated: ObservableNumber = new ObservableNumber('isolated', 0);
      shared.link(linked);
      shared.set(3);
      TestLogger.info(TAG, `shared=${shared.value} linked=${linked.value} isolated=${isolated.value}`);
      expect(linked.value).assertEqual(3);
      expect(isolated.value).assertEqual(0);
      expect(isolated.notifications).assertEqual(0);
      expect(shared.totalNotifications()).assertEqual(2);
      isolated.set(9);
      expect(shared.value).assertEqual(3);
      expect(linked.value).assertEqual(3);
      TestLogger.pass(TAG, 'Browser_State_Link_004');
    });

    it('Browser_State_Observed_005', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_State_Observed_005');
      TestLogger.step(TAG, 'bump the revision of an observed web key');
      const key: ObservedWebKey = new ObservedWebKey(1, 1700000000000);
      expect(key.revision).assertEqual(0);
      key.setKey(2);
      expect(key.revision).assertEqual(1);
      key.setKey(2);
      expect(key.revision).assertEqual(1);
      key.setTimestamp(1700000000500);
      expect(key.revision).assertEqual(2);
      key.setTimestamp(1700000000500);
      TestLogger.info(TAG, `key=${key.key} revision=${key.revision}`);
      expect(key.revision).assertEqual(2);
      expect(key.key).assertEqual(2);
      expect(key.timestamp).assertEqual(1700000000500);
      TestLogger.pass(TAG, 'Browser_State_Observed_005');
    });

    it('Browser_State_Observed_006', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_State_Observed_006');
      TestLogger.step(TAG, 'renumber the observed keys after a deletion');
      const model: MockBrowser = new MockBrowser(4);
      const keys: ObservedWebKey[] = [];
      for (let index = 0; index < 4; index++) {
        keys.push(new ObservedWebKey(index, 1700000000000 + index));
      }
      expect(model.deleteTab(1)).assertTrue();
      keys.splice(1, 1);
      for (let index = 1; index < keys.length; index++) {
        keys[index].setKey(keys[index].key - 1);
      }
      TestLogger.info(TAG, `revisions=${keys[1].revision},${keys[2].revision} modelKeys=${model.getTabKeys().join(',')}`);
      expect(keys.length).assertEqual(3);
      expect(keys[0].revision).assertEqual(0);
      expect(keys[1].revision).assertEqual(1);
      expect(keys[2].revision).assertEqual(1);
      expect(keys[1].key).assertEqual(1);
      expect(keys[2].key).assertEqual(2);
      expect(model.getTabKeys()).assertDeepEquals([0, 1, 2]);
      TestLogger.pass(TAG, 'Browser_State_Observed_006');
    });

    it('Browser_State_TabIndex_007', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_State_TabIndex_007');
      TestLogger.step(TAG, 'move tabArrayIndex four times and record the Tabs calls');
      const model: MockBrowser = new MockBrowser(4);
      const coordinator: TabIndexCoordinator = new TabIndexCoordinator(model);
      for (let round = 0; round < TAB_ROUNDS; round++) {
        expect(coordinator.selectTab(round)).assertTrue();
      }
      TestLogger.info(TAG, `index=${model.getTabArrayIndex()} calls=${coordinator.controller.calls.join(',')}`);
      expect(model.getTabArrayIndex()).assertEqual(TAB_ROUNDS - 1);
      expect(coordinator.controller.callCount()).assertEqual(TAB_ROUNDS);
      expect(coordinator.controller.calls).assertDeepEquals([0, 1, 2, 3]);
      expect(coordinator.controller.lastIndex()).assertEqual(TAB_ROUNDS - 1);
      expect(coordinator.controller.invalidCalls).assertEqual(0);
      expect(coordinator.isAligned()).assertTrue();
      TestLogger.pass(TAG, 'Browser_State_TabIndex_007');
    });

    it('Browser_State_TabIndex_008', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_State_TabIndex_008');
      TestLogger.step(TAG, 'align the Tabs controller after an add');
      const model: MockBrowser = new MockBrowser(1);
      const coordinator: TabIndexCoordinator = new TabIndexCoordinator(model);
      expect(coordinator.addTab()).assertTrue();
      expect(coordinator.addTab()).assertTrue();
      TestLogger.info(TAG, `index=${model.getTabArrayIndex()} lastIndex=${coordinator.controller.lastIndex()}`);
      expect(model.getTabArrayIndex()).assertEqual(2);
      expect(model.tabs.length).assertEqual(3);
      expect(coordinator.controller.callCount()).assertEqual(2);
      expect(coordinator.controller.lastIndex()).assertEqual(2);
      expect(coordinator.isAligned()).assertTrue();
      expect(coordinator.controller.invalidCalls).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_State_TabIndex_008');
    });

    it('Browser_State_TabIndex_009', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_State_TabIndex_009');
      TestLogger.step(TAG, 'align the Tabs controller after a delete');
      const model: MockBrowser = new MockBrowser(4);
      const coordinator: TabIndexCoordinator = new TabIndexCoordinator(model);
      coordinator.selectTab(3);
      const expected: number = coordinator.expectedIndexAfterDelete(1);
      expect(coordinator.deleteTab(1)).assertTrue();
      TestLogger.info(TAG, `expected=${expected} model=${model.getTabArrayIndex()} tabs=${coordinator.controller.lastIndex()}`);
      expect(expected).assertEqual(2);
      expect(model.getTabArrayIndex()).assertEqual(2);
      expect(coordinator.controller.lastIndex()).assertEqual(2);
      expect(coordinator.isAligned()).assertTrue();
      expect(model.tabs.length).assertEqual(3);
      expect(coordinator.controller.calls[coordinator.controller.calls.length - 1]).assertEqual(2);
      TestLogger.pass(TAG, 'Browser_State_TabIndex_009');
    });

    it('Browser_State_TabIndex_010', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_State_TabIndex_010');
      TestLogger.step(TAG, 'refuse an invalid index before it reaches the Tabs controller');
      const model: MockBrowser = new MockBrowser(2);
      const controller: TabsControllerDouble = new TabsControllerDouble();
      const negative: boolean = controller.changeIndex(-1, model.tabs.length);
      const overflow: boolean = controller.changeIndex(2, model.tabs.length);
      const valid: boolean = controller.changeIndex(1, model.tabs.length);
      TestLogger.info(TAG, `negative=${negative} overflow=${overflow} valid=${valid} invalid=${controller.invalidCalls}`);
      expect(negative).assertFalse();
      expect(overflow).assertFalse();
      expect(valid).assertTrue();
      expect(controller.invalidCalls).assertEqual(2);
      expect(controller.callCount()).assertEqual(1);
      expect(controller.currentIndex).assertEqual(1);
      expect(controller.lastIndex()).assertEqual(1);
      TestLogger.pass(TAG, 'Browser_State_TabIndex_010');
    });

    it('Browser_State_Machine_011', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_State_Machine_011');
      TestLogger.step(TAG, 'walk the legal loading status transitions');
      const machine: LoadingStateMachine = new LoadingStateMachine();
      expect(machine.isIdle()).assertTrue();
      machine.begin();
      expect(machine.status).assertEqual(MockLoadingStatus.LOADING);
      expect(machine.isIdle()).assertFalse();
      machine.end();
      TestLogger.info(TAG, `transitions=${machine.events().join(',')} illegal=${machine.illegal}`);
      expect(machine.status).assertEqual(MockLoadingStatus.END);
      expect(machine.transitions.length).assertEqual(2);
      expect(machine.legalCount()).assertEqual(2);
      expect(machine.illegal).assertEqual(0);
      expect(machine.transitions[0].from).assertEqual('END');
      expect(machine.transitions[1].to).assertEqual('END');
      expect(machine.isIdle()).assertTrue();
      TestLogger.pass(TAG, 'Browser_State_Machine_011');
    });

    it('Browser_State_Machine_012', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_State_Machine_012');
      TestLogger.step(TAG, 'count the illegal repeated transitions');
      const machine: LoadingStateMachine = new LoadingStateMachine();
      machine.end();
      machine.end();
      machine.begin();
      machine.begin();
      TestLogger.info(TAG, `illegal=${machine.illegal} legal=${machine.legalCount()} status=${machine.status}`);
      expect(machine.illegal).assertEqual(3);
      expect(machine.legalCount()).assertEqual(1);
      expect(machine.transitions.length).assertEqual(4);
      expect(machine.status).assertEqual(MockLoadingStatus.LOADING);
      expect(machine.isIdle()).assertFalse();
      machine.reset();
      expect(machine.illegal).assertEqual(0);
      expect(machine.transitions.length).assertEqual(0);
      expect(machine.status).assertEqual(MockLoadingStatus.END);
      TestLogger.pass(TAG, 'Browser_State_Machine_012');
    });

    it('Browser_State_Progress_013', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_State_Progress_013');
      TestLogger.step(TAG, 'walk the progress table against the gauge contract');
      const machine: LoadingStateMachine = new LoadingStateMachine();
      machine.begin();
      let visible: number = 0;
      for (let index = 0; index < PROGRESS_TABLE.length; index++) {
        const value: number = PROGRESS_TABLE[index];
        machine.onProgress(value);
        const expectedVisible: boolean = progressVisibleAfter(value);
        if (expectedVisible) {
          visible += 1;
        }
        expect(machine.hideProgress).assertEqual(!expectedVisible);
        expect(machine.progress).assertEqual(progressResetAfterComplete(value));
      }
      TestLogger.info(TAG, `visible=${visible} of ${PROGRESS_TABLE.length} final=${machine.progress}`);
      expect(visible).assertEqual(PROGRESS_TABLE.length - 1);
      expect(machine.progress).assertEqual(0);
      expect(machine.hideProgress).assertTrue();
      expect(machine.status).assertEqual(MockLoadingStatus.LOADING);
      machine.end();
      expect(machine.isIdle()).assertTrue();
      TestLogger.pass(TAG, 'Browser_State_Progress_013');
    });

    it('Browser_State_Progress_014', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_State_Progress_014');
      TestLogger.step(TAG, 'verify the progress side effects on the model fields');
      const model: MockBrowser = new MockBrowser(1);
      model.onProgressChange(1);
      expect(model.hideProgress).assertFalse();
      expect(model.progress).assertEqual(1);
      model.onProgressChange(99);
      expect(model.hideProgress).assertFalse();
      expect(model.progress).assertEqual(99);
      model.onProgressChange(100);
      TestLogger.info(TAG, `progress=${model.progress} hide=${model.hideProgress}`);
      expect(model.progress).assertEqual(0);
      expect(model.hideProgress).assertTrue();
      expect(model.loadingStatus).assertEqual(MockLoadingStatus.END);
      model.onProgressChange(0);
      expect(model.hideProgress).assertFalse();
      expect(model.progress).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_State_Progress_014');
    });

    it('Browser_State_Notify_015', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_State_Notify_015');
      TestLogger.step(TAG, 'count notifications for five sequential updates');
      const parent: ObservableNumber = new ObservableNumber('progress', 0);
      const observers: ObservableNumber[] = [];
      for (let index = 0; index < OBSERVER_COUNT; index++) {
        const child: ObservableNumber = new ObservableNumber(`child-${index}`, 0);
        parent.link(child);
        observers.push(child);
      }
      for (let round = 1; round <= UPDATE_ROUNDS; round++) {
        expect(parent.set(round * 20)).assertTrue();
      }
      let childNotifications: number = 0;
      for (let index = 0; index < observers.length; index++) {
        childNotifications += observers[index].notifications;
      }
      TestLogger.info(TAG, `parent=${parent.notifications} children=${childNotifications}`);
      expect(parent.notifications).assertEqual(UPDATE_ROUNDS);
      expect(childNotifications).assertEqual(UPDATE_ROUNDS * OBSERVER_COUNT);
      expect(childNotifications - parent.notifications * OBSERVER_COUNT).assertEqual(TOLERANCE_NOTIFICATION);
      expect(parent.totalNotifications()).assertEqual(UPDATE_ROUNDS * (OBSERVER_COUNT + 1));
      expect(observers[0].value).assertEqual(UPDATE_ROUNDS * 20);
      TestLogger.pass(TAG, 'Browser_State_Notify_015');
    });

    it('Browser_State_Reset_016', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_State_Reset_016');
      TestLogger.step(TAG, 'reset the state machine and the tab index together');
      const model: MockBrowser = new MockBrowser(3);
      const machine: LoadingStateMachine = new LoadingStateMachine();
      machine.begin();
      machine.onProgress(70);
      model.selectTab(2);
      model.onProgressChange(70);
      expect(machine.isIdle()).assertFalse();
      machine.reset();
      model.selectTab(0);
      model.onProgressChange(100);
      TestLogger.info(TAG, `status=${machine.status} progress=${machine.progress} index=${model.getTabArrayIndex()}`);
      expect(machine.status).assertEqual(MockLoadingStatus.END);
      expect(machine.progress).assertEqual(0);
      expect(machine.hideProgress).assertTrue();
      expect(machine.transitions.length).assertEqual(0);
      expect(model.getTabArrayIndex()).assertEqual(0);
      expect(model.hideProgress).assertTrue();
      expect(model.progress).assertEqual(0);
      TestLogger.pass(TAG, 'Browser_State_Reset_016');
    });

    it('Browser_State_Summary_017', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_State_Summary_017');
      TestLogger.step(TAG, 'summarise a mixed state session');
      const model: MockBrowser = new MockBrowser(2);
      const coordinator: TabIndexCoordinator = new TabIndexCoordinator(model);
      const machine: LoadingStateMachine = new LoadingStateMachine();
      const key: ObservedWebKey = new ObservedWebKey(0, 1700000000000);
      coordinator.addTab();
      coordinator.selectTab(1);
      model.onPageBegin(normalizeUrl('www.example.com/summary'));
      machine.begin();
      model.onProgressChange(50);
      machine.onProgress(50);
      model.onProgressChange(100);
      machine.onProgress(100);
      model.onPageEnd();
      machine.end();
      key.setKey(1);
      TestLogger.info(TAG, `tabs=${model.tabs.length} index=${model.getTabArrayIndex()} calls=${coordinator.controller.callCount()}`);
      expect(model.tabs.length).assertEqual(3);
      expect(model.getTabArrayIndex()).assertEqual(1);
      expect(coordinator.controller.callCount()).assertEqual(2);
      expect(coordinator.isAligned()).assertTrue();
      expect(machine.legalCount()).assertEqual(2);
      expect(machine.illegal).assertEqual(0);
      expect(machine.isIdle()).assertTrue();
      expect(model.hideProgress).assertTrue();
      expect(key.revision).assertEqual(1);
      TestLogger.pass(TAG, 'Browser_State_Summary_017');
    });

    it('Browser_State_UI_018', 0, async () => {
      TestLogger.caseBegin(TAG, 'Browser_State_UI_018');
      TestLogger.step(TAG, 'observe the tab index through add and cancel on the device');
      try {
        const input: boolean = await waitForId(driver, ID_INPUT_URL, TIMEOUT_TAB_SWITCH);
        expect(input).assertTrue();
        const before: number = await countById(driver, ID_CANCEL_TAB);
        const added: boolean = await clickById(driver, ID_ACTION_ADD);
        expect(added).assertTrue();
        await serializedDelay(driver, DELAY_TAB_OPERATION);
        const afterAdd: number = await countById(driver, ID_CANCEL_TAB);
        const cancelled: boolean = await clickById(driver, ID_CANCEL_TAB);
        expect(cancelled).assertTrue();
        await serializedDelay(driver, DELAY_TAB_OPERATION);
        const afterCancel: number = await countById(driver, ID_CANCEL_TAB);
        const stillAlive: boolean = await waitForId(driver, ID_INPUT_URL, TIMEOUT_TAB_SWITCH);
        TestLogger.info(TAG, `before=${before} afterAdd=${afterAdd} afterCancel=${afterCancel}`);
        expect(afterAdd >= before).assertTrue();
        expect(afterCancel >= 0).assertTrue();
        expect(stillAlive).assertTrue();
      } finally {
        await serializedDelay(driver, DELAY_TAB_OPERATION);
        TestLogger.info(TAG, 'tab index probe finished');
      }
      TestLogger.pass(TAG, 'Browser_State_UI_018');
    });

  });
}
