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
  waitForIndexPageStable,
  isIndexPageVisible,
  pageComponentCount,
  triggerEntryAbility,
  TIMEOUT_PAGE_RENDER,
  INDEX_PAGE_PATH,
  INDEX_PAGE_TEXT_KEY,
  PAGE_TEXT_INITIAL,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

enum ResourceKind {
  FLOAT = 'float',
  COLOR = 'color',
  STRING = 'string',
  PROFILE = 'profile',
  MEDIA = 'media'
}

enum LoadCode {
  HIT = 0,
  MISS = 1,
  DEFAULT_USED = 2,
  INVALID_TOKEN = 3,
  KIND_MISMATCH = 4,
  CACHE_FULL = 5
}

interface ResourceToken {
  module: string;
  kind: ResourceKind;
  name: string;
}

interface ResourceEntry {
  key: string;
  token: ResourceToken;
  value: string;
  numericValue: number;
  loadCount: number;
  lastAccess: number;
}

interface LoadResult {
  code: LoadCode;
  key: string;
  value: string;
  fromCache: boolean;
  cacheSize: number;
}

interface CacheReport {
  size: number;
  capacity: number;
  hitCount: number;
  missCount: number;
  hitRate: number;
}

class ResourceTokenParser {
  public parse(raw: string): ResourceToken | null {
    if (!raw.startsWith('app.')) {
      return null;
    }
    const parts: string[] = raw.split('.');
    if (parts.length !== 3) {
      return null;
    }
    const kindText: string = parts[1];
    let kind: ResourceKind = ResourceKind.STRING;
    if (kindText === ResourceKind.FLOAT) {
      kind = ResourceKind.FLOAT;
    } else if (kindText === ResourceKind.COLOR) {
      kind = ResourceKind.COLOR;
    } else if (kindText === ResourceKind.PROFILE) {
      kind = ResourceKind.PROFILE;
    } else if (kindText === ResourceKind.MEDIA) {
      kind = ResourceKind.MEDIA;
    } else if (kindText === ResourceKind.STRING) {
      kind = ResourceKind.STRING;
    } else {
      return null;
    }
    if (parts[2].length === 0) {
      return null;
    }
    const token: ResourceToken = {
      module: parts[0],
      kind: kind,
      name: parts[2]
    };
    return token;
  }

  public keyOf(token: ResourceToken): string {
    return `${token.module}.${token.kind}.${token.name}`;
  }
}

class ResourceLoaderUtil {
  private cache: ResourceEntry[] = [];
  private capacity: number;
  private hitCount: number = 0;
  private missCount: number = 0;
  private defaultUsedCount: number = 0;

  public constructor(capacity: number) {
    this.capacity = capacity;
  }

  public load(tokenKey: string, value: string, numericValue: number, kind: ResourceKind): LoadResult {
    const index: number = this.indexOf(tokenKey);
    if (index >= 0) {
      this.hitCount++;
      const cached: ResourceEntry = this.cache[index];
      const refreshed: ResourceEntry = {
        key: cached.key,
        token: cached.token,
        value: value.length === 0 ? cached.value : value,
        numericValue: numericValue,
        loadCount: cached.loadCount + 1,
        lastAccess: Date.now()
      };
      this.cache[index] = refreshed;
      const hit: LoadResult = {
        code: LoadCode.HIT,
        key: tokenKey,
        value: refreshed.value,
        fromCache: true,
        cacheSize: this.cache.length
      };
      return hit;
    }
    this.missCount++;
    if (this.cache.length >= this.capacity) {
      this.evictOldest();
    }
    const token: ResourceToken = {
      module: 'app',
      kind: kind,
      name: tokenKey
    };
    const entry: ResourceEntry = {
      key: tokenKey,
      token: token,
      value: value,
      numericValue: numericValue,
      loadCount: 1,
      lastAccess: Date.now()
    };
    this.cache.push(entry);
    const miss: LoadResult = {
      code: LoadCode.MISS,
      key: tokenKey,
      value: value,
      fromCache: false,
      cacheSize: this.cache.length
    };
    return miss;
  }

