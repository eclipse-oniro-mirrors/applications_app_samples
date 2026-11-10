/*
 * Copyright (c) 2024 Hunan OpenValley Digital Industry Development Co., Ltd.
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
 * 存储工具类
 * 提供内存缓存管理功能
 */
export class StorageUtils {
  /** 内部缓存存储 */
  private static cache: Map<string, CacheEntry> = new Map();
  /** 最大缓存条目数 */
  private static readonly MAX_CACHE_SIZE: number = 200;
  /** 默认缓存过期时间（毫秒） */
  private static readonly DEFAULT_TTL: number = 300000;

  /**
   * 缓存条目接口
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
   * 存储值到缓存
   * @param key - 键名
   * @param value - 值
   * @param ttl - 过期时间（毫秒）
   */
  static put(key: string, value: unknown, ttl: number = StorageUtils.DEFAULT_TTL): void {
    hilog.debug(DOMAIN, TAG, 'StorageUtils put: key=%{public}s', key);
    if (StorageUtils.cache.size >= StorageUtils.MAX_CACHE_SIZE) {
      StorageUtils.evict();
    }
    StorageUtils.cache.set(key, StorageUtils.createEntry(key, value, ttl));
  }

  /**
   * 从缓存获取值
   * @param key - 键名
   * @returns 缓存的值，过期或不存在返回null
   */
  static get<T>(key: string): T | null {
    const entry: CacheEntry | undefined = StorageUtils.cache.get(key);
    if (!entry) return null;
    if (Date.now() > entry.expiresAt) {
      StorageUtils.cache.delete(key);
      return null;
    }
    entry.accessCount += 1;
    entry.lastAccessed = Date.now();
    return entry.value as T;
  }

  /**
   * 检查键是否存在且未过期
   * @param key - 键名
   * @returns 是否存在
   */
  static has(key: string): boolean {
    const entry: CacheEntry | undefined = StorageUtils.cache.get(key);
    if (!entry) return false;
    if (Date.now() > entry.expiresAt) {
      StorageUtils.cache.delete(key);
      return false;
    }
    return true;
  }

  /**
   * 删除缓存条目
   * @param key - 键名
   */
  static remove(key: string): void {
    hilog.debug(DOMAIN, TAG, 'StorageUtils remove: key=%{public}s', key);
    StorageUtils.cache.delete(key);
  }

  /**
   * 清空所有缓存
   */
  static clear(): void {
    hilog.info(DOMAIN, TAG, 'StorageUtils clear: clearing %{public}d entries', StorageUtils.cache.size);
    StorageUtils.cache.clear();
  }

  /**
   * 获取缓存大小
   * @returns 缓存条目数
   */
  static size(): number {
    return StorageUtils.cache.size;
  }

  /**
   * 清理过期条目
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
   * 淘汰最少使用的缓存条目
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
   * 获取所有缓存键名
   * @returns 键名数组
   */
  static keys(): string[] {
    return Array.from(StorageUtils.cache.keys());
  }

  /**
   * 获取缓存统计信息
   * @returns 统计信息对象
   */
  static getStats(): CacheStats {
    let totalAccess: number = 0;
    let expiredCount: number = 0;
    const now: number = Date.now();
    StorageUtils.cache.forEach((entry: CacheEntry) => {
      totalAccess += entry.accessCount;
      if (now > entry.expiresAt) expiredCount++;
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
 * 缓存条目接口
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
 * 缓存统计信息接口
 */
interface CacheStats {
  totalEntries: number;
  totalAccessCount: number;
  expiredEntries: number;
  maxSize: number;
}
