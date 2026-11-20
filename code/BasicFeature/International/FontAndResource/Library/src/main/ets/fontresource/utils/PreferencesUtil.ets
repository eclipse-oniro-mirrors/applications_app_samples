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

// Import the preferences module from the ArkData kit for key-value persistence.
import { preferences } from '@kit.ArkData';
// Import the context type so the helper can open store instances from a caller context.
import { common } from '@kit.AbilityKit';
// Import the platform error type so failure logs carry the error code and message.
import { BusinessError } from '@kit.BasicServicesKit';
// Import the in-house logger so storage failures are observable.
import { Logger } from './Logger';

// The module tag used for every log line emitted by this utility.
const TAG: string = 'PreferencesUtil';

// Typed key-value helpers over @ohos.data.preferences with synchronous APIs.
export class PreferencesUtil {
  // Opens (or creates) a named preferences store for the given context.
  private static open(context: common.Context, storeName: string): preferences.Preferences {
    // Build the store options carrying the store file name.
    const options: preferences.Options = { name: storeName };
    // Open the store synchronously; the platform caches instances per name.
    return preferences.getPreferencesSync(context, options);
  }

  // Formats a caught platform error as "code N: message" for the failure log lines.
  private static reason(error: BusinessError): string {
    // Concatenate instead of calling toString so a thrown value without a code cannot throw again.
    return 'code ' + error.code + ': ' + error.message;
  }

  // Writes a string value into the store and flushes it to disk.
  static putString(context: common.Context, storeName: string, key: string, value: string): void {
    try {
      // Open the target store.
      const store: preferences.Preferences = PreferencesUtil.open(context, storeName);
      // Put the value under the key synchronously.
      store.putSync(key, value);
      // Flush the change to persistent storage.
      store.flush();
    } catch (error) {
      // Log the failure so silent data loss is avoided.
      Logger.error(TAG, 'putString failed for key ' + key + ', ' + PreferencesUtil.reason(error));
    }
  }

  // Reads a string value from the store and returns the fallback when missing.
  static getString(context: common.Context, storeName: string, key: string, fallback: string): string {
    try {
      // Open the target store.
      const store: preferences.Preferences = PreferencesUtil.open(context, storeName);
      // Read the value with the fallback as default.
      const value: preferences.ValueType = store.getSync(key, fallback);
      // Return the value as a string.
      return value as string;
    } catch (error) {
      // Log the failure and fall back to the default.
      Logger.error(TAG, 'getString failed for key ' + key + ', ' + PreferencesUtil.reason(error));
      // Return the caller provided fallback.
      return fallback;
    }
  }

  // Writes a number value into the store and flushes it to disk.
  static putNumber(context: common.Context, storeName: string, key: string, value: number): void {
    try {
      // Open the target store.
      const store: preferences.Preferences = PreferencesUtil.open(context, storeName);
      // Put the numeric value under the key synchronously.
      store.putSync(key, value);
      // Flush the change to persistent storage.
      store.flush();
    } catch (error) {
      // Log the failure so silent data loss is avoided.
      Logger.error(TAG, 'putNumber failed for key ' + key + ', ' + PreferencesUtil.reason(error));
    }
  }

  // Reads a number value from the store and returns the fallback when missing.
  static getNumber(context: common.Context, storeName: string, key: string, fallback: number): number {
    try {
      // Open the target store.
      const store: preferences.Preferences = PreferencesUtil.open(context, storeName);
      // Read the value with the fallback as default.
      const value: preferences.ValueType = store.getSync(key, fallback);
      // Return the value as a number.
      return value as number;
    } catch (error) {
      // Log the failure and fall back to the default.
      Logger.error(TAG, 'getNumber failed for key ' + key + ', ' + PreferencesUtil.reason(error));
      // Return the caller provided fallback.
      return fallback;
    }
  }

  // Writes a boolean value into the store and flushes it to disk.
  static putBoolean(context: common.Context, storeName: string, key: string, value: boolean): void {
    try {
      // Open the target store.
      const store: preferences.Preferences = PreferencesUtil.open(context, storeName);
      // Put the boolean value under the key synchronously.
      store.putSync(key, value);
      // Flush the change to persistent storage.
      store.flush();
    } catch (error) {
      // Log the failure so silent data loss is avoided.
      Logger.error(TAG, 'putBoolean failed for key ' + key + ', ' + PreferencesUtil.reason(error));
    }
  }

  // Reads a boolean value from the store and returns the fallback when missing.
  static getBoolean(context: common.Context, storeName: string, key: string, fallback: boolean): boolean {
    try {
      // Open the target store.
      const store: preferences.Preferences = PreferencesUtil.open(context, storeName);
      // Read the value with the fallback as default.
      const value: preferences.ValueType = store.getSync(key, fallback);
      // Return the value as a boolean.
      return value as boolean;
    } catch (error) {
      // Log the failure and fall back to the default.
      Logger.error(TAG, 'getBoolean failed for key ' + key + ', ' + PreferencesUtil.reason(error));
      // Return the caller provided fallback.
      return fallback;
    }
  }

  // Reports whether the key exists in the store.
  static has(context: common.Context, storeName: string, key: string): boolean {
    try {
      // Open the target store.
      const store: preferences.Preferences = PreferencesUtil.open(context, storeName);
      // Ask the store whether the key is present.
      return store.hasSync(key);
    } catch (error) {
      // Log the failure and report absence.
      Logger.warn(TAG, 'has failed for key ' + key + ', ' + PreferencesUtil.reason(error));
      // Treat failures as key-missing.
      return false;
    }
  }

  // Removes the key from the store and flushes the change.
  static remove(context: common.Context, storeName: string, key: string): void {
    try {
      // Open the target store.
      const store: preferences.Preferences = PreferencesUtil.open(context, storeName);
      // Delete the key synchronously; a missing key is not an error.
      store.deleteSync(key);
      // Flush the change to persistent storage.
      store.flush();
    } catch (error) {
      // Log the failure so silent removal problems are visible.
      Logger.error(TAG, 'remove failed for key ' + key + ', ' + PreferencesUtil.reason(error));
    }
  }

  // Removes every key from the store and flushes the change.
  static clear(context: common.Context, storeName: string): void {
    try {
      // Open the target store.
      const store: preferences.Preferences = PreferencesUtil.open(context, storeName);
      // Clear all entries synchronously.
      store.clearSync();
      // Flush the change to persistent storage.
      store.flush();
    } catch (error) {
      // Log the failure so silent wipe problems are visible.
      Logger.error(TAG, 'clear failed for store ' + storeName + ', ' + PreferencesUtil.reason(error));
    }
  }
}
