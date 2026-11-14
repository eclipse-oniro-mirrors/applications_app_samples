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

/**
 * Deterministic, dependency free mirror of entry/src/main/ets/model/Browser.ets.
 *
 * The real Browser class owns WebviewController instances and a TabsController,
 * both of which require a live UI context. Model level suites therefore run
 * against this mirror and keep the exact same observable behaviour:
 *  - addTab refuses to grow beyond ten tabs,
 *  - deleteTab renumbers the remaining tab keys and repairs tabArrayIndex,
 *  - loadUrl always prefixes https://,
 *  - Back / Forward / Refresh consult accessBackward / accessForward first.
 */

export enum MockLoadingStatus {
  LOADING = 0,
  END = 1
}

export interface MockTabKey {
  key: number;
  timestamp: number;
}

export interface MockPageEvent {
  url: string;
  progress: number;
  timestamp: number;
}

/** Records every controller call so suites can assert the interaction order. */
export class MockWebController {
  history: string[] = [];
  historyIndex: number = -1;
  currentUrl: string = '';
  userAgent: string = 'SampleBrowser/12.0.4.1';
  refreshCount: number = 0;
  loadCount: number = 0;
  javaScriptCalls: string[] = [];
  private pendingUrl: string = '';
  private loadFailure: string = '';

  loadUrl(url: string): boolean {
    if (url === null || url === undefined || url.length === 0) {
      this.loadFailure = 'empty url';
      return false;
    }
    this.loadCount += 1;
    this.pendingUrl = url;
    this.commit(url);
    return true;
  }

  private commit(url: string): void {
    this.currentUrl = url;
    if (this.historyIndex < this.history.length - 1) {
      this.history = this.history.slice(0, this.historyIndex + 1);
    }
    if (this.history.length === 0 || this.history[this.history.length - 1] !== url) {
      this.history.push(url);
      this.historyIndex = this.history.length - 1;
    }
  }

  accessBackward(): boolean {
    return this.historyIndex > 0;
  }

  accessForward(): boolean {
    return this.historyIndex >= 0 && this.historyIndex < this.history.length - 1;
  }

  backward(): boolean {
    if (!this.accessBackward()) {
      return false;
    }
    this.historyIndex -= 1;
    this.currentUrl = this.history[this.historyIndex];
    return true;
  }

  forward(): boolean {
    if (!this.accessForward()) {
      return false;
    }
    this.historyIndex += 1;
    this.currentUrl = this.history[this.historyIndex];
    return true;
  }

  refresh(): void {
    this.refreshCount += 1;
  }

  runJavaScript(script: string): void {
    this.javaScriptCalls.push(script);
  }

  getPendingUrl(): string {
    return this.pendingUrl;
  }

  getLoadFailure(): string {
    return this.loadFailure;
  }

  reset(): void {
    this.history = [];
    this.historyIndex = -1;
    this.currentUrl = '';
    this.refreshCount = 0;
    this.loadCount = 0;
    this.javaScriptCalls = [];
    this.pendingUrl = '';
    this.loadFailure = '';
  }
}

/** One browser tab: a key, a creation timestamp and its own controller. */
export class MockBrowserTab {
  key: number;
  timestamp: number;
  controller: MockWebController = new MockWebController();

  constructor(key: number, timestamp: number) {
    this.key = key;
    this.timestamp = timestamp;
  }
}

/** Behavioural mirror of model/Browser.ets. */
export class MockBrowser {
  inputValue: string = '';
  tabArrayIndex: number = 0;
  progress: number = 0;
  hideProgress: boolean = true;
  loadingStatus: MockLoadingStatus = MockLoadingStatus.END;
  tabs: MockBrowserTab[] = [];
  toasts: string[] = [];
  lastChangedIndex: number = -1;

  constructor(initialTabCount: number = 1) {
    const count: number = initialTabCount <= 0 ? 1 : initialTabCount;
    for (let index = 0; index < count; index++) {
      this.tabs.push(new MockBrowserTab(index, 1700000000000 + index));
    }
  }

  addTab(): boolean {
    if (this.tabs.length > 10) {
      this.toasts.push('页签数量已满');
      return false;
    }
    const key: number = this.tabs.length;
    // Timestamps are monotonic: a tab opened after a deletion must still be
    // newer than every tab that is currently in the strip.
    const previousStamp: number = this.tabs.length === 0 ?
      1700000000000 - 1 : this.tabs[this.tabs.length - 1].timestamp;
    this.tabs.push(new MockBrowserTab(key, previousStamp + 1));
    this.tabArrayIndex = this.tabs.length - 1;
    this.lastChangedIndex = this.tabArrayIndex;
    return true;
  }

  deleteTab(index: number): boolean {
    if (index < 0 || index >= this.tabs.length) {
      return false;
    }
    if (this.tabs.length <= 1) {
      return false;
    }
    this.tabs.splice(index, 1);
    if (this.tabArrayIndex > index || this.tabArrayIndex === this.tabs.length) {
      this.tabArrayIndex -= 1;
    }
    if (this.tabArrayIndex < 0) {
      this.tabArrayIndex = 0;
    }
    for (let cursor = index; cursor < this.tabs.length; cursor++) {
      this.tabs[cursor].key -= 1;
    }
    this.lastChangedIndex = this.tabArrayIndex;
    return true;
  }

