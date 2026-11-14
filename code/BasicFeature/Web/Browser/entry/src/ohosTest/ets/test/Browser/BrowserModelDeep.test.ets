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
  getDriver, startBrowserApp, serializedDelay, resolveTabIndexAfterDelete,
  MAX_TAB_COUNT, TIMEOUT_COMPONENT
} from '../Shared/BrowserTestKit';
import {
  MockBrowser, MockClock, MockWebController, MockLoadingStatus
} from '../Shared/BrowserMock';
import { LoadingStatus } from '../../../../main/ets/model/Browser';

const TAG: string = 'BrowserModelDeepTest';

const DEFAULT_TAB_COUNT: number = 1;
const BASE_TIMESTAMP: number = 1700000000000;
const CLOCK_STEP_MS: number = 5;
const HISTORY_SIZE: number = 5;
const WORKFLOW_STEPS: number = 50;
const DELETE_SCAN_MAX: number = 10;

/* ------------------------------------------------------------------ */
/* Exact mirror of model/Browser.ets                                   */
/* ------------------------------------------------------------------ */

/** Mirror of @Observed WebKey. */
class DeepKey {
  key: number;
  timestamp: number;

  constructor(key: number, timestamp: number) {
    this.key = key;
    this.timestamp = timestamp;
  }
}

/** Mirror of WebObject { controller, isRegistered }. */
class DeepWebObject {
  id: number;
  controller: MockWebController = new MockWebController();
  isRegistered: boolean = false;

  constructor(id: number) {
    this.id = id;
  }

  register(): boolean {
    if (this.isRegistered) {
      return false;
    }
    this.isRegistered = true;
    return true;
  }
}

/**
 * Line by line mirror of class Browser.
 *
 * Two behaviours differ from the hardened MockBrowser and are reproduced
 * verbatim here because they are the real contract of the sample:
 *  - deleteTab has no lower bound guard and can empty the tab list,
 *  - addTab only refuses when the current length is already above ten.
 */
class DeepBrowserModel {
  inputValue: string = '';
  tabArrayIndex: number = 0;
  progress: number = 0;
  hideProgress: boolean = true;
  loadingStatus: MockLoadingStatus = MockLoadingStatus.END;
  webArray: DeepKey[] = [];
  webControllerArray: DeepWebObject[] = [];
  changeIndexCalls: number[] = [];
  lastChangeIndex: number = -1;
  clock: MockClock = new MockClock(BASE_TIMESTAMP);

  constructor(initialCount: number = DEFAULT_TAB_COUNT) {
    const count: number = initialCount < 1 ? 1 : initialCount;
    for (let index = 0; index < count; index++) {
      this.webArray.push(new DeepKey(index, this.clock.advance(CLOCK_STEP_MS)));
      this.webControllerArray.push(new DeepWebObject(index));
    }
  }

  private changeIndex(index: number): void {
    this.changeIndexCalls.push(index);
    this.lastChangeIndex = index;
  }

  addTab(): boolean {
    if (this.webArray.length > MAX_TAB_COUNT) {
      return false;
    }
    const object: DeepWebObject = new DeepWebObject(this.webControllerArray.length);
    this.webControllerArray.push(object);
    this.webArray.push(new DeepKey(this.webArray.length, this.clock.advance(CLOCK_STEP_MS)));
    this.tabArrayIndex = this.webArray.length - 1;
    this.changeIndex(this.tabArrayIndex);
    return true;
  }

  deleteTab(index: number): boolean {
    if (index < 0 || index >= this.webArray.length) {
      return false;
    }
    this.webArray.splice(index, 1);
    this.webControllerArray.splice(index, 1);
    if (this.tabArrayIndex > index || this.tabArrayIndex === this.webArray.length) {
      this.tabArrayIndex -= 1;
    }
    for (let cursor = index; cursor < this.webArray.length; cursor++) {
      this.webArray[cursor].key -= 1;
    }
    this.changeIndex(this.tabArrayIndex);
    return true;
  }

  getWebArray(): DeepKey[] {
    return this.webArray;
  }

  setTabArrayIndex(index: number): void {
    this.tabArrayIndex = index;
  }

  getTabArrayIndex(): number {
    return this.tabArrayIndex;
  }

  setInputVal(value: string): void {
    this.inputValue = value;
  }

  getInputVal(): string {
    return this.inputValue;
  }

  private currentObject(): DeepWebObject | null {
    if (this.tabArrayIndex < 0 || this.tabArrayIndex >= this.webControllerArray.length) {
      return null;
    }
    return this.webControllerArray[this.tabArrayIndex];
  }

  loadUrl(addr: string): boolean {
    const object: DeepWebObject | null = this.currentObject();
    if (object === null) {
      return false;
    }
    return object.controller.loadUrl('https://' + addr);
  }

  Back(): boolean {
    const object: DeepWebObject | null = this.currentObject();
    if (object === null) {
      return false;
    }
    if (object.controller.accessBackward()) {
      return object.controller.backward();
    }
    return false;
  }

  Forward(): boolean {
    const object: DeepWebObject | null = this.currentObject();
    if (object === null) {
      return false;
    }
    if (object.controller.accessForward()) {
      return object.controller.forward();
    }
    return false;
  }

  Refresh(): boolean {
    const object: DeepWebObject | null = this.currentObject();
    if (object === null) {
      return false;
    }
    object.controller.refresh();
    return true;
  }

  registerTab(index: number): boolean {
    if (index < 0 || index >= this.webControllerArray.length) {
      return false;
    }
    return this.webControllerArray[index].register();
  }

  keys(): number[] {
    return this.webArray.map((item: DeepKey) => item.key);
  }

  timestamps(): number[] {
    return this.webArray.map((item: DeepKey) => item.timestamp);
  }

  controllerCount(): number {
    return this.webControllerArray.length;
  }

  keysAreContiguous(): boolean {
    for (let index = 0; index < this.webArray.length; index++) {
      if (this.webArray[index].key !== index) {
        return false;
      }
    }
    return true;
  }

  indexInRange(): boolean {
    return this.tabArrayIndex >= 0 && this.tabArrayIndex < this.webArray.length;
  }

