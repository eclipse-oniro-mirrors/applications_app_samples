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
// Preference change listener interface
// ========================================

/**
 * Preference change listener interface.
 * Defines callbacks invoked when preference data changes.
 */
export interface PreferenceChangeListener {
  /**
   * Invoked when the value of a key changes.
   * @param {string} key - The changed key
   * @param {string | null} oldValue - Value before the change
   * @param {string | null} newValue - Value after the change
   */
  onChanged(key: string, oldValue: string | null, newValue: string | null): void;

  /**
   * Invoked when all data is cleared.
   */
  onCleared(): void;
}

// ========================================
// Preference storage utility class
// ========================================

/**
 * Preference storage utility class.
 * Simulates Preferences-style data persistence,
 * providing key-value get/set/remove/clear operations,
 * with change listeners notified on data updates.
 */
export class PreferenceUtils {
  /** Store name identifier */
  private storeName: string;
  /** Internal key-value storage */
  private storage: Map<string, string>;
  /** Change listener list */
  private listeners: PreferenceChangeListener[];
  /** Whether initialized */
  private initialized: boolean;

  /**
   * Creates a preference storage instance.
   * @param {string} storeName - Store name identifier
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
  // Basic get/set methods
  // ========================================

  /**
   * Gets the value of a key.
   * Looks up the key in storage, returning null when absent.
   * @param {string} key - Key to retrieve
   * @returns {string | null} Value of the key, or null if absent
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
   * Gets the value of a key, falling back to a default when absent.
   * @param {string} key - Key to retrieve
   * @param {string} defaultVal - Default value when the key is absent
   * @returns {string} Value of the key or the default
   */
  getWithDefault(key: string, defaultVal: string): string {
    hilog.debug(DOMAIN, TAG, 'PreferenceUtils getWithDefault: store=%{public}s, key=%{public}s', this.storeName, key);
    const value: string | null = this.get(key);
    const result: string = value !== null ? value : defaultVal;
    hilog.debug(DOMAIN, TAG, 'PreferenceUtils getWithDefault: result=%{public}s', result);
    return result;
  }

  /**
   * Sets a key-value pair.
   * Overwrites an existing key and notifies all registered listeners.
   * @param {string} key - Key to set
   * @param {string} value - Value to set
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
   * Removes a key and its value.
   * @param {string} key - Key to remove
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
   * Clears all stored data.
   * Removes all key-value pairs and notifies listeners that data was cleared.
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
  // Query methods
  // ========================================

  /**
   * Checks whether a key exists.
   * @param {string} key - Key to check
   * @returns {boolean} Whether the key exists
   */
  has(key: string): boolean {
    const result: boolean = this.storage.has(key);
    hilog.debug(DOMAIN, TAG, 'PreferenceUtils has: store=%{public}s, key=%{public}s, result=%{public}s',
      this.storeName, key, result.toString());
    return result;
  }

  /**
   * Gets all stored key names.
   * @returns {string[]} Array of all keys
   */
  keys(): string[] {
    const keyArray: string[] = Array.from(this.storage.keys());
    hilog.debug(DOMAIN, TAG, 'PreferenceUtils keys: store=%{public}s, count=%{public}d',
      this.storeName, keyArray.length);
    return keyArray;
  }

  /**
   * Gets all stored key-value pairs.
   * Returns a copy of the internal storage to prevent external mutation.
   * @returns {Map<string, string>} Map copy of all key-value pairs
   */
  getAll(): Map<string, string> {
    hilog.debug(DOMAIN, TAG, 'PreferenceUtils getAll: store=%{public}s, size=%{public}d',
      this.storeName, this.storage.size);
    return new Map<string, string>(this.storage);
  }

  /**
   * Gets the current entry count.
   * @returns {number} Number of stored entries
   */
  size(): number {
    const count: number = this.storage.size;
    hilog.debug(DOMAIN, TAG, 'PreferenceUtils size: store=%{public}s, count=%{public}d', this.storeName, count);
    return count;
  }

  /**
   * Gets the store name.
   * @returns {string} Store name identifier
   */
  getStoreName(): string {
    return this.storeName;
  }

  // ========================================
  // Listener management methods
  // ========================================

  /**
   * Adds a preference change listener.
   * @param {PreferenceChangeListener} listener - Listener to add
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
   * Removes a preference change listener.
   * @param {PreferenceChangeListener} listener - Listener to remove
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
   * Notifies all listeners that a key's value changed.
   * @param {string} key - The changed key
   * @param {string | null} oldValue - Value before the change
   * @param {string | null} newValue - Value after the change
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
   * Notifies all listeners that data was cleared.
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
  // Lifecycle methods
  // ========================================

  /**
   * Destroys the storage instance.
   * Clears all data and listeners, releasing resources.
   */
  destroy(): void {
    hilog.info(DOMAIN, TAG, 'PreferenceUtils destroy: store=%{public}s', this.storeName);
    this.storage.clear();
    this.listeners = [];
    this.initialized = false;
  }
}
