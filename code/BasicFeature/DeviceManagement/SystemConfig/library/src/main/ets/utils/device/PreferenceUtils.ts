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
import { SystemConfigConstants } from '../../constants/SystemConfigConstants';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

// ========================================
// 偏好设置变更监听接口
// ========================================

/**
 * 偏好设置变更监听接口。
 * 定义监听偏好设置数据变化时的回调方法。
 */
export interface PreferenceChangeListener {
  /**
   * 当某个键的值发生变化时回调。
   * @param {string} key - 发生变化的键
   * @param {string | null} oldValue - 变化前的值
   * @param {string | null} newValue - 变化后的值
   */
  onChanged(key: string, oldValue: string | null, newValue: string | null): void;

  /**
   * 当所有数据被清除时回调。
   */
  onCleared(): void;
}

// ========================================
// 偏好设置存储工具类
// ========================================

/**
 * 偏好设置存储工具类。
 * 模拟 Preferences 数据持久化能力，
 * 提供键值对的存取、删除、清空操作，
 * 并支持注册变更监听器以响应数据变化。
 */
export class PreferenceUtils {
  /** 存储名称标识 */
  private storeName: string;
  /** 内部键值存储 */
  private storage: Map<string, string>;
  /** 变更监听器列表 */
  private listeners: PreferenceChangeListener[];
  /** 是否已初始化 */
  private initialized: boolean;

  /**
   * 创建偏好设置存储实例。
   * @param {string} storeName - 存储名称标识
   */
  constructor(storeName: string) {
    hilog.info(DOMAIN, TAG, 'PreferenceUtils constructor: storeName=%{public}s', storeName);
    this.storeName = storeName;
    this.storage = new Map<string, string>();
    this.listeners = [];
    this.initialized = true;
    hilog.info(DOMAIN, TAG, 'PreferenceUtils constructor: initialization complete');
  }

  // ========================================
  // 基础存取方法
  // ========================================

  /**
   * 获取指定键的值。
   * 从存储中查找键对应的值，不存在时返回 null。
   * @param {string} key - 要获取的键名
   * @returns {string | null} 键对应的值，不存在返回 null
   */
  get(key: string): string | null {
    hilog.debug(DOMAIN, TAG, 'PreferenceUtils get: store=%{public}s, key=%{public}s', this.storeName, key);
    if (!this.initialized) {
      hilog.error(DOMAIN, TAG, 'PreferenceUtils get: store not initialized');
      return null;
    }
    const value: string | undefined = this.storage.get(key);
    const result: string | null = value !== undefined ? value : null;
    hilog.debug(DOMAIN, TAG, 'PreferenceUtils get: key=%{public}s, found=%{public}s',
      key, (result !== null).toString());
    return result;
  }

  /**
   * 获取指定键的值，不存在时返回默认值。
   * @param {string} key - 要获取的键名
   * @param {string} defaultVal - 键不存在时的默认值
   * @returns {string} 键对应的值或默认值
   */
  getWithDefault(key: string, defaultVal: string): string {
    hilog.debug(DOMAIN, TAG, 'PreferenceUtils getWithDefault: store=%{public}s, key=%{public}s', this.storeName, key);
    const value: string | null = this.get(key);
    const result: string = value !== null ? value : defaultVal;
    hilog.debug(DOMAIN, TAG, 'PreferenceUtils getWithDefault: result=%{public}s', result);
    return result;
  }

  /**
   * 设置键值对。
   * 将指定键设置为给定值，若键已存在则覆盖，并通知所有注册的监听器。
   * @param {string} key - 要设置的键名
   * @param {string} value - 要设置的值
   */
  set(key: string, value: string): void {
    hilog.info(DOMAIN, TAG, 'PreferenceUtils set: store=%{public}s, key=%{public}s', this.storeName, key);
    if (!this.initialized) {
      hilog.error(DOMAIN, TAG, 'PreferenceUtils set: store not initialized');
      return;
    }
    const oldValue: string | null = this.get(key);
    this.storage.set(key, value);
    this.notifyListeners(key, oldValue, value);
  }

  /**
   * 删除指定键及其值。
   * @param {string} key - 要删除的键名
   */
  remove(key: string): void {
    hilog.info(DOMAIN, TAG, 'PreferenceUtils remove: store=%{public}s, key=%{public}s', this.storeName, key);
    if (!this.initialized) {
      hilog.error(DOMAIN, TAG, 'PreferenceUtils remove: store not initialized');
      return;
    }
    const oldValue: string | null = this.get(key);
    this.storage.delete(key);
    hilog.info(DOMAIN, TAG, 'PreferenceUtils remove: key=%{public}s removed', key);
    this.notifyListeners(key, oldValue, null);
  }

  /**
   * 清空所有存储数据。
   * 删除存储中的所有键值对，并通知监听器数据已清除。
   */
  clear(): void {
    hilog.info(DOMAIN, TAG, 'PreferenceUtils clear: store=%{public}s, entries=%{public}d',
      this.storeName, this.storage.size);
    if (!this.initialized) {
      hilog.error(DOMAIN, TAG, 'PreferenceUtils clear: store not initialized');
      return;
    }
    this.storage.clear();
    this.notifyCleared();
    hilog.info(DOMAIN, TAG, 'PreferenceUtils clear: all entries cleared');
  }