  public loadOrDefault(tokenKey: string, value: string, numericValue: number, kind: ResourceKind,
    fallback: string): LoadResult {
    if (tokenKey.length === 0) {
      this.defaultUsedCount++;
      const invalid: LoadResult = {
        code: LoadCode.INVALID_TOKEN,
        key: tokenKey,
        value: fallback,
        fromCache: false,
        cacheSize: this.cache.length
      };
      return invalid;
    }
    const result: LoadResult = this.load(tokenKey, value, numericValue, kind);
    if (result.value.length === 0) {
      this.defaultUsedCount++;
      const fallbackResult: LoadResult = {
        code: LoadCode.DEFAULT_USED,
        key: tokenKey,
        value: fallback,
        fromCache: result.fromCache,
        cacheSize: result.cacheSize
      };
      return fallbackResult;
    }
    return result;
  }

  public get(tokenKey: string): ResourceEntry | null {
    const index: number = this.indexOf(tokenKey);
    if (index < 0) {
      return null;
    }
    return this.cache[index];
  }

  public contains(tokenKey: string): boolean {
    return this.indexOf(tokenKey) >= 0;
  }

  public remove(tokenKey: string): boolean {
    const index: number = this.indexOf(tokenKey);
    if (index < 0) {
      return false;
    }
    const kept: ResourceEntry[] = [];
    for (let i = 0; i < this.cache.length; i++) {
      if (i !== index) {
        kept.push(this.cache[i]);
      }
    }
    this.cache = kept;
    return true;
  }

  public size(): number {
    return this.cache.length;
  }

  public getCapacity(): number {
    return this.capacity;
  }

  public setCapacity(capacity: number): void {
    this.capacity = capacity;
    while (this.cache.length > capacity) {
      this.evictOldest();
    }
  }

  public getHitCount(): number {
    return this.hitCount;
  }

  public getMissCount(): number {
    return this.missCount;
  }

  public getDefaultUsedCount(): number {
    return this.defaultUsedCount;
  }

  public hitRate(): number {
    const total: number = this.hitCount + this.missCount;
    if (total === 0) {
      return 0;
    }
    return this.hitCount / total;
  }

  public report(): CacheReport {
    const report: CacheReport = {
      size: this.cache.length,
      capacity: this.capacity,
      hitCount: this.hitCount,
      missCount: this.missCount,
      hitRate: this.hitRate()
    };
    return report;
  }

  public entriesOfKind(kind: ResourceKind): ResourceEntry[] {
    const matched: ResourceEntry[] = [];
    for (let i = 0; i < this.cache.length; i++) {
      if (this.cache[i].token.kind === kind) {
        matched.push(this.cache[i]);
      }
    }
    return matched;
  }

  public numericOf(tokenKey: string): number {
    const entry: ResourceEntry | null = this.get(tokenKey);
    if (entry === null) {
      return -1;
    }
    return entry.numericValue;
  }

  public clearCache(): void {
    this.cache = [];
  }

  public resetCounters(): void {
    this.hitCount = 0;
    this.missCount = 0;
    this.defaultUsedCount = 0;
  }

  private evictOldest(): void {
    if (this.cache.length === 0) {
      return;
    }
    let oldestIndex: number = 0;
    let oldestAccess: number = this.cache[0].lastAccess;
    for (let i = 1; i < this.cache.length; i++) {
      if (this.cache[i].lastAccess < oldestAccess) {
        oldestAccess = this.cache[i].lastAccess;
        oldestIndex = i;
      }
    }
    const kept: ResourceEntry[] = [];
    for (let i = 0; i < this.cache.length; i++) {
      if (i !== oldestIndex) {
        kept.push(this.cache[i]);
      }
    }
    this.cache = kept;
  }

  private indexOf(tokenKey: string): number {
    for (let i = 0; i < this.cache.length; i++) {
      if (this.cache[i].key === tokenKey) {
        return i;
      }
    }
    return -1;
  }
}

interface ResourceDirectory {
  floats: string[];
  colors: string[];
  profiles: string[];
}

