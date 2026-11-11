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

import { common } from '@kit.AbilityKit';
import { sendablePreferences } from '@kit.ArkData';
import { lang } from '@kit.ArkTS';
import { DataValidator } from '../utils/DataValidator';
import { DataStoreConstants } from '../constants/DataStoreConstants';
import { StoreStatistics, DataEntry, DataType } from '../models/DataModels';
import { ResultText } from '../utils/ResultText';

const STORE_NAME: string = 'sendable_data_store';
const SAMPLE_KEY: string = 'sampleKey';
const SAMPLE_VALUE: string = 'Sendable preferences value';
const DEFAULT_VALUE: string = 'Default value';
const VERSION_KEY: string = '__store_version__';
const STATS_READ_KEY: string = '__stats_read_count__';
const STATS_WRITE_KEY: string = '__stats_write_count__';
const STATS_DELETE_KEY: string = '__stats_delete_count__';

export type PreferencesEventCallback = (message: string) => void;

export class SendablePreferencesHelper {
  private readonly context: common.UIAbilityContext;
  private readonly options: sendablePreferences.Options = { name: STORE_NAME };
  private readonly eventCallback: PreferencesEventCallback;
  private readonly changeCallback: (key: string) => void;
  private readonly multiProcessChangeCallback: (key: string) => void;
  private readonly dataChangeCallback: (data: lang.ISendable) => void;
  private preferences: sendablePreferences.Preferences | null = null;
  private changeSubscribed: boolean = false;
  private multiProcessChangeSubscribed: boolean = false;
  private dataChangeSubscribed: boolean = false;
  private readCount: number = 0;
  private writeCount: number = 0;
  private deleteCount: number = 0;
  private lastAccessTime: number = 0;
  private lastWriteTime: number = 0;
  private storeVersion: number = DataStoreConstants.STORE_VERSION_1;

  constructor(context: common.UIAbilityContext, eventCallback: PreferencesEventCallback) {
    this.context = context;
    this.eventCallback = eventCallback;
    this.changeCallback = (key: string): void => {
      this.eventCallback(ResultText.ofArgs($r('app.string.result_prefs_change_event'), [key],
        `change event: ${key}`));
    };
    this.multiProcessChangeCallback = (key: string): void => {
      this.eventCallback(ResultText.ofArgs($r('app.string.result_prefs_multiprocess_change_event'), [key],
        `multiProcessChange event: ${key}`));
    };
    this.dataChangeCallback = (data: lang.ISendable): void => {
      this.eventCallback(ResultText.ofArgs($r('app.string.result_prefs_data_change_event'),
        [JSON.stringify(data)], `dataChange event: ${JSON.stringify(data)}`));
    };
  }

  async initialize(): Promise<string> {
    this.unsubscribeAll();
    this.preferences = await sendablePreferences.getPreferences(this.context, this.options);
    return ResultText.of($r('app.string.result_prefs_init_completed'), 'getPreferences completed');
  }

  initializeSync(): string {
    this.unsubscribeAll();
    this.preferences = sendablePreferences.getPreferencesSync(this.context, this.options);
    return ResultText.of($r('app.string.result_prefs_init_sync_completed'), 'getPreferencesSync completed');
  }

  getLimits(): string {
    return ResultText.ofArgs($r('app.string.result_prefs_limits'),
      [sendablePreferences.MAX_KEY_LENGTH, sendablePreferences.MAX_VALUE_LENGTH],
      `MAX_KEY_LENGTH=${sendablePreferences.MAX_KEY_LENGTH}, ` +
        `MAX_VALUE_LENGTH=${sendablePreferences.MAX_VALUE_LENGTH}`);
  }

