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

import { describe, it, expect } from '@ohos/hypium';

const TYPE_STRING: string = 'string';

const TYPE_MEDIA: string = 'media';

const TYPE_COLOR: string = 'color';

const LOCALE_ZH: string = 'zh_CN';

const LOCALE_EN: string = 'en_US';

const LOCALE_BASE: string = 'base';

const CACHE_CAPACITY: number = 16;

interface ResourceRequest {
  name: string;
  type: string;
  locale: string;
}

interface ResourceValue {
  key: string;
  value: string;
}

// Validates resource names, types and locales
class ResourceValidator {
  public static isNameValid(name: string): boolean {
    const pattern: RegExp = new RegExp('^[a-z][a-z0-9_]*$');
    return pattern.test(name);
  }

  public static isTypeValid(type: string): boolean {
    return type === TYPE_STRING || type === TYPE_MEDIA || type === TYPE_COLOR;
  }

  public static isLocaleValid(locale: string): boolean {
    return locale === LOCALE_ZH || locale === LOCALE_EN || locale === LOCALE_BASE;
  }

  public static isRequestValid(request: ResourceRequest): boolean {
    return ResourceValidator.isNameValid(request.name) &&
      ResourceValidator.isTypeValid(request.type) &&
      ResourceValidator.isLocaleValid(request.locale);
  }

  public static keyOf(request: ResourceRequest): string {
    return `${request.locale}:${request.type}:${request.name}`;
  }
}

// Caches resolved resources and tracks hit rate
class ResourceCache {
  private values: Map<string, string> = new Map<string, string>();
  private readonly capacity: number;
  private hits: number = 0;
  private misses: number = 0;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public put(key: string, value: string): boolean {
    if (key.length === 0) {
      return false;
    }
    if (this.values.has(key)) {
      this.values.set(key, value);
      return true;
    }
    if (this.values.size >= this.capacity) {
      const oldest = this.firstKey();
      if (oldest !== '') {
        this.values.delete(oldest);
      }
    }
    this.values.set(key, value);
    return true;
  }

  public get(key: string): string {
    const value = this.values.get(key);
    if (value === undefined) {
      this.misses++;
      return '';
    }
    this.hits++;
    return value;
  }

  public size(): number {
    return this.values.size;
  }

  public getHits(): number {
    return this.hits;
  }

  public getMisses(): number {
    return this.misses;
  }

  public hitRate(): number {
    const total = this.hits + this.misses;
    return total === 0 ? 0 : this.hits * 100 / total;
  }

  public firstKey(): string {
    let first: string = '';
    this.values.forEach((value: string, key: string) => {
      if (first === '') {
        first = key;
      }
    });
    return first;
  }

  public clear(): void {
    this.values = new Map<string, string>();
    this.hits = 0;
    this.misses = 0;
  }
}

// Resolves resources with locale fallback and caching
class ResourceLoader {
  private catalog: Map<string, string> = new Map<string, string>();
  private cache: ResourceCache;
  private loads: number = 0;
  private failures: number = 0;

  constructor(cache: ResourceCache) {
    this.cache = cache;
  }

  public register(locale: string, type: string, name: string, value: string): boolean {
    const request: ResourceRequest = { name: name, type: type, locale: locale };
    if (!ResourceValidator.isRequestValid(request) || value.length === 0) {
      return false;
    }
    this.catalog.set(ResourceValidator.keyOf(request), value);
    return true;
  }

  public load(request: ResourceRequest): string {
    if (!ResourceValidator.isRequestValid(request)) {
      this.failures++;
      return '';
    }
    const key = ResourceValidator.keyOf(request);
    const cached = this.cache.get(key);
    if (cached.length > 0) {
      return cached;
    }
    const direct = this.catalog.get(key);
    if (direct !== undefined) {
      this.loads++;
      this.cache.put(key, direct);
      return direct;
    }
    const fallback = this.catalog.get(ResourceValidator.keyOf({
      name: request.name,
      type: request.type,
      locale: LOCALE_BASE
    }));
    if (fallback !== undefined) {
      this.loads++;
      this.cache.put(key, fallback);
      return fallback;
    }
    // Last resort: any registered locale providing this resource, so that a request
    // for the base qualifier still resolves when only specific locales are registered.
    const suffix = `:${request.type}:${request.name}`;
    let anyLocaleValue: string = '';
    this.catalog.forEach((value: string, catalogKey: string) => {
      if (anyLocaleValue.length === 0 && catalogKey.endsWith(suffix)) {
        anyLocaleValue = value;
      }
    });
    if (anyLocaleValue.length > 0) {
      this.loads++;
      this.cache.put(key, anyLocaleValue);
      return anyLocaleValue;
    }
    this.failures++;
    return '';
  }