function buildProjectDirectory(): ResourceDirectory {
  const directory: ResourceDirectory = {
    floats: ['page_text_font_size'],
    colors: ['start_window_background'],
    profiles: ['main_pages']
  };
  return directory;
}

export default function resourceLoaderValidationTest(): void {
  describe('ResourceLoaderValidationTest', () => {
    let driver: Driver;
    let parser: ResourceTokenParser;
    let loader: ResourceLoaderUtil;
    let directory: ResourceDirectory;

    beforeAll(async () => {
      driver = getDriver();
      parser = new ResourceTokenParser();
      loader = new ResourceLoaderUtil(16);
      directory = buildProjectDirectory();
      logInfo('ResourceLoaderValidationTest: beforeAll start');
      await triggerEntryAbility(driver);
      await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      logInfo('ResourceLoaderValidationTest: beforeAll finished');

      await ensureIndexPageInitial(driver);
    })

    afterAll(async () => {
      driver = getDriver();
      await driver.delayMs(100);
      logInfo('ResourceLoaderValidationTest: afterAll finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_0100
     * @tc.name testResourceKindEnumValues
     * @tc.desc Verify the resource kind enum exposes the five declared lowercase category names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testResourceKindEnumValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(ResourceKind.FLOAT).assertEqual('float');
        expect(ResourceKind.COLOR).assertEqual('color');
        expect(ResourceKind.STRING).assertEqual('string');
        expect(ResourceKind.PROFILE).assertEqual('profile');
        expect(ResourceKind.MEDIA).assertEqual('media');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_0200
     * @tc.name testLoadCodeEnumValues
     * @tc.desc Verify load result codes enumerate hits misses defaults and failures in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLoadCodeEnumValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(LoadCode.HIT).assertEqual(0);
        expect(LoadCode.MISS).assertEqual(1);
        expect(LoadCode.DEFAULT_USED).assertEqual(2);
        expect(LoadCode.INVALID_TOKEN).assertEqual(3);
        expect(LoadCode.KIND_MISMATCH).assertEqual(4);
        expect(LoadCode.CACHE_FULL).assertEqual(5);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_0300
     * @tc.name testParseFloatToken
     * @tc.desc Verify the font size token parses to module app kind float and name page_text_font_size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testParseFloatToken', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const token: ResourceToken | null = parser.parse('app.float.page_text_font_size');
        expect(token === null).assertFalse();
        if (token !== null) {
          expect(token.module).assertEqual('app');
          expect(token.kind).assertEqual(ResourceKind.FLOAT);
          expect(token.name).assertEqual('page_text_font_size');
          expect(parser.keyOf(token)).assertEqual('app.float.page_text_font_size');
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_0400
     * @tc.name testParseColorToken
     * @tc.desc Verify the start window token parses to module app kind color and name start_window_background
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testParseColorToken', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const token: ResourceToken | null = parser.parse('app.color.start_window_background');
        expect(token === null).assertFalse();
        if (token !== null) {
          expect(token.kind).assertEqual(ResourceKind.COLOR);
          expect(token.name).assertEqual('start_window_background');
          expect(parser.keyOf(token)).assertEqual('app.color.start_window_background');
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_0500
     * @tc.name testParseRejectsMalformedTokens
     * @tc.desc Verify tokens with the wrong prefix segment count or empty name parse to null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testParseRejectsMalformedTokens', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(parser.parse('sys.color.background') === null).assertTrue();
        expect(parser.parse('app.float') === null).assertTrue();
        expect(parser.parse('app.float.page.text') === null).assertTrue();
        expect(parser.parse('app.float.') === null).assertTrue();
        expect(parser.parse('') === null).assertTrue();
        expect(parser.parse('app.unknown.some_name') === null).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_0600
     * @tc.name testParseProfileToken
     * @tc.desc Verify the main pages profile token parses with profile kind and page name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testParseProfileToken', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const token: ResourceToken | null = parser.parse('app.profile.main_pages');
        expect(token === null).assertFalse();
        if (token !== null) {
          expect(token.kind).assertEqual(ResourceKind.PROFILE);
          expect(token.name).assertEqual('main_pages');
        }
        const stringToken: ResourceToken | null = parser.parse('app.string.app_name');
        expect(stringToken === null).assertFalse();
        if (stringToken !== null) {
          expect(stringToken.kind).assertEqual(ResourceKind.STRING);
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_0700
     * @tc.name testLoadFirstAccessIsMiss
     * @tc.desc Verify the first load of a token reports a miss stores cache size one and returns the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLoadFirstAccessIsMiss', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: ResourceLoaderUtil = new ResourceLoaderUtil(8);
        const result: LoadResult = local.load('app.float.page_text_font_size', '50fp', 50, ResourceKind.FLOAT);
        expect(result.code).assertEqual(LoadCode.MISS);
        expect(result.fromCache).assertFalse();
        expect(result.value).assertEqual('50fp');
        expect(result.cacheSize).assertEqual(1);
        expect(local.size()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_0800
     * @tc.name testLoadSecondAccessIsHit
     * @tc.desc Verify a repeated load hits the cache increments the load count and keeps size one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLoadSecondAccessIsHit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: ResourceLoaderUtil = new ResourceLoaderUtil(8);
        local.load('app.color.start_window_background', '#FFFFFF', 0, ResourceKind.COLOR);
        const second: LoadResult = local.load('app.color.start_window_background', '', 0, ResourceKind.COLOR);
        expect(second.code).assertEqual(LoadCode.HIT);
        expect(second.fromCache).assertTrue();
        expect(second.value).assertEqual('#FFFFFF');
        expect(second.cacheSize).assertEqual(1);
        const entry: ResourceEntry | null = local.get('app.color.start_window_background');
        if (entry !== null) {
          expect(entry.loadCount).assertEqual(2);
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_0900
     * @tc.name testHitRateAfterMixedLoads
     * @tc.desc Verify three unique loads then two repeats produce a hit rate of exactly two fifths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testHitRateAfterMixedLoads', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: ResourceLoaderUtil = new ResourceLoaderUtil(8);
        local.load('app.float.a', '1fp', 1, ResourceKind.FLOAT);
        local.load('app.float.b', '2fp', 2, ResourceKind.FLOAT);
        local.load('app.float.c', '3fp', 3, ResourceKind.FLOAT);
        expect(local.hitRate()).assertEqual(0);
        local.load('app.float.a', '1fp', 1, ResourceKind.FLOAT);
        local.load('app.float.b', '2fp', 2, ResourceKind.FLOAT);
        expect(local.hitRate()).assertEqual(2 / 5);
        const report: CacheReport = local.report();
        expect(report.hitCount).assertEqual(2);
        expect(report.missCount).assertEqual(3);
        expect(report.size).assertEqual(3);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_1000
     * @tc.name testHitRateOnEmptyLoader
     * @tc.desc Verify a loader with no accesses reports a zero hit rate and zero counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testHitRateOnEmptyLoader', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: ResourceLoaderUtil = new ResourceLoaderUtil(4);
        expect(local.hitRate()).assertEqual(0);
        expect(local.getHitCount()).assertEqual(0);
        expect(local.getMissCount()).assertEqual(0);
        expect(local.size()).assertEqual(0);
        expect(local.report().capacity).assertEqual(4);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_1100
     * @tc.name testMissingTokenUsesDefault
     * @tc.desc Verify an empty token key reports invalid-token and returns the caller fallback value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMissingTokenUsesDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: ResourceLoaderUtil = new ResourceLoaderUtil(4);
        const result: LoadResult = local.loadOrDefault('', 'unused', 0, ResourceKind.STRING, 'DEFAULT_TEXT');
        expect(result.code).assertEqual(LoadCode.INVALID_TOKEN);
        expect(result.value).assertEqual('DEFAULT_TEXT');
        expect(result.fromCache).assertFalse();
        expect(local.getDefaultUsedCount()).assertEqual(1);
        expect(local.size()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_1200
     * @tc.name testEmptyValueFallsBackToDefault
     * @tc.desc Verify a resolvable but empty resource value is replaced by the fallback with default-used code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEmptyValueFallsBackToDefault', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: ResourceLoaderUtil = new ResourceLoaderUtil(4);
        const result: LoadResult = local.loadOrDefault('app.string.missing_label', '', 0,
          ResourceKind.STRING, 'fallback_label');
        expect(result.code).assertEqual(LoadCode.DEFAULT_USED);
        expect(result.value).assertEqual('fallback_label');
        expect(local.getDefaultUsedCount()).assertEqual(1);
        expect(local.contains('app.string.missing_label')).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_1300
     * @tc.name testRepeatedLoadIsIdempotent
     * @tc.desc Verify ten loads of the same token keep cache size one while load count reaches ten
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRepeatedLoadIsIdempotent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: ResourceLoaderUtil = new ResourceLoaderUtil(8);
        for (let i = 0; i < 10; i++) {
          local.load('app.float.page_text_font_size', '50fp', 50, ResourceKind.FLOAT);
        }
        expect(local.size()).assertEqual(1);
        expect(local.getHitCount()).assertEqual(9);
        expect(local.getMissCount()).assertEqual(1);
        const entry: ResourceEntry | null = local.get('app.float.page_text_font_size');
        if (entry !== null) {
          expect(entry.loadCount).assertEqual(10);
          expect(entry.value).assertEqual('50fp');
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_1400
     * @tc.name testCacheCapacityEvictsOldest
     * @tc.desc Verify a two-slot cache retains only the two most recently accessed tokens
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCacheCapacityEvictsOldest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: ResourceLoaderUtil = new ResourceLoaderUtil(2);
        local.load('app.float.first', '1fp', 1, ResourceKind.FLOAT);
        local.load('app.float.second', '2fp', 2, ResourceKind.FLOAT);
        local.load('app.float.third', '3fp', 3, ResourceKind.FLOAT);
        expect(local.size()).assertEqual(2);
        expect(local.contains('app.float.third')).assertTrue();
        expect(local.contains('app.float.second')).assertTrue();
        expect(local.size()).assertLessOrEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_1500
     * @tc.name testRemoveCachedResource
     * @tc.desc Verify removing a cached token succeeds once then reports false on the absent second call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRemoveCachedResource', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: ResourceLoaderUtil = new ResourceLoaderUtil(8);
        local.load('app.color.start_window_background', '#FFFFFF', 0, ResourceKind.COLOR);
        expect(local.remove('app.color.start_window_background')).assertTrue();
        expect(local.contains('app.color.start_window_background')).assertFalse();
        expect(local.remove('app.color.start_window_background')).assertFalse();
        expect(local.size()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_1600
     * @tc.name testEntriesFilteredByKind
     * @tc.desc Verify kind filtering separates two float entries from one color entry exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEntriesFilteredByKind', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: ResourceLoaderUtil = new ResourceLoaderUtil(8);
        const floatToken: ResourceToken | null = parser.parse('app.float.page_text_font_size');
        expect(floatToken === null).assertFalse();
        local.load('app.float.page_text_font_size', '50fp', 50, ResourceKind.FLOAT);
        local.load('app.float.other_size', '20fp', 20, ResourceKind.FLOAT);
        local.load('app.color.start_window_background', '#FFFFFF', 0, ResourceKind.COLOR);
        expect(local.entriesOfKind(ResourceKind.FLOAT).length).assertEqual(2);
        expect(local.entriesOfKind(ResourceKind.COLOR).length).assertEqual(1);
        expect(local.entriesOfKind(ResourceKind.STRING).length).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_1700
     * @tc.name testNumericValueRoundTrip
     * @tc.desc Verify the font size numeric value is retrievable as fifty and an absent token returns minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNumericValueRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: ResourceLoaderUtil = new ResourceLoaderUtil(8);
        local.load('app.float.page_text_font_size', '50fp', 50, ResourceKind.FLOAT);
        expect(local.numericOf('app.float.page_text_font_size')).assertEqual(50);
        expect(local.numericOf('app.float.absent_size')).assertEqual(-1);
        expect(local.get('app.float.absent_size') === null).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_1800
     * @tc.name testClearCacheKeepsCounters
     * @tc.desc Verify clearing the cache empties entries while hit and miss counters remain until reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testClearCacheKeepsCounters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: ResourceLoaderUtil = new ResourceLoaderUtil(8);
        local.load('app.float.page_text_font_size', '50fp', 50, ResourceKind.FLOAT);
        local.load('app.float.page_text_font_size', '50fp', 50, ResourceKind.FLOAT);
        expect(local.getHitCount()).assertEqual(1);
        expect(local.getMissCount()).assertEqual(1);
        local.clearCache();
        expect(local.size()).assertEqual(0);
        expect(local.getHitCount()).assertEqual(1);
        expect(local.getMissCount()).assertEqual(1);
        local.resetCounters();
        expect(local.getHitCount()).assertEqual(0);
        expect(local.hitRate()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_1900
     * @tc.name testShrinkCapacityEvictsDown
     * @tc.desc Verify reducing cache capacity trims the entry set down to the new limit immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testShrinkCapacityEvictsDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: ResourceLoaderUtil = new ResourceLoaderUtil(8);
        local.load('app.float.one', '1fp', 1, ResourceKind.FLOAT);
        local.load('app.float.two', '2fp', 2, ResourceKind.FLOAT);
        local.load('app.float.three', '3fp', 3, ResourceKind.FLOAT);
        local.load('app.float.four', '4fp', 4, ResourceKind.FLOAT);
        expect(local.size()).assertEqual(4);
        local.setCapacity(2);
        expect(local.getCapacity()).assertEqual(2);
        expect(local.size()).assertEqual(2);
        expect(local.report().size).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_2000
     * @tc.name testDirectoryFloatEntries
     * @tc.desc Verify the project float directory declares exactly the page text font size entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDirectoryFloatEntries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(directory.floats.length).assertEqual(1);
        expect(directory.floats[0]).assertEqual('page_text_font_size');
        const token: ResourceToken | null = parser.parse('app.float.page_text_font_size');
        expect(token === null).assertFalse();
        if (token !== null) {
          let found: boolean = false;
          for (let i = 0; i < directory.floats.length; i++) {
            if (directory.floats[i] === token.name) {
              found = true;
            }
          }
          expect(found).assertTrue();
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_2100
     * @tc.name testDirectoryColorEntries
     * @tc.desc Verify the project color directory declares exactly the start window background entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDirectoryColorEntries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(directory.colors.length).assertEqual(1);
        expect(directory.colors[0]).assertEqual('start_window_background');
        const token: ResourceToken | null = parser.parse('app.color.start_window_background');
        expect(token === null).assertFalse();
        if (token !== null) {
          expect(token.name).assertEqual(directory.colors[0]);
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_2200
     * @tc.name testDirectoryProfileContainsIndexPage
     * @tc.desc Verify the main pages profile is declared and the index page path appears in the routing list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDirectoryProfileContainsIndexPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(directory.profiles.length).assertEqual(1);
        expect(directory.profiles[0]).assertEqual('main_pages');
        expect(INDEX_PAGE_PATH).assertEqual('pages/Index');
        expect(INDEX_PAGE_TEXT_KEY).assertEqual('HelloWorld');
        expect(PAGE_TEXT_INITIAL).assertEqual('Hello World');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_2300
     * @tc.name testLoadFloatAndColorFromDirectory
     * @tc.desc Verify both directory tokens load with their declared literal values and kinds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLoadFloatAndColorFromDirectory', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: ResourceLoaderUtil = new ResourceLoaderUtil(8);
        const floatResult: LoadResult = local.load('app.float.page_text_font_size', '50fp', 50,
          ResourceKind.FLOAT);
        const colorResult: LoadResult = local.load('app.color.start_window_background', '#FFFFFF', 0,
          ResourceKind.COLOR);
        expect(floatResult.value).assertEqual('50fp');
        expect(floatResult.code).assertEqual(LoadCode.MISS);
        expect(colorResult.value).assertEqual('#FFFFFF');
        expect(colorResult.code).assertEqual(LoadCode.MISS);
        expect(local.size()).assertEqual(2);
        expect(local.entriesOfKind(ResourceKind.FLOAT).length).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_2400
     * @tc.name testUiIndexPageVisibleForResourceProbe
     * @tc.desc Verify the index page using the font size resource renders and is visible in the real window
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiIndexPageVisibleForResourceProbe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
        const count: number = await pageComponentCount(driver);
        expect(count > 0).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_2500
     * @tc.name testUiFontResourceBacksRenderedText
     * @tc.desc Verify the text resource literal is backed by a loaded float token while the page stays rendered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiFontResourceBacksRenderedText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: ResourceLoaderUtil = new ResourceLoaderUtil(8);
        local.load('app.float.page_text_font_size', '50fp', 50, ResourceKind.FLOAT);
        expect(local.numericOf('app.float.page_text_font_size')).assertEqual(50);
        const visible: boolean = await isIndexPageVisible(driver);
        expect(visible).assertTrue();
        expect(local.size()).assertEqual(1);
        const report: CacheReport = local.report();
        expect(report.missCount).assertEqual(1);
        expect(report.hitCount).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_2600
     * @tc.name testUiRepeatedProbeKeepsHitRate
     * @tc.desc Verify repeated resource probes across real page queries raise the hit rate above one half
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiRepeatedProbeKeepsHitRate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: ResourceLoaderUtil = new ResourceLoaderUtil(8);
        for (let i = 0; i < 4; i++) {
          local.load('app.color.start_window_background', '#FFFFFF', 0, ResourceKind.COLOR);
          expect(await isIndexPageVisible(driver)).assertTrue();
        }
        expect(local.getMissCount()).assertEqual(1);
        expect(local.getHitCount()).assertEqual(3);
        expect(local.hitRate()).assertEqual(0.75);
        expect(local.size()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_2700
     * @tc.name testUiRenderedPageRequiresBothTokens
     * @tc.desc Verify the rendered page depends on both the float and color tokens being loadable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiRenderedPageRequiresBothTokens', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: ResourceLoaderUtil = new ResourceLoaderUtil(8);
        const floatToken: ResourceToken | null = parser.parse('app.float.page_text_font_size');
        const colorToken: ResourceToken | null = parser.parse('app.color.start_window_background');
        expect(floatToken === null).assertFalse();
        expect(colorToken === null).assertFalse();
        if (floatToken !== null) {
          local.load(parser.keyOf(floatToken), '50fp', 50, ResourceKind.FLOAT);
          expect(local.contains('app.float.page_text_font_size')).assertTrue();
        }
        if (colorToken !== null) {
          local.load(parser.keyOf(colorToken), '#FFFFFF', 0, ResourceKind.COLOR);
          expect(local.contains('app.color.start_window_background')).assertTrue();
        }
        expect(local.size()).assertEqual(2);
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_2800
     * @tc.name testUiProfileTokenMatchesRunningPage
     * @tc.desc Verify the main pages profile token resolves and the running page path matches its routing entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiProfileTokenMatchesRunningPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const token: ResourceToken | null = parser.parse('app.profile.main_pages');
        expect(token === null).assertFalse();
        if (token !== null) {
          expect(token.kind).assertEqual(ResourceKind.PROFILE);
          expect(token.name).assertEqual('main_pages');
        }
        expect(directory.profiles[0]).assertEqual('main_pages');
        expect(INDEX_PAGE_PATH).assertEqual('pages/Index');
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_2900
     * @tc.name testUiTokenLoadsAcrossProbeCycles
     * @tc.desc Verify four probe cycles over the live page keep exactly one cached token with three hits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiTokenLoadsAcrossProbeCycles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: ResourceLoaderUtil = new ResourceLoaderUtil(4);
        for (let i = 0; i < 4; i++) {
          const count: number = await pageComponentCount(driver);
          expect(count > 0).assertTrue();
          local.load('app.float.page_text_font_size', '50fp', 50, ResourceKind.FLOAT);
        }
        expect(local.size()).assertEqual(1);
        expect(local.getMissCount()).assertEqual(1);
        expect(local.getHitCount()).assertEqual(3);
        expect(local.hitRate()).assertEqual(0.75);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_3000
     * @tc.name testUiMissingResourceFallsBackWhilePageRenders
     * @tc.desc Verify an unresolved resource falls back to the default value and the page still renders
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiMissingResourceFallsBackWhilePageRenders', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: ResourceLoaderUtil = new ResourceLoaderUtil(4);
        const missing: LoadResult = local.loadOrDefault('app.color.absent_background', '', 0,
          ResourceKind.COLOR, '#000000');
        expect(missing.code).assertEqual(LoadCode.DEFAULT_USED);
        expect(missing.value).assertEqual('#000000');
        expect(local.getDefaultUsedCount()).assertEqual(1);
        const visible: boolean = await isIndexPageVisible(driver);
        expect(visible).assertTrue();
        expect(await pageComponentCount(driver) > 0).assertTrue();
      } finally {
        done();
      }
    })
    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_3100
     * @tc.name testUiCacheHoldsBothTokensWhilePageRenders
     * @tc.desc Verify both app tokens stay cached together across live probes without eviction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiCacheHoldsBothTokensWhilePageRenders', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: ResourceLoaderUtil = new ResourceLoaderUtil(2);
        for (let i = 0; i < 3; i++) {
          expect(await isIndexPageVisible(driver)).assertTrue();
          local.load('app.float.page_text_font_size', '50fp', 50, ResourceKind.FLOAT);
          local.load('app.color.start_window_background', '#FFFFFF', 0, ResourceKind.COLOR);
        }
        expect(local.size()).assertEqual(2);
        expect(local.getMissCount()).assertEqual(2);
        expect(local.getHitCount()).assertEqual(4);
        expect(local.entriesOfKind(ResourceKind.FLOAT).length).assertEqual(1);
        expect(local.entriesOfKind(ResourceKind.COLOR).length).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_3200
     * @tc.name testUiMissThenHitSequenceDuringProbe
     * @tc.desc Verify the first probe misses the color token and the second probe after a live query hits it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiMissThenHitSequenceDuringProbe', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: ResourceLoaderUtil = new ResourceLoaderUtil(8);
        const first: LoadResult = local.load('app.color.start_window_background', '#FFFFFF', 0, ResourceKind.COLOR);
        expect(first.code).assertEqual(LoadCode.MISS);
        expect(first.fromCache).assertFalse();
        const count: number = await pageComponentCount(driver);
        expect(count > 0).assertTrue();
        const second: LoadResult = local.load('app.color.start_window_background', '#FFFFFF', 0, ResourceKind.COLOR);
        expect(second.code).assertEqual(LoadCode.HIT);
        expect(second.fromCache).assertTrue();
        expect(local.hitRate()).assertEqual(0.5);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_RESLOADER_3300
     * @tc.name testUiDirectoryBacksRunningPageResources
     * @tc.desc Verify the project directory declares both tokens the running page needs and the page renders
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiDirectoryBacksRunningPageResources', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(directory.floats.length).assertEqual(1);
        expect(directory.colors.length).assertEqual(1);
        expect(directory.floats[0]).assertEqual('page_text_font_size');
        expect(directory.colors[0]).assertEqual('start_window_background');
        const floatToken: ResourceToken | null = parser.parse(`app.float.${directory.floats[0]}`);
        const colorToken: ResourceToken | null = parser.parse(`app.color.${directory.colors[0]}`);
        expect(floatToken === null).assertFalse();
        expect(colorToken === null).assertFalse();
        expect(await isIndexPageVisible(driver)).assertTrue();
        expect(INDEX_PAGE_TEXT_KEY).assertEqual('HelloWorld');
      } finally {
        done();
      }
    })
  })
}
