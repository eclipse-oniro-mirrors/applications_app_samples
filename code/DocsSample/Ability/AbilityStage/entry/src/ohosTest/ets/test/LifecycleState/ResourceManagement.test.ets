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
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  logInfo,
  sleepMs,
  launchEntryAbility,
  doAbilityBackground,
  doAbilityForeground,
  waitForIndexPageStable,
  isIndexPageVisible,
  pageComponentCount,
  checkComponentExistsByKey,
  INDEX_PAGE_TEXT_KEY,
  TIMEOUT_PAGE_RENDER,
  DELAY_AFTER_LAUNCH,
  DELAY_AFTER_BACKGROUND,
  INDEX_PAGE_PATH,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

enum ResourceKind {
  FLOAT = 'float',
  COLOR = 'color',
  STRING = 'string'
}

interface ResourceToken {
  kind: ResourceKind;
  moduleName: string;
  resourceName: string;
}

interface ResourceHandle {
  handleId: number;
  token: ResourceToken;
  refCount: number;
}

interface HandleTableStats {
  allocated: number;
  released: number;
  live: number;
  peakLive: number;
}

const FONT_SIZE_RESOURCE: string = 'page_text_font_size';

const START_WINDOW_COLOR_RESOURCE: string = 'start_window_background';

const DEFAULT_CAPACITY: number = 8;

function resourceError(name: string, message: string): Error {
  const error: Error = new Error(message);
  error.name = name;
  return error;
}

class ResourceTokenParser {
  private static readonly VALID_KINDS: ResourceKind[] = [
    ResourceKind.FLOAT,
    ResourceKind.COLOR,
    ResourceKind.STRING
  ];

  public static canonical(kind: ResourceKind, moduleName: string, resourceName: string): string {
    return `${kind}:${moduleName}:${resourceName}`;
  }

  public static isKindValid(kind: string): boolean {
    for (let i: number = 0; i < ResourceTokenParser.VALID_KINDS.length; i++) {
      if (`${ResourceTokenParser.VALID_KINDS[i]}` === kind) {
        return true;
      }
    }
    return false;
  }

  public static resolve(raw: string): ResourceToken {
    if (raw.length === 0) {
      throw resourceError('ResourceTokenError', 'empty resource reference');
    }
    if (raw.indexOf('$r(') !== 0) {
      throw resourceError('ResourceTokenError', `missing $r wrapper: ${raw}`);
    }
    if (raw.indexOf(')') !== raw.length - 1) {
      throw resourceError('ResourceTokenError', 'unterminated $r reference');
    }
    const body: string = raw.substring(3, raw.length - 1);
    const segments: string[] = body.split('.');
    if (segments.length !== 3) {
      throw resourceError('ResourceTokenError', `expected 3 segments, got ${segments.length}`);
    }
    if (segments[0] !== 'app') {
      throw resourceError('ResourceTokenError', `unsupported module ${segments[0]}`);
    }
    if (!ResourceTokenParser.isKindValid(segments[1])) {
      throw resourceError('ResourceTokenError', `unknown kind ${segments[1]}`);
    }
    if (segments[2].length === 0) {
      throw resourceError('ResourceTokenError', 'empty resource name');
    }
    const token: ResourceToken = {
      kind: ResourceTokenParser.toKind(segments[1]),
      moduleName: segments[0],
      resourceName: segments[2]
    };
    return token;
  }

  public static toKind(kind: string): ResourceKind {
    if (kind === ResourceKind.FLOAT) {
      return ResourceKind.FLOAT;
    }
    if (kind === ResourceKind.COLOR) {
      return ResourceKind.COLOR;
    }
    if (kind === ResourceKind.STRING) {
      return ResourceKind.STRING;
    }
    throw resourceError('ResourceTokenError', `unknown kind ${kind}`);
  }

  public static isValid(raw: string): boolean {
    try {
      ResourceTokenParser.resolve(raw);
      return true;
    } catch (e) {
      return false;
    }
  }

  public static isFontSizeToken(token: ResourceToken): boolean {
    return token.kind === ResourceKind.FLOAT && token.resourceName === FONT_SIZE_RESOURCE;
  }

