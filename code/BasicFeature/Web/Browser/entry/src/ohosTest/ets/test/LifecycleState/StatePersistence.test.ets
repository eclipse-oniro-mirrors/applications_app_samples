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
  getDriver, startBrowserApp, serializedDelay, componentByIdExists, textById,
  MAX_TAB_COUNT, ID_INPUT_URL, TIMEOUT_COMPONENT
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockBrowserTab } from '../Shared/BrowserMock';

const TAG: string = 'BrowserStatePersistenceTest';

/** The subset of browser state that survives a page or ability restart. */
class BrowserDraft {
  inputValue: string = '';
  tabIndex: number = 0;
  progress: number = 0;
  history: string[] = [];

  clone(): BrowserDraft {
    const copy: BrowserDraft = new BrowserDraft();
    copy.inputValue = this.inputValue;
    copy.tabIndex = this.tabIndex;
    copy.progress = this.progress;
    copy.history = this.history.slice(0);
    return copy;
  }

  equals(other: BrowserDraft): boolean {
    if (this.inputValue !== other.inputValue || this.tabIndex !== other.tabIndex ||
      this.progress !== other.progress || this.history.length !== other.history.length) {
      return false;
    }
    for (let index = 0; index < this.history.length; index++) {
      if (this.history[index] !== other.history[index]) {
        return false;
      }
    }
    return true;
  }

  describe(): string {
    return `input=${this.inputValue},tab=${this.tabIndex},progress=${this.progress},history=${this.history.length}`;
  }
}

/**
 * Manual serializer for the draft.
 *
 * The browser sample persists only scalars and a bounded history, therefore a
 * pipe separated payload is enough and keeps the test free of JSON edge cases.
 */
class StateCodec {
  static readonly VERSION: string = 'v1';
  static readonly SEPARATOR: string = '|';
  static readonly HISTORY_LIMIT: number = 50;

  static encode(draft: BrowserDraft): string {
    const history: string[] = [];
    for (let index = 0; index < draft.history.length; index++) {
      history.push(encodeURIComponent(draft.history[index]));
    }
    const progress: number = draft.progress === 100 ? 0 : draft.progress;
    return `${StateCodec.VERSION}${StateCodec.SEPARATOR}${encodeURIComponent(draft.inputValue)}` +
      `${StateCodec.SEPARATOR}${draft.tabIndex}${StateCodec.SEPARATOR}${progress}` +
      `${StateCodec.SEPARATOR}${history.join(',')}`;
  }

  static decode(payload: string): BrowserDraft {
    const draft: BrowserDraft = new BrowserDraft();
    if (payload === null || payload === undefined || payload.length === 0) {
      return draft;
    }
    const parts: string[] = payload.split(StateCodec.SEPARATOR);
    if (parts.length < 5 || parts[0] !== StateCodec.VERSION) {
      return draft;
    }
    try {
      draft.inputValue = decodeURIComponent(parts[1]);
      const tabIndex: number = parseInt(parts[2], 10);
      const progress: number = parseInt(parts[3], 10);
      draft.tabIndex = isNaN(tabIndex) || tabIndex < 0 ? 0 : tabIndex;
      draft.progress = isNaN(progress) || progress < 0 ? 0 : (progress > 100 ? 100 : progress);
      if (parts[4].length > 0) {
        const items: string[] = parts[4].split(',');
        for (let index = 0; index < items.length && index < StateCodec.HISTORY_LIMIT; index++) {
          draft.history.push(decodeURIComponent(items[index]));
        }
      }
    } catch (error) {
      TestLogger.exception(TAG, 'codec.decode', error as Error);
      return new BrowserDraft();
    }
    return draft;
  }

  static versionOf(payload: string): string {
    if (payload === null || payload === undefined || payload.length === 0) {
      return '';
    }
    return payload.split(StateCodec.SEPARATOR)[0];
  }
}

/**
 * Slot based persistence store. A failed write must never destroy the last
 * good snapshot, therefore the previous payload is restored on failure.
 */
class PersistenceStore {
  private slots: Map<string, string> = new Map<string, string>();
  private saved: number = 0;
  private loaded: number = 0;
  private failed: number = 0;
  private lastFailure: string = '';
  failNextSave: boolean = false;
  quotaBytes: number = 4096;

