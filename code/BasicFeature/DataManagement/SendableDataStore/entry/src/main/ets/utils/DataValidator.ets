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

import { DataStoreConstants } from '../constants/DataStoreConstants';
import { DataType } from '../models/DataModels';

/**
 * DataValidator provides validation methods for keys, values, store names,
 * table names, indexes, and data integrity checks.
 */
export class DataValidator {
  static isString(value: Object | null): boolean {
    if (value === null) {
      return false;
    }
    return typeof value === 'string';
  }

  static isNumber(value: Object | null): boolean {
    if (value === null) {
      return false;
    }
    if (typeof value !== 'number') {
      return false;
    }
    return !Number.isNaN(value as number);
  }

  static isBoolean(value: Object | null): boolean {
    if (value === null) {
      return false;
    }
    return typeof value === 'boolean';
  }

  static isNull(value: Object | null): boolean {
    return value === null;
  }

  static isUndefined(value: Object | undefined): boolean {
    return value === undefined;
  }

  static isNullOrUndefined(value: Object | null | undefined): boolean {
    return value === null || value === undefined;
  }

  static isValidKey(key: string): boolean {
    if (key === null || key === undefined) {
      return false;
    }
    if (key.length === 0) {
      return false;
    }
    if (key.length > DataStoreConstants.MAX_KEY_LENGTH) {
      return false;
    }
    const invalidPattern = new RegExp('[\\x00-\\x1F]');
    if (invalidPattern.test(key)) {
      return false;
    }
    return true;
  }

  static isValidValue(value: string | number | boolean | null): boolean {
    if (value === null) {
      return true;
    }
    if (typeof value === 'string') {
      return value.length <= DataStoreConstants.MAX_VALUE_LENGTH;
    }
    if (typeof value === 'number') {
      return !Number.isNaN(value) && Number.isFinite(value);
    }
    if (typeof value === 'boolean') {
      return true;
    }
    return false;
  }

  static isValidIndex(index: number, max: number): boolean {
    if (!Number.isInteger(index)) {
      return false;
    }
    if (index < 0) {
      return false;
    }
    if (index >= max) {
      return false;
    }
    return true;
  }

  static isValidStoreName(name: string): boolean {
    if (name === null || name === undefined) {
      return false;
    }
    if (name.length === 0 || name.length > 64) {
      return false;
    }
    const validPattern = new RegExp('^[a-zA-Z][a-zA-Z0-9_]*$');
    return validPattern.test(name);
  }

  static isValidTableName(name: string): boolean {
    if (name === null || name === undefined) {
      return false;
    }
    if (name.length === 0 || name.length > 128) {
      return false;
    }
    const validPattern = new RegExp('^[a-zA-Z_][a-zA-Z0-9_]*$');
    return validPattern.test(name);
  }

  static isValidSQL(sql: string): boolean {
    if (sql === null || sql === undefined) {
      return false;
    }
    if (sql.length === 0) {
      return false;
    }
    const trimmed = sql.trim();
    const dangerousPatterns = [
      new RegExp('DROP\\s+DATABASE', 'i'),
      new RegExp('DROP\\s+TABLE', 'i'),
      new RegExp('ALTER\\s+DATABASE', 'i'),
      new RegExp('TRUNCATE', 'i')
    ];
    for (let i = 0; i < dangerousPatterns.length; i++) {
      if (dangerousPatterns[i].test(trimmed)) {
        return false;
      }
    }
    return true;
  }

  static isValidBatchSize(size: number): boolean {
    if (!Number.isInteger(size)) {
      return false;
    }
    if (size <= 0) {
      return false;
    }
    if (size > DataStoreConstants.MAX_BATCH_SIZE) {
      return false;
    }
    return true;
  }

  static isValidCapacity(capacity: number, max: number): boolean {
    if (!Number.isInteger(capacity)) {
      return false;
    }
    if (capacity <= 0) {
      return false;
    }
    if (capacity > max) {
      return false;
    }
    return true;
  }

  static isValidPriority(priority: number): boolean {
    if (!Number.isInteger(priority)) {
      return false;
    }
    return priority >= 0 && priority <= 10;
  }

  static isValidVersion(version: number): boolean {
    if (!Number.isInteger(version)) {
      return false;
    }
    return version >= 1;
  }

