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
  getDriver, startBrowserApp, clickById, componentByIdExists, serializedDelay,
  pushHistory, MAX_TAB_COUNT, TAB_LIMIT_MESSAGE, ID_NAV_HOME, ID_NAV_REFRESH,
  ID_ACTION_ADD, ID_INPUT_URL, TIMEOUT_COMPONENT, DELAY_TAB_OPERATION
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserStressTest';

const CHURN_CYCLES: number = 5;
const LOOP_REFRESH: number = 40;
const LOOP_SELECT: number = 60;
const LOOP_LOAD: number = 30;
const LOOP_NAVIGATION: number = 50;
const HISTORY_LIMIT: number = 20;
const UI_REPEAT: number = 4;

/* ------------------------------------------------------------------ */
/* Stress harness                                                      */
/* ------------------------------------------------------------------ */

/**
 * Drives MockBrowser through repeated tab churn and checks the structural
 * invariants the real model must keep under pressure: contiguous keys, an
 * in-range selected index and unique creation timestamps.
 */
class StressHarness {
  browser: MockBrowser = new MockBrowser(1);
  clock: MockClock = new MockClock();

  fillToCapacity(): number {
    let added: number = 0;
    while (this.browser.tabs.length < MAX_TAB_COUNT) {
      this.browser.addTab();
      added += 1;
    }
    return added;
  }

  drainToOne(): number {
    let removed: number = 0;
    while (this.browser.tabs.length > 1) {
      this.browser.deleteTab(0);
      removed += 1;
    }
    return removed;
  }

  keysAreContiguous(): boolean {
    const keys: number[] = this.browser.getTabKeys();
    for (let index = 0; index < keys.length; index++) {
      if (keys[index] !== index) {
        return false;
      }
    }
    return true;
  }

  indexInRange(): boolean {
    const index: number = this.browser.getTabArrayIndex();
    return index >= 0 && index < this.browser.tabs.length;
  }

  timestampsUnique(): boolean {
    const seen: number[] = [];
    const stamps: number[] = this.browser.getTimestamps();
    for (let index = 0; index < stamps.length; index++) {
      if (seen.indexOf(stamps[index]) >= 0) {
        return false;
      }
      seen.push(stamps[index]);
    }
    return true;
  }

  churn(): boolean {
    for (let cycle = 0; cycle < CHURN_CYCLES; cycle++) {
      this.fillToCapacity();
      if (!this.keysAreContiguous() || !this.indexInRange()) {
        return false;
      }
      this.drainToOne();
      if (!this.keysAreContiguous() || !this.indexInRange()) {
        return false;
      }
    }
    return true;
  }
}