  selectTab(index: number): boolean {
    if (index < 0 || index >= this.tabs.length) {
      return false;
    }
    this.tabArrayIndex = index;
    this.lastChangedIndex = index;
    return true;
  }

  getTabKeys(): number[] {
    return this.tabs.map((tab: MockBrowserTab) => tab.key);
  }

  getTimestamps(): number[] {
    return this.tabs.map((tab: MockBrowserTab) => tab.timestamp);
  }

  getCurrentTab(): MockBrowserTab | null {
    if (this.tabArrayIndex < 0 || this.tabArrayIndex >= this.tabs.length) {
      return null;
    }
    return this.tabs[this.tabArrayIndex];
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

  loadUrl(address: string): boolean {
    const tab: MockBrowserTab | null = this.getCurrentTab();
    if (tab === null) {
      return false;
    }
    const normalized: string = this.normalize(address);
    return tab.controller.loadUrl(normalized);
  }

  normalize(address: string): string {
    let result: string = address ?? '';
    if (!result.startsWith('http')) {
      result = 'https://' + result;
    }
    return result;
  }

  back(): boolean {
    const tab: MockBrowserTab | null = this.getCurrentTab();
    if (tab === null) {
      return false;
    }
    if (tab.controller.accessBackward()) {
      return tab.controller.backward();
    }
    return false;
  }

  forward(): boolean {
    const tab: MockBrowserTab | null = this.getCurrentTab();
    if (tab === null) {
      return false;
    }
    if (tab.controller.accessForward()) {
      return tab.controller.forward();
    }
    return false;
  }

  refresh(): void {
    const tab: MockBrowserTab | null = this.getCurrentTab();
    if (tab !== null) {
      tab.controller.refresh();
    }
  }

  onPageBegin(url: string): void {
    this.inputValue = url !== null && url.startsWith('http') ? url : '';
    this.loadingStatus = MockLoadingStatus.LOADING;
  }

  onPageEnd(): void {
    this.loadingStatus = MockLoadingStatus.END;
    const tab: MockBrowserTab | null = this.getCurrentTab();
    if (tab !== null) {
      tab.controller.runJavaScript('adapterDevice()');
    }
  }

  onProgressChange(progress: number): void {
    this.progress = progress;
    if (this.progress === 100) {
      this.hideProgress = true;
      this.progress = 0;
    } else {
      this.hideProgress = false;
    }
  }

  onWindowNew(targetUrl: string): boolean {
    if (targetUrl !== 'about:blank' && targetUrl !== '') {
      const tab: MockBrowserTab | null = this.getCurrentTab();
      if (tab === null) {
        return false;
      }
      tab.controller.loadUrl(targetUrl);
      return true;
    }
    return false;
  }

  onBackPress(): boolean {
    const tab: MockBrowserTab | null = this.getCurrentTab();
    const accessBackward: boolean = tab !== null && tab.controller.accessBackward();
    if (accessBackward || this.loadingStatus === MockLoadingStatus.LOADING) {
      if (tab !== null) {
        tab.controller.backward();
      }
      return true;
    }
    return false;
  }

  resetToHome(homePage: string): void {
    const tab: MockBrowserTab | null = this.getCurrentTab();
    if (tab !== null) {
      tab.controller.loadUrl(homePage);
      this.inputValue = '';
    }
  }
}

/** Simple latency-aware network double used by connectivity suites. */
export class MockNetwork {
  online: boolean = true;
  latencyMs: number = 20;
  failureRate: number = 0;
  requests: string[] = [];
  private seed: number = 7;

  setOnline(online: boolean): void {
    this.online = online;
  }

  setLatency(latencyMs: number): void {
    this.latencyMs = latencyMs < 0 ? 0 : latencyMs;
  }

  setFailureRate(rate: number): void {
    this.failureRate = rate < 0 ? 0 : (rate > 1 ? 1 : rate);
  }

  private nextRandom(): number {
    this.seed = (this.seed * 1103515245 + 12345) % 2147483648;
    return this.seed / 2147483648;
  }

  fetch(url: string): boolean {
    this.requests.push(url);
    if (!this.online) {
      return false;
    }
    if (this.nextRandom() < this.failureRate) {
      return false;
    }
    return url !== null && url.length > 0;
  }

  requestCount(): number {
    return this.requests.length;
  }

  reset(): void {
    this.requests = [];
    this.online = true;
    this.latencyMs = 20;
    this.failureRate = 0;
  }
}

/** Timing helper producing deterministic pseudo durations. */
export class MockClock {
  private current: number;

  constructor(start: number = 1700000000000) {
    this.current = start;
  }

  now(): number {
    return this.current;
  }

  advance(ms: number): number {
    this.current += ms < 0 ? 0 : ms;
    return this.current;
  }

  reset(start: number = 1700000000000): void {
    this.current = start;
  }
}