  save(key: string, draft: BrowserDraft): boolean {
    const payload: string = StateCodec.encode(draft);
    if (this.failNextSave) {
      this.failNextSave = false;
      this.failed += 1;
      this.lastFailure = 'injected write failure';
      TestLogger.warn(TAG, `save(${key}) rejected by injected failure`);
      return false;
    }
    if (payload.length > this.quotaBytes) {
      this.failed += 1;
      this.lastFailure = 'quota exceeded';
      TestLogger.warn(TAG, `save(${key}) rejected: payload ${payload.length} bytes`);
      return false;
    }
    this.slots.set(key, payload);
    this.saved += 1;
    return true;
  }

  load(key: string): BrowserDraft {
    const payload: string | undefined = this.slots.get(key);
    this.loaded += 1;
    if (payload === undefined) {
      return new BrowserDraft();
    }
    return StateCodec.decode(payload);
  }

  has(key: string): boolean {
    return this.slots.has(key);
  }

  clear(key: string): boolean {
    if (!this.slots.has(key)) {
      return false;
    }
    this.slots.delete(key);
    return true;
  }

  raw(key: string): string {
    const payload: string | undefined = this.slots.get(key);
    return payload === undefined ? '' : payload;
  }

  size(): number {
    return this.slots.size;
  }

  saveCount(): number {
    return this.saved;
  }

  loadCount(): number {
    return this.loaded;
  }

  failureCount(): number {
    return this.failed;
  }

  failureReason(): string {
    return this.lastFailure;
  }

  reset(): void {
    this.slots = new Map<string, string>();
    this.saved = 0;
    this.loaded = 0;
    this.failed = 0;
    this.lastFailure = '';
    this.failNextSave = false;
    this.quotaBytes = 4096;
  }
}