  async putValue(): Promise<string> {
    await this.getInstance().put(SAMPLE_KEY, SAMPLE_VALUE);
    this.writeCount++;
    this.lastWriteTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_put_completed'), [SAMPLE_KEY],
      `put completed: ${SAMPLE_KEY}`);
  }

  putValueSync(): string {
    this.getInstance().putSync(SAMPLE_KEY, SAMPLE_VALUE);
    this.writeCount++;
    this.lastWriteTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_put_sync_completed'), [SAMPLE_KEY],
      `putSync completed: ${SAMPLE_KEY}`);
  }

  async getValue(): Promise<string> {
    const value: lang.ISendable = await this.getInstance().get(SAMPLE_KEY, DEFAULT_VALUE);
    this.readCount++;
    this.lastAccessTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_get'), [JSON.stringify(value)],
      `get: ${JSON.stringify(value)}`);
  }

  getValueSync(): string {
    const value: lang.ISendable = this.getInstance().getSync(SAMPLE_KEY, DEFAULT_VALUE);
    this.readCount++;
    this.lastAccessTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_get_sync'), [JSON.stringify(value)],
      `getSync: ${JSON.stringify(value)}`);
  }

  async getAllValues(): Promise<string> {
    const values: lang.ISendable = await this.getInstance().getAll();
    this.readCount++;
    this.lastAccessTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_get_all'), [JSON.stringify(values)],
      `getAll: ${JSON.stringify(values)}`);
  }

  getAllValuesSync(): string {
    const values: lang.ISendable = this.getInstance().getAllSync();
    this.readCount++;
    this.lastAccessTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_get_all_sync'), [JSON.stringify(values)],
      `getAllSync: ${JSON.stringify(values)}`);
  }

  async hasValue(): Promise<string> {
    const result: boolean = await this.getInstance().has(SAMPLE_KEY);
    this.readCount++;
    this.lastAccessTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_has'), [String(result)], `has: ${result}`);
  }

  hasValueSync(): string {
    const result: boolean = this.getInstance().hasSync(SAMPLE_KEY);
    this.readCount++;
    this.lastAccessTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_has_sync'), [String(result)],
      `hasSync: ${result}`);
  }

  async deleteValue(): Promise<string> {
    await this.getInstance().delete(SAMPLE_KEY);
    this.deleteCount++;
    return ResultText.ofArgs($r('app.string.result_prefs_delete_completed'), [SAMPLE_KEY],
      `delete completed: ${SAMPLE_KEY}`);
  }

  deleteValueSync(): string {
    this.getInstance().deleteSync(SAMPLE_KEY);
    this.deleteCount++;
    return ResultText.ofArgs($r('app.string.result_prefs_delete_sync_completed'), [SAMPLE_KEY],
      `deleteSync completed: ${SAMPLE_KEY}`);
  }

  async flushValues(): Promise<string> {
    await this.getInstance().flush();
    return ResultText.of($r('app.string.result_prefs_flush_completed'), 'flush completed');
  }

  flushValuesSync(): string {
    this.getInstance().flushSync();
    return ResultText.of($r('app.string.result_prefs_flush_sync_completed'), 'flushSync completed');
  }

  async clearValues(): Promise<string> {
    await this.getInstance().clear();
    return ResultText.of($r('app.string.result_prefs_clear_completed'), 'clear completed');
  }

  clearValuesSync(): string {
    this.getInstance().clearSync();
    return ResultText.of($r('app.string.result_prefs_clear_sync_completed'), 'clearSync completed');
  }

  subscribeChange(): string {
    this.getInstance().on('change', this.changeCallback);
    this.changeSubscribed = true;
    return ResultText.of($r('app.string.result_prefs_subscribe_change'), 'Subscribed to change');
  }

  unsubscribeChange(): string {
    this.getInstance().off('change', this.changeCallback);
    this.changeSubscribed = false;
    return ResultText.of($r('app.string.result_prefs_unsubscribe_change'), 'Unsubscribed from change');
  }

  subscribeMultiProcessChange(): string {
    this.getInstance().on('multiProcessChange', this.multiProcessChangeCallback);
    this.multiProcessChangeSubscribed = true;
    return ResultText.of($r('app.string.result_prefs_subscribe_multiprocess'), 'Subscribed to multiProcessChange');
  }

  unsubscribeMultiProcessChange(): string {
    this.getInstance().off('multiProcessChange', this.multiProcessChangeCallback);
    this.multiProcessChangeSubscribed = false;
    return ResultText.of($r('app.string.result_prefs_unsubscribe_multiprocess'),
      'Unsubscribed from multiProcessChange');
  }

  subscribeDataChange(): string {
    this.getInstance().on('dataChange', [SAMPLE_KEY], this.dataChangeCallback);
    this.dataChangeSubscribed = true;
    return ResultText.of($r('app.string.result_prefs_subscribe_data_change'), 'Subscribed to dataChange');
  }

  unsubscribeDataChange(): string {
    this.getInstance().off('dataChange', [SAMPLE_KEY], this.dataChangeCallback);
    this.dataChangeSubscribed = false;
    return ResultText.of($r('app.string.result_prefs_unsubscribe_data_change'), 'Unsubscribed from dataChange');
  }

  async removeFromCache(): Promise<string> {
    this.unsubscribeAll();
    await sendablePreferences.removePreferencesFromCache(this.context, this.options);
    this.preferences = null;
    return ResultText.of($r('app.string.result_prefs_remove_cache_completed'),
      'removePreferencesFromCache completed');
  }

  removeFromCacheSync(): string {
    this.unsubscribeAll();
    sendablePreferences.removePreferencesFromCacheSync(this.context, this.options);
    this.preferences = null;
    return ResultText.of($r('app.string.result_prefs_remove_cache_sync_completed'),
      'removePreferencesFromCacheSync completed');
  }

  async deleteStore(): Promise<string> {
    this.unsubscribeAll();
    await sendablePreferences.deletePreferences(this.context, this.options);
    this.preferences = null;
    return ResultText.of($r('app.string.result_prefs_delete_prefs_completed'), 'deletePreferences completed');
  }

  release(): void {
    this.unsubscribeAll();
    if (this.preferences !== null) {
      sendablePreferences.removePreferencesFromCacheSync(this.context, this.options);
      this.preferences = null;
    }
  }

  async putMultiple(keys: string[], values: string[]): Promise<string> {
    const instance: sendablePreferences.Preferences = this.getInstance();
    if (keys.length !== values.length) {
      return ResultText.of($r('app.string.result_prefs_put_multiple_mismatch'),
        'putMultiple failed: keys and values length mismatch');
    }
    if (keys.length > DataStoreConstants.MAX_BATCH_SIZE) {
      return ResultText.ofArgs($r('app.string.result_prefs_put_multiple_exceeds_max'),
        [keys.length, DataStoreConstants.MAX_BATCH_SIZE],
        `putMultiple failed: batch size ${keys.length} exceeds max ${DataStoreConstants.MAX_BATCH_SIZE}`);
    }
    let successCount: number = 0;
    for (let i: number = 0; i < keys.length; i++) {
      if (DataValidator.isValidKey(keys[i]) && DataValidator.isValidValue(values[i])) {
        await instance.put(keys[i], values[i]);
        successCount++;
      }
    }
    this.writeCount += successCount;
    this.lastWriteTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_put_multiple_completed'), [successCount, keys.length],
      `putMultiple completed: ${successCount}/${keys.length} keys written`);
  }

  async getMultiple(keys: string[]): Promise<string> {
    const instance: sendablePreferences.Preferences = this.getInstance();
    if (keys.length > DataStoreConstants.MAX_BATCH_SIZE) {
      return ResultText.ofArgs($r('app.string.result_prefs_get_multiple_exceeds_max'),
        [keys.length, DataStoreConstants.MAX_BATCH_SIZE],
        `getMultiple failed: batch size ${keys.length} exceeds max ${DataStoreConstants.MAX_BATCH_SIZE}`);
    }
    const results: string[] = [];
    for (let i: number = 0; i < keys.length; i++) {
    if (DataValidator.isValidKey(keys[i])) {
        const value: lang.ISendable = await instance.get(keys[i], DEFAULT_VALUE);
        results.push(`${keys[i]}=${JSON.stringify(value)}`);
      }
    }
    this.readCount += results.length;
    this.lastAccessTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_get_multiple'),
      [results.length, keys.length, results.join(', ')],
      `getMultiple: ${results.length}/${keys.length} keys read [${results.join(', ')}]`);
  }

  async deleteMultiple(keys: string[]): Promise<string> {
    const instance: sendablePreferences.Preferences = this.getInstance();
    if (keys.length > DataStoreConstants.MAX_BATCH_SIZE) {
      return ResultText.ofArgs($r('app.string.result_prefs_delete_multiple_exceeds_max'),
        [keys.length, DataStoreConstants.MAX_BATCH_SIZE],
        `deleteMultiple failed: batch size ${keys.length} exceeds max ${DataStoreConstants.MAX_BATCH_SIZE}`);
    }
    let successCount: number = 0;
    for (let i: number = 0; i < keys.length; i++) {
      if (DataValidator.isValidKey(keys[i])) {
        await instance.delete(keys[i]);
        successCount++;
      }
    }
    this.deleteCount += successCount;
    return ResultText.ofArgs($r('app.string.result_prefs_delete_multiple_completed'), [successCount, keys.length],
      `deleteMultiple completed: ${successCount}/${keys.length} keys deleted`);
  }

  async hasMultiple(keys: string[]): Promise<string> {
    const instance: sendablePreferences.Preferences = this.getInstance();
    if (keys.length > DataStoreConstants.MAX_BATCH_SIZE) {
      return ResultText.ofArgs($r('app.string.result_prefs_has_multiple_exceeds_max'),
        [keys.length, DataStoreConstants.MAX_BATCH_SIZE],
        `hasMultiple failed: batch size ${keys.length} exceeds max ${DataStoreConstants.MAX_BATCH_SIZE}`);
    }
    const results: string[] = [];
    for (let i: number = 0; i < keys.length; i++) {
      if (DataValidator.isValidKey(keys[i])) {
        const exists: boolean = await instance.has(keys[i]);
        results.push(`${keys[i]}=${exists}`);
      }
    }
    this.readCount += results.length;
    this.lastAccessTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_has_multiple'), [results.join(', ')],
      `hasMultiple: [${results.join(', ')}]`);
  }

  putMultipleSync(keys: string[], values: string[]): string {
    const instance: sendablePreferences.Preferences = this.getInstance();
    if (keys.length !== values.length) {
      return ResultText.of($r('app.string.result_prefs_put_multiple_sync_mismatch'),
        'putMultipleSync failed: keys and values length mismatch');
    }
    if (keys.length > DataStoreConstants.MAX_BATCH_SIZE) {
      return ResultText.of($r('app.string.result_prefs_put_multiple_sync_exceeds_max'),
        `putMultipleSync failed: batch size exceeds max`);
    }
    let successCount: number = 0;
    for (let i: number = 0; i < keys.length; i++) {
      if (DataValidator.isValidKey(keys[i]) && DataValidator.isValidValue(values[i])) {
        instance.putSync(keys[i], values[i]);
        successCount++;
      }
    }
    this.writeCount += successCount;
    this.lastWriteTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_put_multiple_sync_completed'),
      [successCount, keys.length],
      `putMultipleSync completed: ${successCount}/${keys.length} keys written`);
  }

  getMultipleSync(keys: string[]): string {
    const instance: sendablePreferences.Preferences = this.getInstance();
    if (keys.length > DataStoreConstants.MAX_BATCH_SIZE) {
      return ResultText.of($r('app.string.result_prefs_get_multiple_sync_exceeds_max'),
        `getMultipleSync failed: batch size exceeds max`);
    }
    const results: string[] = [];
    for (let i: number = 0; i < keys.length; i++) {
      if (DataValidator.isValidKey(keys[i])) {
        const value: lang.ISendable = instance.getSync(keys[i], DEFAULT_VALUE);
        results.push(`${keys[i]}=${JSON.stringify(value)}`);
      }
    }
    this.readCount += results.length;
    this.lastAccessTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_get_multiple_sync'),
      [results.length, keys.length, results.join(', ')],
      `getMultipleSync: ${results.length}/${keys.length} keys read [${results.join(', ')}]`);
  }

  async putNumber(key: string, value: number): Promise<string> {
    if (!DataValidator.isValidKey(key)) {
      return ResultText.of($r('app.string.result_prefs_put_number_invalid_key'), 'putNumber failed: invalid key');
    }
    if (!DataValidator.isNumber(value)) {
      return ResultText.of($r('app.string.result_prefs_put_number_invalid_value'),
        'putNumber failed: invalid number value');
    }
    await this.getInstance().put(key, value);
    this.writeCount++;
    this.lastWriteTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_put_number_completed'), [key, String(value)],
      `putNumber completed: ${key}=${value}`);
  }

  async getNumber(key: string, defaultValue: number): Promise<string> {
    if (!DataValidator.isValidKey(key)) {
      return ResultText.of($r('app.string.result_prefs_get_number_invalid_key'), 'getNumber failed: invalid key');
    }
    const value: lang.ISendable = await this.getInstance().get(key, defaultValue);
    this.readCount++;
    this.lastAccessTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_get_number'), [key, JSON.stringify(value)],
      `getNumber: ${key}=${JSON.stringify(value)}`);
  }

  putNumberSync(key: string, value: number): string {
    if (!DataValidator.isValidKey(key) || !DataValidator.isNumber(value)) {
      return ResultText.of($r('app.string.result_prefs_put_number_sync_invalid'),
        'putNumberSync failed: invalid key or value');
    }
    this.getInstance().putSync(key, value);
    this.writeCount++;
    this.lastWriteTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_put_number_sync_completed'), [key, String(value)],
      `putNumberSync completed: ${key}=${value}`);
  }

  getNumberSync(key: string, defaultValue: number): string {
    if (!DataValidator.isValidKey(key)) {
      return ResultText.of($r('app.string.result_prefs_get_number_sync_invalid_key'),
        'getNumberSync failed: invalid key');
    }
    const value: lang.ISendable = this.getInstance().getSync(key, defaultValue);
    this.readCount++;
    this.lastAccessTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_get_number_sync'), [key, JSON.stringify(value)],
      `getNumberSync: ${key}=${JSON.stringify(value)}`);
  }

  async putBoolean(key: string, value: boolean): Promise<string> {
    if (!DataValidator.isValidKey(key)) {
      return ResultText.of($r('app.string.result_prefs_put_boolean_invalid_key'), 'putBoolean failed: invalid key');
    }
    await this.getInstance().put(key, value);
    this.writeCount++;
    this.lastWriteTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_put_boolean_completed'), [key, String(value)],
      `putBoolean completed: ${key}=${value}`);
  }

  async getBoolean(key: string, defaultValue: boolean): Promise<string> {
    if (!DataValidator.isValidKey(key)) {
      return ResultText.of($r('app.string.result_prefs_get_boolean_invalid_key'), 'getBoolean failed: invalid key');
    }
    const value: lang.ISendable = await this.getInstance().get(key, defaultValue);
    this.readCount++;
    this.lastAccessTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_get_boolean'), [key, JSON.stringify(value)],
      `getBoolean: ${key}=${JSON.stringify(value)}`);
  }

  putBooleanSync(key: string, value: boolean): string {
    if (!DataValidator.isValidKey(key)) {
      return ResultText.of($r('app.string.result_prefs_put_boolean_sync_invalid_key'),
        'putBooleanSync failed: invalid key');
    }
    this.getInstance().putSync(key, value);
    this.writeCount++;
    this.lastWriteTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_put_boolean_sync_completed'), [key, String(value)],
      `putBooleanSync completed: ${key}=${value}`);
  }

  getBooleanSync(key: string, defaultValue: boolean): string {
    if (!DataValidator.isValidKey(key)) {
      return ResultText.of($r('app.string.result_prefs_get_boolean_sync_invalid_key'),
        'getBooleanSync failed: invalid key');
    }
    const value: lang.ISendable = this.getInstance().getSync(key, defaultValue);
    this.readCount++;
    this.lastAccessTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_get_boolean_sync'), [key, JSON.stringify(value)],
      `getBooleanSync: ${key}=${JSON.stringify(value)}`);
  }

  async putString(key: string, value: string): Promise<string> {
    if (!DataValidator.isValidKey(key)) {
      return ResultText.of($r('app.string.result_prefs_put_string_invalid_key'), 'putString failed: invalid key');
    }
    if (!DataValidator.isValidValue(value)) {
      return ResultText.of($r('app.string.result_prefs_put_string_exceeds_length'),
        'putString failed: value exceeds max length');
    }
    await this.getInstance().put(key, value);
    this.writeCount++;
    this.lastWriteTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_put_string_completed'), [key, value],
      `putString completed: ${key}=${value}`);
  }

  async getString(key: string, defaultValue: string): Promise<string> {
    if (!DataValidator.isValidKey(key)) {
      return ResultText.of($r('app.string.result_prefs_get_string_invalid_key'), 'getString failed: invalid key');
    }
    const value: lang.ISendable = await this.getInstance().get(key, defaultValue);
    this.readCount++;
    this.lastAccessTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_get_string'), [key, JSON.stringify(value)],
      `getString: ${key}=${JSON.stringify(value)}`);
  }

  putStringSync(key: string, value: string): string {
    if (!DataValidator.isValidKey(key) || !DataValidator.isValidValue(value)) {
      return ResultText.of($r('app.string.result_prefs_put_string_sync_invalid'),
        'putStringSync failed: invalid key or value');
    }
    this.getInstance().putSync(key, value);
    this.writeCount++;
    this.lastWriteTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_put_string_sync_completed'), [key, value],
      `putStringSync completed: ${key}=${value}`);
  }

  getStringSync(key: string, defaultValue: string): string {
    if (!DataValidator.isValidKey(key)) {
      return ResultText.of($r('app.string.result_prefs_get_string_sync_invalid_key'),
        'getStringSync failed: invalid key');
    }
    const value: lang.ISendable = this.getInstance().getSync(key, defaultValue);
    this.readCount++;
    this.lastAccessTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_get_string_sync'), [key, JSON.stringify(value)],
      `getStringSync: ${key}=${JSON.stringify(value)}`);
  }

  async putObject(key: string, value: string): Promise<string> {
    if (!DataValidator.isValidKey(key)) {
      return ResultText.of($r('app.string.result_prefs_put_object_invalid_key'), 'putObject failed: invalid key');
    }
    await this.getInstance().put(key, value);
    this.writeCount++;
    this.lastWriteTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_put_object_completed'), [key],
      `putObject completed: ${key}`);
  }

  async getObject(key: string, defaultValue: string): Promise<string> {
    if (!DataValidator.isValidKey(key)) {
      return ResultText.of($r('app.string.result_prefs_get_object_invalid_key'), 'getObject failed: invalid key');
    }
    const value: lang.ISendable = await this.getInstance().get(key, defaultValue);
    this.readCount++;
    this.lastAccessTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_get_object'), [key, JSON.stringify(value)],
      `getObject: ${key}=${JSON.stringify(value)}`);
  }

  putObjectSync(key: string, value: string): string {
    if (!DataValidator.isValidKey(key)) {
      return ResultText.of($r('app.string.result_prefs_put_object_sync_invalid_key'),
        'putObjectSync failed: invalid key');
    }
    this.getInstance().putSync(key, value);
    this.writeCount++;
    this.lastWriteTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_put_object_sync_completed'), [key],
      `putObjectSync completed: ${key}`);
  }

  getObjectSync(key: string, defaultValue: string): string {
    if (!DataValidator.isValidKey(key)) {
      return ResultText.of($r('app.string.result_prefs_get_object_sync_invalid_key'),
        'getObjectSync failed: invalid key');
    }
    const value: lang.ISendable = this.getInstance().getSync(key, defaultValue);
    this.readCount++;
    this.lastAccessTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_get_object_sync'), [key, JSON.stringify(value)],
      `getObjectSync: ${key}=${JSON.stringify(value)}`);
  }

  async getKeysByPrefix(prefix: string): Promise<string> {
    if (!DataValidator.isValidKey(prefix)) {
      return ResultText.of($r('app.string.result_prefs_keys_by_prefix_invalid'),
        'getKeysByPrefix failed: invalid prefix');
    }
    const allData: lang.ISendable = await this.getInstance().getAll();
    const allJson: string = JSON.stringify(allData);
    const allKeys: string[] = [];
    const parsed: Record<string, Object> = JSON.parse(allJson) as Record<string, Object>;
    const keys: string[] = Object.keys(parsed);
    for (let i: number = 0; i < keys.length; i++) {
      if (keys[i].indexOf(prefix) === 0) {
        allKeys.push(keys[i]);
      }
    }
    this.readCount++;
    this.lastAccessTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_keys_by_prefix'),
      [prefix, allKeys.join(', '), allKeys.length],
      `getKeysByPrefix('${prefix}'): [${allKeys.join(', ')}] (${allKeys.length} keys)`);
  }

  async deleteByPrefix(prefix: string): Promise<string> {
    if (!DataValidator.isValidKey(prefix)) {
      return ResultText.of($r('app.string.result_prefs_delete_by_prefix_invalid'),
        'deleteByPrefix failed: invalid prefix');
    }
    const allData: lang.ISendable = await this.getInstance().getAll();
    const allJson: string = JSON.stringify(allData);
    const parsed: Record<string, Object> = JSON.parse(allJson) as Record<string, Object>;
    const keys: string[] = Object.keys(parsed);
    let deletedCount: number = 0;
    for (let i: number = 0; i < keys.length; i++) {
      if (keys[i].indexOf(prefix) === 0) {
        await this.getInstance().delete(keys[i]);
        deletedCount++;
      }
    }
    this.deleteCount += deletedCount;
    return ResultText.ofArgs($r('app.string.result_prefs_delete_by_prefix'), [prefix, deletedCount],
      `deleteByPrefix('${prefix}'): ${deletedCount} keys deleted`);
  }

  async countByPrefix(prefix: string): Promise<string> {
    if (!DataValidator.isValidKey(prefix)) {
      return ResultText.of($r('app.string.result_prefs_count_by_prefix_invalid'),
        'countByPrefix failed: invalid prefix');
    }
    const allData: lang.ISendable = await this.getInstance().getAll();
    const allJson: string = JSON.stringify(allData);
    const parsed: Record<string, Object> = JSON.parse(allJson) as Record<string, Object>;
    const keys: string[] = Object.keys(parsed);
    let count: number = 0;
    for (let i: number = 0; i < keys.length; i++) {
      if (keys[i].indexOf(prefix) === 0) {
        count++;
      }
    }
    this.readCount++;
    this.lastAccessTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_count_by_prefix'), [prefix, count],
      `countByPrefix('${prefix}'): ${count}`);
  }

  getKeysByPrefixSync(prefix: string): string {
    if (!DataValidator.isValidKey(prefix)) {
      return ResultText.of($r('app.string.result_prefs_keys_by_prefix_sync_invalid'),
        'getKeysByPrefixSync failed: invalid prefix');
    }
    const allData: lang.ISendable = this.getInstance().getAllSync();
    const allJson: string = JSON.stringify(allData);
    const allKeys: string[] = [];
    const parsed: Record<string, Object> = JSON.parse(allJson) as Record<string, Object>;
    const keys: string[] = Object.keys(parsed);
    for (let i: number = 0; i < keys.length; i++) {
      if (keys[i].indexOf(prefix) === 0) {
        allKeys.push(keys[i]);
      }
    }
    this.readCount++;
    this.lastAccessTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_keys_by_prefix_sync'),
      [prefix, allKeys.join(', '), allKeys.length],
      `getKeysByPrefixSync('${prefix}'): [${allKeys.join(', ')}] (${allKeys.length} keys)`);
  }

  deleteByPrefixSync(prefix: string): string {
    if (!DataValidator.isValidKey(prefix)) {
      return ResultText.of($r('app.string.result_prefs_delete_by_prefix_sync_invalid'),
        'deleteByPrefixSync failed: invalid prefix');
    }
    const allData: lang.ISendable = this.getInstance().getAllSync();
    const allJson: string = JSON.stringify(allData);
    const parsed: Record<string, Object> = JSON.parse(allJson) as Record<string, Object>;
    const keys: string[] = Object.keys(parsed);
    let deletedCount: number = 0;
    for (let i: number = 0; i < keys.length; i++) {
      if (keys[i].indexOf(prefix) === 0) {
        this.getInstance().deleteSync(keys[i]);
        deletedCount++;
      }
    }
    this.deleteCount += deletedCount;
    return ResultText.ofArgs($r('app.string.result_prefs_delete_by_prefix_sync'), [prefix, deletedCount],
      `deleteByPrefixSync('${prefix}'): ${deletedCount} keys deleted`);
  }

  countByPrefixSync(prefix: string): string {
    if (!DataValidator.isValidKey(prefix)) {
      return ResultText.of($r('app.string.result_prefs_count_by_prefix_sync_invalid'),
        'countByPrefixSync failed: invalid prefix');
    }
    const allData: lang.ISendable = this.getInstance().getAllSync();
    const allJson: string = JSON.stringify(allData);
    const parsed: Record<string, Object> = JSON.parse(allJson) as Record<string, Object>;
    const keys: string[] = Object.keys(parsed);
    let count: number = 0;
    for (let i: number = 0; i < keys.length; i++) {
      if (keys[i].indexOf(prefix) === 0) {
        count++;
      }
    }
    this.readCount++;
    this.lastAccessTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_count_by_prefix_sync'), [prefix, count],
      `countByPrefixSync('${prefix}'): ${count}`);
  }

  async getStoreVersion(): Promise<string> {
    const version: lang.ISendable = await this.getInstance().get(VERSION_KEY, this.storeVersion);
    this.readCount++;
    this.lastAccessTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_get_store_version'), [JSON.stringify(version)],
      `getStoreVersion: ${JSON.stringify(version)}`);
  }

  async setStoreVersion(version: number): Promise<string> {
    if (!DataValidator.isValidVersion(version)) {
      return ResultText.of($r('app.string.result_prefs_set_store_version_invalid'),
        'setStoreVersion failed: invalid version');
    }
    await this.getInstance().put(VERSION_KEY, version);
    this.storeVersion = version;
    this.writeCount++;
    this.lastWriteTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_set_store_version_completed'), [version],
      `setStoreVersion completed: ${version}`);
  }

  getStoreVersionSync(): string {
    const version: lang.ISendable = this.getInstance().getSync(VERSION_KEY, this.storeVersion);
    this.readCount++;
    this.lastAccessTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_get_store_version_sync'), [JSON.stringify(version)],
      `getStoreVersionSync: ${JSON.stringify(version)}`);
  }

  setStoreVersionSync(version: number): string {
    if (!DataValidator.isValidVersion(version)) {
      return ResultText.of($r('app.string.result_prefs_set_store_version_sync_invalid'),
        'setStoreVersionSync failed: invalid version');
    }
    this.getInstance().putSync(VERSION_KEY, version);
    this.storeVersion = version;
    this.writeCount++;
    this.lastWriteTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_set_store_version_sync_completed'), [version],
      `setStoreVersionSync completed: ${version}`);
  }

  async getStoreInfo(): Promise<string> {
    const allData: lang.ISendable = await this.getInstance().getAll();
    const allJson: string = JSON.stringify(allData);
    const parsed: Record<string, Object> = JSON.parse(allJson) as Record<string, Object>;
    const keyCount: number = Object.keys(parsed).length;
    const version: lang.ISendable = await this.getInstance().get(VERSION_KEY, this.storeVersion);
    this.readCount += 2;
    this.lastAccessTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_store_info'),
      [STORE_NAME, keyCount, JSON.stringify(version), this.readCount, this.writeCount, this.deleteCount],
      `StoreInfo: name=${STORE_NAME}, keys=${keyCount}, version=${JSON.stringify(version)}, ` +
        `reads=${this.readCount}, writes=${this.writeCount}, deletes=${this.deleteCount}`);
  }

  getStoreInfoSync(): string {
    const allData: lang.ISendable = this.getInstance().getAllSync();
    const allJson: string = JSON.stringify(allData);
    const parsed: Record<string, Object> = JSON.parse(allJson) as Record<string, Object>;
    const keyCount: number = Object.keys(parsed).length;
    const version: lang.ISendable = this.getInstance().getSync(VERSION_KEY, this.storeVersion);
    this.readCount += 2;
    this.lastAccessTime = Date.now();
    return ResultText.ofArgs($r('app.string.result_prefs_store_info_sync'),
      [STORE_NAME, keyCount, JSON.stringify(version), this.readCount, this.writeCount, this.deleteCount],
      `StoreInfoSync: name=${STORE_NAME}, keys=${keyCount}, version=${JSON.stringify(version)}, ` +
        `reads=${this.readCount}, writes=${this.writeCount}, deletes=${this.deleteCount}`);
  }

  async reinitialize(): Promise<string> {
    this.unsubscribeAll();
    this.preferences = null;
    this.readCount = 0;
    this.writeCount = 0;
    this.deleteCount = 0;
    this.lastAccessTime = 0;
    this.lastWriteTime = 0;
    this.storeVersion = DataStoreConstants.STORE_VERSION_1;
    return await this.initialize();
  }

  reinitializeSync(): string {
    this.unsubscribeAll();
    this.preferences = null;
    this.readCount = 0;
    this.writeCount = 0;
    this.deleteCount = 0;
    this.lastAccessTime = 0;
    this.lastWriteTime = 0;
    this.storeVersion = DataStoreConstants.STORE_VERSION_1;
    return this.initializeSync();
  }

  isInitialized(): boolean {
    return this.preferences !== null;
  }

  getStatistics(): string {
    return ResultText.ofArgs($r('app.string.result_prefs_statistics'),
      [this.readCount, this.writeCount, this.deleteCount, this.lastAccessTime, this.lastWriteTime,
        String(this.isInitialized()), this.storeVersion],
      `Statistics: reads=${this.readCount}, writes=${this.writeCount}, ` +
        `deletes=${this.deleteCount}, lastAccess=${this.lastAccessTime}, ` +
        `lastWrite=${this.lastWriteTime}, initialized=${this.isInitialized()}, ` +
        `version=${this.storeVersion}`);
  }

  resetStatistics(): string {
    this.readCount = 0;
    this.writeCount = 0;
    this.deleteCount = 0;
    this.lastAccessTime = 0;
    this.lastWriteTime = 0;
    return ResultText.of($r('app.string.result_prefs_statistics_reset'), 'Statistics reset');
  }

  getReadCount(): number {
    return this.readCount;
  }

  getWriteCount(): number {
    return this.writeCount;
  }

  getDeleteCount(): number {
    return this.deleteCount;
  }

  getLastAccessTime(): number {
    return this.lastAccessTime;
  }

  getLastWriteTime(): number {
    return this.lastWriteTime;
  }

  getCurrentVersion(): number {
    return this.storeVersion;
  }

  private getInstance(): sendablePreferences.Preferences {
    if (this.preferences === null) {
      throw new Error('Initialize shared preferences first');
    }
    return this.preferences;
  }

  private unsubscribeAll(): void {
    if (this.preferences === null) {
      return;
    }
    if (this.changeSubscribed) {
      this.preferences.off('change', this.changeCallback);
      this.changeSubscribed = false;
    }
    if (this.multiProcessChangeSubscribed) {
      this.preferences.off('multiProcessChange', this.multiProcessChangeCallback);
      this.multiProcessChangeSubscribed = false;
    }
    if (this.dataChangeSubscribed) {
      this.preferences.off('dataChange', [SAMPLE_KEY], this.dataChangeCallback);
      this.dataChangeSubscribed = false;
    }
  }
}
