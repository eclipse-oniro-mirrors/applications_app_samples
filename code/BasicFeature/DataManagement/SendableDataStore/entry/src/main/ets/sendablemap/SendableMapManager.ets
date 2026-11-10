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

import { DataValidator } from '../utils/DataValidator';
import { DataStoreConstants } from '../constants/DataStoreConstants';
import { MapEntry, DataType } from '../models/DataModels';
import { Logger } from '../utils/Logger';

const DEFAULT_MAP_CAPACITY: number = 64;

/**
 * SendableMapManager provides key-value map operations including creation,
 * CRUD, batch operations, traversal, filtering, and conversion utilities.
 */
export class SendableMapManager {
  private keys: string[] = [];
  private values: string[] = [];
  private dataTypes: DataType[] = [];
  private timestamps: number[] = [];
  private mapSize: number = 0;
  private createdAt: number = 0;
  private updatedAt: number = 0;
  private readCount: number = 0;
  private writeCount: number = 0;
  private deleteCount: number = 0;

  constructor() {
  }

  initialize(capacity: number): string {
    if (!DataValidator.isValidCapacity(capacity, DataStoreConstants.MAX_MAP_SIZE)) {
      return `initialize failed: invalid capacity ${capacity}`;
    }
    this.keys = [];
    this.values = [];
    this.dataTypes = [];
    this.timestamps = [];
    this.mapSize = 0;
    this.createdAt = Date.now();
    this.updatedAt = this.createdAt;
    return `Map initialized with capacity=${capacity}`;
  }

  putString(key: string, value: string): string {
    if (!DataValidator.isValidKey(key)) {
      return 'putString failed: invalid key';
    }
    const existIdx = this.findKeyIndex(key);
    if (existIdx >= 0) {
      this.values[existIdx] = value;
      this.dataTypes[existIdx] = DataType.STRING;
      this.timestamps[existIdx] = Date.now();
      this.writeCount++;
      this.updatedAt = Date.now();
      return `putString updated: ${key}=${value}`;
    }
    if (this.mapSize >= DataStoreConstants.MAX_MAP_SIZE) {
      return `putString failed: map is full (${this.mapSize}/${DataStoreConstants.MAX_MAP_SIZE})`;
    }
    this.keys.push(key);
    this.values.push(value);
    this.dataTypes.push(DataType.STRING);
    this.timestamps.push(Date.now());
    this.mapSize++;
    this.writeCount++;
    this.updatedAt = Date.now();
    return `putString completed: ${key}=${value}`;
  }

  putNumber(key: string, value: number): string {
    if (!DataValidator.isValidKey(key)) {
      return 'putNumber failed: invalid key';
    }
    if (!DataValidator.isNumber(value)) {
      return 'putNumber failed: invalid number value';
    }
    const valueStr = value.toString();
    const existIdx = this.findKeyIndex(key);
    if (existIdx >= 0) {
      this.values[existIdx] = valueStr;
      this.dataTypes[existIdx] = DataType.NUMBER;
      this.timestamps[existIdx] = Date.now();
      this.writeCount++;
      this.updatedAt = Date.now();
      return `putNumber updated: ${key}=${value}`;
    }
    if (this.mapSize >= DataStoreConstants.MAX_MAP_SIZE) {
      return `putNumber failed: map is full`;
    }
    this.keys.push(key);
    this.values.push(valueStr);
    this.dataTypes.push(DataType.NUMBER);
    this.timestamps.push(Date.now());
    this.mapSize++;
    this.writeCount++;
    this.updatedAt = Date.now();
    return `putNumber completed: ${key}=${value}`;
  }

  putBoolean(key: string, value: boolean): string {
    if (!DataValidator.isValidKey(key)) {
      return 'putBoolean failed: invalid key';
    }
    const valueStr = value ? 'true' : 'false';
    const existIdx = this.findKeyIndex(key);
    if (existIdx >= 0) {
      this.values[existIdx] = valueStr;
      this.dataTypes[existIdx] = DataType.BOOLEAN;
      this.timestamps[existIdx] = Date.now();
      this.writeCount++;
      this.updatedAt = Date.now();
      return `putBoolean updated: ${key}=${value}`;
    }
    if (this.mapSize >= DataStoreConstants.MAX_MAP_SIZE) {
      return `putBoolean failed: map is full`;
    }
    this.keys.push(key);
    this.values.push(valueStr);
    this.dataTypes.push(DataType.BOOLEAN);
    this.timestamps.push(Date.now());
    this.mapSize++;
    this.writeCount++;
    this.updatedAt = Date.now();
    return `putBoolean completed: ${key}=${value}`;
  }

