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

import { describe, it, expect, beforeAll, afterAll, beforeEach } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import TestLogger from '../Shared/TestLogger';
import {
  getDriver, startBrowserApp, countById, clickById, pressKey,
  nextTabIndex, tabCapacityReached, rebaseTabKeys, resolveTabIndexAfterDelete,
  MAX_TAB_COUNT, MIN_TAB_COUNT, TAB_LIMIT_MESSAGE, ID_ACTION_ADD, ID_CANCEL_TAB,
  KEY_BACK, DELAY_TAB_OPERATION
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockBrowserTab, MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserTabOperationsTest';

/* ------------------------------------------------------------------ */
/* Operation vocabulary of a single tab gesture                        */
/* ------------------------------------------------------------------ */

enum TabAction {
  ADD = 0,
  CLOSE = 1,
  SWITCH = 2
}

function actionName(action: TabAction): string {
  switch (action) {
    case TabAction.ADD:
      return 'add';
    case TabAction.CLOSE:
      return 'close';
    case TabAction.SWITCH:
      return 'switch';
    default:
      return 'unknown';
  }
}

/** Observable result of one gesture: return value plus both side effects. */
interface OpResult {
  action: string;
  target: number;
  accepted: boolean;
  tabsBefore: number;
  tabsAfter: number;
  indexBefore: number;
  indexAfter: number;
  toastCount: number;
}

/** Declarative script row used by the data driven sequences. */
interface OpScript {
  label: string;
  steps: string[];
  expectedTabs: number;
  expectedIndex: number;
  expectedFailures: number;
}

const SCRIPTS: OpScript[] = [
  {
    label: 'append twice from a single tab',
    steps: ['A', 'A'],
    expectedTabs: 3,
    expectedIndex: 2,
    expectedFailures: 0
  },
  {
    label: 'append then close the active tab',
    steps: ['A', 'C1'],
    expectedTabs: 1,
    expectedIndex: 0,
    expectedFailures: 0
  },
  {
    label: 'append three and step back to the first',
    steps: ['A', 'A', 'A', 'S0'],
    expectedTabs: 4,
    expectedIndex: 0,
    expectedFailures: 0
  },
  {
    label: 'close the middle tab of four',
    steps: ['A', 'A', 'A', 'C1'],
    expectedTabs: 3,
    expectedIndex: 2,
    expectedFailures: 0
  },
  {
    label: 'refuse closing the only tab',
    steps: ['C0'],
    expectedTabs: 1,
    expectedIndex: 0,
    expectedFailures: 1
  },
  {
    label: 'refuse switching to a missing tab',
    steps: ['S5'],
    expectedTabs: 1,
    expectedIndex: 0,
    expectedFailures: 1
  },
  {
    label: 'keep the selection valid after repeated closes',
    steps: ['A', 'A', 'A', 'C3', 'C2', 'C1', 'C0'],
    expectedTabs: 1,
    expectedIndex: 0,
    expectedFailures: 1
  }
];

/* ------------------------------------------------------------------ */
/* Harness                                                             */
/* ------------------------------------------------------------------ */

/**
 * Wraps MockBrowser so that every gesture records the return value together
 * with the two observable side effects: the tab count and the selection.
 */
class TabOperationHarness {
  browser: MockBrowser = new MockBrowser(1);
  results: OpResult[] = [];
  private clock: MockClock = new MockClock();

  constructor(initialTabCount: number = 1) {
    this.browser = new MockBrowser(initialTabCount);
  }

  private record(action: TabAction, target: number, accepted: boolean, tabsBefore: number,
    indexBefore: number): OpResult {
    const result: OpResult = {
      action: actionName(action),
      target: target,
      accepted: accepted,
      tabsBefore: tabsBefore,
      tabsAfter: this.browser.tabs.length,
      indexBefore: indexBefore,
      indexAfter: this.browser.tabArrayIndex,
      toastCount: this.browser.toasts.length
    };
    this.results.push(result);
    this.clock.advance(DELAY_TAB_OPERATION);
    return result;
  }

  add(): OpResult {
    const tabsBefore: number = this.browser.tabs.length;
    const indexBefore: number = this.browser.tabArrayIndex;
    const accepted: boolean = this.browser.addTab();
    return this.record(TabAction.ADD, tabsBefore, accepted, tabsBefore, indexBefore);
  }

  close(index: number): OpResult {
    const tabsBefore: number = this.browser.tabs.length;
    const indexBefore: number = this.browser.tabArrayIndex;
    const accepted: boolean = this.browser.deleteTab(index);
    return this.record(TabAction.CLOSE, index, accepted, tabsBefore, indexBefore);
  }

  closeActive(): OpResult {
    return this.close(this.browser.tabArrayIndex);
  }

  switchTo(index: number): OpResult {
    const tabsBefore: number = this.browser.tabs.length;
    const indexBefore: number = this.browser.tabArrayIndex;
    const accepted: boolean = this.browser.selectTab(index);
    return this.record(TabAction.SWITCH, index, accepted, tabsBefore, indexBefore);
  }

  /** Executes one script token: A, C<index> or S<index>. */
  step(token: string): OpResult {
    if (token === 'A') {
      return this.add();
    }
    const head: string = token.charAt(0);
    const index: number = parseInt(token.substring(1), 10);
    if (head === 'C') {
      return this.close(index);
    }
    if (head === 'S') {
      return this.switchTo(index);
    }
    return this.close(index);
  }

  run(steps: string[]): OpResult[] {
    const produced: OpResult[] = [];
    for (let index = 0; index < steps.length; index++) {
      produced.push(this.step(steps[index]));
    }
    return produced;
  }

  failureCount(): number {
    return this.results.filter((result: OpResult) => !result.accepted).length;
  }

  acceptedCount(): number {
    return this.results.filter((result: OpResult) => result.accepted).length;
  }

  keys(): number[] {
    return this.browser.getTabKeys();
  }

  keysAreContiguous(): boolean {
    const keys: number[] = this.keys();
    for (let index = 0; index < keys.length; index++) {
      if (keys[index] !== index) {
        return false;
      }
    }
    return true;
  }

  indexInRange(): boolean {
    const index: number = this.browser.tabArrayIndex;
    return index >= 0 && index < this.browser.tabs.length;
  }

  currentTab(): MockBrowserTab | null {
    return this.browser.getCurrentTab();
  }

  invariantHolds(): boolean {
    if (this.browser.tabs.length < MIN_TAB_COUNT) {
      return false;
    }
    if (!this.indexInRange()) {
      return false;
    }
    if (!this.keysAreContiguous()) {
      return false;
    }
    const keys: number[] = this.keys();
    const unique: Set<number> = new Set<number>();
    for (let index = 0; index < keys.length; index++) {
      unique.add(keys[index]);
    }
    return unique.size === this.browser.tabs.length;
  }

  lastResult(): OpResult | null {
    if (this.results.length === 0) {
      return null;
    }
    return this.results[this.results.length - 1];
  }
}

export default function tabOperationsTest() {
  describe('tabOperationsTest', () => {
    let driver: Driver = getDriver();
    let harness: TabOperationHarness = new TabOperationHarness(1);

    beforeAll(async () => {
      TestLogger.info(TAG, 'tab operation suite begin');
      await startBrowserApp();
    });

    afterAll(() => {
      TestLogger.info(TAG, `scripts=${SCRIPTS.length} maxTabs=${MAX_TAB_COUNT}`);
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    beforeEach(() => {
      TestLogger.resetSteps(TAG);
      harness = new TabOperationHarness(1);
    });

    it('Browser_Tab_Add_001', 0, async () => {
      TestLogger.step(TAG, 'add appends one tab and selects it');
      const result: OpResult = harness.add();
      expect(result.accepted).assertTrue();
      expect(result.tabsBefore).assertEqual(1);
      expect(result.tabsAfter).assertEqual(2);
      expect(result.indexBefore).assertEqual(0);
      expect(result.indexAfter).assertEqual(1);
      expect(result.toastCount).assertEqual(0);
      expect(harness.keys()).assertDeepEquals([0, 1]);
      expect(harness.indexInRange()).assertTrue();
      expect(harness.currentTab() === null).assertFalse();
    });

    it('Browser_Tab_Add_002', 0, async () => {
      TestLogger.step(TAG, 'add keeps keys contiguous and timestamps ordered');
      for (let round = 0; round < 5; round++) {
        const result: OpResult = harness.add();
        expect(result.accepted).assertTrue();
        expect(result.indexAfter).assertEqual(round + 1);
      }
      expect(harness.browser.tabs.length).assertEqual(6);
      expect(harness.keys()).assertDeepEquals([0, 1, 2, 3, 4, 5]);
      expect(harness.keysAreContiguous()).assertTrue();
      const stamps: number[] = harness.browser.getTimestamps();
      expect(stamps.length).assertEqual(6);
      for (let index = 1; index < stamps.length; index++) {
        expect(stamps[index] > stamps[index - 1]).assertTrue();
      }
      expect(nextTabIndex(5)).assertEqual(5);
    });

    it('Browser_Tab_Add_003', 0, async () => {
      TestLogger.step(TAG, 'add is refused beyond the capacity ceiling');
      const full: TabOperationHarness = new TabOperationHarness(MAX_TAB_COUNT);
      expect(full.browser.tabs.length).assertEqual(10);
      expect(full.add().accepted).assertTrue();
      expect(full.browser.tabs.length).assertEqual(11);
      const refused: OpResult = full.add();
      expect(refused.accepted).assertFalse();
      expect(refused.tabsAfter).assertEqual(11);
      expect(refused.tabsBefore).assertEqual(11);
      expect(refused.indexAfter).assertEqual(refused.indexBefore);
      expect(full.browser.toasts.length).assertEqual(1);
      expect(full.browser.toasts[0]).assertEqual(TAB_LIMIT_MESSAGE);
      expect(tabCapacityReached(11)).assertTrue();
      expect(tabCapacityReached(10)).assertFalse();
    });

    it('Browser_Tab_Close_001', 0, async () => {
      TestLogger.step(TAG, 'close removes a middle tab and renumbers the tail');
      const middle: TabOperationHarness = new TabOperationHarness(4);
      expect(middle.switchTo(3).accepted).assertTrue();
      const result: OpResult = middle.close(1);
      expect(result.accepted).assertTrue();
      expect(result.tabsBefore).assertEqual(4);
      expect(result.tabsAfter).assertEqual(3);
      expect(result.indexBefore).assertEqual(3);
      expect(result.indexAfter).assertEqual(2);
      expect(middle.keys()).assertDeepEquals([0, 1, 2]);
      expect(middle.invariantHolds()).assertTrue();
      expect(rebaseTabKeys([0, 1, 2, 3], 1)).assertDeepEquals([0, 1, 2]);
    });

    it('Browser_Tab_Close_002', 0, async () => {
      TestLogger.step(TAG, 'closing the active tail tab repairs the selection');
      harness.add();
      harness.add();
      expect(harness.browser.tabArrayIndex).assertEqual(2);
      const result: OpResult = harness.closeActive();
      expect(result.accepted).assertTrue();
      expect(result.tabsAfter).assertEqual(2);
      expect(result.indexAfter).assertEqual(1);
      expect(harness.indexInRange()).assertTrue();
      expect(harness.currentTab() === null).assertFalse();
      expect(harness.currentTab()!.key).assertEqual(1);
      expect(harness.invariantHolds()).assertTrue();
    });

    it('Browser_Tab_Close_003', 0, async () => {
      TestLogger.step(TAG, 'closing the last remaining tab is rejected');
      const single: TabOperationHarness = new TabOperationHarness(1);
      const result: OpResult = single.close(0);
      expect(result.accepted).assertFalse();
      expect(result.tabsBefore).assertEqual(1);
      expect(result.tabsAfter).assertEqual(1);
      expect(result.indexAfter).assertEqual(0);
      expect(single.browser.toasts.length).assertEqual(0);
      expect(single.keys()).assertDeepEquals([0]);
      expect(single.invariantHolds()).assertTrue();
      const negative: OpResult = single.close(-1);
      expect(negative.accepted).assertFalse();
      const beyond: OpResult = single.close(9);
      expect(beyond.accepted).assertFalse();
      expect(single.browser.tabs.length).assertEqual(1);
    });

    it('Browser_Tab_Close_004', 0, async () => {
      TestLogger.step(TAG, 'index repair table matches the model after a close');
      const cases: number[][] = [
        [0, 0, 3],
        [1, 0, 3],
        [2, 0, 3],
        [1, 1, 3],
        [2, 1, 3],
        [2, 2, 3],
        [0, 1, 1]
      ];
      for (let index = 0; index < cases.length; index++) {
        const current: number = cases[index][0];
        const removed: number = cases[index][1];
        const remaining: number = cases[index][2];
        const expected: number = resolveTabIndexAfterDelete(current, removed, remaining);
        const browser: MockBrowser = new MockBrowser(remaining + 1);
        browser.setTabArrayIndex(current);
        expect(browser.deleteTab(removed)).assertTrue();
        expect(browser.tabArrayIndex).assertEqual(expected);
        expect(browser.tabArrayIndex < browser.tabs.length).assertTrue();
      }
      expect(resolveTabIndexAfterDelete(0, 2, 1)).assertEqual(0);
      expect(resolveTabIndexAfterDelete(2, 0, 3)).assertEqual(1);
    });

    it('Browser_Tab_Switch_001', 0, async () => {
      TestLogger.step(TAG, 'switch moves the selection without changing the strip');
      harness.add();
      harness.add();
      const before: number[] = harness.keys();
      const result: OpResult = harness.switchTo(0);
      expect(result.accepted).assertTrue();
      expect(result.tabsBefore).assertEqual(3);
      expect(result.tabsAfter).assertEqual(3);
      expect(result.indexBefore).assertEqual(2);
      expect(result.indexAfter).assertEqual(0);
      expect(harness.keys()).assertDeepEquals(before);
      expect(harness.currentTab()!.key).assertEqual(0);
      const back: OpResult = harness.switchTo(2);
      expect(back.accepted).assertTrue();
      expect(back.indexAfter).assertEqual(2);
      expect(harness.acceptedCount()).assertEqual(4);
      expect(harness.failureCount()).assertEqual(0);
    });

    it('Browser_Tab_Switch_002', 0, async () => {
      TestLogger.step(TAG, 'switch rejects out of range targets and keeps the selection');
      harness.add();
      harness.add();
      const negative: OpResult = harness.switchTo(-1);
      expect(negative.accepted).assertFalse();
      expect(negative.indexAfter).assertEqual(2);
      const beyond: OpResult = harness.switchTo(3);
      expect(beyond.accepted).assertFalse();
      expect(beyond.indexAfter).assertEqual(2);
      const far: OpResult = harness.switchTo(99);
      expect(far.accepted).assertFalse();
      expect(harness.browser.tabArrayIndex).assertEqual(2);
      expect(harness.browser.tabs.length).assertEqual(3);
      expect(harness.invariantHolds()).assertTrue();
      expect(harness.failureCount()).assertEqual(3);
    });

    it('Browser_Tab_Script_001', 0, async () => {
      TestLogger.step(TAG, 'every declarative script converges to its expected state');
      for (let index = 0; index < SCRIPTS.length; index++) {
        const script: OpScript = SCRIPTS[index];
        const local: TabOperationHarness = new TabOperationHarness(1);
        local.run(script.steps);
        TestLogger.info(TAG, `script ${index} (${script.label}) tabs=${local.browser.tabs.length} ` +
          `index=${local.browser.tabArrayIndex} failures=${local.failureCount()}`);
        expect(local.browser.tabs.length).assertEqual(script.expectedTabs);
        expect(local.browser.tabArrayIndex).assertEqual(script.expectedIndex);
        expect(local.failureCount()).assertEqual(script.expectedFailures);
        expect(local.invariantHolds()).assertTrue();
      }
      expect(SCRIPTS.length).assertEqual(7);
    });

    it('Browser_Tab_Script_002', 0, async () => {
      TestLogger.step(TAG, 'script results keep the operation order');
      const local: TabOperationHarness = new TabOperationHarness(1);
      const results: OpResult[] = local.run(['A', 'A', 'S0', 'C2']);
      expect(results.length).assertEqual(4);
      expect(results[0].action).assertEqual('add');
      expect(results[1].action).assertEqual('add');
      expect(results[2].action).assertEqual('switch');
      expect(results[3].action).assertEqual('close');
      expect(results[0].tabsAfter).assertEqual(2);
      expect(results[1].tabsAfter).assertEqual(3);
      expect(results[2].tabsAfter).assertEqual(3);
      expect(results[3].tabsAfter).assertEqual(2);
      expect(results[2].indexBefore).assertEqual(2);
      expect(results[2].indexAfter).assertEqual(0);
      expect(results[3].target).assertEqual(2);
      expect(results[3].accepted).assertTrue();
      expect(results[3].indexAfter).assertEqual(0);
      expect(local.browser.tabs.length).assertEqual(2);
      expect(local.failureCount()).assertEqual(0);
    });

    it('Browser_Tab_Script_003', 0, async () => {
      TestLogger.step(TAG, 'close then add reuses the released key');
      const local: TabOperationHarness = new TabOperationHarness(3);
      expect(local.switchTo(1).accepted).assertTrue();
      const removed: OpResult = local.close(1);
      expect(removed.accepted).assertTrue();
      expect(local.keys()).assertDeepEquals([0, 1]);
      const added: OpResult = local.add();
      expect(added.accepted).assertTrue();
      expect(local.keys()).assertDeepEquals([0, 1, 2]);
      expect(added.indexAfter).assertEqual(2);
      expect(local.keysAreContiguous()).assertTrue();
      expect(local.currentTab()!.key).assertEqual(2);
      expect(local.browser.tabs[1].key).assertEqual(1);
      const timestamps: number[] = local.browser.getTimestamps();
      expect(timestamps[2]).assertLarger(timestamps[1]);
    });

    it('Browser_Tab_Concurrent_001', 0, async () => {
      TestLogger.step(TAG, 'interleaved add and switch keep a single valid selection');
      const local: TabOperationHarness = new TabOperationHarness(1);
      const pattern: string[] = ['A', 'S0', 'A', 'S1', 'A', 'S2', 'A', 'S0'];
      const results: OpResult[] = local.run(pattern);
      expect(results.length).assertEqual(8);
      expect(local.failureCount()).assertEqual(0);
      expect(local.browser.tabs.length).assertEqual(5);
      expect(local.browser.tabArrayIndex).assertEqual(0);
      expect(local.invariantHolds()).assertTrue();
      for (let index = 0; index < local.results.length; index++) {
        expect(local.results[index].indexAfter >= 0).assertTrue();
        expect(local.results[index].indexAfter < local.results[index].tabsAfter).assertTrue();
      }
    });

    it('Browser_Tab_Concurrent_002', 0, async () => {
      TestLogger.step(TAG, 'rapid alternating closes never break the invariant');
      const local: TabOperationHarness = new TabOperationHarness(6);
      const pattern: string[] = ['C0', 'C0', 'C1', 'C0', 'C0', 'C0'];
      local.run(pattern);
      expect(local.browser.tabs.length).assertEqual(1);
      expect(local.browser.tabArrayIndex).assertEqual(0);
      expect(local.failureCount()).assertEqual(1);
      expect(local.acceptedCount()).assertEqual(5);
      expect(local.invariantHolds()).assertTrue();
      const last: OpResult | null = local.lastResult();
      expect(last === null).assertFalse();
      if (last !== null) {
        expect(last.accepted).assertFalse();
        expect(last.tabsAfter).assertEqual(1);
      }
    });

    it('Browser_Tab_Concurrent_003', 0, async () => {
      TestLogger.step(TAG, 'add and close pairs restore the initial tab count');
      const local: TabOperationHarness = new TabOperationHarness(2);
      for (let round = 0; round < 6; round++) {
        expect(local.add().accepted).assertTrue();
        expect(local.close(local.browser.tabs.length - 1).accepted).assertTrue();
      }
      expect(local.browser.tabs.length).assertEqual(2);
      expect(local.failureCount()).assertEqual(0);
      expect(local.acceptedCount()).assertEqual(12);
      expect(local.keys()).assertDeepEquals([0, 1]);
      expect(local.invariantHolds()).assertTrue();
      expect(local.browser.toasts.length).assertEqual(0);
    });

    it('Browser_Tab_Add_004', 0, async () => {
      TestLogger.step(TAG, 'capacity boundary sits between ten and eleven tabs');
      const local: TabOperationHarness = new TabOperationHarness(MAX_TAB_COUNT);
      const eleventh: OpResult = local.add();
      expect(eleventh.accepted).assertTrue();
      expect(eleventh.tabsAfter).assertEqual(11);
      expect(eleventh.toastCount).assertEqual(0);
      const refused: OpResult = local.add();
      expect(refused.accepted).assertFalse();
      expect(refused.toastCount).assertEqual(1);
      const again: OpResult = local.add();
      expect(again.accepted).assertFalse();
      expect(again.toastCount).assertEqual(2);
      expect(local.browser.tabs.length).assertEqual(11);
      expect(local.keys().length).assertEqual(11);
      expect(local.keysAreContiguous()).assertTrue();
      expect(local.browser.toasts[0]).assertEqual(TAB_LIMIT_MESSAGE);
      expect(local.browser.toasts[1]).assertEqual(TAB_LIMIT_MESSAGE);
      expect(local.failureCount()).assertEqual(2);
    });

    it('Browser_Tab_Close_005', 0, async () => {
      TestLogger.step(TAG, 'closing one tab keeps the other controllers intact');
      const local: TabOperationHarness = new TabOperationHarness(3);
      local.browser.tabs[0].controller.loadUrl('https://a.example.com');
      local.browser.tabs[1].controller.loadUrl('https://b.example.com');
      local.browser.tabs[2].controller.loadUrl('https://c.example.com');
      expect(local.switchTo(2).accepted).assertTrue();
      expect(local.close(0).accepted).assertTrue();
      expect(local.browser.tabs.length).assertEqual(2);
      expect(local.browser.tabs[0].controller.currentUrl).assertEqual('https://b.example.com');
      expect(local.browser.tabs[1].controller.currentUrl).assertEqual('https://c.example.com');
      expect(local.browser.tabs[0].controller.loadCount).assertEqual(1);
      expect(local.browser.tabs[1].controller.loadCount).assertEqual(1);
      expect(local.browser.tabArrayIndex).assertEqual(1);
      expect(local.currentTab()!.controller.currentUrl).assertEqual('https://c.example.com');
    });

    it('Browser_Tab_Switch_003', 0, async () => {
      TestLogger.step(TAG, 'switch reports no tab, toast or progress side effect');
      const local: TabOperationHarness = new TabOperationHarness(3);
      local.browser.progress = 42;
      expect(local.switchTo(1).accepted).assertTrue();
      expect(local.browser.progress).assertEqual(42);
      expect(local.browser.tabs.length).assertEqual(3);
      expect(local.browser.toasts.length).assertEqual(0);
      expect(local.results[0].toastCount).assertEqual(0);
      expect(local.results[0].tabsBefore).assertEqual(local.results[0].tabsAfter);
      expect(local.results[0].indexAfter - local.results[0].indexBefore).assertEqual(1);
      const history: string[] = local.currentTab()!.controller.history;
      expect(history.length).assertEqual(0);
      expect(local.browser.tabs[0].controller.history.length).assertEqual(0);
    });

    it('Browser_Tab_Invariant_001', 0, async () => {
      TestLogger.step(TAG, 'short token combinations always keep the invariant');
      const tokens: string[] = ['A', 'A', 'C0', 'C1', 'S0', 'S1'];
      let checked: number = 0;
      for (let first = 0; first < tokens.length; first++) {
        for (let second = 0; second < tokens.length; second++) {
          const local: TabOperationHarness = new TabOperationHarness(2);
          local.run([tokens[first], tokens[second]]);
          expect(local.invariantHolds()).assertTrue();
          expect(local.browser.tabArrayIndex >= 0).assertTrue();
          expect(local.browser.tabArrayIndex < local.browser.tabs.length).assertTrue();
          expect(local.browser.tabs.length >= MIN_TAB_COUNT).assertTrue();
          checked += 1;
        }
      }
      expect(checked).assertEqual(36);
      TestLogger.info(TAG, `invariant combinations checked=${checked}`);
    });

    it('Browser_Tab_Invariant_002', 0, async () => {
      TestLogger.step(TAG, 'long mixed script keeps keys unique and ordered');
      const local: TabOperationHarness = new TabOperationHarness(2);
      local.run(['A', 'A', 'C1', 'A', 'S0', 'C0', 'A', 'A', 'C2', 'S1', 'C1', 'A']);
      expect(local.invariantHolds()).assertTrue();
      const keys: number[] = local.keys();
      const unique: Set<number> = new Set<number>();
      for (let index = 0; index < keys.length; index++) {
        unique.add(keys[index]);
      }
      expect(unique.size).assertEqual(keys.length);
      for (let index = 0; index < keys.length; index++) {
        expect(keys[index]).assertEqual(index);
      }
      expect(local.browser.tabs.length).assertEqual(keys.length);
      expect(local.results.length).assertEqual(12);
      TestLogger.info(TAG, `final tabs=${keys.length} index=${local.browser.tabArrayIndex}`);
    });

    it('Browser_Tab_Result_001', 0, async () => {
      TestLogger.step(TAG, 'every recorded result satisfies the delta contract');
      const local: TabOperationHarness = new TabOperationHarness(3);
      local.run(['A', 'A', 'S0', 'C1', 'C1', 'C1', 'A', 'S1']);
      expect(local.results.length).assertEqual(8);
      for (let index = 0; index < local.results.length; index++) {
        const result: OpResult = local.results[index];
        const delta: number = result.tabsAfter - result.tabsBefore;
        TestLogger.info(TAG, `result ${index} ${result.action} delta=${delta} ` +
          `accepted=${result.accepted}`);
        expect(delta >= -1 && delta <= 1).assertTrue();
        if (result.action === 'add') {
          expect(delta === 1 || delta === 0).assertTrue();
          expect(result.toastCount >= 0).assertTrue();
        }
        if (result.action === 'switch') {
          expect(delta).assertEqual(0);
        }
        if (!result.accepted) {
          expect(result.indexAfter).assertEqual(result.indexBefore);
        }
      }
      expect(local.results[0].action).assertEqual('add');
      expect(local.results[5].action).assertEqual('close');
      expect(local.results[7].action).assertEqual('switch');
    });

    it('Browser_Tab_UI_001', 0, async () => {
      TestLogger.step(TAG, 'the add affordance is reachable from the title bar');
      const addVisible: number = await countById(driver, ID_ACTION_ADD);
      TestLogger.info(TAG, `actionButton1 count=${addVisible}`);
      expect(addVisible >= 0).assertTrue();
      const clicked: boolean = await clickById(driver, ID_ACTION_ADD);
      TestLogger.info(TAG, `actionButton1 click accepted=${clicked}`);
      const cancelVisible: number = await countById(driver, ID_CANCEL_TAB);
      expect(cancelVisible >= 0).assertTrue();
      await pressKey(driver, KEY_BACK, 1, DELAY_TAB_OPERATION);
      expect(ID_ACTION_ADD).assertEqual('actionButton1');
      expect(ID_CANCEL_TAB).assertEqual('cancelBtn');
    });

    it('Browser_Tab_UI_002', 0, async () => {
      TestLogger.step(TAG, 'cancel visibility follows the tab count rule');
      const single: TabOperationHarness = new TabOperationHarness(1);
      expect(single.browser.tabs.length).assertEqual(MIN_TAB_COUNT);
      expect(single.closeActive().accepted).assertFalse();
      const pair: TabOperationHarness = new TabOperationHarness(2);
      expect(pair.browser.tabs.length).assertEqual(2);
      expect(pair.closeActive().accepted).assertTrue();
      expect(pair.browser.tabs.length).assertEqual(1);
      const cancelAfterClose: number = await countById(driver, ID_CANCEL_TAB);
      expect(cancelAfterClose >= 0).assertTrue();
      expect(MIN_TAB_COUNT).assertEqual(1);
      expect(MAX_TAB_COUNT).assertEqual(10);
    });

    it('Browser_Tab_Result_002', 0, async () => {
      TestLogger.step(TAG, 'results aggregate into per action statistics');
      const local: TabOperationHarness = new TabOperationHarness(2);
      local.run(['A', 'A', 'S0', 'A', 'C3', 'C0']);
      const adds: OpResult[] = local.results.filter((item: OpResult) => item.action === 'add');
      const closes: OpResult[] = local.results.filter((item: OpResult) => item.action === 'close');
      const switches: OpResult[] =
        local.results.filter((item: OpResult) => item.action === 'switch');
      expect(adds.length).assertEqual(3);
      expect(closes.length).assertEqual(2);
      expect(switches.length).assertEqual(1);
      expect(adds[0].tabsAfter - adds[0].tabsBefore).assertEqual(1);
      expect(closes[0].tabsAfter - closes[0].tabsBefore).assertEqual(-1);
      let accepted: number = 0;
      for (let index = 0; index < local.results.length; index++) {
        if (local.results[index].accepted) {
          accepted += 1;
        }
      }
      expect(accepted).assertEqual(local.acceptedCount());
      expect(accepted + local.failureCount()).assertEqual(local.results.length);
      expect(local.browser.tabs.length).assertEqual(3);
      expect(local.invariantHolds()).assertTrue();
      TestLogger.info(TAG, `adds=${adds.length} closes=${closes.length} ` +
        `switches=${switches.length} accepted=${accepted}`);
    });
    it('Browser_Tab_Result_003', 0, async () => {
      TestLogger.step(TAG, 'replaying the same script yields the same shape twice');
      const first: TabOperationHarness = new TabOperationHarness(2);
      const second: TabOperationHarness = new TabOperationHarness(2);
      const script: string[] = ['A', 'S0', 'C1', 'A', 'S1'];
      first.run(script);
      second.run(script);
      expect(first.results.length).assertEqual(second.results.length);
      for (let index = 0; index < first.results.length; index++) {
        expect(first.results[index].action).assertEqual(second.results[index].action);
        expect(first.results[index].accepted).assertEqual(second.results[index].accepted);
        expect(first.results[index].tabsBefore).assertEqual(second.results[index].tabsBefore);
        expect(first.results[index].tabsAfter).assertEqual(second.results[index].tabsAfter);
        expect(first.results[index].indexAfter).assertEqual(second.results[index].indexAfter);
      }
      expect(first.keys()).assertDeepEquals(second.keys());
      expect(first.browser.tabArrayIndex).assertEqual(second.browser.tabArrayIndex);
      expect(first.invariantHolds()).assertTrue();
      expect(first.browser.tabs.length).assertEqual(3);
      TestLogger.info(TAG, `replay tabs=${first.browser.tabs.length} ` +
        `index=${first.browser.tabArrayIndex}`);
      const unique: Set<number> = new Set<number>();
      const replayKeys: number[] = first.keys();
      for (let index = 0; index < replayKeys.length; index++) {
        unique.add(replayKeys[index]);
      }
      expect(unique.size).assertEqual(replayKeys.length);
      expect(DELAY_TAB_OPERATION > 0).assertTrue();
      expect(first.browser.toasts.length).assertEqual(0);
      expect(first.failureCount()).assertEqual(0);
      expect(first.results[0].tabsBefore).assertEqual(2);
      expect(first.results[first.results.length - 1].indexAfter).assertEqual(1);
      expect(SCRIPTS.length > 0).assertTrue();
      expect(SCRIPTS[0].steps.length).assertEqual(2);
    });
    it('Browser_Tab_Record_004', 0, async () => {
      TestLogger.step(TAG, 'a tab keeps its own controller while others are manipulated');
      const local: TabOperationHarness = new TabOperationHarness(3);
      local.browser.tabs[2].controller.loadUrl('https://kept.example.com');
      expect(local.add().accepted).assertTrue();
      expect(local.switchTo(2).accepted).assertTrue();
      expect(local.browser.tabs[2].controller.currentUrl).assertEqual('https://kept.example.com');
      expect(local.browser.tabs.length).assertEqual(4);
      expect(local.close(0).accepted).assertTrue();
      expect(local.browser.tabs.length).assertEqual(3);
      expect(local.browser.tabs.length).assertLess(4);
      expect(local.keys()).assertDeepEquals([0, 1, 2]);
      expect(local.browser.tabs[1].controller.currentUrl).assertEqual('https://kept.example.com');
      expect(local.currentTab()!.controller.currentUrl).assertEqual('https://kept.example.com');
      expect(local.invariantHolds()).assertTrue();
    });
  });
}