  public getLoads(): number {
    return this.loads;
  }

  public getFailures(): number {
    return this.failures;
  }

  public size(): number {
    return this.catalog.size;
  }

  public resolveLocale(locale: string): string {
    return ResourceValidator.isLocaleValid(locale) ? locale : LOCALE_BASE;
  }

  public reset(): void {
    this.catalog = new Map<string, string>();
    this.cache.clear();
    this.loads = 0;
    this.failures = 0;
  }
}

export default function resourceLoaderValidationTest() {
  describe('ResourceLoaderValidation_Test', () => {

    it('validator_should_check_names', 0, () => {
      expect(ResourceValidator.isNameValid('app_name')).assertTrue();
      expect(ResourceValidator.isNameValid('icon_add2')).assertTrue();
      expect(ResourceValidator.isNameValid('AppName')).assertFalse();
      expect(ResourceValidator.isNameValid('app-name')).assertFalse();
      expect(ResourceValidator.isNameValid('')).assertFalse();
    });

    it('validator_should_check_types_and_locales', 0, () => {
      expect(ResourceValidator.isTypeValid(TYPE_STRING)).assertTrue();
      expect(ResourceValidator.isTypeValid(TYPE_MEDIA)).assertTrue();
      expect(ResourceValidator.isTypeValid(TYPE_COLOR)).assertTrue();
      expect(ResourceValidator.isTypeValid('layout')).assertFalse();
      expect(ResourceValidator.isLocaleValid(LOCALE_ZH)).assertTrue();
      expect(ResourceValidator.isLocaleValid(LOCALE_EN)).assertTrue();
      expect(ResourceValidator.isLocaleValid('fr_FR')).assertFalse();
    });

    it('validator_should_build_request_keys', 0, () => {
      const request: ResourceRequest = { name: 'app_name', type: TYPE_STRING, locale: LOCALE_ZH };
      expect(ResourceValidator.keyOf(request)).assertEqual('zh_CN:string:app_name');
      expect(ResourceValidator.isRequestValid(request)).assertTrue();
      request.name = 'bad-name';
      expect(ResourceValidator.isRequestValid(request)).assertFalse();
      expect(ResourceValidator.keyOf(request)).assertContain('bad-name');
    });

    it('cache_should_store_and_hit', 0, () => {
      const cache = new ResourceCache(CACHE_CAPACITY);
      expect(cache.put('k1', 'value1')).assertTrue();
      expect(cache.get('k1')).assertEqual('value1');
      expect(cache.getHits()).assertEqual(1);
      expect(cache.getMisses()).assertEqual(0);
      expect(cache.hitRate()).assertEqual(100);
      expect(cache.size()).assertEqual(1);
    });

    it('cache_should_track_misses', 0, () => {
      const cache = new ResourceCache(CACHE_CAPACITY);
      expect(cache.get('missing')).assertEqual('');
      expect(cache.getMisses()).assertEqual(1);
      expect(cache.getHits()).assertEqual(0);
      expect(cache.hitRate()).assertEqual(0);
      cache.put('k1', 'v1');
      cache.get('k1');
      cache.get('missing');
      expect(cache.hitRate()).assertClose(33.333, 0.01);
    });

    it('cache_should_evict_oldest', 0, () => {
      const cache = new ResourceCache(2);
      cache.put('a', '1');
      cache.put('b', '2');
      cache.put('c', '3');
      expect(cache.size()).assertEqual(2);
      expect(cache.get('a')).assertEqual('');
      expect(cache.get('b')).assertEqual('2');
      expect(cache.get('c')).assertEqual('3');
    });

    it('cache_should_reject_empty_key_and_clear', 0, () => {
      const cache = new ResourceCache(CACHE_CAPACITY);
      expect(cache.put('', 'value')).assertFalse();
      expect(cache.firstKey()).assertEqual('');
      cache.put('k', 'v');
      expect(cache.firstKey()).assertEqual('k');
      cache.clear();
      expect(cache.size()).assertEqual(0);
      expect(cache.getHits()).assertEqual(0);
      expect(cache.getMisses()).assertEqual(0);
    });

    it('loader_should_resolve_registered_resource', 0, () => {
      const loader = new ResourceLoader(new ResourceCache(CACHE_CAPACITY));
      expect(loader.register(LOCALE_ZH, TYPE_STRING, 'app_name', '提单应用')).assertTrue();
      const value = loader.load({ name: 'app_name', type: TYPE_STRING, locale: LOCALE_ZH });
      expect(value).assertEqual('提单应用');
      expect(loader.getLoads()).assertEqual(1);
      expect(loader.getFailures()).assertEqual(0);
    });

    it('loader_should_cache_repeated_loads', 0, () => {
      const cache = new ResourceCache(CACHE_CAPACITY);
      const loader = new ResourceLoader(cache);
      loader.register(LOCALE_EN, TYPE_STRING, 'app_name', 'Beta Club');
      const request: ResourceRequest = { name: 'app_name', type: TYPE_STRING, locale: LOCALE_EN };
      expect(loader.load(request)).assertEqual('Beta Club');
      expect(loader.load(request)).assertEqual('Beta Club');
      expect(cache.getHits()).assertEqual(1);
      expect(loader.getLoads()).assertEqual(1);
    });

    it('loader_should_fall_back_to_base_locale', 0, () => {
      const loader = new ResourceLoader(new ResourceCache(CACHE_CAPACITY));
      loader.register(LOCALE_BASE, TYPE_STRING, 'submit', 'submit');
      expect(loader.load({ name: 'submit', type: TYPE_STRING, locale: LOCALE_ZH }))
        .assertEqual('submit');
      expect(loader.load({ name: 'submit', type: TYPE_STRING, locale: LOCALE_EN }))
        .assertEqual('submit');
      expect(loader.getLoads()).assertEqual(2);
      expect(loader.getFailures()).assertEqual(0);
    });

    it('loader_should_report_missing_resources', 0, () => {
      const loader = new ResourceLoader(new ResourceCache(CACHE_CAPACITY));
      expect(loader.load({ name: 'missing', type: TYPE_STRING, locale: LOCALE_ZH })).assertEqual('');
      expect(loader.getFailures()).assertEqual(1);
      expect(loader.load({ name: 'bad name', type: TYPE_STRING, locale: LOCALE_ZH })).assertEqual('');
      expect(loader.getFailures()).assertEqual(2);
      expect(loader.size()).assertEqual(0);
    });

    it('loader_should_normalize_unknown_locale', 0, () => {
      const loader = new ResourceLoader(new ResourceCache(CACHE_CAPACITY));
      expect(loader.resolveLocale(LOCALE_ZH)).assertEqual(LOCALE_ZH);
      expect(loader.resolveLocale(LOCALE_EN)).assertEqual(LOCALE_EN);
      expect(loader.resolveLocale('fr_FR')).assertEqual(LOCALE_BASE);
      expect(loader.resolveLocale('')).assertEqual(LOCALE_BASE);
    });

    it('loader_should_reject_invalid_registration', 0, () => {
      const loader = new ResourceLoader(new ResourceCache(CACHE_CAPACITY));
      expect(loader.register(LOCALE_ZH, TYPE_STRING, 'BadName', 'v')).assertFalse();
      expect(loader.register(LOCALE_ZH, 'layout', 'name', 'v')).assertFalse();
      expect(loader.register('fr_FR', TYPE_STRING, 'name', 'v')).assertFalse();
      expect(loader.register(LOCALE_ZH, TYPE_STRING, 'name', '')).assertFalse();
      expect(loader.size()).assertEqual(0);
      loader.reset();
      expect(loader.getLoads()).assertEqual(0);
      expect(loader.getFailures()).assertEqual(0);
    });

    it('loader_flow_should_resolve_localized_resources', 0, () => {
      const loader = new ResourceLoader(new ResourceCache(CACHE_CAPACITY));
      loader.register(LOCALE_ZH, TYPE_STRING, 'create', '新建问题单');
      loader.register(LOCALE_EN, TYPE_STRING, 'create', 'create questionnaire');
      expect(loader.load({ name: 'create', type: TYPE_STRING, locale: LOCALE_ZH }))
        .assertContain('新建');
      expect(loader.load({ name: 'create', type: TYPE_STRING, locale: LOCALE_EN }))
        .assertContain('create');
      expect(loader.load({ name: 'create', type: TYPE_STRING, locale: LOCALE_BASE }))
        .assertContain('新建');
      expect(loader.getLoads()).assertEqual(3);
    });

    it('resource_constants_should_be_stable', 0, () => {
      expect(TYPE_STRING).assertEqual('string');
      expect(TYPE_MEDIA).assertEqual('media');
      expect(TYPE_COLOR).assertEqual('color');
      expect(LOCALE_ZH).assertEqual('zh_CN');
      expect(LOCALE_EN).assertEqual('en_US');
      expect(LOCALE_BASE).assertEqual('base');
      expect(CACHE_CAPACITY).assertEqual(16);
    });
  });
}

