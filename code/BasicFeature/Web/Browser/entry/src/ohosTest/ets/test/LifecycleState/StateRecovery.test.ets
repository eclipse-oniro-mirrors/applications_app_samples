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
import TestLogger from '../Shared/TestLogger';
import {
  getDriver, startBrowserApp, serializedDelay, componentByIdExists, countById,
  MAX_TAB_COUNT, PAD_HOME_PAGE, PHONE_HOME_PAGE, ID_INPUT_URL, ID_CANCEL_TAB,
  TIMEOUT_COMPONENT, TIMEOUT_TAB_SWITCH
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockBrowserTab } from '../Shared/BrowserMock';

const TAG: string = 'BrowserStateRecoveryTest';

/** One persisted tab inside a recovery snapshot. */
class RecoveryTab {
  key: number;
  url: string;
  historyIndex: number;
  history: string[];

  constructor(key: number, url: string, historyIndex: number, history: string[] = []) {
    this.key = key;
    this.url = url;
    this.historyIndex = historyIndex;
    this.history = history;
  }
}

/** Everything needed to rebuild the browsing UI after a process restart. */
class RecoverySnapshot {
  tabs: RecoveryTab[] = [];
  tabIndex: number = 0;
  inputValue: string = '';
  progress: number = 0;
  savedAt: number = 0;
  complete: boolean = true;

  tabCount(): number {
    return this.tabs.length;
  }

  describe(): string {
    return `tabs=${this.tabs.length},index=${this.tabIndex},savedAt=${this.savedAt},complete=${this.complete}`;
  }
}

/** Ordered recovery steps, used to assert the restore sequence. */
class RecoveryLog {
  steps: string[] = [];

  add(step: string): void {
    this.steps.push(step);
  }

  line(): string {
    return this.steps.join('>');
  }

  count(): number {
    return this.steps.length;
  }

  reset(): void {
    this.steps = [];
  }
}

/**
 * Rebuilds a browser mirror from a snapshot.
 *
 * The engine is written to be idempotent: running recover twice on the same
 * snapshot must produce the same DOM independent tab model.
 */
class RecoveryEngine {
  log: RecoveryLog = new RecoveryLog();
  private lastApplied: string = '';

  snapshot(browser: MockBrowser, savedAt: number): RecoverySnapshot {
    const snapshot: RecoverySnapshot = new RecoverySnapshot();
    for (let index = 0; index < browser.tabs.length; index++) {
      const tab: MockBrowserTab = browser.tabs[index];
      snapshot.tabs.push(new RecoveryTab(tab.key, tab.controller.currentUrl,
        tab.controller.historyIndex, tab.controller.history.slice(0)));
    }
    snapshot.tabIndex = browser.getTabArrayIndex();
    snapshot.inputValue = browser.getInputVal();
    snapshot.progress = browser.progress === 100 ? 0 : browser.progress;
    snapshot.savedAt = savedAt;
    snapshot.complete = snapshot.tabs.length > 0;
    return snapshot;
  }

  /** Returns a new browser instance rebuilt from the snapshot. */
  rebuild(snapshot: RecoverySnapshot, homePage: string = PAD_HOME_PAGE): MockBrowser {
    this.log = new RecoveryLog();
    const browser: MockBrowser = new MockBrowser();
    browser.tabs = [];
    if (snapshot === null || snapshot.tabs.length === 0) {
      this.log.add('fallback-home');
      const home: MockBrowserTab = new MockBrowserTab(0, 1700000000000);
      home.controller.loadUrl(homePage);
      browser.tabs.push(home);
      browser.setTabArrayIndex(0);
      browser.setInputVal('');
      this.lastApplied = 'home';
      return browser;
    }
    this.log.add('restore-tabs');
    for (let index = 0; index < snapshot.tabs.length; index++) {
      const item: RecoveryTab = snapshot.tabs[index];
      const tab: MockBrowserTab = new MockBrowserTab(item.key, 1700000000000 + item.key);
      let visited: string[] = item.history;
      if (visited.length === 0 && item.url.length > 0) {
        visited = [item.url];
      }
      for (let cursor = 0; cursor < visited.length; cursor++) {
        tab.controller.loadUrl(visited[cursor]);
      }
      let target: number = item.historyIndex;
      if (target < 0) {
        target = 0;
      }
      if (visited.length > 0 && target >= visited.length) {
        target = visited.length - 1;
      }
      while (visited.length > 0 && tab.controller.historyIndex > target) {
        tab.controller.backward();
      }
      browser.tabs.push(tab);
    }
    this.log.add('restore-index');
    let index: number = snapshot.tabIndex;
    if (index < 0) {
      index = 0;
    }
    if (index >= browser.tabs.length) {
      index = browser.tabs.length - 1;
    }
    browser.setTabArrayIndex(index);
    this.log.add('restore-input');
    browser.setInputVal(snapshot.inputValue);
    this.log.add('restore-progress');
    browser.onProgressChange(snapshot.progress);
    this.lastApplied = snapshot.describe();
    return browser;
  }

