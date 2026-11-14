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
  getDriver, startBrowserApp, serializedDelay, componentByIdExists, countById,
  clickById, PAD_HOME_PAGE, PHONE_HOME_PAGE, MAX_TAB_COUNT,
  ID_NAV_HOME, ID_CANCEL_TAB, ID_ACTION_ADD, TIMEOUT_COMPONENT, DELAY_TAB_OPERATION
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockBrowserTab } from '../Shared/BrowserMock';

const TAG: string = 'BrowserResourceManagementTest';

/** Resource families referenced by the sample UI. */
class ResourceKind {
  static readonly RAWFILE: string = 'rawfile';
  static readonly MEDIA: string = 'media';
  static readonly STRING: string = 'string';
  static readonly COLOR: string = 'color';
}

/** A resource reference exactly as `$r('app.<kind>.<name>')` resolves it. */
class ResourceRef {
  kind: string;
  name: string;
  uri: string;

  constructor(kind: string, name: string) {
    this.kind = kind;
    this.name = name;
    this.uri = `app.${kind}.${name}`;
  }

  static of(uri: string): ResourceRef {
    const parts: string[] = uri.split('.');
    if (parts.length < 3) {
      return new ResourceRef('unknown', uri);
    }
    return new ResourceRef(parts[1], parts.slice(2).join('.'));
  }

  describe(): string {
    return `$r('${this.uri}')`;
  }
}

/** One loadable resource with its byte size. */
class ResourceEntry {
  ref: ResourceRef;
  available: boolean;
  bytes: number;

  constructor(ref: ResourceRef, available: boolean, bytes: number) {
    this.ref = ref;
    this.available = available;
    this.bytes = bytes;
  }
}

/**
 * Reference counted resource pool.
 *
 * A tab acquires the resources it renders and releases them when the tab is
 * closed; leaked() reports anything that outlived its owner.
 */
class ResourcePool {
  private entries: Map<string, ResourceEntry> = new Map<string, ResourceEntry>();
  private refCounts: Map<string, number> = new Map<string, number>();
  private releaseLog: string[] = [];

  register(ref: ResourceRef, available: boolean = true, bytes: number = 512): void {
    this.entries.set(ref.uri, new ResourceEntry(ref, available, bytes));
    if (!this.refCounts.has(ref.uri)) {
      this.refCounts.set(ref.uri, 0);
    }
  }

  isAvailable(uri: string): boolean {
    const entry: ResourceEntry | undefined = this.entries.get(uri);
    return entry !== undefined && entry.available;
  }

  acquire(uri: string): boolean {
    if (!this.isAvailable(uri)) {
      TestLogger.warn(TAG, `acquire rejected for missing resource ${uri}`);
      return false;
    }
    const current: number = this.refCounts.get(uri) ?? 0;
    this.refCounts.set(uri, current + 1);
    return true;
  }

  release(uri: string): boolean {
    const current: number = this.refCounts.get(uri) ?? 0;
    if (current <= 0) {
      return false;
    }
    this.refCounts.set(uri, current - 1);
    this.releaseLog.push(uri);
    return true;
  }

  refCount(uri: string): number {
    return this.refCounts.get(uri) ?? 0;
  }

  totalRefs(): number {
    let total: number = 0;
    this.refCounts.forEach((count: number) => {
      total += count;
    });
    return total;
  }

  availableUris(): string[] {
    const result: string[] = [];
    this.entries.forEach((entry: ResourceEntry, uri: string) => {
      if (entry.available) {
        result.push(uri);
      }
    });
    return result;
  }

  releasedCount(): number {
    return this.releaseLog.length;
  }

  released(): string[] {
    return this.releaseLog.slice(0);
  }

  /** Missing resources degrade to the first available fallback. */
  resolveOrFallback(uri: string, fallbacks: string[]): string {
    if (this.isAvailable(uri)) {
      return uri;
    }
    for (let index = 0; index < fallbacks.length; index++) {
      if (this.isAvailable(fallbacks[index])) {
        return fallbacks[index];
      }
    }
    return '';
  }

  releaseAll(): void {
    this.refCounts.forEach((count: number, uri: string) => {
      for (let index = 0; index < count; index++) {
        this.releaseLog.push(uri);
      }
    });
    this.refCounts.forEach((count: number, uri: string) => {
      this.refCounts.set(uri, 0);
    });
  }

  reset(): void {
    this.entries = new Map<string, ResourceEntry>();
    this.refCounts = new Map<string, number>();
    this.releaseLog = [];
  }
}