  public static isStartWindowColorToken(token: ResourceToken): boolean {
    return token.kind === ResourceKind.COLOR && token.resourceName === START_WINDOW_COLOR_RESOURCE;
  }
}

class ResourceHandleTable {
  private handles: Map<number, ResourceHandle> = new Map<number, ResourceHandle>();

  private nextHandleId: number = 1;

  private allocatedTotal: number = 0;

  private releasedTotal: number = 0;

  private peakLive: number = 0;

  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public acquire(token: ResourceToken): number {
    const existing: number = this.findByToken(token);
    if (existing >= 0) {
      const handle: ResourceHandle | undefined = this.handles.get(existing);
      if (handle !== undefined) {
        handle.refCount++;
      }
      return existing;
    }
    if (this.handles.size >= this.capacity) {
      throw resourceError('ResourceCapacityError', `capacity ${this.capacity} reached`);
    }
    const handle: ResourceHandle = {
      handleId: this.nextHandleId,
      token: token,
      refCount: 1
    };
    this.handles.set(handle.handleId, handle);
    this.nextHandleId++;
    this.allocatedTotal++;
    if (this.handles.size > this.peakLive) {
      this.peakLive = this.handles.size;
    }
    return handle.handleId;
  }

  private findByToken(token: ResourceToken): number {
    const target: string = ResourceTokenParser.canonical(token.kind, token.moduleName, token.resourceName);
    const ids: number[] = this.handleIds();
    for (let i: number = 0; i < ids.length; i++) {
      const handle: ResourceHandle | undefined = this.handles.get(ids[i]);
      if (handle === undefined) {
        continue;
      }
      const current: string =
        ResourceTokenParser.canonical(handle.token.kind, handle.token.moduleName, handle.token.resourceName);
      if (current === target) {
        return ids[i];
      }
    }
    return -1;
  }

  public release(handleId: number): boolean {
    const handle: ResourceHandle | undefined = this.handles.get(handleId);
    if (handle === undefined) {
      return false;
    }
    handle.refCount--;
    if (handle.refCount > 0) {
      return true;
    }
    this.handles.delete(handleId);
    this.releasedTotal++;
    return true;
  }

  public refCountOf(handleId: number): number {
    const handle: ResourceHandle | undefined = this.handles.get(handleId);
    if (handle === undefined) {
      return 0;
    }
    return handle.refCount;
  }

  public liveCount(): number {
    return this.handles.size;
  }

  public handleIds(): number[] {
    const ids: number[] = [];
    for (let id: number = 1; id < this.nextHandleId; id++) {
      if (this.handles.has(id)) {
        ids.push(id);
      }
    }
    return ids;
  }

  public stats(): HandleTableStats {
    const result: HandleTableStats = {
      allocated: this.allocatedTotal,
      released: this.releasedTotal,
      live: this.handles.size,
      peakLive: this.peakLive
    };
    return result;
  }

  public hasLeak(expectedAllocated: number, expectedReleased: number): boolean {
    return this.allocatedTotal !== expectedAllocated || this.releasedTotal !== expectedReleased ||
      this.handles.size !== expectedAllocated - expectedReleased;
  }

  public getCapacity(): number {
    return this.capacity;
  }

  public tokenAt(handleId: number): ResourceToken | null {
    const handle: ResourceHandle | undefined = this.handles.get(handleId);
    if (handle === undefined) {
      return null;
    }
    return handle.token;
  }

  public clear(): void {
    this.handles = new Map<number, ResourceHandle>();
    this.nextHandleId = 1;
    this.allocatedTotal = 0;
    this.releasedTotal = 0;
    this.peakLive = 0;
  }
}

class ResourceLeakDetector {
  public static isBalanced(allocated: number, released: number): boolean {
    return allocated === released;
  }

  public static leakedCount(allocated: number, released: number): number {
    const leaked: number = allocated - released;
    return leaked < 0 ? 0 : leaked;
  }

  public static describe(allocated: number, released: number): string {
    return `allocated=${allocated} released=${released} leaked=${ResourceLeakDetector.leakedCount(allocated, released)}`;
  }

  public static isOverReleased(allocated: number, released: number): boolean {
    return released > allocated;
  }
}