  uniqueTimestampCount(): number {
    const seen: number[] = [];
    for (let index = 0; index < this.webArray.length; index++) {
      if (seen.indexOf(this.webArray[index].timestamp) < 0) {
        seen.push(this.webArray[index].timestamp);
      }
    }
    return seen.length;
  }

  loadHistory(urls: string[]): void {
    for (let index = 0; index < urls.length; index++) {
      this.loadUrl(urls[index]);
    }
  }
}

export default function browserModelDeepTest() {
  describe('browserModelDeepTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'browser model deep suite begin');
      await startBrowserApp();
      await serializedDelay(driver, TIMEOUT_COMPONENT / 2);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Model_001', 0, async () => {
      TestLogger.step(TAG, 'validate the initial state of the browser model');
      const model: DeepBrowserModel = new DeepBrowserModel();
      expect(model.webArray.length).assertEqual(DEFAULT_TAB_COUNT);
      expect(model.controllerCount()).assertEqual(DEFAULT_TAB_COUNT);
      expect(model.keys()).assertDeepEquals([0]);
      expect(model.tabArrayIndex).assertEqual(0);
      expect(model.inputValue).assertEqual('');
      expect(model.progress).assertEqual(0);
      expect(model.hideProgress).assertTrue();
      expect(model.loadingStatus).assertEqual(MockLoadingStatus.END);
      expect(model.changeIndexCalls.length).assertEqual(0);
    });

    it('Browser_Model_002', 0, async () => {
      TestLogger.step(TAG, 'append a tab and select it');
      const model: DeepBrowserModel = new DeepBrowserModel();
      expect(model.addTab()).assertTrue();
      expect(model.webArray.length).assertEqual(2);
      expect(model.controllerCount()).assertEqual(2);
      expect(model.keys()).assertDeepEquals([0, 1]);
      expect(model.tabArrayIndex).assertEqual(1);
      expect(model.changeIndexCalls).assertDeepEquals([1]);
      expect(model.lastChangeIndex).assertEqual(1);
      expect(model.indexInRange()).assertTrue();
    });

    it('Browser_Model_003', 0, async () => {
      TestLogger.step(TAG, 'refuse to add a tab when eleven tabs already exist');
      const model: DeepBrowserModel = new DeepBrowserModel();
      while (model.webArray.length <= MAX_TAB_COUNT) {
        expect(model.addTab()).assertTrue();
      }
      expect(model.webArray.length).assertEqual(MAX_TAB_COUNT + 1);
      expect(model.addTab()).assertFalse();
      expect(model.webArray.length).assertEqual(MAX_TAB_COUNT + 1);
      expect(model.controllerCount()).assertEqual(MAX_TAB_COUNT + 1);
      expect(model.keysAreContiguous()).assertTrue();
      expect(model.tabArrayIndex).assertEqual(MAX_TAB_COUNT);
    });

    it('Browser_Model_004', 0, async () => {
      TestLogger.step(TAG, 'accept one more tab at exactly ten tabs');
      const model: DeepBrowserModel = new DeepBrowserModel();
      while (model.webArray.length < MAX_TAB_COUNT) {
        model.addTab();
      }
      expect(model.webArray.length).assertEqual(MAX_TAB_COUNT);
      expect(model.addTab()).assertTrue();
      expect(model.webArray.length).assertEqual(MAX_TAB_COUNT + 1);
      expect(model.keys()[MAX_TAB_COUNT]).assertEqual(MAX_TAB_COUNT);
      expect(model.tabArrayIndex).assertEqual(MAX_TAB_COUNT);
      expect(model.uniqueTimestampCount()).assertEqual(MAX_TAB_COUNT + 1);
    });

    it('Browser_Model_005', 0, async () => {
      TestLogger.step(TAG, 'delete a middle tab and renumber the following keys');
      const model: DeepBrowserModel = new DeepBrowserModel(4);
      expect(model.deleteTab(1)).assertTrue();
      expect(model.webArray.length).assertEqual(3);
      expect(model.controllerCount()).assertEqual(3);
      expect(model.keys()).assertDeepEquals([0, 1, 2]);
      expect(model.keysAreContiguous()).assertTrue();
      expect(model.tabArrayIndex).assertEqual(0);
      expect(model.lastChangeIndex).assertEqual(0);
    });

    it('Browser_Model_006', 0, async () => {
      TestLogger.step(TAG, 'repair the selected index when a tab before it is deleted');
      const model: DeepBrowserModel = new DeepBrowserModel(4);
      model.setTabArrayIndex(3);
      expect(model.deleteTab(0)).assertTrue();
      expect(model.webArray.length).assertEqual(3);
      expect(model.tabArrayIndex).assertEqual(2);
      expect(model.indexInRange()).assertTrue();
      expect(model.keysAreContiguous()).assertTrue();
      expect(model.changeIndexCalls[0]).assertEqual(2);
    });

    it('Browser_Model_007', 0, async () => {
      TestLogger.step(TAG, 'clamp the index when the selected trailing tab is deleted');
      const model: DeepBrowserModel = new DeepBrowserModel(4);
      model.setTabArrayIndex(3);
      expect(model.deleteTab(3)).assertTrue();
      expect(model.webArray.length).assertEqual(3);
      expect(model.tabArrayIndex).assertEqual(2);
      expect(model.indexInRange()).assertTrue();
      expect(model.keys()).assertDeepEquals([0, 1, 2]);
      expect(model.changeIndexCalls[0]).assertEqual(2);
    });

    it('Browser_Model_008', 0, async () => {
      TestLogger.step(TAG, 'keep the index when the selected middle tab is deleted');
      const model: DeepBrowserModel = new DeepBrowserModel(4);
      model.setTabArrayIndex(2);
      expect(model.deleteTab(2)).assertTrue();
      expect(model.webArray.length).assertEqual(3);
      expect(model.tabArrayIndex).assertEqual(2);
      expect(model.indexInRange()).assertTrue();
      expect(model.keysAreContiguous()).assertTrue();
      expect(model.lastChangeIndex).assertEqual(2);
    });

    it('Browser_Model_009', 0, async () => {
      TestLogger.step(TAG, 'ignore out of range delete requests');
      const model: DeepBrowserModel = new DeepBrowserModel(4);
      const before: number[] = model.keys();
      expect(model.deleteTab(-1)).assertFalse();
      expect(model.deleteTab(4)).assertFalse();
      expect(model.deleteTab(99)).assertFalse();
      expect(model.keys()).assertDeepEquals(before);
      expect(model.controllerCount()).assertEqual(4);
      expect(model.changeIndexCalls.length).assertEqual(0);
    });

    it('Browser_Model_010', 0, async () => {
      TestLogger.step(TAG, 'delete the only tab and observe the empty state');
      const model: DeepBrowserModel = new DeepBrowserModel(1);
      expect(model.deleteTab(0)).assertTrue();
      expect(model.webArray.length).assertEqual(0);
      expect(model.controllerCount()).assertEqual(0);
      expect(model.tabArrayIndex).assertEqual(-1);
      expect(model.indexInRange()).assertFalse();
      expect(model.changeIndexCalls).assertDeepEquals([-1]);
      expect(model.getWebArray().length).assertEqual(0);
    });

    it('Browser_Model_011', 0, async () => {
      TestLogger.step(TAG, 'verify the forced https prefix of loadUrl');
      const model: DeepBrowserModel = new DeepBrowserModel();
      expect(model.loadUrl('example.com')).assertTrue();
      expect(model.webControllerArray[0].controller.getPendingUrl()).assertEqual('https://example.com');
      expect(model.loadUrl('http://example.com')).assertTrue();
      expect(model.webControllerArray[0].controller.getPendingUrl())
        .assertEqual('https://http://example.com');
      expect(model.loadUrl('https://example.com')).assertTrue();
      expect(model.webControllerArray[0].controller.getPendingUrl())
        .assertEqual('https://https://example.com');
      expect(model.loadUrl('')).assertTrue();
      expect(model.webControllerArray[0].controller.getPendingUrl()).assertEqual('https://');
    });

    it('Browser_Model_012', 0, async () => {
      TestLogger.step(TAG, 'load the address into the selected tab controller only');
      const model: DeepBrowserModel = new DeepBrowserModel(3);
      model.setTabArrayIndex(1);
      expect(model.loadUrl('second.example.com')).assertTrue();
      expect(model.webControllerArray[1].controller.getPendingUrl())
        .assertEqual('https://second.example.com');
      expect(model.webControllerArray[0].controller.getPendingUrl()).assertEqual('');
      expect(model.webControllerArray[2].controller.getPendingUrl()).assertEqual('');
      expect(model.webControllerArray[1].controller.loadCount).assertEqual(1);
    });

    it('Browser_Model_013', 0, async () => {
      TestLogger.step(TAG, 'refuse to go back without any history');
      const model: DeepBrowserModel = new DeepBrowserModel();
      expect(model.Back()).assertFalse();
      expect(model.webControllerArray[0].controller.historyIndex).assertEqual(-1);
      expect(model.webControllerArray[0].controller.currentUrl).assertEqual('');
      expect(model.Back()).assertFalse();
      expect(model.webControllerArray[0].controller.loadCount).assertEqual(0);
    });

    it('Browser_Model_014', 0, async () => {
      TestLogger.step(TAG, 'go back after two committed page loads');
      const model: DeepBrowserModel = new DeepBrowserModel();
      model.loadUrl('first.example.com');
      model.loadUrl('second.example.com');
      const controller: MockWebController = model.webControllerArray[0].controller;
      expect(controller.history.length).assertEqual(2);
      expect(controller.currentUrl).assertEqual('https://second.example.com');
      expect(model.Back()).assertTrue();
      expect(controller.currentUrl).assertEqual('https://first.example.com');
      expect(model.Back()).assertFalse();
      expect(controller.currentUrl).assertEqual('https://first.example.com');
    });

    it('Browser_Model_015', 0, async () => {
      TestLogger.step(TAG, 'refuse to go forward at the newest history entry');
      const model: DeepBrowserModel = new DeepBrowserModel();
      model.loadUrl('only.example.com');
      expect(model.Forward()).assertFalse();
      expect(model.webControllerArray[0].controller.currentUrl)
        .assertEqual('https://only.example.com');
      expect(model.webControllerArray[0].controller.historyIndex).assertEqual(0);
    });

    it('Browser_Model_016', 0, async () => {
      TestLogger.step(TAG, 'go forward after a successful back navigation');
      const model: DeepBrowserModel = new DeepBrowserModel();
      model.loadUrl('first.example.com');
      model.loadUrl('second.example.com');
      const controller: MockWebController = model.webControllerArray[0].controller;
      expect(model.Back()).assertTrue();
      expect(model.Forward()).assertTrue();
      expect(controller.currentUrl).assertEqual('https://second.example.com');
      expect(model.Forward()).assertFalse();
      expect(controller.historyIndex).assertEqual(1);
    });

    it('Browser_Model_017', 0, async () => {
      TestLogger.step(TAG, 'walk the access flags across five history entries');
      const model: DeepBrowserModel = new DeepBrowserModel();
      const urls: string[] = [];
      for (let index = 0; index < HISTORY_SIZE; index++) {
        urls.push('page' + index + '.example.com');
        model.loadUrl(urls[index]);
      }
      const controller: MockWebController = model.webControllerArray[0].controller;
      expect(controller.history.length).assertEqual(HISTORY_SIZE);
      let backwardSuccess: number = 0;
      for (let round = 0; round < HISTORY_SIZE + 1; round++) {
        if (model.Back()) {
          backwardSuccess += 1;
        }
      }
      expect(backwardSuccess).assertEqual(HISTORY_SIZE - 1);
      expect(controller.currentUrl).assertEqual('https://page0.example.com');
      let forwardSuccess: number = 0;
      for (let round = 0; round < HISTORY_SIZE + 1; round++) {
        if (model.Forward()) {
          forwardSuccess += 1;
        }
      }
      expect(forwardSuccess).assertEqual(HISTORY_SIZE - 1);
      expect(controller.currentUrl).assertEqual('https://page4.example.com');
    });

    it('Browser_Model_018', 0, async () => {
      TestLogger.step(TAG, 'refresh the selected tab controller');
      const model: DeepBrowserModel = new DeepBrowserModel(3);
      model.setTabArrayIndex(2);
      expect(model.Refresh()).assertTrue();
      expect(model.Refresh()).assertTrue();
      expect(model.webControllerArray[2].controller.refreshCount).assertEqual(2);
      expect(model.webControllerArray[0].controller.refreshCount).assertEqual(0);
      expect(model.webControllerArray[1].controller.refreshCount).assertEqual(0);
    });

    it('Browser_Model_019', 0, async () => {
      TestLogger.step(TAG, 'refresh with no accessible controller does nothing');
      const model: DeepBrowserModel = new DeepBrowserModel(2);
      model.setTabArrayIndex(5);
      expect(model.Refresh()).assertFalse();
      expect(model.webControllerArray[0].controller.refreshCount).assertEqual(0);
      model.setTabArrayIndex(-2);
      expect(model.Refresh()).assertFalse();
      expect(model.loadUrl('ignored.example.com')).assertFalse();
      expect(model.Back()).assertFalse();
      expect(model.Forward()).assertFalse();
    });

    it('Browser_Model_020', 0, async () => {
      TestLogger.step(TAG, 'confirm getWebArray returns the live key array');
      const model: DeepBrowserModel = new DeepBrowserModel();
      const first: DeepKey[] = model.getWebArray();
      expect(first.length).assertEqual(1);
      first.push(new DeepKey(1, BASE_TIMESTAMP));
      expect(model.webArray.length).assertEqual(2);
      expect(model.getWebArray().length).assertEqual(2);
      expect(model.getWebArray() === model.webArray).assertTrue();
      model.webArray.pop();
      expect(first.length).assertEqual(1);
    });

    it('Browser_Model_021', 0, async () => {
      TestLogger.step(TAG, 'keep key and controller arrays the same length');
      const model: DeepBrowserModel = new DeepBrowserModel();
      expect(model.getWebArray().length).assertEqual(model.controllerCount());
      model.addTab();
      model.addTab();
      expect(model.getWebArray().length).assertEqual(3);
      expect(model.controllerCount()).assertEqual(3);
      model.deleteTab(1);
      expect(model.getWebArray().length).assertEqual(2);
      expect(model.controllerCount()).assertEqual(2);
      expect(model.keysAreContiguous()).assertTrue();
    });

    it('Browser_Model_022', 0, async () => {
      TestLogger.step(TAG, 'scan every delete position of one to ten tabs');
      let combinations: number = 0;
      for (let count = 1; count <= DELETE_SCAN_MAX; count++) {
        for (let removed = 0; removed < count; removed += 1) {
          const model: DeepBrowserModel = new DeepBrowserModel(count);
          model.setTabArrayIndex(count - 1);
          expect(model.deleteTab(removed)).assertTrue();
          const remaining: number = count - 1;
          expect(model.webArray.length).assertEqual(remaining);
          expect(model.controllerCount()).assertEqual(remaining);
          expect(model.keysAreContiguous()).assertTrue();
          expect(model.uniqueTimestampCount()).assertEqual(remaining);
          if (remaining > 0) {
            expect(model.indexInRange()).assertTrue();
          }
          combinations += 1;
        }
      }
      expect(combinations).assertEqual(DELETE_SCAN_MAX * (DELETE_SCAN_MAX + 1) / 2);
    });

    it('Browser_Model_023', 0, async () => {
      TestLogger.step(TAG, 'scan selected and removed index pairs of the delete repair');
      let checked: number = 0;
      for (let count = 2; count <= 6; count++) {
        for (let current = 0; current < count; current++) {
          for (let removed = 0; removed < count; removed++) {
            const model: DeepBrowserModel = new DeepBrowserModel(count);
            model.setTabArrayIndex(current);
            expect(model.deleteTab(removed)).assertTrue();
            let expected: number = current;
            if (expected > removed || expected === count - 1) {
              expected -= 1;
            }
            expect(model.tabArrayIndex).assertEqual(expected);
            expect(model.indexInRange()).assertTrue();
            checked += 1;
          }
        }
      }
      expect(checked).assertEqual(90);
    });

    it('Browser_Model_024', 0, async () => {
      TestLogger.step(TAG, 'delete and add a tab while keeping both arrays aligned');
      const model: DeepBrowserModel = new DeepBrowserModel(6);
      model.deleteTab(3);
      expect(model.keys()).assertDeepEquals([0, 1, 2, 3, 4]);
      expect(model.addTab()).assertTrue();
      expect(model.keys()).assertDeepEquals([0, 1, 2, 3, 4, 5]);
      expect(model.controllerCount()).assertEqual(6);
      expect(model.tabArrayIndex).assertEqual(5);
      expect(model.keysAreContiguous()).assertTrue();
      expect(model.uniqueTimestampCount()).assertEqual(6);
    });

    it('Browser_Model_025', 0, async () => {
      TestLogger.step(TAG, 'round trip the selected tab index');
      const model: DeepBrowserModel = new DeepBrowserModel(4);
      for (let index = 0; index < 4; index++) {
        model.setTabArrayIndex(index);
        expect(model.getTabArrayIndex()).assertEqual(index);
        expect(model.webArray[model.getTabArrayIndex()].key).assertEqual(index);
      }
      model.setTabArrayIndex(9);
      expect(model.getTabArrayIndex()).assertEqual(9);
      expect(model.indexInRange()).assertFalse();
      model.setTabArrayIndex(-1);
      expect(model.getTabArrayIndex()).assertEqual(-1);
      expect(model.indexInRange()).assertFalse();
    });

    it('Browser_Model_026', 0, async () => {
      TestLogger.step(TAG, 'round trip the input value of the address bar');
      const model: DeepBrowserModel = new DeepBrowserModel();
      expect(model.getInputVal()).assertEqual('');
      model.setInputVal('https://example.com');
      expect(model.getInputVal()).assertEqual('https://example.com');
      model.setInputVal('');
      expect(model.getInputVal()).assertEqual('');
      const unicode: string = '例子.测试/path';
      model.setInputVal(unicode);
      expect(model.getInputVal()).assertEqual(unicode);
      expect(model.getInputVal().length).assertEqual(unicode.length);
    });

    it('Browser_Model_027', 0, async () => {
      TestLogger.step(TAG, 'register a tab controller exactly once');
      const model: DeepBrowserModel = new DeepBrowserModel(3);
      expect(model.registerTab(0)).assertTrue();
      expect(model.registerTab(0)).assertFalse();
      expect(model.webControllerArray[0].isRegistered).assertTrue();
      expect(model.registerTab(1)).assertTrue();
      expect(model.webControllerArray[1].isRegistered).assertTrue();
      expect(model.webControllerArray[2].isRegistered).assertFalse();
      expect(model.registerTab(3)).assertFalse();
      expect(model.registerTab(-1)).assertFalse();
    });

    it('Browser_Model_028', 0, async () => {
      TestLogger.step(TAG, 'compare the real loading enum with the mock mirror');
      expect(LoadingStatus.LOADING).assertEqual(0);
      expect(LoadingStatus.END).assertEqual(1);
      expect(LoadingStatus.LOADING).assertEqual(MockLoadingStatus.LOADING);
      expect(LoadingStatus.END).assertEqual(MockLoadingStatus.END);
      const model: DeepBrowserModel = new DeepBrowserModel();
      expect(model.loadingStatus).assertEqual(LoadingStatus.END);
      model.loadingStatus = MockLoadingStatus.LOADING;
      expect(model.loadingStatus).assertEqual(LoadingStatus.LOADING);
    });

    it('Browser_Model_029', 0, async () => {
      TestLogger.step(TAG, 'validate the progress bar state machine');
      const model: DeepBrowserModel = new DeepBrowserModel();
      expect(model.hideProgress).assertTrue();
      model.progress = 37;
      model.hideProgress = false;
      expect(model.progress).assertEqual(37);
      expect(model.hideProgress).assertFalse();
      model.progress = 100;
      if (model.progress === 100) {
        model.hideProgress = true;
        model.progress = 0;
      }
      expect(model.progress).assertEqual(0);
      expect(model.hideProgress).assertTrue();
    });

    it('Browser_Model_030', 0, async () => {
      TestLogger.step(TAG, 'run a fifty step mixed workflow and keep the invariants');
      const model: DeepBrowserModel = new DeepBrowserModel();
      let stable: boolean = true;
      for (let step = 0; step < WORKFLOW_STEPS; step++) {
        const phase: number = step % 5;
        if (phase === 0 && model.webArray.length <= MAX_TAB_COUNT) {
          model.addTab();
        } else if (phase === 1) {
          model.loadUrl('step' + step + '.example.com');
        } else if (phase === 2) {
          model.Back();
        } else if (phase === 3) {
          model.Forward();
        } else {
          model.Refresh();
        }
        if (!model.keysAreContiguous()) {
          stable = false;
        }
        if (model.webArray.length > 0 && !model.indexInRange()) {
          stable = false;
        }
        if (model.webArray.length !== model.controllerCount()) {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      expect(model.webArray.length).assertEqual(MAX_TAB_COUNT + 1);
      expect(model.changeIndexCalls.length).assertEqual(MAX_TAB_COUNT);
    });

    it('Browser_Model_031', 0, async () => {
      TestLogger.step(TAG, 'fill the tab list, delete five tabs and retry the add');
      const model: DeepBrowserModel = new DeepBrowserModel();
      while (model.webArray.length <= MAX_TAB_COUNT) {
        model.addTab();
      }
      expect(model.webArray.length).assertEqual(MAX_TAB_COUNT + 1);
      for (let round = 0; round < 5; round++) {
        expect(model.deleteTab(0)).assertTrue();
      }
      expect(model.webArray.length).assertEqual(6);
      expect(model.keysAreContiguous()).assertTrue();
      expect(model.addTab()).assertTrue();
      expect(model.webArray.length).assertEqual(7);
      expect(model.tabArrayIndex).assertEqual(6);
    });

    it('Browser_Model_032', 0, async () => {
      TestLogger.step(TAG, 'keep three tab histories isolated from each other');
      const model: DeepBrowserModel = new DeepBrowserModel(3);
      model.setTabArrayIndex(0);
      model.loadUrl('a.example.com');
      model.loadUrl('b.example.com');
      model.setTabArrayIndex(1);
      model.loadUrl('c.example.com');
      model.setTabArrayIndex(2);
      model.loadUrl('d.example.com');
      expect(model.webControllerArray[0].controller.history.length).assertEqual(2);
      expect(model.webControllerArray[1].controller.history.length).assertEqual(1);
      expect(model.webControllerArray[2].controller.history.length).assertEqual(1);
      expect(model.webControllerArray[0].controller.currentUrl).assertEqual('https://b.example.com');
      expect(model.webControllerArray[1].controller.currentUrl).assertEqual('https://c.example.com');
      expect(model.webControllerArray[2].controller.currentUrl).assertEqual('https://d.example.com');
    });

    it('Browser_Model_033', 0, async () => {
      TestLogger.step(TAG, 'preserve the history of surviving tabs after a delete');
      const model: DeepBrowserModel = new DeepBrowserModel(3);
      model.setTabArrayIndex(1);
      model.loadUrl('keep.example.com');
      model.setTabArrayIndex(0);
      model.loadUrl('removed.example.com');
      model.loadUrl('removed2.example.com');
      expect(model.deleteTab(0)).assertTrue();
      expect(model.webArray.length).assertEqual(2);
      expect(model.webControllerArray.length).assertEqual(2);
      expect(model.webControllerArray[0].controller.getPendingUrl())
        .assertEqual('https://keep.example.com');
      expect(model.webControllerArray[0].controller.history.length).assertEqual(1);
      expect(model.webControllerArray[1].controller.history.length).assertEqual(0);
    });

    it('Browser_Model_034', 0, async () => {
      TestLogger.step(TAG, 'preserve the timestamps of the surviving tabs');
      const model: DeepBrowserModel = new DeepBrowserModel(5);
      const before: number[] = model.timestamps();
      expect(model.deleteTab(2)).assertTrue();
      const after: number[] = model.timestamps();
      expect(after.length).assertEqual(4);
      expect(after[0]).assertEqual(before[0]);
      expect(after[1]).assertEqual(before[1]);
      expect(after[2]).assertEqual(before[3]);
      expect(after[3]).assertEqual(before[4]);
      expect(model.uniqueTimestampCount()).assertEqual(4);
      expect(model.keys()).assertDeepEquals([0, 1, 2, 3]);
    });

    it('Browser_Model_035', 0, async () => {
      TestLogger.step(TAG, 'compare the delete repair with the shared helper');
      for (let count = 2; count <= DELETE_SCAN_MAX; count++) {
        for (let current = 0; current < count; current++) {
          for (let removed = 0; removed < count; removed++) {
            const model: DeepBrowserModel = new DeepBrowserModel(count);
            model.setTabArrayIndex(current);
            model.deleteTab(removed);
            const expected: number =
              resolveTabIndexAfterDelete(current, removed, count - 1);
            expect(model.tabArrayIndex).assertEqual(expected);
            expect(model.lastChangeIndex).assertEqual(expected);
          }
        }
      }
    });

    it('Browser_Model_036', 0, async () => {
      TestLogger.step(TAG, 'compare the empty state of the deep model and the mock');
      const deep: DeepBrowserModel = new DeepBrowserModel(1);
      expect(deep.deleteTab(0)).assertTrue();
      expect(deep.webArray.length).assertEqual(0);
      const mock: MockBrowser = new MockBrowser(1);
      expect(mock.deleteTab(0)).assertFalse();
      expect(mock.tabs.length).assertEqual(1);
      expect(deep.webArray.length).assertLess(mock.tabs.length);
      expect(deep.indexInRange()).assertFalse();
      expect(mock.getTabArrayIndex()).assertEqual(0);
    });

    it('Browser_Model_037', 0, async () => {
      TestLogger.step(TAG, 'keep timestamps strictly increasing after delete and add');
      const model: DeepBrowserModel = new DeepBrowserModel(4);
      const before: number[] = model.timestamps();
      model.deleteTab(1);
      model.addTab();
      const after: number[] = model.timestamps();
      expect(after.length).assertEqual(4);
      expect(after[0]).assertEqual(before[0]);
      expect(after[3] > after[2]).assertTrue();
      expect(model.uniqueTimestampCount()).assertEqual(4);
      expect(model.keysAreContiguous()).assertTrue();
      expect(model.clock.now()).assertEqual(after[3]);
    });

    it('Browser_Model_038', 0, async () => {
      TestLogger.step(TAG, 'delete the trailing tab until a single tab remains');
      const model: DeepBrowserModel = new DeepBrowserModel(MAX_TAB_COUNT);
      while (model.webArray.length > 1) {
        const last: number = model.webArray.length - 1;
        model.setTabArrayIndex(last);
        expect(model.deleteTab(last)).assertTrue();
        expect(model.indexInRange()).assertTrue();
      }
      expect(model.webArray.length).assertEqual(1);
      expect(model.keys()).assertDeepEquals([0]);
      expect(model.controllerCount()).assertEqual(1);
      expect(model.tabArrayIndex).assertEqual(0);
      expect(model.uniqueTimestampCount()).assertEqual(1);
    });

    it('Browser_Model_039', 0, async () => {
      TestLogger.step(TAG, 'avoid duplicate history entries for the same url');
      const model: DeepBrowserModel = new DeepBrowserModel();
      model.loadUrl('same.example.com');
      model.loadUrl('same.example.com');
      model.loadUrl('same.example.com');
      const controller: MockWebController = model.webControllerArray[0].controller;
      expect(controller.loadCount).assertEqual(3);
      expect(controller.history.length).assertEqual(1);
      expect(controller.historyIndex).assertEqual(0);
      expect(model.Back()).assertFalse();
      expect(model.Forward()).assertFalse();
    });

    it('Browser_Model_040', 0, async () => {
      TestLogger.step(TAG, 'truncate the forward history when a new page loads');
      const model: DeepBrowserModel = new DeepBrowserModel();
      model.loadUrl('a.example.com');
      model.loadUrl('b.example.com');
      model.loadUrl('c.example.com');
      const controller: MockWebController = model.webControllerArray[0].controller;
      expect(model.Back()).assertTrue();
      expect(controller.currentUrl).assertEqual('https://b.example.com');
      model.loadUrl('d.example.com');
      expect(controller.history.length).assertEqual(3);
      expect(controller.history[0]).assertEqual('https://a.example.com');
      expect(controller.history[1]).assertEqual('https://b.example.com');
      expect(controller.history[2]).assertEqual('https://d.example.com');
      expect(model.Forward()).assertFalse();
      expect(model.Back()).assertTrue();
      expect(controller.currentUrl).assertEqual('https://b.example.com');
    });

    it('Browser_Model_041', 0, async () => {
      TestLogger.step(TAG, 'count the surviving entries after forward history truncation');
      const model: DeepBrowserModel = new DeepBrowserModel();
      for (let index = 0; index < HISTORY_SIZE; index++) {
        model.loadUrl('h' + index + '.example.com');
      }
      const controller: MockWebController = model.webControllerArray[0].controller;
      expect(model.Back()).assertTrue();
      expect(model.Back()).assertTrue();
      model.loadUrl('fresh.example.com');
      expect(controller.history.length).assertEqual(4);
      expect(controller.history[HISTORY_SIZE - 3]).assertEqual('https://h2.example.com');
      expect(controller.history[controller.history.length - 1])
        .assertEqual('https://fresh.example.com');
      expect(controller.historyIndex).assertEqual(3);
      expect(controller.currentUrl).assertEqual('https://fresh.example.com');
    });

    it('Browser_Model_042', 0, async () => {
      TestLogger.step(TAG, 'renumber the key objects that follow a deletion');
      const model: DeepBrowserModel = new DeepBrowserModel(4);
      const kept: DeepKey = model.webArray[2];
      const originalTimestamp: number = kept.timestamp;
      expect(model.deleteTab(1)).assertTrue();
      expect(kept.key).assertEqual(1);
      expect(kept.timestamp).assertEqual(originalTimestamp);
      expect(model.webArray[1] === kept).assertTrue();
      expect(model.getWebArray()[1] === kept).assertTrue();
      expect(model.keys()).assertDeepEquals([0, 1, 2]);
    });

    it('Browser_Model_043', 0, async () => {
      TestLogger.step(TAG, 'delete the first of two tabs with the first selected');
      const model: DeepBrowserModel = new DeepBrowserModel(2);
      expect(model.tabArrayIndex).assertEqual(0);
      expect(model.deleteTab(0)).assertTrue();
      expect(model.webArray.length).assertEqual(1);
      expect(model.controllerCount()).assertEqual(1);
      expect(model.tabArrayIndex).assertEqual(0);
      expect(model.indexInRange()).assertTrue();
      expect(model.keys()).assertDeepEquals([0]);
    });

    it('Browser_Model_044', 0, async () => {
      TestLogger.step(TAG, 'record the change index of every tab mutation');
      const model: DeepBrowserModel = new DeepBrowserModel(1);
      expect(model.changeIndexCalls.length).assertEqual(0);
      model.addTab();
      model.addTab();
      expect(model.changeIndexCalls).assertDeepEquals([1, 2]);
      model.deleteTab(0);
      expect(model.changeIndexCalls).assertDeepEquals([1, 2, 1]);
      model.deleteTab(1);
      expect(model.changeIndexCalls).assertDeepEquals([1, 2, 1, 0]);
      expect(model.lastChangeIndex).assertEqual(0);
      expect(model.webArray.length).assertEqual(1);
    });

    it('Browser_Model_045', 0, async () => {
      TestLogger.step(TAG, 'assign sequential controller identities on add');
      const model: DeepBrowserModel = new DeepBrowserModel(1);
      model.addTab();
      model.addTab();
      model.addTab();
      expect(model.controllerCount()).assertEqual(4);
      for (let index = 0; index < model.controllerCount(); index++) {
        expect(model.webControllerArray[index].id).assertEqual(index);
      }
      expect(model.webControllerArray[3].isRegistered).assertFalse();
      expect(model.webControllerArray[3].controller.getPendingUrl()).assertEqual('');
    });

    it('Browser_Model_046', 0, async () => {
      TestLogger.step(TAG, 'drop the registration flag together with the deleted controller');
      const model: DeepBrowserModel = new DeepBrowserModel(3);
      expect(model.registerTab(0)).assertTrue();
      expect(model.registerTab(1)).assertTrue();
      expect(model.deleteTab(0)).assertTrue();
      expect(model.webControllerArray.length).assertEqual(2);
      expect(model.webControllerArray[0].id).assertEqual(1);
      expect(model.webControllerArray[0].isRegistered).assertTrue();
      expect(model.webControllerArray[1].id).assertEqual(2);
      expect(model.webControllerArray[1].isRegistered).assertFalse();
      expect(model.registerTab(1)).assertTrue();
      expect(model.webControllerArray[1].isRegistered).assertTrue();
    });

    it('Browser_Model_047', 0, async () => {
      TestLogger.step(TAG, 'delete five middle tabs while keeping the key chain valid');
      const model: DeepBrowserModel = new DeepBrowserModel(MAX_TAB_COUNT);
      let deleted: number = 0;
      while (model.webArray.length > 5) {
        expect(model.deleteTab(2)).assertTrue();
        deleted += 1;
        expect(model.keysAreContiguous()).assertTrue();
        expect(model.webArray.length).assertEqual(model.controllerCount());
      }
      expect(deleted).assertEqual(MAX_TAB_COUNT - 5);
      expect(model.keys()).assertDeepEquals([0, 1, 2, 3, 4]);
      expect(model.indexInRange()).assertTrue();
      expect(model.uniqueTimestampCount()).assertEqual(5);
    });

    it('Browser_Model_048', 0, async () => {
      TestLogger.step(TAG, 'verify the forced prefix over an address table');
      const addresses: string[] = [
        'example.com', 'http://example.com', 'https://example.com',
        'file://index.html', 'about:blank'
      ];
      const expected: string[] = [
        'https://example.com', 'https://http://example.com',
        'https://https://example.com', 'https://file://index.html',
        'https://about:blank'
      ];
      const model: DeepBrowserModel = new DeepBrowserModel();
      for (let index = 0; index < addresses.length; index++) {
        expect(model.loadUrl(addresses[index])).assertTrue();
        expect(model.webControllerArray[0].controller.getPendingUrl()).assertEqual(expected[index]);
        expect(model.webControllerArray[0].controller.getPendingUrl().startsWith('https://'))
          .assertTrue();
      }
      expect(model.webControllerArray[0].controller.loadCount).assertEqual(5);
    });

    it('Browser_Model_049', 0, async () => {
      TestLogger.step(TAG, 'refresh every tab three times through the model');
      const model: DeepBrowserModel = new DeepBrowserModel(4);
      for (let round = 0; round < 3; round++) {
        for (let index = 0; index < 4; index++) {
          model.setTabArrayIndex(index);
          expect(model.Refresh()).assertTrue();
        }
      }
      for (let index = 0; index < 4; index++) {
        expect(model.webControllerArray[index].controller.refreshCount).assertEqual(3);
      }
      expect(model.tabArrayIndex).assertEqual(3);
    });

    it('Browser_Model_050', 0, async () => {
      TestLogger.step(TAG, 'aggregate twenty mixed operations of the deep model');
      const model: DeepBrowserModel = new DeepBrowserModel(2);
      let failures: number = 0;
      for (let step = 0; step < 20; step++) {
        if (step % 4 === 0) {
          model.loadUrl('mix' + step + '.example.com');
        } else if (step % 4 === 1) {
          if (model.webArray.length <= MAX_TAB_COUNT) {
            model.addTab();
          }
        } else if (step % 4 === 2) {
          model.Back();
        } else {
          model.Refresh();
        }
        if (!model.keysAreContiguous() || model.webArray.length !== model.controllerCount()) {
          failures += 1;
        }
      }
      expect(failures).assertEqual(0);
      expect(model.keysAreContiguous()).assertTrue();
      expect(model.webArray.length).assertEqual(model.controllerCount());
      expect(model.webArray.length > 1).assertTrue();
      expect(model.uniqueTimestampCount()).assertEqual(model.webArray.length);
    });

    it('Browser_Model_051', 0, async () => {
      TestLogger.step(TAG, 'churn fifteen add and delete cycles and keep stamps unique');
      const model: DeepBrowserModel = new DeepBrowserModel();
      for (let cycle = 0; cycle < 15; cycle++) {
        expect(model.addTab()).assertTrue();
        const last: number = model.webArray.length - 1;
        expect(model.deleteTab(last)).assertTrue();
        expect(model.keysAreContiguous()).assertTrue();
        expect(model.uniqueTimestampCount()).assertEqual(model.webArray.length);
      }
      expect(model.webArray.length).assertEqual(1);
      expect(model.controllerCount()).assertEqual(1);
      expect(model.clock.now() > BASE_TIMESTAMP).assertTrue();
    });

    it('Browser_Model_052', 0, async () => {
      TestLogger.step(TAG, 'load into the last valid tab and then out of range');
      const model: DeepBrowserModel = new DeepBrowserModel(4);
      model.setTabArrayIndex(3);
      expect(model.loadUrl('last.example.com')).assertTrue();
      expect(model.webControllerArray[3].controller.getPendingUrl())
        .assertEqual('https://last.example.com');
      expect(model.webControllerArray[2].controller.getPendingUrl()).assertEqual('');
      model.setTabArrayIndex(4);
      expect(model.loadUrl('missing.example.com')).assertFalse();
      expect(model.controllerCount()).assertEqual(4);
      expect(model.webControllerArray[3].controller.loadCount).assertEqual(1);
    });

    it('Browser_Model_053', 0, async () => {
      TestLogger.step(TAG, 'scan the constructor for one to twelve initial tabs');
      for (let count = 1; count <= MAX_TAB_COUNT + 2; count++) {
        const model: DeepBrowserModel = new DeepBrowserModel(count);
        expect(model.webArray.length).assertEqual(count);
        expect(model.controllerCount()).assertEqual(count);
        expect(model.keysAreContiguous()).assertTrue();
        expect(model.uniqueTimestampCount()).assertEqual(count);
        expect(model.tabArrayIndex).assertEqual(0);
        expect(model.getWebArray()[count - 1].key).assertEqual(count - 1);
      }
    });

    it('Browser_Model_054', 0, async () => {
      TestLogger.step(TAG, 'scan the add capacity boundary from one to twelve tabs');
      for (let count = 1; count <= MAX_TAB_COUNT + 2; count++) {
        const model: DeepBrowserModel = new DeepBrowserModel(count);
        const accepted: boolean = model.addTab();
        expect(accepted).assertEqual(count <= MAX_TAB_COUNT);
        expect(model.webArray.length).assertEqual(accepted ? count + 1 : count);
        if (accepted) {
          expect(model.tabArrayIndex).assertEqual(count);
        }
        expect(model.keysAreContiguous()).assertTrue();
      }
    });

    it('Browser_Model_055', 0, async () => {
      TestLogger.step(TAG, 'compare the single tab delete with the shared helper');
      const model: DeepBrowserModel = new DeepBrowserModel(1);
      const helperResult: number = resolveTabIndexAfterDelete(0, 0, 0);
      expect(helperResult).assertEqual(0);
      expect(model.deleteTab(0)).assertTrue();
      expect(model.tabArrayIndex).assertEqual(-1);
      expect(model.tabArrayIndex).assertLess(helperResult);
      expect(model.indexInRange()).assertFalse();
      expect(model.webArray.length).assertEqual(0);
    });

    it('Browser_Model_056', 0, async () => {
      TestLogger.step(TAG, 'run a scripted twelve step browser scenario');
      const model: DeepBrowserModel = new DeepBrowserModel(2);
      expect(model.addTab()).assertTrue();
      expect(model.webArray.length).assertEqual(3);
      model.loadUrl('one.example.com');
      model.loadUrl('two.example.com');
      expect(model.Back()).assertTrue();
      expect(model.webControllerArray[2].controller.currentUrl)
        .assertEqual('https://one.example.com');
      expect(model.Forward()).assertTrue();
      model.setTabArrayIndex(0);
      expect(model.Refresh()).assertTrue();
      expect(model.webControllerArray[0].controller.refreshCount).assertEqual(1);
      expect(model.deleteTab(0)).assertTrue();
      expect(model.webArray.length).assertEqual(2);
      expect(model.keysAreContiguous()).assertTrue();
      expect(model.keys()).assertDeepEquals([0, 1]);
      expect(model.webControllerArray[1].controller.currentUrl)
        .assertEqual('https://two.example.com');
      expect(model.tabArrayIndex).assertEqual(0);
      expect(model.indexInRange()).assertTrue();
    });

    it('Browser_Model_057', 0, async () => {
      TestLogger.step(TAG, 'delete the first tab with the trailing tab selected');
      for (let count = 3; count <= 7; count++) {
        const model: DeepBrowserModel = new DeepBrowserModel(count);
        model.setTabArrayIndex(count - 1);
        expect(model.deleteTab(0)).assertTrue();
        expect(model.webArray.length).assertEqual(count - 1);
        expect(model.tabArrayIndex).assertEqual(count - 2);
        expect(model.lastChangeIndex).assertEqual(count - 2);
        expect(model.keysAreContiguous()).assertTrue();
        expect(model.controllerCount()).assertEqual(count - 1);
      }
    });

    it('Browser_Model_058', 0, async () => {
      TestLogger.step(TAG, 'keep two tab histories intact across tab switches');
      const model: DeepBrowserModel = new DeepBrowserModel(2);
      model.setTabArrayIndex(0);
      model.loadUrl('a1.example.com');
      model.loadUrl('a2.example.com');
      model.setTabArrayIndex(1);
      model.loadUrl('b1.example.com');
      model.loadUrl('b2.example.com');
      expect(model.Back()).assertTrue();
      expect(model.webControllerArray[1].controller.currentUrl)
        .assertEqual('https://b1.example.com');
      model.setTabArrayIndex(0);
      expect(model.webControllerArray[0].controller.currentUrl)
        .assertEqual('https://a2.example.com');
      expect(model.Back()).assertTrue();
      expect(model.webControllerArray[0].controller.currentUrl)
        .assertEqual('https://a1.example.com');
      expect(model.webControllerArray[1].controller.currentUrl)
        .assertEqual('https://b1.example.com');
      expect(model.webControllerArray[0].controller.history.length).assertEqual(2);
      expect(model.webControllerArray[1].controller.history.length).assertEqual(2);
      expect(model.webControllerArray[0].controller.loadCount).assertEqual(2);
      expect(model.webControllerArray[1].controller.loadCount).assertEqual(2);
      expect(model.webControllerArray[0].controller.historyIndex).assertEqual(0);
      expect(model.webControllerArray[1].controller.historyIndex).assertEqual(0);
    });
  });
}