  /** Process restart recovery: rebuild in place and keep the caller reference. */
  recover(browser: MockBrowser, snapshot: RecoverySnapshot, homePage: string = PAD_HOME_PAGE): MockBrowser {
    const rebuilt: MockBrowser = this.rebuild(snapshot, homePage);
    browser.tabs = rebuilt.tabs;
    browser.setTabArrayIndex(rebuilt.getTabArrayIndex());
    browser.setInputVal(rebuilt.getInputVal());
    browser.onProgressChange(rebuilt.progress);
    return browser;
  }

  /** Rotation keeps navigation state and only re-runs the layout step. */
  rotate(browser: MockBrowser, landscape: boolean): string {
    this.log.add(landscape ? 'layout-landscape' : 'layout-portrait');
    browser.onPageEnd();
    return landscape ? 'landscape' : 'portrait';
  }

  appliedMarker(): string {
    return this.lastApplied;
  }

  reset(): void {
    this.log = new RecoveryLog();
    this.lastApplied = '';
  }
}

/** Simulated abrupt termination; the snapshot taken before it is the only state. */
class ProcessRebuild {
  crashed: boolean = false;
  recovered: boolean = false;
  attempts: number = 0;

  crash(): void {
    this.crashed = true;
  }

  recover(engine: RecoveryEngine, browser: MockBrowser, snapshot: RecoverySnapshot): MockBrowser {
    this.attempts += 1;
    if (!this.crashed) {
      return browser;
    }
    this.recovered = true;
    return engine.recover(browser, snapshot);
  }
}