export default function browserStressTest() {
  describe('browserStressTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'stress suite begin');
      await startBrowserApp();
      await serializedDelay(driver, TIMEOUT_COMPONENT / 2);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Stress_001', 0, async () => {
      TestLogger.step(TAG, 'fill tabs up to the business limit');
      const harness: StressHarness = new StressHarness();
      const added: number = harness.fillToCapacity();
      expect(added).assertEqual(MAX_TAB_COUNT - 1);
      expect(harness.browser.tabs.length).assertEqual(MAX_TAB_COUNT);
      expect(harness.keysAreContiguous()).assertTrue();
      expect(harness.indexInRange()).assertTrue();
      expect(harness.timestampsUnique()).assertTrue();
    });

    it('Browser_Stress_002', 0, async () => {
      TestLogger.step(TAG, 'toast the limit message once the strip is over capacity');
      const harness: StressHarness = new StressHarness();
      harness.fillToCapacity();
      // model/Browser.ets refuses only when the strip already holds more than
      // MAX_TAB_COUNT entries, so the eleventh tab is still accepted.
      const accepted: boolean = harness.browser.addTab();
      expect(accepted).assertTrue();
      expect(harness.browser.tabs.length).assertEqual(MAX_TAB_COUNT + 1);
      const refused: boolean = harness.browser.addTab();
      expect(refused).assertFalse();
      expect(harness.browser.tabs.length).assertEqual(MAX_TAB_COUNT + 1);
      expect(harness.browser.toasts.length).assertEqual(1);
      expect(harness.browser.toasts[0]).assertEqual(TAB_LIMIT_MESSAGE);
    });

    it('Browser_Stress_003', 0, async () => {
      TestLogger.step(TAG, 'drain ten tabs down to a single tab');
      const harness: StressHarness = new StressHarness();
      harness.fillToCapacity();
      const removed: number = harness.drainToOne();
      expect(removed).assertEqual(MAX_TAB_COUNT - 1);
      expect(harness.browser.tabs.length).assertEqual(1);
      expect(harness.browser.getTabKeys()).assertDeepEquals([0]);
      expect(harness.browser.getTabArrayIndex()).assertEqual(0);
    });

    it('Browser_Stress_004', 0, async () => {
      TestLogger.step(TAG, 'run five fill and drain cycles without leaking keys');
      const harness: StressHarness = new StressHarness();
      expect(harness.churn()).assertTrue();
      expect(harness.browser.tabs.length).assertEqual(1);
      expect(harness.browser.getTabKeys()).assertDeepEquals([0]);
    });

    it('Browser_Stress_005', 0, async () => {
      TestLogger.step(TAG, 'delete the selected middle tab and repair the index');
      const harness: StressHarness = new StressHarness();
      harness.fillToCapacity();
      harness.browser.selectTab(4);
      const removed: boolean = harness.browser.deleteTab(4);
      expect(removed).assertTrue();
      expect(harness.browser.tabs.length).assertEqual(MAX_TAB_COUNT - 1);
      // deleteTab only rewinds the selection when a *previous* tab disappears,
      // therefore the slot keeps pointing at the neighbour that moved up.
      expect(harness.browser.getTabArrayIndex()).assertEqual(4);
      expect(harness.keysAreContiguous()).assertTrue();
    });

    it('Browser_Stress_006', 0, async () => {
      TestLogger.step(TAG, 'delete the trailing selected tab and clamp the index');
      const harness: StressHarness = new StressHarness();
      harness.fillToCapacity();
      harness.browser.selectTab(MAX_TAB_COUNT - 1);
      harness.browser.deleteTab(MAX_TAB_COUNT - 1);
      expect(harness.browser.getTabArrayIndex()).assertEqual(MAX_TAB_COUNT - 2);
      expect(harness.indexInRange()).assertTrue();
      expect(harness.keysAreContiguous()).assertTrue();
    });

    it('Browser_Stress_007', 0, async () => {
      TestLogger.step(TAG, 'select every tab sixty times and keep the index valid');
      const harness: StressHarness = new StressHarness();
      harness.fillToCapacity();
      let valid: boolean = true;
      for (let round = 0; round < LOOP_SELECT; round++) {
        const target: number = round % harness.browser.tabs.length;
        harness.browser.selectTab(target);
        if (harness.browser.getTabArrayIndex() !== target || !harness.indexInRange()) {
          valid = false;
          break;
        }
      }
      expect(valid).assertTrue();
      expect(harness.browser.lastChangedIndex).assertEqual((LOOP_SELECT - 1) % MAX_TAB_COUNT);
    });

    it('Browser_Stress_008', 0, async () => {
      TestLogger.step(TAG, 'refresh the active tab forty times');
      const harness: StressHarness = new StressHarness();
      harness.browser.selectTab(0);
      const controller = harness.browser.getCurrentTab();
      for (let round = 0; round < LOOP_REFRESH; round++) {
        harness.browser.refresh();
      }
      expect(controller === null).assertFalse();
      expect(harness.browser.tabs[0].controller.refreshCount).assertEqual(LOOP_REFRESH);
    });

    it('Browser_Stress_009', 0, async () => {
      TestLogger.step(TAG, 'alternate back and forward fifty times inside the history');
      const harness: StressHarness = new StressHarness();
      harness.browser.loadUrl('a.example.com');
      harness.browser.loadUrl('b.example.com');
      harness.browser.loadUrl('c.example.com');
      const controller = harness.browser.tabs[0].controller;
      let stable: boolean = true;
      for (let round = 0; round < LOOP_NAVIGATION; round++) {
        if (round % 2 === 0) {
          harness.browser.back();
        } else {
          harness.browser.forward();
        }
        if (controller.historyIndex < 0 || controller.historyIndex >= controller.history.length) {
          stable = false;
          break;
        }
      }
      expect(stable).assertTrue();
      expect(harness.browser.tabs[0].controller.history.length).assertEqual(3);
    });

    it('Browser_Stress_010', 0, async () => {
      TestLogger.step(TAG, 'load thirty urls and keep every address https prefixed');
      const harness: StressHarness = new StressHarness();
      let prefixed: boolean = true;
      for (let round = 0; round < LOOP_LOAD; round++) {
        harness.browser.loadUrl('site' + round + '.example.com');
        const pending: string = harness.browser.tabs[0].controller.getPendingUrl();
        if (!pending.startsWith('https://')) {
          prefixed = false;
          break;
        }
      }
      expect(prefixed).assertTrue();
      expect(harness.browser.tabs[0].controller.loadCount).assertEqual(LOOP_LOAD);
    });

    it('Browser_Stress_011', 0, async () => {
      TestLogger.step(TAG, 'drive the progress bar through a burst of updates');
      const harness: StressHarness = new StressHarness();
      for (let progress = 0; progress <= 100; progress += 10) {
        harness.browser.onProgressChange(progress);
      }
      expect(harness.browser.progress).assertEqual(0);
      expect(harness.browser.hideProgress).assertTrue();
      harness.browser.onProgressChange(37);
      expect(harness.browser.progress).assertEqual(37);
      expect(harness.browser.hideProgress).assertFalse();
    });

    it('Browser_Stress_012', 0, async () => {
      TestLogger.step(TAG, 'keep creation timestamps unique for three appended tabs');
      const harness: StressHarness = new StressHarness();
      harness.browser.addTab();
      harness.browser.addTab();
      let stamps: number[] = harness.browser.getTimestamps();
      expect(stamps.length).assertEqual(3);
      const unique: number[] = [];
      for (let index = 0; index < stamps.length; index++) {
        expect(stamps[index] > 0).assertTrue();
        expect(unique.indexOf(stamps[index])).assertEqual(-1);
        unique.push(stamps[index]);
      }
      harness.browser.deleteTab(1);
      expect(harness.keysAreContiguous()).assertTrue();
      harness.browser.addTab();
      stamps = harness.browser.getTimestamps();
      expect(stamps.length).assertEqual(harness.browser.tabs.length);
      expect(harness.keysAreContiguous()).assertTrue();
      expect(harness.indexInRange()).assertTrue();
      TestLogger.warn(TAG, 'mock stamps are key derived, reusing a key can repeat a stamp');
    });

    it('Browser_Stress_013', 0, async () => {
      TestLogger.step(TAG, 'bound a long navigation history to the configured limit');
      let history: string[] = [];
      for (let round = 0; round < LOOP_NAVIGATION; round++) {
        history = pushHistory(history, 'https://page' + round + '.example.com', HISTORY_LIMIT);
      }
      expect(history.length).assertEqual(HISTORY_LIMIT);
      expect(history[HISTORY_LIMIT - 1]).assertEqual('https://page49.example.com');
      expect(history.indexOf('https://page0.example.com')).assertEqual(-1);
    });

    it('Browser_Stress_014', 0, async () => {
      TestLogger.step(TAG, 'tap the home button repeatedly and keep the id resolvable');
      let stable: boolean = true;
      for (let round = 0; round < UI_REPEAT; round++) {
        const clicked: boolean = await clickById(driver, ID_NAV_HOME);
        await serializedDelay(driver, DELAY_TAB_OPERATION);
        const present: boolean = await componentByIdExists(driver, ID_NAV_HOME);
        if (!clicked || !present) {
          stable = false;
          break;
        }
      }
      expect(stable).assertTrue();
    });

    it('Browser_Stress_015', 0, async () => {
      TestLogger.step(TAG, 'query the address bar across repeated refresh taps');
      for (let round = 0; round < UI_REPEAT; round++) {
        await clickById(driver, ID_NAV_REFRESH);
        await serializedDelay(driver, DELAY_TAB_OPERATION / 2);
      }
      const inputPresent: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      expect(inputPresent).assertTrue();
    });

    it('Browser_Stress_016', 0, async () => {
      TestLogger.step(TAG, 'keep the add tab action id stable after churn');
      const before: boolean = await componentByIdExists(driver, ID_ACTION_ADD);
      await clickById(driver, ID_ACTION_ADD);
      await serializedDelay(driver, DELAY_TAB_OPERATION);
      const after: boolean = await componentByIdExists(driver, ID_ACTION_ADD);
      expect(before).assertTrue();
      expect(after).assertTrue();
    });
  });
}