class ResourcePathResolver {
  public static resolvePageResource(pagePath: string, key: string): string {
    if (pagePath.length === 0) {
      throw resourceError('ResourcePathError', 'empty page path');
    }
    if (key.length === 0) {
      throw resourceError('ResourcePathError', 'empty resource key');
    }
    return `${pagePath}#${key}`;
  }

  public static splitPagePath(pagePath: string): string[] {
    if (pagePath.indexOf('/') < 0) {
      throw resourceError('ResourcePathError', `page path lacks separator: ${pagePath}`);
    }
    return pagePath.split('/');
  }

  public static isStandardPage(pagePath: string): boolean {
    return pagePath === INDEX_PAGE_PATH;
  }
}

export default function resourceManagementTest(): void {
  describe('ResourceManagementTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      driver = getDriver();
      await launchEntryAbility();
      await sleepMs(DELAY_AFTER_LAUNCH);

      await ensureIndexPageInitial(driver);
    })

    afterAll(async () => {
      await doAbilityForeground();
      await sleepMs(DELAY_AFTER_BACKGROUND);
      logInfo('ResourceManagementTest: suite finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESOURCE_0100
     * @tc.name testParseFontSizeResourceToken
     * @tc.desc Verify $r token parsing: app.float.page_text_font_size -> kind float, module app, name page_text_font_size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testParseFontSizeResourceToken', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const token: ResourceToken = ResourceTokenParser.resolve('$r(app.float.page_text_font_size)');
        expect(token.kind).assertEqual(ResourceKind.FLOAT);
        expect(token.moduleName).assertEqual('app');
        expect(token.resourceName).assertEqual(FONT_SIZE_RESOURCE);
        expect(ResourceTokenParser.isFontSizeToken(token)).assertTrue();
        expect(ResourceTokenParser.isStartWindowColorToken(token)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESOURCE_0200
     * @tc.name testParseStartWindowColorToken
     * @tc.desc Verify color token: app.color.start_window_background -> kind color and recognized as start window color
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testParseStartWindowColorToken', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const token: ResourceToken = ResourceTokenParser.resolve('$r(app.color.start_window_background)');
        expect(token.kind).assertEqual(ResourceKind.COLOR);
        expect(token.resourceName).assertEqual(START_WINDOW_COLOR_RESOURCE);
        expect(ResourceTokenParser.isStartWindowColorToken(token)).assertTrue();
        expect(ResourceTokenParser.isFontSizeToken(token)).assertFalse();
        expect(ResourceTokenParser.canonical(token.kind, token.moduleName, token.resourceName))
          .assertEqual('color:app:start_window_background');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESOURCE_0300
     * @tc.name testRejectUnwrappedResourceReference
     * @tc.desc Verify token wrapper guard: reference without $r() -> throws ResourceTokenError and validity false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRejectUnwrappedResourceReference', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        try {
          ResourceTokenParser.resolve('app.float.page_text_font_size');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ResourceTokenError');
          expect(e.message).assertEqual('missing $r wrapper: app.float.page_text_font_size');
        }
        expect(ResourceTokenParser.isValid('app.float.page_text_font_size')).assertFalse();
        expect(ResourceTokenParser.isValid('')).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESOURCE_0400
     * @tc.name testRejectUnknownResourceKind
     * @tc.desc Verify kind whitelist: app.dimension.size -> throws ResourceTokenError with unknown kind dimension
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRejectUnknownResourceKind', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        try {
          ResourceTokenParser.resolve('$r(app.dimension.page_text_font_size)');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ResourceTokenError');
          expect(e.message).assertEqual('unknown kind dimension');
        }
        expect(ResourceTokenParser.isKindValid('float')).assertTrue();
        expect(ResourceTokenParser.isKindValid('color')).assertTrue();
        expect(ResourceTokenParser.isKindValid('string')).assertTrue();
        expect(ResourceTokenParser.isKindValid('dimension')).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESOURCE_0500
     * @tc.name testRejectWrongSegmentCount
     * @tc.desc Verify segment count guard: $r(app.float) -> ResourceTokenError saying expected 3 segments got 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRejectWrongSegmentCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        try {
          ResourceTokenParser.resolve('$r(app.float)');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ResourceTokenError');
          expect(e.message).assertEqual('expected 3 segments, got 2');
        }
        expect(ResourceTokenParser.isValid('$r(app.float)')).assertFalse();
        expect(ResourceTokenParser.isValid('$r(app.float.page_text_font_size)')).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESOURCE_0600
     * @tc.name testAcquireAllocatesSequentialHandleIds
     * @tc.desc Verify handle allocation: two distinct tokens acquired -> handle ids 1 and 2, live 2, allocated 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAcquireAllocatesSequentialHandleIds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const table: ResourceHandleTable = new ResourceHandleTable(DEFAULT_CAPACITY);
        const fontToken: ResourceToken = ResourceTokenParser.resolve('$r(app.float.page_text_font_size)');
        const colorToken: ResourceToken = ResourceTokenParser.resolve('$r(app.color.start_window_background)');
        const first: number = table.acquire(fontToken);
        const second: number = table.acquire(colorToken);
        expect(first).assertEqual(1);
        expect(second).assertEqual(2);
        expect(table.liveCount()).assertEqual(2);
        const stats: HandleTableStats = table.stats();
        expect(stats.allocated).assertEqual(2);
        expect(stats.released).assertEqual(0);
        expect(stats.live).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESOURCE_0700
     * @tc.name testAcquireSameTokenIncrementsRefCount
     * @tc.desc Verify ref counting: same token acquired twice -> single handle with refCount 2 and live 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAcquireSameTokenIncrementsRefCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const table: ResourceHandleTable = new ResourceHandleTable(DEFAULT_CAPACITY);
        const token: ResourceToken = ResourceTokenParser.resolve('$r(app.float.page_text_font_size)');
        const first: number = table.acquire(token);
        const second: number = table.acquire(token);
        expect(first).assertEqual(second);
        expect(table.refCountOf(first)).assertEqual(2);
        expect(table.liveCount()).assertEqual(1);
        expect(table.stats().allocated).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESOURCE_0800
     * @tc.name testReleaseDecrementsRefCountBeforeFreeing
     * @tc.desc Verify release semantics: acquire twice then release once -> still live with refCount 1, second release frees handle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReleaseDecrementsRefCountBeforeFreeing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const table: ResourceHandleTable = new ResourceHandleTable(DEFAULT_CAPACITY);
        const token: ResourceToken = ResourceTokenParser.resolve('$r(app.color.start_window_background)');
        const id: number = table.acquire(token);
        table.acquire(token);
        expect(table.release(id)).assertTrue();
        expect(table.liveCount()).assertEqual(1);
        expect(table.refCountOf(id)).assertEqual(1);
        expect(table.stats().released).assertEqual(0);
        expect(table.release(id)).assertTrue();
        expect(table.liveCount()).assertEqual(0);
        expect(table.refCountOf(id)).assertEqual(0);
        expect(table.stats().released).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESOURCE_0900
     * @tc.name testReleaseUnknownHandleReturnsFalse
     * @tc.desc Verify idempotent release: releasing handle 99 -> false and totals untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReleaseUnknownHandleReturnsFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const table: ResourceHandleTable = new ResourceHandleTable(DEFAULT_CAPACITY);
        expect(table.release(99)).assertFalse();
        expect(table.liveCount()).assertEqual(0);
        expect(table.stats().released).assertEqual(0);
        expect(table.tokenAt(99)).assertEqual(null);
        expect(table.refCountOf(99)).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESOURCE_1000
     * @tc.name testBalancedAllocReleaseHasNoLeak
     * @tc.desc Verify no leak: allocate 4 distinct tokens then release 4 -> allocated 4, released 4, live 0, no leak
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBalancedAllocReleaseHasNoLeak', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const table: ResourceHandleTable = new ResourceHandleTable(DEFAULT_CAPACITY);
        const ids: number[] = [];
        ids.push(table.acquire(ResourceTokenParser.resolve('$r(app.float.page_text_font_size)')));
        ids.push(table.acquire(ResourceTokenParser.resolve('$r(app.color.start_window_background)')));
        ids.push(table.acquire(ResourceTokenParser.resolve('$r(app.string.app_name)')));
        ids.push(table.acquire(ResourceTokenParser.resolve('$r(app.float.title_size)')));
        expect(table.liveCount()).assertEqual(4);
        for (let i: number = 0; i < ids.length; i++) {
          expect(table.release(ids[i])).assertTrue();
        }
        const stats: HandleTableStats = table.stats();
        expect(stats.allocated).assertEqual(4);
        expect(stats.released).assertEqual(4);
        expect(stats.live).assertEqual(0);
        expect(ResourceLeakDetector.isBalanced(stats.allocated, stats.released)).assertTrue();
        expect(table.hasLeak(4, 4)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESOURCE_1100
     * @tc.name testLeakDetectedWhenOneHandleRemains
     * @tc.desc Verify leak detection: allocate 4 release 3 -> leaked count 1 and hasLeak true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLeakDetectedWhenOneHandleRemains', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const table: ResourceHandleTable = new ResourceHandleTable(DEFAULT_CAPACITY);
        const ids: number[] = [];
        ids.push(table.acquire(ResourceTokenParser.resolve('$r(app.float.page_text_font_size)')));
        ids.push(table.acquire(ResourceTokenParser.resolve('$r(app.color.start_window_background)')));
        ids.push(table.acquire(ResourceTokenParser.resolve('$r(app.string.app_name)')));
        ids.push(table.acquire(ResourceTokenParser.resolve('$r(app.float.title_size)')));
        for (let i: number = 0; i < 3; i++) {
          table.release(ids[i]);
        }
        const stats: HandleTableStats = table.stats();
        expect(stats.live).assertEqual(1);
        expect(ResourceLeakDetector.leakedCount(stats.allocated, stats.released)).assertEqual(1);
        expect(ResourceLeakDetector.isBalanced(stats.allocated, stats.released)).assertFalse();
        expect(table.hasLeak(4, 4)).assertTrue();
        expect(ResourceLeakDetector.describe(4, 3)).assertEqual('allocated=4 released=3 leaked=1');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESOURCE_1200
     * @tc.name testCapacityLimitRejectsExtraAcquire
     * @tc.desc Verify capacity boundary: table of capacity 2 -> third distinct token throws ResourceCapacityError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCapacityLimitRejectsExtraAcquire', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const table: ResourceHandleTable = new ResourceHandleTable(2);
        table.acquire(ResourceTokenParser.resolve('$r(app.float.page_text_font_size)'));
        table.acquire(ResourceTokenParser.resolve('$r(app.color.start_window_background)'));
        try {
          table.acquire(ResourceTokenParser.resolve('$r(app.string.app_name)'));
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ResourceCapacityError');
          expect(e.message).assertEqual('capacity 2 reached');
        }
        expect(table.liveCount()).assertEqual(2);
        expect(table.stats().allocated).assertEqual(2);
        expect(table.getCapacity()).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESOURCE_1300
     * @tc.name testReleaseFreesSlotForNewToken
     * @tc.desc Verify slot reuse: full capacity 2 then release one -> a new token acquires successfully with next handle id 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReleaseFreesSlotForNewToken', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const table: ResourceHandleTable = new ResourceHandleTable(2);
        const first: number = table.acquire(ResourceTokenParser.resolve('$r(app.float.page_text_font_size)'));
        table.acquire(ResourceTokenParser.resolve('$r(app.color.start_window_background)'));
        table.release(first);
        expect(table.liveCount()).assertEqual(1);
        const third: number = table.acquire(ResourceTokenParser.resolve('$r(app.string.app_name)'));
        expect(third).assertEqual(3);
        expect(table.liveCount()).assertEqual(2);
        expect(table.stats().allocated).assertEqual(3);
        expect(table.stats().released).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESOURCE_1400
     * @tc.name testPeakLiveTrackedAcrossCycles
     * @tc.desc Verify peak tracking: peak reaches 3 in burst cycle then falls to 0 -> peakLive stays 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPeakLiveTrackedAcrossCycles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const table: ResourceHandleTable = new ResourceHandleTable(DEFAULT_CAPACITY);
        const a: number = table.acquire(ResourceTokenParser.resolve('$r(app.float.page_text_font_size)'));
        const b: number = table.acquire(ResourceTokenParser.resolve('$r(app.color.start_window_background)'));
        const c: number = table.acquire(ResourceTokenParser.resolve('$r(app.string.app_name)'));
        expect(table.stats().peakLive).assertEqual(3);
        table.release(a);
        table.release(b);
        table.release(c);
        expect(table.liveCount()).assertEqual(0);
        expect(table.stats().peakLive).assertEqual(3);
        expect(table.handleIds().length).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESOURCE_1500
     * @tc.name testTokenLookupReturnsStoredToken
     * @tc.desc Verify handle to token mapping: acquired color token -> tokenAt returns matching color resource name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTokenLookupReturnsStoredToken', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const table: ResourceHandleTable = new ResourceHandleTable(DEFAULT_CAPACITY);
        const token: ResourceToken = ResourceTokenParser.resolve('$r(app.color.start_window_background)');
        const id: number = table.acquire(token);
        const stored: ResourceToken | null = table.tokenAt(id);
        expect(stored !== null).assertTrue();
        if (stored !== null) {
          expect(stored.kind).assertEqual(ResourceKind.COLOR);
          expect(stored.resourceName).assertEqual(START_WINDOW_COLOR_RESOURCE);
        }
        expect(table.handleIds()[0]).assertEqual(id);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESOURCE_1600
     * @tc.name testPageResourcePathComposition
     * @tc.desc Verify page resource path: pages/Index plus key HelloWorld -> pages/Index#HelloWorld and recognized standard page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPageResourcePathComposition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const resolved: string = ResourcePathResolver.resolvePageResource(INDEX_PAGE_PATH, INDEX_PAGE_TEXT_KEY);
        expect(resolved).assertEqual('pages/Index#HelloWorld');
        expect(ResourcePathResolver.isStandardPage(INDEX_PAGE_PATH)).assertTrue();
        expect(ResourcePathResolver.isStandardPage('pages/Other')).assertFalse();
        const segments: string[] = ResourcePathResolver.splitPagePath(INDEX_PAGE_PATH);
        expect(segments.length).assertEqual(2);
        expect(segments[0]).assertEqual('pages');
        expect(segments[1]).assertEqual('Index');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESOURCE_1700
     * @tc.name testPageResourcePathRejectsEmptyInputs
     * @tc.desc Verify path guards: empty page path and empty key -> ResourcePathError, non slash path -> separator error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPageResourcePathRejectsEmptyInputs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        try {
          ResourcePathResolver.resolvePageResource('', INDEX_PAGE_TEXT_KEY);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ResourcePathError');
          expect(e.message).assertEqual('empty page path');
        }
        try {
          ResourcePathResolver.resolvePageResource(INDEX_PAGE_PATH, '');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ResourcePathError');
          expect(e.message).assertEqual('empty resource key');
        }
        try {
          ResourcePathResolver.splitPagePath('Index');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ResourcePathError');
          expect(e.message).assertEqual('page path lacks separator: Index');
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESOURCE_1800
     * @tc.name testUiFontSizeResourceRendersPage
     * @tc.desc Verify font size resource in real page: launch EntryAbility -> Index renders with HelloWorld text component present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiFontSizeResourceRendersPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        const token: ResourceToken = ResourceTokenParser.resolve('$r(app.float.page_text_font_size)');
        expect(ResourceTokenParser.isFontSizeToken(token)).assertTrue();
        const present: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
        expect(present).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESOURCE_1900
     * @tc.name testUiHandleTableSurvivesBackgroundCycle
     * @tc.desc Verify handles persist across app switch: acquire 2 handles, background then foreground -> handles still live and page visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiHandleTableSurvivesBackgroundCycle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        const table: ResourceHandleTable = new ResourceHandleTable(DEFAULT_CAPACITY);
        const fontHandle: number = table.acquire(ResourceTokenParser.resolve('$r(app.float.page_text_font_size)'));
        const colorHandle: number = table.acquire(ResourceTokenParser.resolve('$r(app.color.start_window_background)'));
        await doAbilityBackground();
        await sleepMs(DELAY_AFTER_BACKGROUND);
        await doAbilityForeground();
        await sleepMs(DELAY_AFTER_LAUNCH);
        expect(table.liveCount()).assertEqual(2);
        expect(table.refCountOf(fontHandle)).assertEqual(1);
        expect(table.refCountOf(colorHandle)).assertEqual(1);
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESOURCE_2000
     * @tc.name testUiComponentCountStableDuringHandleChurn
     * @tc.desc Verify page unaffected by handle churn: 10 acquire/release cycles on live page -> component count equals baseline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testUiComponentCountStableDuringHandleChurn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      try {
        await launchEntryAbility();
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        const baseline: number = await pageComponentCount(driver);
        const table: ResourceHandleTable = new ResourceHandleTable(DEFAULT_CAPACITY);
        for (let i: number = 0; i < 10; i++) {
          const id: number = table.acquire(ResourceTokenParser.resolve('$r(app.float.page_text_font_size)'));
          table.release(id);
        }
        const current: number = await pageComponentCount(driver);
        expect(current).assertEqual(baseline);
        const stats: HandleTableStats = table.stats();
        expect(stats.allocated).assertEqual(10);
        expect(stats.released).assertEqual(10);
        expect(stats.live).assertEqual(0);
        expect(table.hasLeak(10, 10)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESOURCE_2100
     * @tc.name testHandleTableThroughputWithinBudget
     * @tc.desc Verify allocation throughput: the timed loop performs only acquire and release with no
     * assertion inside it, so 500 pairs must complete within 1500 ms; because every release drops the last
     * reference the table then reports 500 allocations, 500 releases, zero live handles and a peak of one,
     * with handle ids running from 1 to 500
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testHandleTableThroughputWithinBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      try {
        const table: ResourceHandleTable = new ResourceHandleTable(DEFAULT_CAPACITY);
        const token: ResourceToken = ResourceTokenParser.resolve('$r(app.float.page_text_font_size)');
        let firstId: number = -1;
        let lastId: number = -1;
        let releaseFailures: number = 0;
        const startTime: number = Date.now();
        for (let i: number = 0; i < 500; i++) {
          const id: number = table.acquire(token);
          if (i === 0) {
            firstId = id;
          }
          lastId = id;
          if (!table.release(id)) {
            releaseFailures++;
          }
        }
        const elapsed: number = Date.now() - startTime;
        logInfo(`testHandleTableThroughputWithinBudget: 500 pairs in ${elapsed} ms`);
        expect(firstId).assertEqual(1);
        expect(lastId).assertEqual(500);
        expect(releaseFailures).assertEqual(0);
        expect(elapsed <= 1500).assertTrue();
        expect(table.stats().allocated).assertEqual(500);
        expect(table.stats().released).assertEqual(500);
        expect(table.liveCount()).assertEqual(0);
        expect(table.stats().peakLive).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESOURCE_2200
     * @tc.name testTableClearResetsCounters
     * @tc.desc Verify table reset: after allocations then clear -> allocated 0, live 0, peak 0 and next handle id restarts at 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTableClearResetsCounters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const table: ResourceHandleTable = new ResourceHandleTable(DEFAULT_CAPACITY);
        table.acquire(ResourceTokenParser.resolve('$r(app.float.page_text_font_size)'));
        table.acquire(ResourceTokenParser.resolve('$r(app.color.start_window_background)'));
        expect(table.stats().peakLive).assertEqual(2);
        table.clear();
        const stats: HandleTableStats = table.stats();
        expect(stats.allocated).assertEqual(0);
        expect(stats.released).assertEqual(0);
        expect(stats.live).assertEqual(0);
        expect(stats.peakLive).assertEqual(0);
        const reused: number = table.acquire(ResourceTokenParser.resolve('$r(app.string.app_name)'));
        expect(reused).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESOURCE_2300
     * @tc.name testLeakDetectorOverReleaseReporting
     * @tc.desc Verify over-release detection: allocated 2 released 3 -> isOverReleased true and leaked count clamps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLeakDetectorOverReleaseReporting', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(ResourceLeakDetector.isOverReleased(2, 3)).assertTrue();
        expect(ResourceLeakDetector.leakedCount(2, 3)).assertEqual(0);
        expect(ResourceLeakDetector.isBalanced(3, 3)).assertTrue();
        expect(ResourceLeakDetector.isBalanced(0, 0)).assertTrue();
        expect(ResourceLeakDetector.isOverReleased(3, 3)).assertFalse();
        expect(ResourceLeakDetector.describe(0, 0)).assertEqual('allocated=0 released=0 leaked=0');
      } finally {
        done();
      }
    })
  })
}
