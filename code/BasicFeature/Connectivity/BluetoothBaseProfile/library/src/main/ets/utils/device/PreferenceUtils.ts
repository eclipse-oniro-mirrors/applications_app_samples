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
 * preference change listener interface
 */
export interface PreferenceChangeListener {
  /**
   * when bias good value change time callback
   * @param key - changed key name
   * @param value - new value
   */
  onChange(key: string, value: string | number | boolean): void;
}

/**
 * preference utility class
 * provides lightweight key-value persistent storage capability
 * use internal store Map simulate Preference store
 */
export class PreferenceUtils {
  /** internal storage */
  private static storage: Map<string, Map<string, string | number | boolean>> = new Map();
  /** listener list */
  private static listeners: PreferenceChangeListener[] = [];
  /** default store name */
  private static readonly DEFAULT_STORE: string = 'bluetooth_prefs';

  /**
   * initialize preference store
   * @param storeName - store name
   */
  static initialize(storeName: string = PreferenceUtils.DEFAULT_STORE): void {
    hilog.info(DOMAIN, TAG, 'PreferenceUtils initialize: storeName=%{public}s', storeName);
    if (!PreferenceUtils.storage.has(storeName)) {
      PreferenceUtils.storage.set(storeName, new Map());
    }
  }

  /**
   * get store instance
   * @param storeName - store name
   * @returns Map instance
   */
  private static getStore(storeName: string): Map<string, string | number | boolean> {
    if (!PreferenceUtils.storage.has(storeName)) {
      PreferenceUtils.storage.set(storeName, new Map());
    }
    return PreferenceUtils.storage.get(storeName)!;
  }

  /**
   * store string value
   * @param key - key name
   * @param value - value
   * @param storeName - store name
   */
  static putString(key: string, value: string, storeName: string = PreferenceUtils.DEFAULT_STORE): void {
    hilog.debug(DOMAIN, TAG, 'PreferenceUtils putString: key=%{public}s', key);
    const store: Map<string, string | number | boolean> = PreferenceUtils.getStore(storeName);
    store.set(key, value);
    PreferenceUtils.notifyListeners(key, value);
  }

  /**
   * get string value
   * @param key - key name
   * @param defaultValue - default value
   * @param storeName - store name
   * @returns stored string value
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
   * store number value
   * @param key - key name
   * @param value - value
   * @param storeName - store name
   */
  static putNumber(key: string, value: number, storeName: string = PreferenceUtils.DEFAULT_STORE): void {
    hilog.debug(DOMAIN, TAG, 'PreferenceUtils putNumber: key=%{public}s, value=%{public}d', key, value);
    const store: Map<string, string | number | boolean> = PreferenceUtils.getStore(storeName);
    store.set(key, value);
    PreferenceUtils.notifyListeners(key, value);
  }

  /**
   * get number value
   * @param key - key name
   * @param defaultValue - default value
   * @param storeName - store name
   * @returns stored number value
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
   * store boolean value
   * @param key - key name
   * @param value - value
   * @param storeName - store name
   */
  static putBoolean(key: string, value: boolean, storeName: string = PreferenceUtils.DEFAULT_STORE): void {
    hilog.debug(DOMAIN, TAG, 'PreferenceUtils putBoolean: key=%{public}s, value=%{public}s', key, value.toString());
    const store: Map<string, string | number | boolean> = PreferenceUtils.getStore(storeName);
    store.set(key, value);
    PreferenceUtils.notifyListeners(key, value);
  }

  /**
   * get boolean value
   * @param key - key name
   * @param defaultValue - default value
   * @param storeName - store name
   * @returns stored boolean value
   */
  static getBoolean(key: string, defaultValue: boolean = false,
    storeName: string = PreferenceUtils.DEFAULT_STORE): boolean {
    const store: Map<string, string | number | boolean> = PreferenceUtils.getStore(storeName);
    const value: string | number | boolean | undefined = store.get(key);
    if (value === undefined) {
      return defaultValue;
    }
    return Boolean(value);
  }

  /**
   * check whether the key exists
   * @param key - key name
   * @param storeName - store name
   * @returns whether store at
   */
  static has(key: string, storeName: string = PreferenceUtils.DEFAULT_STORE): boolean {
    const store: Map<string, string | number | boolean> = PreferenceUtils.getStore(storeName);
    return store.has(key);
  }

  /**
   * delete the specified key
   * @param key - key name
   * @param storeName - store name
   */
  static remove(key: string, storeName: string = PreferenceUtils.DEFAULT_STORE): void {
    hilog.debug(DOMAIN, TAG, 'PreferenceUtils remove: key=%{public}s', key);
    const store: Map<string, string | number | boolean> = PreferenceUtils.getStore(storeName);
    store.delete(key);
  }

  /**
   * clear the specified store
   * @param storeName - store name
   */
  static clear(storeName: string = PreferenceUtils.DEFAULT_STORE): void {
    hilog.info(DOMAIN, TAG, 'PreferenceUtils clear: clearing store %{public}s', storeName);
    PreferenceUtils.storage.set(storeName, new Map());
  }

  /**
   * get all key names
   * @param storeName - store name
   * @returns key array
   */
  static keys(storeName: string = PreferenceUtils.DEFAULT_STORE): string[] {
    const store: Map<string, string | number | boolean> = PreferenceUtils.getStore(storeName);
    return Array.from(store.keys());
  }

  /**
   * get store size
   * @param storeName - store name
   * @returns store entry count
   */
  static size(storeName: string = PreferenceUtils.DEFAULT_STORE): number {
    const store: Map<string, string | number | boolean> = PreferenceUtils.getStore(storeName);
    return store.size;
  }

  /**
   * add preference change listener
   * @param listener - listener
   */
  static addListener(listener: PreferenceChangeListener): void {
    PreferenceUtils.listeners.push(listener);
  }

  /**
   * remove preference change listener
   * @param listener - listener
   */
  static removeListener(listener: PreferenceChangeListener): void {
    const index: number = PreferenceUtils.listeners.indexOf(listener);
    if (index !== -1) {
      PreferenceUtils.listeners.splice(index, 1);
    }
  }

  /**
   * notify all listeners
   * @param key - changed key
   * @param value - new value
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
