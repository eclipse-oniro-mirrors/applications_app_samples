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

import { preferences } from '@kit.ArkData';
import { common } from '@kit.AbilityKit';

// Name of the preferences store shared by the whole HAR sample.
const STORE_NAME: string = 'photo_picker_preferences';
// Default number returned when a numeric key is missing.
const DEFAULT_NUMBER: number = 0;
// Default boolean returned when a boolean key is missing.
const DEFAULT_BOOLEAN: boolean = false;

/**
 * Small synchronous facade over the ArkData preferences store.
 * The caller owns the UIAbility context so this class stays free of global state.
 * Every method loads the store on demand, which keeps the API simple for sample code.
 */
export class PreferencesUtils {
  /**
   * Opens the shared preferences store synchronously.
   * @param context Context used to resolve the store location.
   * @returns The opened preferences handle.
   */
  private static openStore(context: common.UIAbilityContext): preferences.Preferences {
    // Build the options with an explicit type so the literal matches the declared interface.
    const options: preferences.Options = { name: STORE_NAME };
    // Open the store, creating the backing file when it does not exist yet.
    const store: preferences.Preferences = preferences.getPreferencesSync(context, options);
    // Hand the handle back to the calling method.
    return store;
  }

  /**
   * Stores a string value.
   * @param context Context used to resolve the store.
   * @param key Preference key.
   * @param value Value to store.
   * @returns True when the value was persisted.
   */
  static putString(context: common.UIAbilityContext, key: string, value: string): boolean {
    // Open the store for this single operation.
    const store: preferences.Preferences = PreferencesUtils.openStore(context);
    // Write the string into the in memory cache of the store.
    store.putSync(key, value);
    // Persist the cache to disk synchronously so the value survives a restart.
    store.flushSync();
    // Report success to the caller.
    return true;
  }

  /**
   * Reads a string value.
   * @param context Context used to resolve the store.
   * @param key Preference key.
   * @param defaultValue Value returned when the key is missing.
   * @returns Stored string or the provided default value.
   */
  static getString(context: common.UIAbilityContext, key: string, defaultValue: string): string {
    // Open the store for this single read.
    const store: preferences.Preferences = PreferencesUtils.openStore(context);
    // Read the raw entry, which is typed as a union value by the platform.
    const raw: preferences.ValueType = store.getSync(key, defaultValue);
    // Only a real string may be returned as text, everything else falls back.
    if (typeof raw === 'string') {
      // Return the stored string.
      return raw.toString();
    }
    // Return the caller default when the stored type does not match.
    return defaultValue;
  }

  /**
   * Stores a number value.
   * @param context Context used to resolve the store.
   * @param key Preference key.
   * @param value Value to store.
   * @returns True when the value was persisted.
   */
  static putNumber(context: common.UIAbilityContext, key: string, value: number): boolean {
    // Open the store for this single operation.
    const store: preferences.Preferences = PreferencesUtils.openStore(context);
    // Write the number into the in memory cache of the store.
    store.putSync(key, value);
    // Persist the cache to disk synchronously.
    store.flushSync();
    // Report success to the caller.
    return true;
  }

  /**
   * Reads a number value.
   * @param context Context used to resolve the store.
   * @param key Preference key.
   * @param defaultValue Value returned when the key is missing.
   * @returns Stored number or the provided default value.
   */
  static getNumber(context: common.UIAbilityContext, key: string, defaultValue: number): number {
    // Open the store for this single read.
    const store: preferences.Preferences = PreferencesUtils.openStore(context);
    // Read the raw entry with the number default.
    const raw: preferences.ValueType = store.getSync(key, defaultValue);
    // Only a real number may be returned as a number.
    if (typeof raw === 'number') {
      // Return the stored number.
      return raw.valueOf();
    }
    // Return the fallback number when the stored type does not match.
    return DEFAULT_NUMBER;
  }

  /**
   * Stores a boolean value.
   * @param context Context used to resolve the store.
   * @param key Preference key.
   * @param value Value to store.
   * @returns True when the value was persisted.
   */
  static putBoolean(context: common.UIAbilityContext, key: string, value: boolean): boolean {
    // Open the store for this single operation.
    const store: preferences.Preferences = PreferencesUtils.openStore(context);
    // Write the boolean into the in memory cache of the store.
    store.putSync(key, value);
    // Persist the cache to disk synchronously.
    store.flushSync();
    // Report success to the caller.
    return true;
  }

  /**
   * Reads a boolean value.
   * @param context Context used to resolve the store.
   * @param key Preference key.
   * @param defaultValue Value returned when the key is missing.
   * @returns Stored boolean or the provided default value.
   */
  static getBoolean(context: common.UIAbilityContext, key: string, defaultValue: boolean): boolean {
    // Open the store for this single read.
    const store: preferences.Preferences = PreferencesUtils.openStore(context);
    // Read the raw entry with the boolean default.
    const raw: preferences.ValueType = store.getSync(key, defaultValue);
    // Only a real boolean may be returned as a boolean.
    if (typeof raw === 'boolean') {
      // Return the stored boolean.
      return raw.valueOf();
    }
    // Return the fallback boolean when the stored type does not match.
    return DEFAULT_BOOLEAN;
  }

  /**
   * Removes a single key from the store.
   * @param context Context used to resolve the store.
   * @param key Preference key to remove.
   * @returns True when the key is gone afterwards.
   */
  static deleteKey(context: common.UIAbilityContext, key: string): boolean {
    // Open the store for this single operation.
    const store: preferences.Preferences = PreferencesUtils.openStore(context);
    // Drop the key from the in memory cache.
    store.deleteSync(key);
    // Persist the removal to disk.
    store.flushSync();
    // Confirm the key is no longer present.
    return !store.hasSync(key);
  }

  /**
   * Removes every key from the store.
   * @param context Context used to resolve the store.
   * @returns True when the store is empty afterwards.
   */
  static clear(context: common.UIAbilityContext): boolean {
    // Open the store for this single operation.
    const store: preferences.Preferences = PreferencesUtils.openStore(context);
    // Drop all entries of the store.
    store.clearSync();
    // Persist the empty state to disk.
    store.flushSync();
    // Report success because the store is now empty.
    return true;
  }

  /**
   * Checks whether a key exists in the store.
   * @param context Context used to resolve the store.
   * @param key Preference key to look up.
   * @returns True when the key is present.
   */
  static hasKey(context: common.UIAbilityContext, key: string): boolean {
    // Open the store for this single probe.
    const store: preferences.Preferences = PreferencesUtils.openStore(context);
    // Ask the store whether the key exists.
    const present: boolean = store.hasSync(key);
    // Return the probe result.
    return present;
  }
}