  get(key: string): string {
    if (!DataValidator.isValidKey(key)) {
      return 'get failed: invalid key';
    }
    const idx = this.findKeyIndex(key);
    if (idx < 0) {
      return `get: key '${key}' not found`;
    }
    this.readCount++;
    this.updatedAt = Date.now();
    return `get('${key}'): value=${this.values[idx]}, type=${this.dataTypes[idx]}`;
  }

  getValue(key: string): string {
    if (!DataValidator.isValidKey(key)) {
      return '';
    }
    const idx = this.findKeyIndex(key);
    if (idx < 0) {
      return '';
    }
    this.readCount++;
    return this.values[idx];
  }

  getWithType(key: string): string {
    if (!DataValidator.isValidKey(key)) {
      return 'getWithType failed: invalid key';
    }
    const idx = this.findKeyIndex(key);
    if (idx < 0) {
      return `getWithType: key '${key}' not found`;
    }
    this.readCount++;
    return `getWithType('${key}'): {value=${this.values[idx]}, type=${this.dataTypes[idx]}, ts=${this.timestamps[idx]}}`;
  }

  remove(key: string): string {
    if (!DataValidator.isValidKey(key)) {
      return 'remove failed: invalid key';
    }
    const idx = this.findKeyIndex(key);
    if (idx < 0) {
      return `remove: key '${key}' not found`;
    }
    this.removeAtIndex(idx);
    this.deleteCount++;
    this.updatedAt = Date.now();
    return `remove completed: '${key}'`;
  }

  has(key: string): string {
    if (!DataValidator.isValidKey(key)) {
      return 'has failed: invalid key';
    }
    const found = this.findKeyIndex(key) >= 0;
    this.readCount++;
    return `has('${key}'): ${found}`;
  }

  hasKey(key: string): boolean {
    if (!DataValidator.isValidKey(key)) {
      return false;
    }
    return this.findKeyIndex(key) >= 0;
  }

  putAll(entries: MapEntry[]): string {
    if (entries.length === 0) {
      return 'putAll failed: empty entries';
    }
    if (entries.length > DataStoreConstants.MAX_BATCH_SIZE) {
      return `putAll failed: batch size ${entries.length} exceeds max`;
    }
    let successCount = 0;
    for (let i = 0; i < entries.length; i++) {
      const entry = entries[i];
      if (DataValidator.isValidKey(entry.key)) {
        const valueStr = entry.value !== null ? entry.value.toString() : 'null';
        const existIdx = this.findKeyIndex(entry.key);
        if (existIdx >= 0) {
          this.values[existIdx] = valueStr;
          this.dataTypes[existIdx] = entry.dataType;
          this.timestamps[existIdx] = Date.now();
        } else {
          if (this.mapSize < DataStoreConstants.MAX_MAP_SIZE) {
            this.keys.push(entry.key);
            this.values.push(valueStr);
            this.dataTypes.push(entry.dataType);
            this.timestamps.push(Date.now());
            this.mapSize++;
          }
        }
        successCount++;
      }
    }
    this.writeCount += successCount;
    this.updatedAt = Date.now();
    return `putAll completed: ${successCount}/${entries.length} entries`;
  }

  getAll(targetKeys: string[]): string {
    if (targetKeys.length === 0) {
      return 'getAll failed: empty keys';
    }
    const results: string[] = [];
    for (let i = 0; i < targetKeys.length; i++) {
      const idx = this.findKeyIndex(targetKeys[i]);
      if (idx >= 0) {
        results.push(`${targetKeys[i]}=${this.values[idx]}`);
      } else {
        results.push(`${targetKeys[i]}=NOT_FOUND`);
      }
    }
    this.readCount += targetKeys.length;
    return `getAll: [${results.join(', ')}]`;
  }

  removeAll(targetKeys: string[]): string {
    if (targetKeys.length === 0) {
      return 'removeAll failed: empty keys';
    }
    let removedCount = 0;
    for (let i = 0; i < targetKeys.length; i++) {
      const idx = this.findKeyIndex(targetKeys[i]);
      if (idx >= 0) {
        this.removeAtIndex(idx);
        removedCount++;
      }
    }
    this.deleteCount += removedCount;
    this.updatedAt = Date.now();
    return `removeAll completed: ${removedCount}/${targetKeys.length} keys removed`;
  }

  clear(): string {
    this.keys = [];
    this.values = [];
    this.dataTypes = [];
    this.timestamps = [];
    this.mapSize = 0;
    this.updatedAt = Date.now();
    return 'Map cleared';
  }