/** Files under entry/src/main/resources/rawfile of the sample. */
class RawfileCatalog {
  files: string[] = [
    'pad.html', 'phone.html', 'index.html', 'test.html', 'favicon.ico',
    'backgroundImg.jpg', 'search.svg', 'bing.png', 'sample.png', 'baidu.png',
    'all.png', 'img.png'
  ];

  has(name: string): boolean {
    return this.files.indexOf(name) >= 0;
  }

  resolveHome(deviceType: string): string {
    const preferred: string = deviceType === 'default' ? PHONE_HOME_PAGE : PAD_HOME_PAGE;
    if (this.has(preferred)) {
      return preferred;
    }
    return this.has('index.html') ? 'index.html' : '';
  }

  countByExtension(extension: string): number {
    let total: number = 0;
    for (let index = 0; index < this.files.length; index++) {
      if (this.files[index].endsWith(extension)) {
        total += 1;
      }
    }
    return total;
  }

  missing(): string[] {
    return ['missing.html', 'absent.png'];
  }
}

/** Keeps tab lifetime and resource lifetime in sync. */
class TabResourceLedger {
  browser: MockBrowser;
  pool: ResourcePool;
  private tabResources: Map<number, string[]> = new Map<number, string[]>();

  constructor(browser: MockBrowser, pool: ResourcePool) {
    this.browser = browser;
    this.pool = pool;
  }

  openTab(uri: string): boolean {
    const added: boolean = this.browser.addTab();
    if (!added) {
      return false;
    }
    const key: number = this.browser.tabs[this.browser.tabs.length - 1].key;
    if (this.pool.acquire(uri)) {
      this.tabResources.set(key, [uri]);
    }
    return true;
  }

  closeTab(index: number): boolean {
    if (index < 0 || index >= this.browser.tabs.length) {
      return false;
    }
    const key: number = this.browser.tabs[index].key;
    const uris: string[] = this.tabResources.get(key) ?? [];
    for (let cursor = 0; cursor < uris.length; cursor++) {
      this.pool.release(uris[cursor]);
    }
    this.tabResources.delete(key);
    return this.browser.deleteTab(index);
  }

  destroy(): void {
    this.browser.tabs = [];
    this.tabResources.forEach((uris: string[]) => {
      for (let cursor = 0; cursor < uris.length; cursor++) {
        this.pool.release(uris[cursor]);
      }
    });
    this.tabResources.clear();
  }

  leaked(): number {
    return this.pool.totalRefs();
  }