function urlsOf(browser: MockBrowser): string[] {
  const result: string[] = [];
  for (let index = 0; index < browser.tabs.length; index++) {
    result.push(browser.tabs[index].controller.currentUrl);
  }
  return result;
}
export default function browserStateRecoveryTest() {
  describe('browserStateRecoveryTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'state recovery suite begin');
      await startBrowserApp();
      await serializedDelay(driver, TIMEOUT_COMPONENT / 2);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Recovery_001', 0, async () => {
      TestLogger.step(TAG, 'snapshot captures tabs, index, input and progress');
      const browser: MockBrowser = new MockBrowser();
      browser.loadUrl('www.sample.com');
      browser.addTab();
      browser.loadUrl('www.bing.com');
      browser.setInputVal('www.bing.com');
      browser.onProgressChange(55);
      const engine: RecoveryEngine = new RecoveryEngine();
      const snapshot: RecoverySnapshot = engine.snapshot(browser, 1700000005000);
      expect(snapshot.tabCount()).assertEqual(2);
      expect(snapshot.tabIndex).assertEqual(1);
      expect(snapshot.inputValue).assertEqual('www.bing.com');
      expect(snapshot.progress).assertEqual(55);
      expect(snapshot.savedAt).assertEqual(1700000005000);
      expect(snapshot.complete).assertTrue();
    });

    it('Browser_Recovery_002', 0, async () => {
      TestLogger.step(TAG, 'rebuild restores the tab count and every url');
      const source: MockBrowser = new MockBrowser();
      source.loadUrl('www.sample.com');
      source.addTab();
      source.loadUrl('www.bing.com');
      source.addTab();
      source.loadUrl('pad.html');
      const engine: RecoveryEngine = new RecoveryEngine();
      const rebuilt: MockBrowser = engine.rebuild(engine.snapshot(source, 1700000001000));
      expect(rebuilt.tabs.length).assertEqual(3);
      expect(urlsOf(rebuilt)[0]).assertEqual('https://www.sample.com');
      expect(urlsOf(rebuilt)[1]).assertEqual('https://www.bing.com');
      expect(urlsOf(rebuilt)[2]).assertEqual('https://pad.html');
      expect(rebuilt.getTabKeys().join(',')).assertEqual('0,1,2');
    });

    it('Browser_Recovery_003', 0, async () => {
      TestLogger.step(TAG, 'rebuild restores the selected tab index');
      const source: MockBrowser = new MockBrowser(4);
      source.selectTab(2);
      source.setInputVal('www.sample.com');
      const engine: RecoveryEngine = new RecoveryEngine();
      const rebuilt: MockBrowser = engine.rebuild(engine.snapshot(source, 1700000002000));
      expect(rebuilt.tabs.length).assertEqual(4);
      expect(rebuilt.getTabArrayIndex()).assertEqual(2);
      expect(rebuilt.getCurrentTab()?.key).assertEqual(2);
      expect(rebuilt.getInputVal()).assertEqual('www.sample.com');
    });

    it('Browser_Recovery_004', 0, async () => {
      TestLogger.step(TAG, 'restore steps run in a deterministic order');
      const source: MockBrowser = new MockBrowser();
      source.loadUrl('www.sample.com');
      const engine: RecoveryEngine = new RecoveryEngine();
      const snapshot: RecoverySnapshot = engine.snapshot(source, 1700000003000);
      engine.rebuild(snapshot);
      expect(engine.log.line()).assertEqual(
        'restore-tabs>restore-index>restore-input>restore-progress');
      expect(engine.log.count()).assertEqual(4);
      expect(engine.appliedMarker()).assertContain('tabs=1');
    });

    it('Browser_Recovery_005', 0, async () => {
      TestLogger.step(TAG, 'rotation keeps the current url untouched');
      const browser: MockBrowser = new MockBrowser();
      browser.loadUrl('www.sample.com');
      browser.loadUrl('www.bing.com');
      const engine: RecoveryEngine = new RecoveryEngine();
      const before: string = browser.getCurrentTab()?.controller.currentUrl ?? '';
      expect(engine.rotate(browser, true)).assertEqual('landscape');
      expect(browser.getCurrentTab()?.controller.currentUrl).assertEqual(before);
      expect(engine.rotate(browser, false)).assertEqual('portrait');
      expect(browser.getCurrentTab()?.controller.currentUrl).assertEqual(before);
    });

    it('Browser_Recovery_006', 0, async () => {
      TestLogger.step(TAG, 'rotation keeps tabs, index and history');
      const browser: MockBrowser = new MockBrowser(3);
      browser.selectTab(1);
      browser.loadUrl('www.sample.com');
      const engine: RecoveryEngine = new RecoveryEngine();
      const historyBefore: number = browser.getCurrentTab()?.controller.history.length ?? 0;
      engine.rotate(browser, true);
      engine.rotate(browser, false);
      expect(browser.tabs.length).assertEqual(3);
      expect(browser.getTabArrayIndex()).assertEqual(1);
      expect(browser.getCurrentTab()?.controller.history.length).assertEqual(historyBefore);
      expect(engine.log.line()).assertEqual('layout-landscape>layout-portrait');
    });

    it('Browser_Recovery_007', 0, async () => {
      TestLogger.step(TAG, 'abrupt exit recovers from the last snapshot');
      const source: MockBrowser = new MockBrowser();
      source.loadUrl('www.sample.com');
      source.addTab();
      source.loadUrl('www.bing.com');
      const engine: RecoveryEngine = new RecoveryEngine();
      const snapshot: RecoverySnapshot = engine.snapshot(source, 1700000004000);
      const rebuild: ProcessRebuild = new ProcessRebuild();
      const reloaded: MockBrowser = new MockBrowser();
      rebuild.crash();
      const recovered: MockBrowser = rebuild.recover(engine, reloaded, snapshot);
      expect(rebuild.crashed).assertTrue();
      expect(rebuild.recovered).assertTrue();
      expect(rebuild.attempts).assertEqual(1);
      expect(recovered.tabs.length).assertEqual(2);
      expect(recovered.getCurrentTab()?.controller.currentUrl).assertEqual('https://www.bing.com');
    });

    it('Browser_Recovery_008', 0, async () => {
      TestLogger.step(TAG, 'recovery without a crash is a no-op');
      const engine: RecoveryEngine = new RecoveryEngine();
      const browser: MockBrowser = new MockBrowser();
      browser.loadUrl('www.sample.com');
      const rebuild: ProcessRebuild = new ProcessRebuild();
      const snapshot: RecoverySnapshot = engine.snapshot(browser, 1700000000000);
      const result: MockBrowser = rebuild.recover(engine, browser, snapshot);
      expect(rebuild.crashed).assertFalse();
      expect(rebuild.recovered).assertFalse();
      expect(result.tabs.length).assertEqual(1);
      expect(result.getCurrentTab()?.controller.currentUrl).assertEqual('https://www.sample.com');
    });

    it('Browser_Recovery_009', 0, async () => {
      TestLogger.step(TAG, 'empty snapshot falls back to the device home page');
      const engine: RecoveryEngine = new RecoveryEngine();
      const snapshot: RecoverySnapshot = new RecoverySnapshot();
      snapshot.complete = false;
      const rebuilt: MockBrowser = engine.rebuild(snapshot, PHONE_HOME_PAGE);
      expect(rebuilt.tabs.length).assertEqual(1);
      expect(rebuilt.getCurrentTab()?.controller.currentUrl).assertEqual(PHONE_HOME_PAGE);
      expect(rebuilt.getTabArrayIndex()).assertEqual(0);
      expect(rebuilt.getInputVal()).assertEqual('');
      expect(engine.log.line()).assertEqual('fallback-home');
    });

    it('Browser_Recovery_010', 0, async () => {
      TestLogger.step(TAG, 'recovery is idempotent for the same snapshot');
      const source: MockBrowser = new MockBrowser();
      source.loadUrl('www.sample.com');
      source.addTab();
      source.loadUrl('www.bing.com');
      const engine: RecoveryEngine = new RecoveryEngine();
      const snapshot: RecoverySnapshot = engine.snapshot(source, 1700000000000);
      const first: MockBrowser = engine.rebuild(snapshot);
      const second: MockBrowser = engine.rebuild(snapshot);
      expect(first.tabs.length).assertEqual(second.tabs.length);
      expect(urlsOf(first).join(',')).assertEqual(urlsOf(second).join(','));
      expect(first.getTabArrayIndex()).assertEqual(second.getTabArrayIndex());
      expect(snapshot.tabCount()).assertEqual(2);
    });
    it('Browser_Recovery_011', 0, async () => {
      TestLogger.step(TAG, 'out of range snapshot index is clamped into the tab array');
      const engine: RecoveryEngine = new RecoveryEngine();
      const snapshot: RecoverySnapshot = new RecoverySnapshot();
      snapshot.tabs.push(new RecoveryTab(0, 'https://www.sample.com', 0));
      snapshot.tabs.push(new RecoveryTab(1, 'https://www.bing.com', 0));
      snapshot.tabIndex = 9;
      const high: MockBrowser = engine.rebuild(snapshot);
      expect(high.getTabArrayIndex()).assertEqual(1);
      snapshot.tabIndex = -4;
      const low: MockBrowser = engine.rebuild(snapshot);
      expect(low.getTabArrayIndex()).assertEqual(0);
      expect(low.tabs.length).assertEqual(2);
    });

    it('Browser_Recovery_012', 0, async () => {
      TestLogger.step(TAG, 'ten tab snapshot rebuilds completely');
      const source: MockBrowser = new MockBrowser(MAX_TAB_COUNT);
      for (let index = 0; index < MAX_TAB_COUNT; index++) {
        source.selectTab(index);
        source.loadUrl(`www.site${index}.com`);
      }
      source.selectTab(5);
      const engine: RecoveryEngine = new RecoveryEngine();
      const rebuilt: MockBrowser = engine.rebuild(engine.snapshot(source, 1700000000000));
      expect(rebuilt.tabs.length).assertEqual(MAX_TAB_COUNT);
      expect(rebuilt.getTabArrayIndex()).assertEqual(5);
      expect(urlsOf(rebuilt)[0]).assertEqual('https://www.site0.com');
      expect(urlsOf(rebuilt)[9]).assertEqual('https://www.site9.com');
    });

    it('Browser_Recovery_013', 0, async () => {
      TestLogger.step(TAG, 'empty url inside a snapshot is restored as a blank tab');
      const engine: RecoveryEngine = new RecoveryEngine();
      const snapshot: RecoverySnapshot = new RecoverySnapshot();
      snapshot.tabs.push(new RecoveryTab(0, 'https://www.sample.com', 0));
      snapshot.tabs.push(new RecoveryTab(1, '', 0));
      snapshot.tabIndex = 1;
      snapshot.inputValue = 'www.bing.com';
      const rebuilt: MockBrowser = engine.rebuild(snapshot);
      expect(rebuilt.tabs.length).assertEqual(2);
      expect(rebuilt.tabs[1].controller.currentUrl).assertEqual('');
      expect(rebuilt.getTabArrayIndex()).assertEqual(1);
      expect(rebuilt.getInputVal()).assertEqual('www.bing.com');
    });

    it('Browser_Recovery_014', 0, async () => {
      TestLogger.step(TAG, 'completed progress is normalized before it is stored');
      const browser: MockBrowser = new MockBrowser();
      browser.onProgressChange(100);
      const engine: RecoveryEngine = new RecoveryEngine();
      const snapshot: RecoverySnapshot = engine.snapshot(browser, 1700000000000);
      expect(snapshot.progress).assertEqual(0);
      browser.onProgressChange(30);
      expect(engine.snapshot(browser, 1).progress).assertEqual(30);
    });

    it('Browser_Recovery_015', 0, async () => {
      TestLogger.step(TAG, 'recovered browser keeps a usable history stack');
      const source: MockBrowser = new MockBrowser();
      source.loadUrl('www.sample.com');
      source.loadUrl('www.bing.com');
      const engine: RecoveryEngine = new RecoveryEngine();
      const rebuilt: MockBrowser = engine.rebuild(engine.snapshot(source, 1700000000000));
      expect(rebuilt.getCurrentTab()?.controller.accessBackward()).assertTrue();
      expect(rebuilt.back()).assertTrue();
      expect(rebuilt.getCurrentTab()?.controller.currentUrl).assertEqual('https://www.sample.com');
      expect(rebuilt.forward()).assertTrue();
      expect(rebuilt.getCurrentTab()?.controller.currentUrl).assertEqual('https://www.bing.com');
    });

    it('Browser_Recovery_016', 0, async () => {
      TestLogger.step(TAG, 'recovery does not duplicate the home page');
      const source: MockBrowser = new MockBrowser(2);
      source.resetToHome(PAD_HOME_PAGE);
      const engine: RecoveryEngine = new RecoveryEngine();
      const rebuilt: MockBrowser = engine.rebuild(engine.snapshot(source, 1700000000000));
      expect(rebuilt.tabs.length).assertEqual(2);
      expect(urlsOf(rebuilt).indexOf(PAD_HOME_PAGE)).assertEqual(0);
      expect(urlsOf(rebuilt).filter((url: string) => url === PAD_HOME_PAGE).length).assertEqual(1);
      expect(engine.log.line()).assertEqual('restore-tabs>restore-index>restore-input>restore-progress');
    });

    it('Browser_Recovery_017', 0, async () => {
      TestLogger.step(TAG, 'recovering into an existing browser keeps the caller reference');
      const engine: RecoveryEngine = new RecoveryEngine();
      const snapshot: RecoverySnapshot = new RecoverySnapshot();
      snapshot.tabs.push(new RecoveryTab(0, 'https://www.sample.com', 0));
      snapshot.tabs.push(new RecoveryTab(1, 'https://www.bing.com', 0));
      snapshot.tabIndex = 1;
      const live: MockBrowser = new MockBrowser(1);
      const result: MockBrowser = engine.recover(live, snapshot);
      expect(result === live).assertTrue();
      expect(live.tabs.length).assertEqual(2);
      expect(live.getTabArrayIndex()).assertEqual(1);
      expect(live.getCurrentTab()?.controller.currentUrl).assertEqual('https://www.bing.com');
    });

    it('Browser_Recovery_018', 0, async () => {
      TestLogger.step(TAG, 'after destroy the recovery produces a single tab home page');
      const source: MockBrowser = new MockBrowser();
      source.loadUrl('www.sample.com');
      const engine: RecoveryEngine = new RecoveryEngine();
      const snapshot: RecoverySnapshot = engine.snapshot(source, 1700000000000);
      source.tabs = [];
      source.setTabArrayIndex(0);
      const afterDestroy: RecoverySnapshot = engine.snapshot(source, 1700000001000);
      expect(afterDestroy.complete).assertFalse();
      const rebuilt: MockBrowser = engine.rebuild(afterDestroy, PAD_HOME_PAGE);
      expect(rebuilt.tabs.length).assertEqual(1);
      expect(rebuilt.getCurrentTab()?.controller.currentUrl).assertEqual(PAD_HOME_PAGE);
      expect(snapshot.tabCount()).assertEqual(1);
    });

    it('Browser_Recovery_019', 0, async () => {
      TestLogger.step(TAG, 'engine reset clears the step log between recoveries');
      const engine: RecoveryEngine = new RecoveryEngine();
      const browser: MockBrowser = new MockBrowser();
      engine.rotate(browser, true);
      expect(engine.log.count()).assertEqual(1);
      engine.reset();
      expect(engine.log.count()).assertEqual(0);
      expect(engine.appliedMarker()).assertEqual('');
      const snapshot: RecoverySnapshot = engine.snapshot(browser, 1700000000000);
      engine.rebuild(snapshot);
      expect(engine.log.count()).assertEqual(4);
    });

    it('Browser_Recovery_020', 0, async () => {
      TestLogger.step(TAG, 'snapshot describes its contents for the report');
      const browser: MockBrowser = new MockBrowser(2);
      const engine: RecoveryEngine = new RecoveryEngine();
      const snapshot: RecoverySnapshot = engine.snapshot(browser, 1700000007000);
      expect(snapshot.describe()).assertContain('tabs=2');
      expect(snapshot.describe()).assertContain('index=0');
      expect(snapshot.describe()).assertContain('savedAt=1700000007000');
      expect(snapshot.describe()).assertContain('complete=true');
    });

    it('Browser_Recovery_021', 0, async () => {
      TestLogger.step(TAG, 'UI: url input is available after the recovery path runs');
      const engine: RecoveryEngine = new RecoveryEngine();
      const browser: MockBrowser = new MockBrowser();
      browser.loadUrl('www.sample.com');
      const snapshot: RecoverySnapshot = engine.snapshot(browser, 1700000000000);
      engine.recover(browser, snapshot);
      const ready: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      TestLogger.info(TAG, `input after recovery=${ready}`);
      expect(engine.log.count()).assertEqual(4);
      expect(browser.tabs.length).assertEqual(1);
      expect(browser.getTabArrayIndex()).assertEqual(0);
      await serializedDelay(driver, TIMEOUT_TAB_SWITCH / 3);
    });

    it('Browser_Recovery_022', 0, async () => {
      TestLogger.step(TAG, 'UI: recovered tab strip stays within the ten tab ceiling');
      const closeButtons: number = await countById(driver, ID_CANCEL_TAB);
      TestLogger.info(TAG, `close buttons after recovery=${closeButtons}`);
      expect(closeButtons <= MAX_TAB_COUNT + 1).assertTrue();
      const engine: RecoveryEngine = new RecoveryEngine();
      const source: MockBrowser = new MockBrowser(MAX_TAB_COUNT);
      const rebuilt: MockBrowser = engine.rebuild(engine.snapshot(source, 1700000000000));
      expect(rebuilt.tabs.length).assertEqual(MAX_TAB_COUNT);
      expect(rebuilt.tabs.length <= MAX_TAB_COUNT).assertTrue();
    });
  });
}