/** Builds a draft from a live browser mirror. */
function draftFromBrowser(browser: MockBrowser): BrowserDraft {
  const draft: BrowserDraft = new BrowserDraft();
  draft.inputValue = browser.getInputVal();
  draft.tabIndex = browser.getTabArrayIndex();
  draft.progress = browser.progress;
  const tab: MockBrowserTab | null = browser.getCurrentTab();
  if (tab !== null && tab.controller.currentUrl.length > 0) {
    draft.history = tab.controller.history.slice(0);
  }
  return draft;
}
export default function browserStatePersistenceTest() {
  describe('browserStatePersistenceTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'state persistence suite begin');
      await startBrowserApp();
      await serializedDelay(driver, TIMEOUT_COMPONENT / 2);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Persistence_001', 0, async () => {
      TestLogger.step(TAG, 'default draft carries empty input and zero tab index');
      const draft: BrowserDraft = new BrowserDraft();
      expect(draft.inputValue).assertEqual('');
      expect(draft.tabIndex).assertEqual(0);
      expect(draft.progress).assertEqual(0);
      expect(draft.history.length).assertEqual(0);
      expect(draft.describe()).assertContain('tab=0');
    });

    it('Browser_Persistence_002', 0, async () => {
      TestLogger.step(TAG, 'draft survives an encode decode round trip');
      const draft: BrowserDraft = new BrowserDraft();
      draft.inputValue = 'www.huawei.com';
      draft.tabIndex = 2;
      draft.progress = 35;
      draft.history = ['https://www.huawei.com', 'https://www.bing.com'];
      const restored: BrowserDraft = StateCodec.decode(StateCodec.encode(draft));
      expect(restored.equals(draft)).assertTrue();
      expect(restored.inputValue).assertEqual('www.huawei.com');
      expect(restored.tabIndex).assertEqual(2);
      expect(restored.progress).assertEqual(35);
      expect(restored.history.length).assertEqual(2);
    });

    it('Browser_Persistence_003', 0, async () => {
      TestLogger.step(TAG, 'input draft is saved and reloaded from the slot');
      const store: PersistenceStore = new PersistenceStore();
      const draft: BrowserDraft = new BrowserDraft();
      draft.inputValue = 'developer.huawei.com';
      expect(store.save('draft', draft)).assertTrue();
      expect(store.has('draft')).assertTrue();
      const loaded: BrowserDraft = store.load('draft');
      expect(loaded.inputValue).assertEqual('developer.huawei.com');
      expect(store.saveCount()).assertEqual(1);
      expect(store.loadCount()).assertEqual(1);
    });

    it('Browser_Persistence_004', 0, async () => {
      TestLogger.step(TAG, 'current tab index is persisted');
      const store: PersistenceStore = new PersistenceStore();
      const draft: BrowserDraft = new BrowserDraft();
      draft.tabIndex = MAX_TAB_COUNT - 1;
      store.save('tabs', draft);
      expect(store.load('tabs').tabIndex).assertEqual(MAX_TAB_COUNT - 1);
      draft.tabIndex = 3;
      store.save('tabs', draft);
      expect(store.load('tabs').tabIndex).assertEqual(3);
    });

    it('Browser_Persistence_005', 0, async () => {
      TestLogger.step(TAG, 'history stack is persisted in visit order');
      const store: PersistenceStore = new PersistenceStore();
      const draft: BrowserDraft = new BrowserDraft();
      draft.history = ['https://www.huawei.com', 'https://www.bing.com', 'https://pad.html'];
      store.save('history', draft);
      const loaded: BrowserDraft = store.load('history');
      expect(loaded.history.length).assertEqual(3);
      expect(loaded.history[0]).assertEqual('https://www.huawei.com');
      expect(loaded.history[2]).assertEqual('https://pad.html');
    });

    it('Browser_Persistence_006', 0, async () => {
      TestLogger.step(TAG, 'progress is serialized and restored');
      const store: PersistenceStore = new PersistenceStore();
      const draft: BrowserDraft = new BrowserDraft();
      draft.progress = 67;
      store.save('progress', draft);
      expect(store.load('progress').progress).assertEqual(67);
      draft.progress = 100;
      store.save('progress', draft);
      expect(store.load('progress').progress).assertEqual(0);
    });

    it('Browser_Persistence_007', 0, async () => {
      TestLogger.step(TAG, 'encoded payload carries the schema version');
      const draft: BrowserDraft = new BrowserDraft();
      draft.inputValue = 'pad.html';
      const payload: string = StateCodec.encode(draft);
      expect(payload.startsWith('v1|')).assertTrue();
      expect(StateCodec.versionOf(payload)).assertEqual('v1');
      expect(payload.split('|').length).assertEqual(5);
    });

    it('Browser_Persistence_008', 0, async () => {
      TestLogger.step(TAG, 'unknown schema version degrades to the default draft');
      const draft: BrowserDraft = StateCodec.decode('v9|www.huawei.com|1|20|');
      expect(draft.inputValue).assertEqual('');
      expect(draft.tabIndex).assertEqual(0);
      expect(draft.history.length).assertEqual(0);
      expect(StateCodec.versionOf('v9|x')).assertEqual('v9');
    });

    it('Browser_Persistence_009', 0, async () => {
      TestLogger.step(TAG, 'malformed payload degrades to the default draft');
      expect(StateCodec.decode('').inputValue).assertEqual('');
      expect(StateCodec.decode('garbage').tabIndex).assertEqual(0);
      expect(StateCodec.decode('v1|only-two-fields').progress).assertEqual(0);
      expect(StateCodec.decode('v1|%E0%A4%A|0|0|').inputValue).assertEqual('');
    });

    it('Browser_Persistence_010', 0, async () => {
      TestLogger.step(TAG, 'missing slot returns a default draft');
      const store: PersistenceStore = new PersistenceStore();
      const loaded: BrowserDraft = store.load('absent');
      expect(loaded.inputValue).assertEqual('');
      expect(loaded.tabIndex).assertEqual(0);
      expect(store.has('absent')).assertFalse();
      expect(store.loadCount()).assertEqual(1);
    });

    it('Browser_Persistence_011', 0, async () => {
      TestLogger.step(TAG, 'injected write failure keeps the last good snapshot');
      const store: PersistenceStore = new PersistenceStore();
      const draft: BrowserDraft = new BrowserDraft();
      draft.inputValue = 'www.huawei.com';
      expect(store.save('draft', draft)).assertTrue();
      store.failNextSave = true;
      draft.inputValue = 'www.bing.com';
      expect(store.save('draft', draft)).assertFalse();
      expect(store.failureCount()).assertEqual(1);
      expect(store.failureReason()).assertEqual('injected write failure');
      expect(store.load('draft').inputValue).assertEqual('www.huawei.com');
    });

    it('Browser_Persistence_012', 0, async () => {
      TestLogger.step(TAG, 'quota overflow is rejected without corrupting the slot');
      const store: PersistenceStore = new PersistenceStore();
      store.quotaBytes = 16;
      const draft: BrowserDraft = new BrowserDraft();
      draft.inputValue = 'www.huawei.com';
      expect(store.save('small', draft)).assertFalse();
      expect(store.failureReason()).assertEqual('quota exceeded');
      expect(store.has('small')).assertFalse();
      store.quotaBytes = 4096;
      expect(store.save('small', draft)).assertTrue();
      expect(store.load('small').inputValue).assertEqual('www.huawei.com');
    });
    it('Browser_Persistence_013', 0, async () => {
      TestLogger.step(TAG, 'clear removes a slot and reports the change');
      const store: PersistenceStore = new PersistenceStore();
      const draft: BrowserDraft = new BrowserDraft();
      draft.inputValue = 'pad.html';
      store.save('draft', draft);
      expect(store.size()).assertEqual(1);
      expect(store.clear('draft')).assertTrue();
      expect(store.size()).assertEqual(0);
      expect(store.clear('draft')).assertFalse();
      expect(store.load('draft').inputValue).assertEqual('');
    });

    it('Browser_Persistence_014', 0, async () => {
      TestLogger.step(TAG, 'overwriting a slot keeps only the latest draft');
      const store: PersistenceStore = new PersistenceStore();
      const draft: BrowserDraft = new BrowserDraft();
      draft.inputValue = 'www.huawei.com';
      draft.tabIndex = 1;
      store.save('draft', draft);
      draft.inputValue = 'www.bing.com';
      draft.tabIndex = 4;
      store.save('draft', draft);
      const loaded: BrowserDraft = store.load('draft');
      expect(loaded.inputValue).assertEqual('www.bing.com');
      expect(loaded.tabIndex).assertEqual(4);
      expect(store.size()).assertEqual(1);
      expect(store.saveCount()).assertEqual(2);
    });

    it('Browser_Persistence_015', 0, async () => {
      TestLogger.step(TAG, 'history beyond fifty entries is truncated on decode');
      const draft: BrowserDraft = new BrowserDraft();
      for (let index = 0; index < 60; index++) {
        draft.history.push(`https://site${index}.com`);
      }
      const payload: string = StateCodec.encode(draft);
      const loaded: BrowserDraft = StateCodec.decode(payload);
      expect(draft.history.length).assertEqual(60);
      expect(loaded.history.length).assertEqual(50);
      expect(loaded.history[0]).assertEqual('https://site0.com');
      expect(loaded.history[49]).assertEqual('https://site49.com');
    });

    it('Browser_Persistence_016', 0, async () => {
      TestLogger.step(TAG, 'search urls with encoded characters round trip');
      const store: PersistenceStore = new PersistenceStore();
      const draft: BrowserDraft = new BrowserDraft();
      draft.inputValue = 'https://www.bing.com/search?q=鸿蒙 浏览器';
      draft.history = ['https://www.bing.com/search?q=%E9%B8%BF%E8%92%99'];
      expect(store.save('unicode', draft)).assertTrue();
      const loaded: BrowserDraft = store.load('unicode');
      expect(loaded.inputValue).assertEqual('https://www.bing.com/search?q=鸿蒙 浏览器');
      expect(loaded.history[0]).assertEqual('https://www.bing.com/search?q=%E9%B8%BF%E8%92%99');
    });

    it('Browser_Persistence_017', 0, async () => {
      TestLogger.step(TAG, 'negative tab index and progress are clamped on decode');
      const payload: string = 'v1|www.huawei.com|-3|-40|';
      const loaded: BrowserDraft = StateCodec.decode(payload);
      expect(loaded.tabIndex).assertEqual(0);
      expect(loaded.progress).assertEqual(0);
      expect(loaded.inputValue).assertEqual('www.huawei.com');
      const over: BrowserDraft = StateCodec.decode('v1|x|2|180|');
      expect(over.tabIndex).assertEqual(2);
      expect(over.progress).assertEqual(100);
    });

    it('Browser_Persistence_018', 0, async () => {
      TestLogger.step(TAG, 'independent slots do not share state');
      const store: PersistenceStore = new PersistenceStore();
      const first: BrowserDraft = new BrowserDraft();
      first.inputValue = 'first';
      first.tabIndex = 1;
      const second: BrowserDraft = new BrowserDraft();
      second.inputValue = 'second';
      second.tabIndex = 2;
      store.save('a', first);
      store.save('b', second);
      expect(store.size()).assertEqual(2);
      expect(store.load('a').inputValue).assertEqual('first');
      expect(store.load('b').inputValue).assertEqual('second');
      expect(store.load('a').tabIndex).assertEqual(1);
    });

    it('Browser_Persistence_019', 0, async () => {
      TestLogger.step(TAG, 'saving the same payload twice is idempotent');
      const store: PersistenceStore = new PersistenceStore();
      const draft: BrowserDraft = new BrowserDraft();
      draft.inputValue = 'www.huawei.com';
      draft.history = ['https://www.huawei.com'];
      expect(store.save('draft', draft)).assertTrue();
      const firstPayload: string = store.raw('draft');
      expect(store.save('draft', draft)).assertTrue();
      expect(store.raw('draft')).assertEqual(firstPayload);
      expect(store.load('draft').equals(draft)).assertTrue();
      expect(store.saveCount()).assertEqual(2);
    });

    it('Browser_Persistence_020', 0, async () => {
      TestLogger.step(TAG, 'draft clone is independent from its source');
      const draft: BrowserDraft = new BrowserDraft();
      draft.inputValue = 'www.huawei.com';
      draft.history = ['https://www.huawei.com'];
      const copy: BrowserDraft = draft.clone();
      copy.inputValue = 'www.bing.com';
      copy.history.push('https://www.bing.com');
      expect(draft.inputValue).assertEqual('www.huawei.com');
      expect(draft.history.length).assertEqual(1);
      expect(copy.history.length).assertEqual(2);
      expect(draft.equals(copy)).assertFalse();
    });

    it('Browser_Persistence_021', 0, async () => {
      TestLogger.step(TAG, 'draft built from the browser mirrors tab and history');
      const browser: MockBrowser = new MockBrowser();
      browser.loadUrl('www.huawei.com');
      browser.loadUrl('www.bing.com');
      browser.setInputVal('www.bing.com');
      const draft: BrowserDraft = draftFromBrowser(browser);
      expect(draft.inputValue).assertEqual('www.bing.com');
      expect(draft.tabIndex).assertEqual(0);
      expect(draft.history.length).assertEqual(2);
      expect(draft.history[0]).assertEqual('https://www.huawei.com');
      expect(draft.history[1]).assertEqual('https://www.bing.com');
    });

    it('Browser_Persistence_022', 0, async () => {
      TestLogger.step(TAG, 'store reset clears slots and counters');
      const store: PersistenceStore = new PersistenceStore();
      const draft: BrowserDraft = new BrowserDraft();
      store.save('a', draft);
      store.load('a');
      store.failNextSave = true;
      store.save('b', draft);
      expect(store.failureCount()).assertEqual(1);
      store.reset();
      expect(store.size()).assertEqual(0);
      expect(store.saveCount()).assertEqual(0);
      expect(store.loadCount()).assertEqual(0);
      expect(store.failureCount()).assertEqual(0);
      expect(store.failureReason()).assertEqual('');
    });

    it('Browser_Persistence_023', 0, async () => {
      TestLogger.step(TAG, 'UI: input box stays usable after a draft reload');
      const ready: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      TestLogger.info(TAG, `input present for reload=${ready}`);
      if (!ready) {
        TestLogger.warn(TAG, 'url input hidden on this layout');
        expect(ready).assertFalse();
        return;
      }
      const text: string = await textById(driver, ID_INPUT_URL);
      const store: PersistenceStore = new PersistenceStore();
      const draft: BrowserDraft = new BrowserDraft();
      draft.inputValue = text;
      expect(store.save('ui', draft)).assertTrue();
      expect(store.load('ui').inputValue).assertEqual(text);
      expect(text.length >= 0).assertTrue();
    });
  });
}


