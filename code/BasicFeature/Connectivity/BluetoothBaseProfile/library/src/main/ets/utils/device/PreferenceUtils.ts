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
 * 偏好设置变更监听器接口
 */
export interface PreferenceChangeListener {
  /**
   * 当偏好值变更时回调
   * @param key - 变更的键名
   * @param value - 新的值
   */
  onChange(key: string, value: string | number | boolean): void;
}

/**
 * 偏好设置工具类
 * 提供轻量级的键值对持久化存储能力
 * 使用内存Map模拟Preference存储
 */
export class PreferenceUtils {
  /** 内部存储 */
  private static storage: Map<string, Map<string, string | number | boolean>> = new Map();
  /** 监听器列表 */
  private static listeners: PreferenceChangeListener[] = [];
  /** 默认存储名称 */
  private static readonly DEFAULT_STORE: string = 'bluetooth_prefs';

  /**
   * 初始化偏好存储
   * @param storeName - 存储名称
   */
  static initialize(storeName: string = PreferenceUtils.DEFAULT_STORE): void {
    hilog.info(DOMAIN, TAG, 'PreferenceUtils initialize: storeName=%{public}s', storeName);
    if (!PreferenceUtils.storage.has(storeName)) {
      PreferenceUtils.storage.set(storeName, new Map());
    }
  }

  /**
   * 获取存储实例
   * @param storeName - 存储名称
   * @returns Map实例
   */
  private static getStore(storeName: string): Map<string, string | number | boolean> {
    if (!PreferenceUtils.storage.has(storeName)) {
      PreferenceUtils.storage.set(storeName, new Map());
    }
    return PreferenceUtils.storage.get(storeName)!;
  }

  /**
   * 存储字符串值
   * @param key - 键名
   * @param value - 值
   * @param storeName - 存储名称
   */
  static putString(key: string, value: string, storeName: string = PreferenceUtils.DEFAULT_STORE): void {
    hilog.debug(DOMAIN, TAG, 'PreferenceUtils putString: key=%{public}s', key);
    const store: Map<string, string | number | boolean> = PreferenceUtils.getStore(storeName);
    store.set(key, value);
    PreferenceUtils.notifyListeners(key, value);
  }

  /**
   * 获取字符串值
   * @param key - 键名
   * @param defaultValue - 默认值
   * @param storeName - 存储名称
   * @returns 存储的字符串值
   */
  static getString(key: string, defaultValue: string = '', storeName: string = PreferenceUtils.DEFAULT_STORE): string {
    const store: Map<string, string | number | boolean> = PreferenceUtils.getStore(storeName);
    const value: string | number | boolean | undefined = store.get(key);
    if (value === undefined) {
      return defaultValue;
    }
    return String(value);
  }

  /**
   * 存储数值
   * @param key - 键名
   * @param value - 值
   * @param storeName - 存储名称
   */
  static putNumber(key: string, value: number, storeName: string = PreferenceUtils.DEFAULT_STORE): void {
    hilog.debug(DOMAIN, TAG, 'PreferenceUtils putNumber: key=%{public}s, value=%{public}d', key, value);
    const store: Map<string, string | number | boolean> = PreferenceUtils.getStore(storeName);
    store.set(key, value);
    PreferenceUtils.notifyListeners(key, value);
  }

  /**
   * 获取数值
   * @param key - 键名
   * @param defaultValue - 默认值
   * @param storeName - 存储名称
   * @returns 存储的数值
   */
  static getNumber(key: string, defaultValue: number = 0, storeName: string = PreferenceUtils.DEFAULT_STORE): number {
    const store: Map<string, string | number | boolean> = PreferenceUtils.getStore(storeName);
    const value: string | number | boolean | undefined = store.get(key);
    if (value === undefined) {
      return defaultValue;
    }
    return Number(value);
  }

  /**
   * 存储布尔值
   * @param key - 键名
   * @param value - 值
   * @param storeName - 存储名称
   */
  static putBoolean(key: string, value: boolean, storeName: string = PreferenceUtils.DEFAULT_STORE): void {
    hilog.debug(DOMAIN, TAG, 'PreferenceUtils putBoolean: key=%{public}s, value=%{public}s', key, value.toString());
    const store: Map<string, string | number | boolean> = PreferenceUtils.getStore(storeName);
    store.set(key, value);
    PreferenceUtils.notifyListeners(key, value);
  }

  /**
   * 获取布尔值
   * @param key - 键名
   * @param defaultValue - 默认值
   * @param storeName - 存储名称
   * @returns 存储的布尔值
   */
  static getBoolean(key: string, defaultValue: boolean = false, storeName: string = PreferenceUtils.DEFAULT_STORE): boolean {
    const store: Map<string, string | number | boolean> = PreferenceUtils.getStore(storeName);
    const value: string | number | boolean | undefined = store.get(key);
    if (value === undefined) {
      return defaultValue;
    }
    return Boolean(value);
  }

  /**
   * 检查键是否存在
   * @param key - 键名
   * @param storeName - 存储名称
   * @returns 是否存在
   */
  static has(key: string, storeName: string = PreferenceUtils.DEFAULT_STORE): boolean {
    const store: Map<string, string | number | boolean> = PreferenceUtils.getStore(storeName);
    return store.has(key);
  }

  /**
   * 删除指定键
   * @param key - 键名
   * @param storeName - 存储名称
   */
  static remove(key: string, storeName: string = PreferenceUtils.DEFAULT_STORE): void {
    hilog.debug(DOMAIN, TAG, 'PreferenceUtils remove: key=%{public}s', key);
    const store: Map<string, string | number | boolean> = PreferenceUtils.getStore(storeName);
    store.delete(key);
  }

  /**
   * 清空指定存储
   * @param storeName - 存储名称
   */
  static clear(storeName: string = PreferenceUtils.DEFAULT_STORE): void {
    hilog.info(DOMAIN, TAG, 'PreferenceUtils clear: clearing store %{public}s', storeName);
    PreferenceUtils.storage.set(storeName, new Map());
  }

  /**
   * 获取所有键名
   * @param storeName - 存储名称
   * @returns 键名数组
   */
  static keys(storeName: string = PreferenceUtils.DEFAULT_STORE): string[] {
    const store: Map<string, string | number | boolean> = PreferenceUtils.getStore(storeName);
    return Array.from(store.keys());
  }

  /**
   * 获取存储大小
   * @param storeName - 存储名称
   * @returns 存储条目数
   */
  static size(storeName: string = PreferenceUtils.DEFAULT_STORE): number {
    const store: Map<string, string | number | boolean> = PreferenceUtils.getStore(storeName);
    return store.size;
  }

  /**
   * 添加偏好变更监听器
   * @param listener - 监听器
   */
  static addListener(listener: PreferenceChangeListener): void {
    PreferenceUtils.listeners.push(listener);
  }

  /**
   * 移除偏好变更监听器
   * @param listener - 监听器
   */
  static removeListener(listener: PreferenceChangeListener): void {
    const index: number = PreferenceUtils.listeners.indexOf(listener);
    if (index !== -1) {
      PreferenceUtils.listeners.splice(index, 1);
    }
  }

  /**
   * 通知所有监听器
   * @param key - 变更的键
   * @param value - 新的值
   */
  private static notifyListeners(key: string, value: string | number | boolean): void {
    for (const listener of PreferenceUtils.listeners) {
      try {
        listener.onChange(key, value);
      } catch (e) {
        hilog.error(DOMAIN, TAG, 'PreferenceUtils notifyListeners: error in listener');
      }
    }
  }
}