  // ========================================
  // 查询方法
  // ========================================

  /**
   * 判断指定键是否存在。
   * @param {string} key - 要检查的键名
   * @returns {boolean} 键是否存在
   */
  has(key: string): boolean {
    const result: boolean = this.storage.has(key);
    hilog.debug(DOMAIN, TAG, 'PreferenceUtils has: store=%{public}s, key=%{public}s, result=%{public}s',
      this.storeName, key, result.toString());
    return result;
  }

  /**
   * 获取所有存储的键名列表。
   * @returns {string[]} 所有键名组成的数组
   */
  keys(): string[] {
    const keyArray: string[] = Array.from(this.storage.keys());
    hilog.debug(DOMAIN, TAG, 'PreferenceUtils keys: store=%{public}s, count=%{public}d',
      this.storeName, keyArray.length);
    return keyArray;
  }

  /**
   * 获取所有存储的键值对。
   * 返回内部存储的副本，防止外部直接修改。
   * @returns {Map<string, string>} 所有键值对的 Map 副本
   */
  getAll(): Map<string, string> {
    hilog.debug(DOMAIN, TAG, 'PreferenceUtils getAll: store=%{public}s, size=%{public}d',
      this.storeName, this.storage.size);
    return new Map<string, string>(this.storage);
  }

  /**
   * 获取当前存储条目数量。
   * @returns {number} 存储条目数
   */
  size(): number {
    const count: number = this.storage.size;
    hilog.debug(DOMAIN, TAG, 'PreferenceUtils size: store=%{public}s, count=%{public}d', this.storeName, count);
    return count;
  }

  /**
   * 获取存储名称。
   * @returns {string} 存储名称标识
   */
  getStoreName(): string {
    return this.storeName;
  }

  // ========================================
  // 监听器管理方法
  // ========================================

  /**
   * 添加偏好设置变更监听器。
   * @param {PreferenceChangeListener} listener - 要添加的监听器
   */
  addListener(listener: PreferenceChangeListener): void {
    hilog.info(DOMAIN, TAG, 'PreferenceUtils addListener: store=%{public}s, adding listener', this.storeName);
    const existingIndex: number = this.listeners.indexOf(listener);
    if (existingIndex >= 0) {
      hilog.warn(DOMAIN, TAG, 'PreferenceUtils addListener: listener already registered');
      return;
    }
    this.listeners.push(listener);
    hilog.info(DOMAIN, TAG, 'PreferenceUtils addListener: total listeners=%{public}d', this.listeners.length);
  }

  /**
   * 移除偏好设置变更监听器。
   * @param {PreferenceChangeListener} listener - 要移除的监听器
   */
  removeListener(listener: PreferenceChangeListener): void {
    hilog.info(DOMAIN, TAG, 'PreferenceUtils removeListener: store=%{public}s, removing listener', this.storeName);
    const index: number = this.listeners.indexOf(listener);
    if (index < 0) {
      hilog.warn(DOMAIN, TAG, 'PreferenceUtils removeListener: listener not found');
      return;
    }
    this.listeners.splice(index, 1);
    hilog.info(DOMAIN, TAG, 'PreferenceUtils removeListener: remaining listeners=%{public}d', this.listeners.length);
  }

  /**
   * 通知所有监听器某个键值发生了变化。
   * @param {string} key - 发生变化的键
   * @param {string | null} oldValue - 变化前的值
   * @param {string | null} newValue - 变化后的值
   */
  private notifyListeners(key: string, oldValue: string | null, newValue: string | null): void {
    hilog.debug(DOMAIN, TAG, 'PreferenceUtils notifyListeners: key=%{public}s, listenerCount=%{public}d',
      key, this.listeners.length);
    for (let i: number = 0; i < this.listeners.length; i++) {
      try {
        this.listeners[i].onChanged(key, oldValue, newValue);
      } catch (error) {
        hilog.error(DOMAIN, TAG, 'PreferenceUtils notifyListeners: listener %{public}d error', i);
      }
    }
  }

  /**
   * 通知所有监听器数据已被清除。
   */
  private notifyCleared(): void {
    hilog.debug(DOMAIN, TAG, 'PreferenceUtils notifyCleared: listenerCount=%{public}d', this.listeners.length);
    for (let i: number = 0; i < this.listeners.length; i++) {
      try {
        this.listeners[i].onCleared();
      } catch (error) {
        hilog.error(DOMAIN, TAG, 'PreferenceUtils notifyCleared: listener %{public}d error', i);
      }
    }
  }

  // ========================================
  // 生命周期方法
  // ========================================

  /**
   * 销毁存储实例。
   * 清除所有数据和监听器，释放资源。
   */
  destroy(): void {
    hilog.info(DOMAIN, TAG, 'PreferenceUtils destroy: store=%{public}s', this.storeName);
    this.storage.clear();
    this.listeners = [];
    this.initialized = false;
  }
}
