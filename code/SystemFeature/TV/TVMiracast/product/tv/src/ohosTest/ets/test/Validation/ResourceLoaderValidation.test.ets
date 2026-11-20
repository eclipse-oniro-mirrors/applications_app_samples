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
import { Driver } from '../Shared/MiracastDriver';
import { Log } from 'library';
import {
  getDriver,
  KEY_BACK,
  miracastComponentCount,
  pressAndWait,
  waitForPageStable,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION
} from '../Shared/MiracastDriver';

const TAG: string = 'ResourceLoaderSuite';

// Resource kinds referenced by the miracast application.
enum ResourceType {
  STRING = 'string',
  MEDIA = 'media',
  COLOR = 'color',
  FLOAT = 'float',
  BOOLEAN = 'boolean'
}

// One resolved resource entry.
interface ResourceEntry {
  key: string;
  type: ResourceType;
  value: string;
  size: number;
  loadedAt: number;
}

// One cache load operation.
interface LoadHistoryRecord {
  key: string;
  hit: boolean;
  timestamp: number;
}

// The app.string resources used by the miracast pages.
class AppStringResources {
  public static readonly KEY_TIP: string = 'tip';
  public static readonly KEY_CANCEL: string = 'cancel';
  public static readonly KEY_PERMANENT_TRUST: string = 'permanent_trust';
  public static readonly KEY_ONLY_THIS_TIME: string = 'only_for_this_time';
  public static readonly KEY_TRUSTED_LIST: string = 'trusted_device_list';
  public static readonly KEY_SETTINGS: string = 'projection_Settings';
  public static readonly KEY_MIRACAST: string = 'miracast_screen_casting';
  private values: Map<string, string> = new Map<string, string>();

  public constructor() {
    this.values.set(AppStringResources.KEY_TIP, 'Allow this device to cast to the TV');
    this.values.set(AppStringResources.KEY_CANCEL, 'Cancel');
    this.values.set(AppStringResources.KEY_PERMANENT_TRUST, 'Always allow');
    this.values.set(AppStringResources.KEY_ONLY_THIS_TIME, 'Only this time');
    this.values.set(AppStringResources.KEY_TRUSTED_LIST, 'Trusted devices');
    this.values.set(AppStringResources.KEY_SETTINGS, 'Projection settings');
    this.values.set(AppStringResources.KEY_MIRACAST, 'Screen casting');
  }

  public count(): number {
    return this.values.size;
  }

  public get(key: string): string {
    const value = this.values.get(key);
    return value === undefined ? '' : value;
  }

  public has(key: string): boolean {
    return this.values.has(key);
  }

  public keys(): Array<string> {
    const result: Array<string> = [];
    const iterator = this.values.keys();
    let next = iterator.next();
    while (!next.done) {
      result.push(next.value);
      next = iterator.next();
    }
    return result;
  }

  public resolveById(resourceId: string): string {
    const prefix = 'app.string.';
    if (!resourceId.startsWith(prefix)) {
      return '';
    }
    return this.get(resourceId.substring(prefix.length));
  }

  public totalCharCount(): number {
    let total: number = 0;
    const list = this.keys();
    for (let i = 0; i < list.length; i++) {
      total = total + this.get(list[i]).length;
    }
    return total;
  }

  public remove(key: string): boolean {
    return this.values.delete(key);
  }

  public clear(): void {
    this.values.clear();
  }
}

// Validates app.string and app.media resource keys.
class ResourceKeyValidator {
  public isAppStringKey(resourceId: string): boolean {
    return resourceId.startsWith('app.string.') && resourceId.length > 'app.string.'.length;
  }

  public isAppMediaKey(resourceId: string): boolean {
    return resourceId.startsWith('app.media.') && resourceId.length > 'app.media.'.length;
  }