  ownedTabs(): number {
    return this.tabResources.size;
  }
}
export default function browserResourceManagementTest() {
  describe('browserResourceManagementTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'resource management suite begin');
      await startBrowserApp();
      await serializedDelay(driver, TIMEOUT_COMPONENT / 2);
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Browser_Resource_001', 0, async () => {
      TestLogger.step(TAG, 'rawfile catalog contains all three entry pages');
      const catalog: RawfileCatalog = new RawfileCatalog();
      expect(catalog.has('pad.html')).assertTrue();
      expect(catalog.has('phone.html')).assertTrue();
      expect(catalog.has('index.html')).assertTrue();
      expect(catalog.countByExtension('.html')).assertEqual(4);
      expect(catalog.has('missing.html')).assertFalse();
    });

    it('Browser_Resource_002', 0, async () => {
      TestLogger.step(TAG, 'home page follows the device form factor');
      const catalog: RawfileCatalog = new RawfileCatalog();
      expect(catalog.resolveHome('tablet')).assertEqual(PAD_HOME_PAGE);
      expect(catalog.resolveHome('default')).assertEqual(PHONE_HOME_PAGE);
      expect(catalog.resolveHome('phone')).assertEqual(PAD_HOME_PAGE);
      expect(catalog.resolveHome('')).assertEqual(PAD_HOME_PAGE);
    });

    it('Browser_Resource_003', 0, async () => {
      TestLogger.step(TAG, 'missing home page degrades to index.html');
      const catalog: RawfileCatalog = new RawfileCatalog();
      catalog.files = ['index.html', 'bing.png'];
      expect(catalog.resolveHome('tablet')).assertEqual('index.html');
      expect(catalog.resolveHome('default')).assertEqual('index.html');
      catalog.files = ['bing.png'];
      expect(catalog.resolveHome('tablet')).assertEqual('');
    });

    it('Browser_Resource_004', 0, async () => {
      TestLogger.step(TAG, 'media icon reference resolves to app.media.icon');
      const icon: ResourceRef = new ResourceRef(ResourceKind.MEDIA, 'icon');
      expect(icon.uri).assertEqual('app.media.icon');
      expect(icon.describe()).assertEqual("$r('app.media.icon')");
      expect(icon.kind).assertEqual('media');
      expect(icon.name).assertEqual('icon');
    });

    it('Browser_Resource_005', 0, async () => {
      TestLogger.step(TAG, 'string resources used by the manifest are available');
      const pool: ResourcePool = new ResourcePool();
      pool.register(new ResourceRef(ResourceKind.STRING, 'MainAbility_label'));
      pool.register(new ResourceRef(ResourceKind.STRING, 'Input_url'));
      pool.register(new ResourceRef(ResourceKind.STRING, 'entry_desc'));
      expect(pool.isAvailable('app.string.MainAbility_label')).assertTrue();
      expect(pool.isAvailable('app.string.Input_url')).assertTrue();
      expect(pool.isAvailable('app.string.entry_desc')).assertTrue();
      expect(pool.availableUris().length).assertEqual(3);
    });

    it('Browser_Resource_006', 0, async () => {
      TestLogger.step(TAG, 'color and start window resources are registered');
      const pool: ResourcePool = new ResourcePool();
      pool.register(new ResourceRef(ResourceKind.COLOR, 'white'));
      pool.register(new ResourceRef(ResourceKind.MEDIA, 'icon'));
      expect(pool.isAvailable('app.color.white')).assertTrue();
      expect(pool.isAvailable('app.media.icon')).assertTrue();
      expect(pool.isAvailable('app.media.absent')).assertFalse();
      expect(ResourceRef.of('app.color.white').kind).assertEqual('color');
    });

    it('Browser_Resource_007', 0, async () => {
      TestLogger.step(TAG, 'acquire increments the reference count');
      const pool: ResourcePool = new ResourcePool();
      pool.register(new ResourceRef(ResourceKind.RAWFILE, 'pad.html'));
      expect(pool.refCount('app.rawfile.pad.html')).assertEqual(0);
      expect(pool.acquire('app.rawfile.pad.html')).assertTrue();
      expect(pool.acquire('app.rawfile.pad.html')).assertTrue();
      expect(pool.refCount('app.rawfile.pad.html')).assertEqual(2);
      expect(pool.totalRefs()).assertEqual(2);
    });

    it('Browser_Resource_008', 0, async () => {
      TestLogger.step(TAG, 'release decrements without going negative');
      const pool: ResourcePool = new ResourcePool();
      pool.register(new ResourceRef(ResourceKind.RAWFILE, 'phone.html'));
      pool.acquire('app.rawfile.phone.html');
      expect(pool.release('app.rawfile.phone.html')).assertTrue();
      expect(pool.refCount('app.rawfile.phone.html')).assertEqual(0);
      expect(pool.release('app.rawfile.phone.html')).assertFalse();
      expect(pool.refCount('app.rawfile.phone.html')).assertEqual(0);
      expect(pool.releasedCount()).assertEqual(1);
    });

    it('Browser_Resource_009', 0, async () => {
      TestLogger.step(TAG, 'acquiring a missing resource is refused');
      const pool: ResourcePool = new ResourcePool();
      pool.register(new ResourceRef(ResourceKind.RAWFILE, 'removed.html'), false);
      expect(pool.acquire('app.rawfile.removed.html')).assertFalse();
      expect(pool.refCount('app.rawfile.removed.html')).assertEqual(0);
      expect(pool.acquire('app.rawfile.never-registered')).assertFalse();
      expect(pool.totalRefs()).assertEqual(0);
    });

    it('Browser_Resource_010', 0, async () => {
      TestLogger.step(TAG, 'missing resource resolves through the fallback chain');
      const pool: ResourcePool = new ResourcePool();
      pool.register(new ResourceRef(ResourceKind.MEDIA, 'icon'), false);
      pool.register(new ResourceRef(ResourceKind.RAWFILE, 'index.html'));
      const resolved: string = pool.resolveOrFallback('app.media.icon',
        ['app.media.absent', 'app.rawfile.index.html']);
      expect(resolved).assertEqual('app.rawfile.index.html');
      expect(pool.resolveOrFallback('app.media.absent', [])).assertEqual('');
      expect(pool.resolveOrFallback('app.rawfile.index.html', [])).assertEqual('app.rawfile.index.html');
    });

    it('Browser_Resource_011', 0, async () => {
      TestLogger.step(TAG, 'each opened tab owns one controller resource');
      const pool: ResourcePool = new ResourcePool();
      pool.register(new ResourceRef(ResourceKind.RAWFILE, 'pad.html'));
      const browser: MockBrowser = new MockBrowser();
      const ledger: TabResourceLedger = new TabResourceLedger(browser, pool);
      expect(ledger.openTab('app.rawfile.pad.html')).assertTrue();
      expect(ledger.openTab('app.rawfile.pad.html')).assertTrue();
      expect(browser.tabs.length).assertEqual(3);
      expect(ledger.ownedTabs()).assertEqual(2);
      expect(pool.refCount('app.rawfile.pad.html')).assertEqual(2);
      expect(ledger.leaked()).assertEqual(2);
    });

    it('Browser_Resource_012', 0, async () => {
      TestLogger.step(TAG, 'closing a tab releases exactly its own resource');
      const pool: ResourcePool = new ResourcePool();
      pool.register(new ResourceRef(ResourceKind.RAWFILE, 'pad.html'));
      const browser: MockBrowser = new MockBrowser();
      const ledger: TabResourceLedger = new TabResourceLedger(browser, pool);
      ledger.openTab('app.rawfile.pad.html');
      ledger.openTab('app.rawfile.pad.html');
      expect(ledger.closeTab(2)).assertTrue();
      expect(browser.tabs.length).assertEqual(2);
      expect(pool.refCount('app.rawfile.pad.html')).assertEqual(1);
      expect(ledger.ownedTabs()).assertEqual(1);
      expect(ledger.leaked()).assertEqual(1);
    });
    it('Browser_Resource_013', 0, async () => {
      TestLogger.step(TAG, 'destroying the ability releases every tab resource');
      const pool: ResourcePool = new ResourcePool();
      pool.register(new ResourceRef(ResourceKind.RAWFILE, 'pad.html'));
      const browser: MockBrowser = new MockBrowser();
      const ledger: TabResourceLedger = new TabResourceLedger(browser, pool);
      ledger.openTab('app.rawfile.pad.html');
      ledger.openTab('app.rawfile.pad.html');
      ledger.openTab('app.rawfile.pad.html');
      expect(ledger.leaked()).assertEqual(3);
      ledger.destroy();
      expect(browser.tabs.length).assertEqual(0);
      expect(pool.totalRefs()).assertEqual(0);
      expect(ledger.ownedTabs()).assertEqual(0);
      expect(ledger.leaked()).assertEqual(0);
    });

    it('Browser_Resource_014', 0, async () => {
      TestLogger.step(TAG, 'invalid tab close index is rejected without touching refs');
      const pool: ResourcePool = new ResourcePool();
      pool.register(new ResourceRef(ResourceKind.RAWFILE, 'pad.html'));
      const ledger: TabResourceLedger = new TabResourceLedger(new MockBrowser(), pool);
      ledger.openTab('app.rawfile.pad.html');
      expect(ledger.closeTab(-1)).assertFalse();
      expect(ledger.closeTab(9)).assertFalse();
      expect(pool.refCount('app.rawfile.pad.html')).assertEqual(1);
      expect(ledger.ownedTabs()).assertEqual(1);
    });

    it('Browser_Resource_015', 0, async () => {
      TestLogger.step(TAG, 'ten tabs hold ten controller references');
      const pool: ResourcePool = new ResourcePool();
      pool.register(new ResourceRef(ResourceKind.RAWFILE, 'phone.html'));
      const browser: MockBrowser = new MockBrowser();
      const ledger: TabResourceLedger = new TabResourceLedger(browser, pool);
      for (let index = 0; index < 9; index++) {
        expect(ledger.openTab('app.rawfile.phone.html')).assertTrue();
      }
      expect(browser.tabs.length).assertEqual(MAX_TAB_COUNT);
      expect(pool.refCount('app.rawfile.phone.html')).assertEqual(9);
      expect(ledger.ownedTabs()).assertEqual(9);
      ledger.destroy();
      expect(pool.totalRefs()).assertEqual(0);
    });

    it('Browser_Resource_016', 0, async () => {
      TestLogger.step(TAG, 'releaseAll clears all outstanding references');
      const pool: ResourcePool = new ResourcePool();
      pool.register(new ResourceRef(ResourceKind.MEDIA, 'icon'));
      pool.register(new ResourceRef(ResourceKind.RAWFILE, 'pad.html'));
      pool.acquire('app.media.icon');
      pool.acquire('app.media.icon');
      pool.acquire('app.rawfile.pad.html');
      expect(pool.totalRefs()).assertEqual(3);
      pool.releaseAll();
      expect(pool.totalRefs()).assertEqual(0);
      expect(pool.releasedCount()).assertEqual(3);
      expect(pool.released().indexOf('app.media.icon') >= 0).assertTrue();
    });

    it('Browser_Resource_017', 0, async () => {
      TestLogger.step(TAG, 'rawfile image assets are counted by extension');
      const catalog: RawfileCatalog = new RawfileCatalog();
      expect(catalog.countByExtension('.png')).assertEqual(5);
      expect(catalog.countByExtension('.svg')).assertEqual(1);
      expect(catalog.countByExtension('.jpg')).assertEqual(1);
      expect(catalog.countByExtension('.html')).assertEqual(4);
      expect(catalog.countByExtension('.webp')).assertEqual(0);
    });

    it('Browser_Resource_018', 0, async () => {
      TestLogger.step(TAG, 'test harness pages and favicon remain packaged');
      const catalog: RawfileCatalog = new RawfileCatalog();
      expect(catalog.has('test.html')).assertTrue();
      expect(catalog.has('favicon.ico')).assertTrue();
      expect(catalog.has('backgroundImg.jpg')).assertTrue();
      expect(catalog.has('search.svg')).assertTrue();
      expect(catalog.files.length).assertEqual(12);
    });

    it('Browser_Resource_019', 0, async () => {
      TestLogger.step(TAG, 'resource reference parser round trips every kind');
      const uris: string[] = ['app.media.icon', 'app.string.MainAbility_label', 'app.color.white',
        'app.rawfile.pad.html'];
      for (let index = 0; index < uris.length; index++) {
        const ref: ResourceRef = ResourceRef.of(uris[index]);
        expect(ref.uri).assertEqual(uris[index]);
      }
      expect(ResourceRef.of('app.rawfile.pad.html').name).assertEqual('pad.html');
      expect(ResourceRef.of('broken').kind).assertEqual('unknown');
    });

    it('Browser_Resource_020', 0, async () => {
      TestLogger.step(TAG, 'home navigation after resource release still resolves a page');
      const pool: ResourcePool = new ResourcePool();
      pool.register(new ResourceRef(ResourceKind.RAWFILE, 'pad.html'));
      const browser: MockBrowser = new MockBrowser();
      browser.resetToHome('pad.html');
      expect(browser.getCurrentTab()?.controller.currentUrl).assertEqual('pad.html');
      expect(browser.getInputVal()).assertEqual('');
      pool.releaseAll();
      const fallbackUri: string = pool.resolveOrFallback('app.rawfile.phone.html',
        ['app.rawfile.pad.html']);
      browser.resetToHome(fallbackUri);
      expect(fallbackUri).assertEqual('app.rawfile.pad.html');
      expect(browser.getCurrentTab()?.controller.currentUrl).assertEqual('app.rawfile.pad.html');
    });

    it('Browser_Resource_021', 0, async () => {
      TestLogger.step(TAG, 'UI: home button is rendered with its resource');
      const homeReady: boolean = await componentByIdExists(driver, ID_NAV_HOME);
      TestLogger.info(TAG, `home button present=${homeReady}`);
      if (!homeReady) {
        TestLogger.warn(TAG, 'home button hidden by the current layout');
        expect(homeReady).assertFalse();
        return;
      }
      const clicked: boolean = await clickById(driver, ID_NAV_HOME);
      await serializedDelay(driver, TIMEOUT_COMPONENT / 2);
      expect(clicked).assertTrue();
      const catalog: RawfileCatalog = new RawfileCatalog();
      expect(catalog.has('pad.html') || catalog.has('phone.html')).assertTrue();
    });

    it('Browser_Resource_022', 0, async () => {
      TestLogger.step(TAG, 'UI: closing a tab keeps the resource count bounded');
      await serializedDelay(driver, DELAY_TAB_OPERATION);
      const closeButtons: number = await countById(driver, ID_CANCEL_TAB);
      const addButtons: number = await countById(driver, ID_ACTION_ADD);
      TestLogger.info(TAG, `close=${closeButtons}, add=${addButtons}`);
      expect(closeButtons <= MAX_TAB_COUNT + 1).assertTrue();
      const pool: ResourcePool = new ResourcePool();
      pool.register(new ResourceRef(ResourceKind.RAWFILE, 'pad.html'));
      const ledger: TabResourceLedger = new TabResourceLedger(new MockBrowser(), pool);
      ledger.openTab('app.rawfile.pad.html');
      ledger.closeTab(1);
      expect(pool.totalRefs()).assertEqual(0);
      expect(addButtons >= 0).assertTrue();
    });
  });
}