  allKeys(): string {
    this.readCount++;
    return `Keys: [${this.keys.join(', ')}] (${this.mapSize} keys)`;
  }

  allValues(): string {
    this.readCount++;
    return `Values: [${this.values.join(', ')}] (${this.mapSize} values)`;
  }

  allEntries(): string {
    this.readCount++;
    const entries: string[] = [];
    for (let i = 0; i < this.mapSize; i++) {
      entries.push(`{${this.keys[i]}:${this.values[i]}:${this.dataTypes[i]}}`);
    }
    return `Entries: [${entries.join(', ')}]`;
  }

  getKeysArray(): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.mapSize; i++) {
      result.push(this.keys[i]);
    }
    return result;
  }

  getValuesArray(): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.mapSize; i++) {
      result.push(this.values[i]);
    }
    return result;
  }

  filterByType(targetType: DataType): string {
    const result: string[] = [];
    for (let i = 0; i < this.mapSize; i++) {
      if (this.dataTypes[i] === targetType) {
        result.push(`${this.keys[i]}=${this.values[i]}`);
      }
    }
    this.readCount += this.mapSize;
    return `filterByType(${targetType}): [${result.join(', ')}] (${result.length} matches)`;
  }

  filterByKeyPrefix(prefix: string): string {
    if (!DataValidator.isValidKey(prefix)) {
      return 'filterByKeyPrefix failed: invalid prefix';
    }
    const result: string[] = [];
    for (let i = 0; i < this.mapSize; i++) {
      if (this.keys[i].indexOf(prefix) === 0) {
        result.push(`${this.keys[i]}=${this.values[i]}`);
      }
    }
    this.readCount += this.mapSize;
    return `filterByKeyPrefix('${prefix}'): [${result.join(', ')}] (${result.length} matches)`;
  }

  forEach(): string {
    const result: string[] = [];
    for (let i = 0; i < this.mapSize; i++) {
      result.push(`[${this.keys[i]}]=${this.values[i]}`);
    }
    this.readCount += this.mapSize;
    return `forEach: ${result.join(', ')}`;
  }

  toJSONObject(): string {
    const parts: string[] = [];
    for (let i = 0; i < this.mapSize; i++) {
      parts.push(`"${this.keys[i]}":"${this.values[i]}"`);
    }
    return `{${parts.join(',')}}`;
  }

  toJSONTyped(): string {
    const parts: string[] = [];
    for (let i = 0; i < this.mapSize; i++) {
      parts.push(`"${this.keys[i]}":{"value":"${this.values[i]}","type":"${this.dataTypes[i]}","ts":${this.timestamps[i]}}`);
    }
    return `{${parts.join(',')}}`;
  }

  getSize(): number {
    return this.mapSize;
  }

  getStatistics(): string {
    return `Map Statistics: size=${this.mapSize}, reads=${this.readCount}, ` +
      `writes=${this.writeCount}, deletes=${this.deleteCount}, ` +
      `createdAt=${this.createdAt}, updatedAt=${this.updatedAt}`;
  }

  resetStatistics(): string {
    this.readCount = 0;
    this.writeCount = 0;
    this.deleteCount = 0;
    return 'Map statistics reset';
  }

  isInitialized(): boolean {
    return this.createdAt > 0;
  }

  release(): void {
    this.keys = [];
    this.values = [];
    this.dataTypes = [];
    this.timestamps = [];
    this.mapSize = 0;
    this.createdAt = 0;
    this.updatedAt = 0;
    this.readCount = 0;
    this.writeCount = 0;
    this.deleteCount = 0;
    Logger.info('SendableMapManager released');
  }

  private findKeyIndex(key: string): number {
    for (let i = 0; i < this.mapSize; i++) {
      if (this.keys[i] === key) {
        return i;
      }
    }
    return -1;
  }

  private removeAtIndex(idx: number): void {
    const newKeys: string[] = [];
    const newValues: string[] = [];
    const newDataTypes: DataType[] = [];
    const newTimestamps: number[] = [];
    for (let i = 0; i < this.mapSize; i++) {
      if (i !== idx) {
        newKeys.push(this.keys[i]);
        newValues.push(this.values[i]);
        newDataTypes.push(this.dataTypes[i]);
        newTimestamps.push(this.timestamps[i]);
      }
    }
    this.keys = newKeys;
    this.values = newValues;
    this.dataTypes = newDataTypes;
    this.timestamps = newTimestamps;
    this.mapSize--;
  }
}
