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
  private changeSubscribed = false;
  private multiProcessChangeSubscribed = false;
  private dataChangeSubscribed = false;
  private readCount = 0;
  private writeCount = 0;
  private deleteCount = 0;
  private lastAccessTime = 0;
  private lastWriteTime = 0;
  private storeVersion = DataStoreConstants.STORE_VERSION_1;

  constructor(context: common.UIAbilityContext, eventCallback: PreferencesEventCallback) {
    this.context = context;
    this.eventCallback = eventCallback;
    this.changeCallback = (key: string): void => {
      this.eventCallback(`change event: ${key}`);
    };
    this.multiProcessChangeCallback = (key: string): void => {
      this.eventCallback(`multiProcessChange event: ${key}`);
    };
    this.dataChangeCallback = (data: lang.ISendable): void => {
      this.eventCallback(`dataChange event: ${JSON.stringify(data)}`);
    };
  }

  async initialize(): Promise<string> {
    this.unsubscribeAll();
    this.preferences = await sendablePreferences.getPreferences(this.context, this.options);
    return 'getPreferences completed';
  }

  initializeSync(): string {
    this.unsubscribeAll();
    this.preferences = sendablePreferences.getPreferencesSync(this.context, this.options);
    return 'getPreferencesSync completed';
  }

  getLimits(): string {
    return `MAX_KEY_LENGTH=${sendablePreferences.MAX_KEY_LENGTH}, ` +
      `MAX_VALUE_LENGTH=${sendablePreferences.MAX_VALUE_LENGTH}`;
  }

  async putValue(): Promise<string> {
    await this.getInstance().put(SAMPLE_KEY, SAMPLE_VALUE);
    this.writeCount++;
    this.lastWriteTime = Date.now();
    return `put completed: ${SAMPLE_KEY}`;
  }

  putValueSync(): string {
    this.getInstance().putSync(SAMPLE_KEY, SAMPLE_VALUE);
    this.writeCount++;
    this.lastWriteTime = Date.now();
    return `putSync completed: ${SAMPLE_KEY}`;
  }

  async getValue(): Promise<string> {
    const value = await this.getInstance().get(SAMPLE_KEY, DEFAULT_VALUE);
    this.readCount++;
    this.lastAccessTime = Date.now();
    return `get: ${JSON.stringify(value)}`;
  }

  getValueSync(): string {
    const value = this.getInstance().getSync(SAMPLE_KEY, DEFAULT_VALUE);
    this.readCount++;
    this.lastAccessTime = Date.now();
    return `getSync: ${JSON.stringify(value)}`;
  }

  async getAllValues(): Promise<string> {
    const values = await this.getInstance().getAll();
    this.readCount++;
    this.lastAccessTime = Date.now();
    return `getAll: ${JSON.stringify(values)}`;
  }

  getAllValuesSync(): string {
    const values = this.getInstance().getAllSync();
    this.readCount++;
    this.lastAccessTime = Date.now();
    return `getAllSync: ${JSON.stringify(values)}`;
  }

  async hasValue(): Promise<string> {
    const result = await this.getInstance().has(SAMPLE_KEY);
    this.readCount++;
    this.lastAccessTime = Date.now();
    return `has: ${result}`;
  }

  hasValueSync(): string {
    const result = this.getInstance().hasSync(SAMPLE_KEY);
    this.readCount++;
    this.lastAccessTime = Date.now();
    return `hasSync: ${result}`;
  }

  async deleteValue(): Promise<string> {
    await this.getInstance().delete(SAMPLE_KEY);
    this.deleteCount++;
    return `delete completed: ${SAMPLE_KEY}`;
  }

  deleteValueSync(): string {
    this.getInstance().deleteSync(SAMPLE_KEY);
    this.deleteCount++;
    return `deleteSync completed: ${SAMPLE_KEY}`;
  }

  async flushValues(): Promise<string> {
    await this.getInstance().flush();
    return 'flush completed';
  }

  flushValuesSync(): string {
    this.getInstance().flushSync();
    return 'flushSync completed';
  }

  async clearValues(): Promise<string> {
    await this.getInstance().clear();
    return 'clear completed';
  }

  clearValuesSync(): string {
    this.getInstance().clearSync();
    return 'clearSync completed';
  }

  subscribeChange(): string {
    this.getInstance().on('change', this.changeCallback);
    this.changeSubscribed = true;
    return 'Subscribed to change';
  }

  unsubscribeChange(): string {
    this.getInstance().off('change', this.changeCallback);
    this.changeSubscribed = false;
    return 'Unsubscribed from change';
  }

  subscribeMultiProcessChange(): string {
    this.getInstance().on('multiProcessChange', this.multiProcessChangeCallback);
    this.multiProcessChangeSubscribed = true;
    return 'Subscribed to multiProcessChange';
  }

  unsubscribeMultiProcessChange(): string {
    this.getInstance().off('multiProcessChange', this.multiProcessChangeCallback);
    this.multiProcessChangeSubscribed = false;
    return 'Unsubscribed from multiProcessChange';
  }

  subscribeDataChange(): string {
    this.getInstance().on('dataChange', [SAMPLE_KEY], this.dataChangeCallback);
    this.dataChangeSubscribed = true;
    return 'Subscribed to dataChange';
  }

  unsubscribeDataChange(): string {
    this.getInstance().off('dataChange', [SAMPLE_KEY], this.dataChangeCallback);
    this.dataChangeSubscribed = false;
    return 'Unsubscribed from dataChange';
  }

  async removeFromCache(): Promise<string> {
    this.unsubscribeAll();
    await sendablePreferences.removePreferencesFromCache(this.context, this.options);
    this.preferences = null;
    return 'removePreferencesFromCache completed';
  }

  removeFromCacheSync(): string {
    this.unsubscribeAll();
    sendablePreferences.removePreferencesFromCacheSync(this.context, this.options);
    this.preferences = null;
    return 'removePreferencesFromCacheSync completed';
  }

  async deleteStore(): Promise<string> {
    this.unsubscribeAll();
    await sendablePreferences.deletePreferences(this.context, this.options);
    this.preferences = null;
    return 'deletePreferences completed';
  }

  release(): void {
    this.unsubscribeAll();
    if (this.preferences !== null) {
      sendablePreferences.removePreferencesFromCacheSync(this.context, this.options);
      this.preferences = null;
    }
  }

  async putMultiple(keys: string[], values: string[]): Promise<string> {
    const instance = this.getInstance();
    if (keys.length !== values.length) {
      return 'putMultiple failed: keys and values length mismatch';
    }
    if (keys.length > DataStoreConstants.MAX_BATCH_SIZE) {
      return `putMultiple failed: batch size ${keys.length} exceeds max ${DataStoreConstants.MAX_BATCH_SIZE}`;
    }
    let successCount = 0;
    for (let i = 0; i < keys.length; i++) {
      if (DataValidator.isValidKey(keys[i]) && DataValidator.isValidValue(values[i])) {
        await instance.put(keys[i], values[i]);
        successCount++;
      }
    }
    this.writeCount += successCount;
    this.lastWriteTime = Date.now();
    return `putMultiple completed: ${successCount}/${keys.length} keys written`;
  }

  async getMultiple(keys: string[]): Promise<string> {
    const instance = this.getInstance();
    if (keys.length > DataStoreConstants.MAX_BATCH_SIZE) {
      return `getMultiple failed: batch size ${keys.length} exceeds max ${DataStoreConstants.MAX_BATCH_SIZE}`;
    }
    const results: string[] = [];
    for (let i = 0; i < keys.length; i++) {
    if (DataValidator.isValidKey(keys[i])) {
        const value = await instance.get(keys[i], DEFAULT_VALUE);
        results.push(`${keys[i]}=${JSON.stringify(value)}`);
      }
    }
    this.readCount += results.length;
    this.lastAccessTime = Date.now();
    return `getMultiple: ${results.length}/${keys.length} keys read [${results.join(', ')}]`;
  }

  async deleteMultiple(keys: string[]): Promise<string> {
    const instance = this.getInstance();
    if (keys.length > DataStoreConstants.MAX_BATCH_SIZE) {
      return `deleteMultiple failed: batch size ${keys.length} exceeds max ${DataStoreConstants.MAX_BATCH_SIZE}`;
    }
    let successCount = 0;
    for (let i = 0; i < keys.length; i++) {
      if (DataValidator.isValidKey(keys[i])) {
        await instance.delete(keys[i]);
        successCount++;
      }
    }
    this.deleteCount += successCount;
    return `deleteMultiple completed: ${successCount}/${keys.length} keys deleted`;
  }

  async hasMultiple(keys: string[]): Promise<string> {
    const instance = this.getInstance();
    if (keys.length > DataStoreConstants.MAX_BATCH_SIZE) {
      return `hasMultiple failed: batch size ${keys.length} exceeds max ${DataStoreConstants.MAX_BATCH_SIZE}`;
    }
    const results: string[] = [];
    for (let i = 0; i < keys.length; i++) {
      if (DataValidator.isValidKey(keys[i])) {
        const exists = await instance.has(keys[i]);
        results.push(`${keys[i]}=${exists}`);
      }
    }
    this.readCount += results.length;
    this.lastAccessTime = Date.now();
    return `hasMultiple: [${results.join(', ')}]`;
  }

  putMultipleSync(keys: string[], values: string[]): string {
    const instance = this.getInstance();
    if (keys.length !== values.length) {
      return 'putMultipleSync failed: keys and values length mismatch';
    }
    if (keys.length > DataStoreConstants.MAX_BATCH_SIZE) {
      return `putMultipleSync failed: batch size exceeds max`;
    }
    let successCount = 0;
    for (let i = 0; i < keys.length; i++) {
      if (DataValidator.isValidKey(keys[i]) && DataValidator.isValidValue(values[i])) {
        instance.putSync(keys[i], values[i]);
        successCount++;
      }
    }
    this.writeCount += successCount;
    this.lastWriteTime = Date.now();
    return `putMultipleSync completed: ${successCount}/${keys.length} keys written`;
  }

  getMultipleSync(keys: string[]): string {
    const instance = this.getInstance();
    if (keys.length > DataStoreConstants.MAX_BATCH_SIZE) {
      return `getMultipleSync failed: batch size exceeds max`;
    }
    const results: string[] = [];
    for (let i = 0; i < keys.length; i++) {
      if (DataValidator.isValidKey(keys[i])) {
        const value = instance.getSync(keys[i], DEFAULT_VALUE);
        results.push(`${keys[i]}=${JSON.stringify(value)}`);
      }
    }
    this.readCount += results.length;
    this.lastAccessTime = Date.now();
    return `getMultipleSync: ${results.length}/${keys.length} keys read [${results.join(', ')}]`;
  }

  async putNumber(key: string, value: number): Promise<string> {
    if (!DataValidator.isValidKey(key)) {
      return 'putNumber failed: invalid key';
    }
    if (!DataValidator.isNumber(value)) {
      return 'putNumber failed: invalid number value';
    }
    await this.getInstance().put(key, value);
    this.writeCount++;
    this.lastWriteTime = Date.now();
    return `putNumber completed: ${key}=${value}`;
  }

  async getNumber(key: string, defaultValue: number): Promise<string> {
    if (!DataValidator.isValidKey(key)) {
      return 'getNumber failed: invalid key';
    }
    const value = await this.getInstance().get(key, defaultValue);
    this.readCount++;
    this.lastAccessTime = Date.now();
    return `getNumber: ${key}=${JSON.stringify(value)}`;
  }

  putNumberSync(key: string, value: number): string {
    if (!DataValidator.isValidKey(key) || !DataValidator.isNumber(value)) {
      return 'putNumberSync failed: invalid key or value';
    }
    this.getInstance().putSync(key, value);
    this.writeCount++;
    this.lastWriteTime = Date.now();
    return `putNumberSync completed: ${key}=${value}`;
  }

  getNumberSync(key: string, defaultValue: number): string {
    if (!DataValidator.isValidKey(key)) {
      return 'getNumberSync failed: invalid key';
    }
    const value = this.getInstance().getSync(key, defaultValue);
    this.readCount++;
    this.lastAccessTime = Date.now();
    return `getNumberSync: ${key}=${JSON.stringify(value)}`;
  }

  async putBoolean(key: string, value: boolean): Promise<string> {
    if (!DataValidator.isValidKey(key)) {
      return 'putBoolean failed: invalid key';
    }
    await this.getInstance().put(key, value);
    this.writeCount++;
    this.lastWriteTime = Date.now();
    return `putBoolean completed: ${key}=${value}`;
  }

  async getBoolean(key: string, defaultValue: boolean): Promise<string> {
    if (!DataValidator.isValidKey(key)) {
      return 'getBoolean failed: invalid key';
    }
    const value = await this.getInstance().get(key, defaultValue);
    this.readCount++;
    this.lastAccessTime = Date.now();
    return `getBoolean: ${key}=${JSON.stringify(value)}`;
  }

  putBooleanSync(key: string, value: boolean): string {
    if (!DataValidator.isValidKey(key)) {
      return 'putBooleanSync failed: invalid key';
    }
    this.getInstance().putSync(key, value);
    this.writeCount++;
    this.lastWriteTime = Date.now();
    return `putBooleanSync completed: ${key}=${value}`;
  }

  getBooleanSync(key: string, defaultValue: boolean): string {
    if (!DataValidator.isValidKey(key)) {
      return 'getBooleanSync failed: invalid key';
    }
    const value = this.getInstance().getSync(key, defaultValue);
    this.readCount++;
    this.lastAccessTime = Date.now();
    return `getBooleanSync: ${key}=${JSON.stringify(value)}`;
  }

  async putString(key: string, value: string): Promise<string> {
    if (!DataValidator.isValidKey(key)) {
      return 'putString failed: invalid key';
    }
    if (!DataValidator.isValidValue(value)) {
      return 'putString failed: value exceeds max length';
    }
    await this.getInstance().put(key, value);
    this.writeCount++;
    this.lastWriteTime = Date.now();
    return `putString completed: ${key}=${value}`;
  }

  async getString(key: string, defaultValue: string): Promise<string> {
    if (!DataValidator.isValidKey(key)) {
      return 'getString failed: invalid key';
    }
    const value = await this.getInstance().get(key, defaultValue);
    this.readCount++;
    this.lastAccessTime = Date.now();
    return `getString: ${key}=${JSON.stringify(value)}`;
  }

  putStringSync(key: string, value: string): string {
    if (!DataValidator.isValidKey(key) || !DataValidator.isValidValue(value)) {
      return 'putStringSync failed: invalid key or value';
    }
    this.getInstance().putSync(key, value);
    this.writeCount++;
    this.lastWriteTime = Date.now();
    return `putStringSync completed: ${key}=${value}`;
  }

  getStringSync(key: string, defaultValue: string): string {
    if (!DataValidator.isValidKey(key)) {
      return 'getStringSync failed: invalid key';
    }
    const value = this.getInstance().getSync(key, defaultValue);
    this.readCount++;
    this.lastAccessTime = Date.now();
    return `getStringSync: ${key}=${JSON.stringify(value)}`;
  }

  async putObject(key: string, value: string): Promise<string> {
    if (!DataValidator.isValidKey(key)) {
      return 'putObject failed: invalid key';
    }
    await this.getInstance().put(key, value);
    this.writeCount++;
    this.lastWriteTime = Date.now();
    return `putObject completed: ${key}`;
  }

  async getObject(key: string, defaultValue: string): Promise<string> {
    if (!DataValidator.isValidKey(key)) {
      return 'getObject failed: invalid key';
    }
    const value = await this.getInstance().get(key, defaultValue);
    this.readCount++;
    this.lastAccessTime = Date.now();
    return `getObject: ${key}=${JSON.stringify(value)}`;
  }

  putObjectSync(key: string, value: string): string {
    if (!DataValidator.isValidKey(key)) {
      return 'putObjectSync failed: invalid key';
    }
    this.getInstance().putSync(key, value);
    this.writeCount++;
    this.lastWriteTime = Date.now();
    return `putObjectSync completed: ${key}`;
  }

  getObjectSync(key: string, defaultValue: string): string {
    if (!DataValidator.isValidKey(key)) {
      return 'getObjectSync failed: invalid key';
    }
    const value = this.getInstance().getSync(key, defaultValue);
    this.readCount++;
    this.lastAccessTime = Date.now();
    return `getObjectSync: ${key}=${JSON.stringify(value)}`;
  }

  async getKeysByPrefix(prefix: string): Promise<string> {
    if (!DataValidator.isValidKey(prefix)) {
      return 'getKeysByPrefix failed: invalid prefix';
    }
    const allData = await this.getInstance().getAll();
    const allJson = JSON.stringify(allData);
    const allKeys: string[] = [];
    const parsed = JSON.parse(allJson) as Record<string, Object>;
    const keys = Object.keys(parsed);
    for (let i = 0; i < keys.length; i++) {
      if (keys[i].indexOf(prefix) === 0) {
        allKeys.push(keys[i]);
      }
    }
    this.readCount++;
    this.lastAccessTime = Date.now();
    return `getKeysByPrefix('${prefix}'): [${allKeys.join(', ')}] (${allKeys.length} keys)`;
  }

  async deleteByPrefix(prefix: string): Promise<string> {
    if (!DataValidator.isValidKey(prefix)) {
      return 'deleteByPrefix failed: invalid prefix';
    }
    const allData = await this.getInstance().getAll();
    const allJson = JSON.stringify(allData);
    const parsed = JSON.parse(allJson) as Record<string, Object>;
    const keys = Object.keys(parsed);
    let deletedCount = 0;
    for (let i = 0; i < keys.length; i++) {
      if (keys[i].indexOf(prefix) === 0) {
        await this.getInstance().delete(keys[i]);
        deletedCount++;
      }
    }
    this.deleteCount += deletedCount;
    return `deleteByPrefix('${prefix}'): ${deletedCount} keys deleted`;
  }

  async countByPrefix(prefix: string): Promise<string> {
    if (!DataValidator.isValidKey(prefix)) {
      return 'countByPrefix failed: invalid prefix';
    }
    const allData = await this.getInstance().getAll();
    const allJson = JSON.stringify(allData);
    const parsed = JSON.parse(allJson) as Record<string, Object>;
    const keys = Object.keys(parsed);
    let count = 0;
    for (let i = 0; i < keys.length; i++) {
      if (keys[i].indexOf(prefix) === 0) {
        count++;
      }
    }
    this.readCount++;
    this.lastAccessTime = Date.now();
    return `countByPrefix('${prefix}'): ${count}`;
  }

  getKeysByPrefixSync(prefix: string): string {
    if (!DataValidator.isValidKey(prefix)) {
      return 'getKeysByPrefixSync failed: invalid prefix';
    }
    const allData = this.getInstance().getAllSync();
    const allJson = JSON.stringify(allData);
    const allKeys: string[] = [];
    const parsed = JSON.parse(allJson) as Record<string, Object>;
    const keys = Object.keys(parsed);
    for (let i = 0; i < keys.length; i++) {
      if (keys[i].indexOf(prefix) === 0) {
        allKeys.push(keys[i]);
      }
    }
    this.readCount++;
    this.lastAccessTime = Date.now();
    return `getKeysByPrefixSync('${prefix}'): [${allKeys.join(', ')}] (${allKeys.length} keys)`;
  }

  deleteByPrefixSync(prefix: string): string {
    if (!DataValidator.isValidKey(prefix)) {
      return 'deleteByPrefixSync failed: invalid prefix';
    }
    const allData = this.getInstance().getAllSync();
    const allJson = JSON.stringify(allData);
    const parsed = JSON.parse(allJson) as Record<string, Object>;
    const keys = Object.keys(parsed);
    let deletedCount = 0;
    for (let i = 0; i < keys.length; i++) {
      if (keys[i].indexOf(prefix) === 0) {
        this.getInstance().deleteSync(keys[i]);
        deletedCount++;
      }
    }
    this.deleteCount += deletedCount;
    return `deleteByPrefixSync('${prefix}'): ${deletedCount} keys deleted`;
  }

  countByPrefixSync(prefix: string): string {
    if (!DataValidator.isValidKey(prefix)) {
      return 'countByPrefixSync failed: invalid prefix';
    }
    const allData = this.getInstance().getAllSync();
    const allJson = JSON.stringify(allData);
    const parsed = JSON.parse(allJson) as Record<string, Object>;
    const keys = Object.keys(parsed);
    let count = 0;
    for (let i = 0; i < keys.length; i++) {
      if (keys[i].indexOf(prefix) === 0) {
        count++;
      }
    }
    this.readCount++;
    this.lastAccessTime = Date.now();
    return `countByPrefixSync('${prefix}'): ${count}`;
  }

  async getStoreVersion(): Promise<string> {
    const version = await this.getInstance().get(VERSION_KEY, this.storeVersion);
    this.readCount++;
    this.lastAccessTime = Date.now();
    return `getStoreVersion: ${JSON.stringify(version)}`;
  }

  async setStoreVersion(version: number): Promise<string> {
    if (!DataValidator.isValidVersion(version)) {
      return 'setStoreVersion failed: invalid version';
    }
    await this.getInstance().put(VERSION_KEY, version);
    this.storeVersion = version;
    this.writeCount++;
    this.lastWriteTime = Date.now();
    return `setStoreVersion completed: ${version}`;
  }

  getStoreVersionSync(): string {
    const version = this.getInstance().getSync(VERSION_KEY, this.storeVersion);
    this.readCount++;
    this.lastAccessTime = Date.now();
    return `getStoreVersionSync: ${JSON.stringify(version)}`;
  }

  setStoreVersionSync(version: number): string {
    if (!DataValidator.isValidVersion(version)) {
      return 'setStoreVersionSync failed: invalid version';
    }
    this.getInstance().putSync(VERSION_KEY, version);
    this.storeVersion = version;
    this.writeCount++;
    this.lastWriteTime = Date.now();
    return `setStoreVersionSync completed: ${version}`;
  }

  async getStoreInfo(): Promise<string> {
    const allData = await this.getInstance().getAll();
    const allJson = JSON.stringify(allData);
    const parsed = JSON.parse(allJson) as Record<string, Object>;
    const keyCount = Object.keys(parsed).length;
    const version = await this.getInstance().get(VERSION_KEY, this.storeVersion);
    this.readCount += 2;
    this.lastAccessTime = Date.now();
    return `StoreInfo: name=${STORE_NAME}, keys=${keyCount}, version=${JSON.stringify(version)}, ` +
      `reads=${this.readCount}, writes=${this.writeCount}, deletes=${this.deleteCount}`;
  }

  getStoreInfoSync(): string {
    const allData = this.getInstance().getAllSync();
    const allJson = JSON.stringify(allData);
    const parsed = JSON.parse(allJson) as Record<string, Object>;
    const keyCount = Object.keys(parsed).length;
    const version = this.getInstance().getSync(VERSION_KEY, this.storeVersion);
    this.readCount += 2;
    this.lastAccessTime = Date.now();
    return `StoreInfoSync: name=${STORE_NAME}, keys=${keyCount}, version=${JSON.stringify(version)}, ` +
      `reads=${this.readCount}, writes=${this.writeCount}, deletes=${this.deleteCount}`;
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
    return `Statistics: reads=${this.readCount}, writes=${this.writeCount}, ` +
      `deletes=${this.deleteCount}, lastAccess=${this.lastAccessTime}, ` +
      `lastWrite=${this.lastWriteTime}, initialized=${this.isInitialized()}, ` +
      `version=${this.storeVersion}`;
  }

  resetStatistics(): string {
    this.readCount = 0;
    this.writeCount = 0;
    this.deleteCount = 0;
    this.lastAccessTime = 0;
    this.lastWriteTime = 0;
    return 'Statistics reset';
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