  static isValidTimestamp(timestamp: number): boolean {
    if (!Number.isFinite(timestamp)) {
      return false;
    }
    return timestamp > 0;
  }

  static isValidPort(port: number): boolean {
    if (!Number.isInteger(port)) {
      return false;
    }
    return port > 0 && port <= 65535;
  }

  static isValidDeviceId(deviceId: string): boolean {
    if (deviceId === null || deviceId === undefined) {
      return false;
    }
    if (deviceId.length === 0 || deviceId.length > 128) {
      return false;
    }
    const validPattern = new RegExp('^[a-zA-Z0-9_-]+$');
    return validPattern.test(deviceId);
  }

  static isValidEncryptionMode(mode: string): boolean {
    return mode === DataStoreConstants.ENCRYPTION_AES_128 ||
      mode === DataStoreConstants.ENCRYPTION_AES_256 ||
      mode === DataStoreConstants.ENCRYPTION_SM4;
  }

  static isValidHashAlgorithm(algorithm: string): boolean {
    return algorithm === DataStoreConstants.HASH_SHA256 ||
      algorithm === DataStoreConstants.HASH_SHA512 ||
      algorithm === DataStoreConstants.HASH_SM3;
  }

  static isValidSyncMode(mode: string): boolean {
    return mode === DataStoreConstants.SYNC_MODE_REAL_TIME ||
      mode === DataStoreConstants.SYNC_MODE_PERIODIC ||
      mode === DataStoreConstants.SYNC_MODE_MANUAL;
  }

  static isValidConflictPolicy(policy: string): boolean {
    return policy === DataStoreConstants.CONFLICT_POLICY_LOCAL_FIRST ||
      policy === DataStoreConstants.CONFLICT_POLICY_REMOTE_FIRST ||
      policy === DataStoreConstants.CONFLICT_POLICY_TIMESTAMP ||
      policy === DataStoreConstants.CONFLICT_POLICY_MERGE;
  }

  static isValidLogLevel(level: number): boolean {
    return level >= DataStoreConstants.LOG_LEVEL_DEBUG &&
      level <= DataStoreConstants.LOG_LEVEL_NONE;
  }

  static isValidSecurityLevel(level: string): boolean {
    return level === DataStoreConstants.SECURITY_LEVEL_S1 ||
      level === DataStoreConstants.SECURITY_LEVEL_S2 ||
      level === DataStoreConstants.SECURITY_LEVEL_S3 ||
      level === DataStoreConstants.SECURITY_LEVEL_S4;
  }

  static isValidDataType(type: string): boolean {
    return type === DataType.STRING ||
      type === DataType.NUMBER ||
      type === DataType.BOOLEAN ||
      type === DataType.OBJECT ||
      type === DataType.ARRAY ||
      type === DataType.NULL;
  }

  static isValidStoreType(type: string): boolean {
    return type === DataStoreConstants.STORE_TYPE_PREFERENCES ||
      type === DataStoreConstants.STORE_TYPE_RDB ||
      type === DataStoreConstants.STORE_TYPE_ARRAY ||
      type === DataStoreConstants.STORE_TYPE_MAP ||
      type === DataStoreConstants.STORE_TYPE_QUEUE ||
      type === DataStoreConstants.STORE_TYPE_RECORD;
  }

  static validateKeyRange(value: number, min: number, max: number): boolean {
    if (!Number.isFinite(value)) {
      return false;
    }
    return value >= min && value <= max;
  }

  static validateStringLength(value: string, min: number, max: number): boolean {
    if (value === null || value === undefined) {
      return false;
    }
    return value.length >= min && value.length <= max;
  }

  static validateArrayLength(length: number, max: number): boolean {
    if (!Number.isInteger(length)) {
      return false;
    }
    return length >= 0 && length <= max;
  }

  static validateMapSize(size: number, max: number): boolean {
    if (!Number.isInteger(size)) {
      return false;
    }
    return size >= 0 && size <= max;
  }

  static validateQueueCapacity(capacity: number, max: number): boolean {
    if (!Number.isInteger(capacity)) {
      return false;
    }
    return capacity > 0 && capacity <= max;
  }

  static validateRecordFields(fieldCount: number, max: number): boolean {
    if (!Number.isInteger(fieldCount)) {
      return false;
    }
    return fieldCount > 0 && fieldCount <= max;
  }
}
