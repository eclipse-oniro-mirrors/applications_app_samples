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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { BluetoothConstants } from '../../constants/BluetoothConstants';

const TAG: string = BluetoothConstants.TAG;
const DOMAIN: number = BluetoothConstants.DOMAIN;

/**
 * storage utility class
 * provides memory cache manage manage function
 */
export class StorageUtils {
  /** internal cache storage */
  private static cache: Map<string, CacheEntry> = new Map();
  /** max cache entry number */
  private static readonly MAX_CACHE_SIZE: number = 200;
  /** default cache expiration time interval (ms) */
  private static readonly DEFAULT_TTL: number = 300000;

  /**
   * cache entry interface
   */
  private static createEntry(key: string, value: unknown, ttl: number): CacheEntry {
    return {
      key: key,
      value: value,
      createdAt: Date.now(),
      expiresAt: Date.now() + ttl,
      accessCount: 0,
      lastAccessed: Date.now()
    };
  }

  /**
   * store value to cache
   * @param key - key name
   * @param value - value
   * @param ttl - expiration time interval (ms)
   */
  static put(key: string, value: unknown, ttl: number = StorageUtils.DEFAULT_TTL): void {
    hilog.debug(DOMAIN, TAG, 'StorageUtils put: key=%{public}s', key);
    if (StorageUtils.cache.size >= StorageUtils.MAX_CACHE_SIZE) {
      StorageUtils.evict();
    }
    StorageUtils.cache.set(key, StorageUtils.createEntry(key, value, ttl));
  }

  /**
   * get value from cache
   * @param key - key name
   * @returns cached value, expiration or not store at return null
   */
  static get<T>(key: string): T | null {
    const entry: CacheEntry | undefined = StorageUtils.cache.get(key);
    if (!entry) {
      return null;
    }
    if (Date.now() > entry.expiresAt) {
      StorageUtils.cache.delete(key);
      return null;
    }
    entry.accessCount += 1;
    entry.lastAccessed = Date.now();
    return entry.value as T;
  }

  /**
   * check whether the key exists and is not expired
   * @param key - key name
   * @returns whether store at
   */
  static has(key: string): boolean {
    const entry: CacheEntry | undefined = StorageUtils.cache.get(key);
    if (!entry) {
      return false;
    }
    if (Date.now() > entry.expiresAt) {
      StorageUtils.cache.delete(key);
      return false;
    }
    return true;
  }

  /**
   * delete cache entry
   * @param key - key name
   */
  static remove(key: string): void {
    hilog.debug(DOMAIN, TAG, 'StorageUtils remove: key=%{public}s', key);
    StorageUtils.cache.delete(key);
  }

  /**
   * clear all cache
   */
  static clear(): void {
    hilog.info(DOMAIN, TAG, 'StorageUtils clear: clearing %{public}d entries', StorageUtils.cache.size);
    StorageUtils.cache.clear();
  }

  /**
   * get cache size
   * @returns cache entry number
   */
  static size(): number {
    return StorageUtils.cache.size;
  }

  /**
   * clean expired entries
   */
  static cleanExpired(): void {
    const now: number = Date.now();
    const keysToRemove: string[] = [];
    StorageUtils.cache.forEach((entry: CacheEntry, key: string) => {
      if (now > entry.expiresAt) {
        keysToRemove.push(key);
      }
    });
    for (const key of keysToRemove) {
      StorageUtils.cache.delete(key);
    }
    if (keysToRemove.length > 0) {
      hilog.info(DOMAIN, TAG, 'StorageUtils cleanExpired: removed %{public}d entries', keysToRemove.length);
    }
  }

  /**
   * evict least used cache entry
   */
  private static evict(): void {
    hilog.debug(DOMAIN, TAG, 'StorageUtils evict: evicting least used entries');
    let minAccess: number = Number.MAX_VALUE;
    let minKey: string = '';
    StorageUtils.cache.forEach((entry: CacheEntry, key: string) => {
      if (entry.accessCount < minAccess) {
        minAccess = entry.accessCount;
        minKey = key;
      }
    });
    if (minKey) {
      StorageUtils.cache.delete(minKey);
    }
  }

  /**
   * get all cache keys
   * @returns key array
   */
  static keys(): string[] {
    return Array.from(StorageUtils.cache.keys());
  }

  /**
   * get cache stats
   * @returns statistics against object
   */
  static getStats(): CacheStats {
    let totalAccess: number = 0;
    let expiredCount: number = 0;
    const now: number = Date.now();
    StorageUtils.cache.forEach((entry: CacheEntry) => {
      totalAccess += entry.accessCount;
      if (now > entry.expiresAt) {
        expiredCount++;
      }
    });
    return {
      totalEntries: StorageUtils.cache.size,
      totalAccessCount: totalAccess,
      expiredEntries: expiredCount,
      maxSize: StorageUtils.MAX_CACHE_SIZE
    };
  }
}

/**
 * cache entry interface
 */
interface CacheEntry {
  key: string;
  value: unknown;
  createdAt: number;
  expiresAt: number;
  accessCount: number;
  lastAccessed: number;
}

/**
 * cache stats interface
 */
interface CacheStats {
  totalEntries: number;
  totalAccessCount: number;
  expiredEntries: number;
  maxSize: number;
}