  public isSnakeCase(key: string): boolean {
    if (key.length === 0) {
      return false;
    }
    for (let i = 0; i < key.length; i++) {
      const code = key.charCodeAt(i);
      const lowerLetter = code >= 97 && code <= 122;
      const digit = code >= 48 && code <= 57;
      const underscore = code === 95;
      if (!lowerLetter && !digit && !underscore) {
        return false;
      }
    }
    return true;
  }

  public hasNoWhitespace(key: string): boolean {
    for (let i = 0; i < key.length; i++) {
      const code = key.charCodeAt(i);
      if (code === 32 || code === 9 || code === 10 || code === 13) {
        return false;
      }
    }
    return true;
  }

  public stripPrefix(resourceId: string): string {
    const stringPrefix = 'app.string.';
    const mediaPrefix = 'app.media.';
    if (resourceId.startsWith(stringPrefix)) {
      return resourceId.substring(stringPrefix.length);
    }
    if (resourceId.startsWith(mediaPrefix)) {
      return resourceId.substring(mediaPrefix.length);
    }
    return '';
  }
}

// LRU-ish resource cache with hit rate accounting.
class ResourceCache {
  private entries: Map<string, ResourceEntry> = new Map<string, ResourceEntry>();
  private history: Array<LoadHistoryRecord> = [];
  private limit: number = 64;
  private hitCount: number = 0;
  private missCount: number = 0;

  public setLimit(limit: number): void {
    this.limit = limit > 0 ? limit : 1;
  }

  public getLimit(): number {
    return this.limit;
  }

  public load(key: string, type: ResourceType, value: string, size: number): boolean {
    if (this.entries.has(key)) {
      this.hitCount++;
      this.history.push({ key: key, hit: true, timestamp: Date.now() });
      return true;
    }
    this.missCount++;
    if (this.entries.size >= this.limit) {
      this.evictOldest();
    }
    this.entries.set(key, {
      key: key,
      type: type,
      value: value,
      size: size > 0 ? size : 0,
      loadedAt: Date.now()
    });
    this.history.push({ key: key, hit: false, timestamp: Date.now() });
    return true;
  }

  private evictOldest(): void {
    let oldestKey: string = '';
    let oldestTime: number = Number.MAX_SAFE_INTEGER;
    const iterator = this.entries.keys();
    let next = iterator.next();
    while (!next.done) {
      const entry = this.entries.get(next.value);
      if (entry !== undefined && entry.loadedAt < oldestTime) {
        oldestTime = entry.loadedAt;
        oldestKey = next.value;
      }
      next = iterator.next();
    }
    if (oldestKey.length > 0) {
      this.entries.delete(oldestKey);
    }
  }

  public get(key: string): ResourceEntry | null {
    const entry = this.entries.get(key);
    return entry === undefined ? null : entry;
  }

  public has(key: string): boolean {
    return this.entries.has(key);
  }

  public remove(key: string): boolean {
    return this.entries.delete(key);
  }

  public size(): number {
    return this.entries.size;
  }

  public getHitCount(): number {
    return this.hitCount;
  }

  public getMissCount(): number {
    return this.missCount;
  }

  public getHitRate(): number {
    const total = this.hitCount + this.missCount;
    return total === 0 ? 0 : this.hitCount / total;
  }

  public getHistory(): Array<LoadHistoryRecord> {
    return [...this.history];
  }

  public clear(): void {
    this.entries.clear();
    this.history = [];
    this.hitCount = 0;
    this.missCount = 0;
  }
}

export default function resourceLoaderValidationSuite(): void {
  describe('ResourceLoaderValidation_Suite', () => {
    let driver: Driver;
    let strings: AppStringResources;
    let cache: ResourceCache;

    beforeAll(async () => {
      driver = getDriver();
      strings = new AppStringResources();
      cache = new ResourceCache();
      Log.info(TAG, 'suite start');
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      cache.clear();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      Log.info(TAG, 'suite end');
    });

    it('resource_type_enum_should_be_defined_correctly', 0, async () => {
      expect(ResourceType.STRING).assertEqual('string');
      expect(ResourceType.MEDIA).assertEqual('media');
      expect(ResourceType.COLOR).assertEqual('color');
      expect(ResourceType.FLOAT).assertEqual('float');
      expect(ResourceType.BOOLEAN).assertEqual('boolean');
    });

    it('app_string_table_should_expose_seven_entries', 0, async () => {
      expect(strings.count()).assertEqual(7);
      expect(strings.keys().length).assertEqual(7);
      expect(strings.has(AppStringResources.KEY_TIP)).assertTrue();
      expect(strings.has('missing_key')).assertFalse();
    });

    it('permission_option_strings_should_be_resolved', 0, async () => {
      expect(strings.get(AppStringResources.KEY_PERMANENT_TRUST)).assertEqual('Always allow');
      expect(strings.get(AppStringResources.KEY_ONLY_THIS_TIME)).assertEqual('Only this time');
      expect(strings.get(AppStringResources.KEY_TRUSTED_LIST)).assertEqual('Trusted devices');
      expect(strings.get('missing_key')).assertEqual('');
    });

    it('cancel_and_page_title_strings_should_be_resolved', 0, async () => {
      expect(strings.get(AppStringResources.KEY_CANCEL)).assertEqual('Cancel');
      expect(strings.get(AppStringResources.KEY_SETTINGS)).assertEqual('Projection settings');
      expect(strings.get(AppStringResources.KEY_MIRACAST)).assertEqual('Screen casting');
    });

    it('resource_id_lookup_should_strip_prefix', 0, async () => {
      expect(strings.resolveById('app.string.tip')).assertEqual('Allow this device to cast to the TV');
      expect(strings.resolveById('app.string.cancel')).assertEqual('Cancel');
      expect(strings.resolveById('app.media.tip')).assertEqual('');
      expect(strings.resolveById('tip')).assertEqual('');
    });

    it('string_metrics_should_be_computed', 0, async () => {
      const total: number = strings.totalCharCount();
      expect(total).assertLarger(0);
      expect(total >= strings.get(AppStringResources.KEY_TIP).length).assertTrue();
      expect(strings.resolveById('app.string.miracast_screen_casting')).assertEqual('Screen casting');
    });

    it('string_table_mutation_should_work', 0, async () => {
      const local = new AppStringResources();
      expect(local.remove(AppStringResources.KEY_TIP)).assertTrue();
      expect(local.count()).assertEqual(6);
      expect(local.remove(AppStringResources.KEY_TIP)).assertFalse();
      local.clear();
      expect(local.count()).assertEqual(0);
      expect(strings.count()).assertEqual(7);
    });

    it('string_key_validator_should_accept_app_string_ids', 0, async () => {
      const validator = new ResourceKeyValidator();
      expect(validator.isAppStringKey('app.string.tip')).assertTrue();
      expect(validator.isAppStringKey('app.string.')).assertFalse();
      expect(validator.isAppStringKey('app.media.icon')).assertFalse();
      expect(validator.isAppMediaKey('app.media.icon')).assertTrue();
      expect(validator.isAppMediaKey('app.string.tip')).assertFalse();
    });

    it('snake_case_validator_should_reject_uppercase_and_spaces', 0, async () => {
      const validator = new ResourceKeyValidator();
      expect(validator.isSnakeCase('permanent_trust')).assertTrue();
      expect(validator.isSnakeCase('perm2_trust')).assertTrue();
      expect(validator.isSnakeCase('Permanent_Trust')).assertFalse();
      expect(validator.isSnakeCase('permanent trust')).assertFalse();
      expect(validator.isSnakeCase('')).assertFalse();
    });

    it('resource_key_validator_should_reject_whitespace_in_keys', 0, async () => {
      const validator = new ResourceKeyValidator();
      expect(validator.hasNoWhitespace('projection_Settings')).assertTrue();
      expect(validator.hasNoWhitespace('projection Settings')).assertFalse();
      expect(validator.hasNoWhitespace('tip\tkey')).assertFalse();
      expect(validator.stripPrefix('app.string.tip')).assertEqual('tip');
      expect(validator.stripPrefix('app.media.index_switch_on')).assertEqual('index_switch_on');
      expect(validator.stripPrefix('tip')).assertEqual('');
    });

    it('cache_should_start_empty', 0, async () => {
      const local = new ResourceCache();
      expect(local.size()).assertEqual(0);
      expect(local.get('missing')).assertNull();
      expect(local.has('missing')).assertFalse();
      expect(local.getHitRate()).assertEqual(0);
      expect(local.getHistory().length).assertEqual(0);
    });

    it('cache_should_track_miss_then_hit', 0, async () => {
      const local = new ResourceCache();
      expect(local.load('media_index_switch_on', ResourceType.MEDIA, '$media:switch', 120)).assertTrue();
      expect(local.getMissCount()).assertEqual(1);
      expect(local.getHitCount()).assertEqual(0);
      expect(local.load('media_index_switch_on', ResourceType.MEDIA, '$media:switch', 120)).assertTrue();
      expect(local.getMissCount()).assertEqual(1);
      expect(local.getHitCount()).assertEqual(1);
      expect(local.size()).assertEqual(1);
    });

    it('cache_hit_rate_should_be_accurate', 0, async () => {
      const local = new ResourceCache();
      local.load('a', ResourceType.STRING, 'A', 10);
      local.load('b', ResourceType.STRING, 'B', 20);
      local.load('a', ResourceType.STRING, 'A', 10);
      expect(local.getHitRate()).assertEqual(1 / 3);
      local.load('a', ResourceType.STRING, 'A', 10);
      expect(local.getHitRate()).assertEqual(0.5);
    });

    it('cache_entry_should_expose_all_fields', 0, async () => {
      const local = new ResourceCache();
      local.load('media_trust_device_icon', ResourceType.MEDIA, '$media:trust', 64);
      const entry = local.get('media_trust_device_icon');
      expect(entry === null).assertFalse();
      if (entry !== null) {
        expect(entry.key).assertEqual('media_trust_device_icon');
        expect(entry.type).assertEqual(ResourceType.MEDIA);
        expect(entry.value).assertEqual('$media:trust');
        expect(entry.size).assertEqual(64);
        expect(entry.loadedAt > 0).assertTrue();
      }
    });

    it('cache_should_enforce_size_limit_with_eviction', 0, async () => {
      const local = new ResourceCache();
      local.setLimit(2);
      expect(local.getLimit()).assertEqual(2);
      local.load('first', ResourceType.STRING, '1', 10);
      local.load('second', ResourceType.STRING, '2', 10);
      local.load('third', ResourceType.STRING, '3', 10);
      expect(local.size()).assertEqual(2);
      expect(local.has('first')).assertFalse();
      expect(local.has('third')).assertTrue();
    });

    it('cache_limit_boundary_should_be_normalized', 0, async () => {
      const local = new ResourceCache();
      local.setLimit(0);
      expect(local.getLimit()).assertEqual(1);
      local.setLimit(-4);
      expect(local.getLimit()).assertEqual(1);
      local.load('only', ResourceType.STRING, 'x', 0);
      const only = local.get('only');
      expect(only === null).assertFalse();
      if (only !== null) {
        expect(only.size).assertEqual(0);
      }
    });

    it('cache_should_remove_entries', 0, async () => {
      const local = new ResourceCache();
      local.load('tip', ResourceType.STRING, 'Allow', 5);
      expect(local.remove('tip')).assertTrue();
      expect(local.remove('tip')).assertFalse();
      expect(local.size()).assertEqual(0);
      expect(local.has('tip')).assertFalse();
    });

    it('cache_should_clear_all_state', 0, async () => {
      const local = new ResourceCache();
      local.load('tip', ResourceType.STRING, 'Allow', 5);
      local.load('tip', ResourceType.STRING, 'Allow', 5);
      expect(local.getHitCount()).assertEqual(1);
      local.clear();
      expect(local.size()).assertEqual(0);
      expect(local.getHitRate()).assertEqual(0);
      expect(local.getHistory().length).assertEqual(0);
      expect(local.getHitCount()).assertEqual(0);
      expect(local.getMissCount()).assertEqual(0);
    });

    it('cache_history_should_record_every_load', 0, async () => {
      const local = new ResourceCache();
      local.load('a', ResourceType.STRING, 'A', 1);
      local.load('b', ResourceType.MEDIA, '$media:b', 2);
      local.load('a', ResourceType.STRING, 'A', 1);
      const history = local.getHistory();
      expect(history.length).assertEqual(3);
      expect(history[0].hit).assertFalse();
      expect(history[2].hit).assertTrue();
      expect(history[1].key).assertEqual('b');
      expect(history[2].timestamp >= history[0].timestamp).assertTrue();
    });

    it('cache_should_reload_after_clear', 0, async () => {
      const local = new ResourceCache();
      local.load('tip', ResourceType.STRING, 'Allow', 5);
      local.clear();
      expect(local.load('tip', ResourceType.STRING, 'Allow', 5)).assertTrue();
      expect(local.size()).assertEqual(1);
      expect(local.getMissCount()).assertEqual(1);
      const reloaded = local.get('tip');
      expect(reloaded === null).assertFalse();
      if (reloaded !== null) {
        expect(reloaded.value).assertEqual('Allow');
      }
    });

    it('cache_loading_performance_should_meet_requirements', 0, async () => {
      const local = new ResourceCache();
      local.setLimit(200);
      const startedAt: number = Date.now();
      for (let i: number = 0; i < 200; i++) {
        local.load('key_' + String(i), ResourceType.STRING, 'value', 10);
        local.get('key_' + String(i));
      }
      expect(Date.now() - startedAt).assertLessOrEqual(5000);
      expect(local.size()).assertEqual(200);
      expect(local.getHistory().length).assertEqual(200);
    });

    it('cache_history_get_should_return_copy', 0, async () => {
      const local = new ResourceCache();
      local.load('tip', ResourceType.STRING, 'Allow', 5);
      const history = local.getHistory();
      history.push({ key: 'fake', hit: true, timestamp: 0 });
      expect(local.getHistory().length).assertEqual(1);
    });


    it('device_resource_lookup_should_not_throw', 0, async () => {
      const validator = new ResourceKeyValidator();
      const ids: Array<string> = ['app.string.tip', 'app.media.icon', 'bad.id', ''];
      for (let i: number = 0; i < ids.length; i++) {
        const resolved: string = strings.resolveById(ids[i]);
        expect(resolved.length >= 0).assertTrue();
        expect(validator.stripPrefix(ids[i]).length >= 0).assertTrue();
      }
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
    });

    it('comprehensive_resource_scenario_should_complete', 0, async () => {
      const local = new ResourceCache();
      local.setLimit(4);
      const validator = new ResourceKeyValidator();
      expect(validator.isAppStringKey('app.string.' + AppStringResources.KEY_TIP)).assertTrue();
      expect(validator.stripPrefix('app.media.index_switch_off')).assertEqual('index_switch_off');
      for (let i: number = 0; i < 6; i++) {
        local.load('key_' + String(i), ResourceType.STRING, strings.get(AppStringResources.KEY_TIP), 4);
      }
      expect(local.size()).assertEqual(4);
      expect(local.getHistory().length).assertEqual(6);
      expect(local.getHitRate()).assertEqual(0);
      expect(strings.count()).assertEqual(7);
      local.clear();
      expect(local.size()).assertEqual(0);
    });
  });
}
