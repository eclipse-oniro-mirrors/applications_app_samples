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

/**
 * DataStore constants for store names, error codes, event types, and configuration keys.
 */
export class DataStoreConstants {
  static readonly DEFAULT_STORE_NAME: string = 'sendable_data_store';
  static readonly DEFAULT_DB_NAME: string = 'SendableDataStore.db';
  static readonly DEFAULT_TABLE_NAME: string = 'sendable_sample';

  static readonly MAX_STORE_COUNT: number = 16;
  static readonly MAX_KEY_LENGTH: number = 8192;
  static readonly MAX_VALUE_LENGTH: number = 8192;
  static readonly MAX_BATCH_SIZE: number = 200;
  static readonly MAX_QUEUE_CAPACITY: number = 10000;
  static readonly MAX_MAP_SIZE: number = 50000;
  static readonly MAX_ARRAY_CAPACITY: number = 100000;
  static readonly MAX_RECORD_FIELDS: number = 256;

  static readonly ERROR_NOT_INITIALIZED: number = 10001;
  static readonly ERROR_ALREADY_INITIALIZED: number = 10002;
  static readonly ERROR_INVALID_KEY: number = 10003;
  static readonly ERROR_INVALID_VALUE: number = 10004;
  static readonly ERROR_STORE_FULL: number = 10005;
  static readonly ERROR_TABLE_NOT_FOUND: number = 10006;
  static readonly ERROR_NETWORK: number = 10007;
  static readonly ERROR_ENCRYPTION: number = 10008;
  static readonly ERROR_MIGRATION: number = 10009;
  static readonly ERROR_BACKUP: number = 10010;
  static readonly ERROR_CONFLICT: number = 10011;
  static readonly ERROR_CAPACITY_EXCEEDED: number = 10012;
  static readonly ERROR_INDEX_OUT_OF_BOUNDS: number = 10013;
  static readonly ERROR_TYPE_MISMATCH: number = 10014;
  static readonly ERROR_SCHEMA_MISMATCH: number = 10015;
  static readonly ERROR_TRANSACTION: number = 10016;
  static readonly ERROR_SQL_EXECUTION: number = 10017;
  static readonly ERROR_DEVICE_OFFLINE: number = 10018;

  static readonly EVENT_CHANGE: string = 'change';
  static readonly EVENT_MULTI_PROCESS_CHANGE: string = 'multiProcessChange';
  static readonly EVENT_DATA_CHANGE: string = 'dataChange';
  static readonly EVENT_SYNC: string = 'sync';
  static readonly EVENT_MIGRATION: string = 'migration';
  static readonly EVENT_BACKUP: string = 'backup';
  static readonly EVENT_ENCRYPTION: string = 'encryption';
  static readonly EVENT_DEVICE_CONNECTED: string = 'deviceConnected';
  static readonly EVENT_DEVICE_DISCONNECTED: string = 'deviceDisconnected';
  static readonly EVENT_CONFLICT_RESOLVED: string = 'conflictResolved';

  static readonly CONFIG_AUTO_BACKUP: string = 'autoBackup';
  static readonly CONFIG_ENCRYPTION_MODE: string = 'encryptionMode';
  static readonly CONFIG_SYNC_INTERVAL: string = 'syncInterval';
  static readonly CONFIG_MAX_RETRIES: string = 'maxRetries';
  static readonly CONFIG_LOG_LEVEL: string = 'logLevel';
  static readonly CONFIG_DEBUG_MODE: string = 'debugMode';
  static readonly CONFIG_BATCH_SIZE: string = 'batchSize';
  static readonly CONFIG_CACHE_ENABLED: string = 'cacheEnabled';
  static readonly CONFIG_MIGRATION_AUTO: string = 'migrationAuto';
  static readonly CONFIG_CONFLICT_POLICY: string = 'conflictPolicy';

  static readonly LOG_LEVEL_DEBUG: number = 0;
  static readonly LOG_LEVEL_INFO: number = 1;
  static readonly LOG_LEVEL_WARN: number = 2;
  static readonly LOG_LEVEL_ERROR: number = 3;
  static readonly LOG_LEVEL_NONE: number = 4;

  static readonly STORE_VERSION_1: number = 1;
  static readonly STORE_VERSION_2: number = 2;
  static readonly STORE_VERSION_3: number = 3;
  static readonly CURRENT_STORE_VERSION: number = 3;

  static readonly SECURITY_LEVEL_S1: string = 'S1';
  static readonly SECURITY_LEVEL_S2: string = 'S2';
  static readonly SECURITY_LEVEL_S3: string = 'S3';
  static readonly SECURITY_LEVEL_S4: string = 'S4';

  static readonly ENCRYPTION_AES_128: string = 'AES-128';
  static readonly ENCRYPTION_AES_256: string = 'AES-256';
  static readonly ENCRYPTION_SM4: string = 'SM4';

  static readonly HASH_SHA256: string = 'SHA-256';
  static readonly HASH_SHA512: string = 'SHA-512';
  static readonly HASH_SM3: string = 'SM3';

  static readonly SYNC_MODE_REAL_TIME: string = 'realTime';
  static readonly SYNC_MODE_PERIODIC: string = 'periodic';
  static readonly SYNC_MODE_MANUAL: string = 'manual';

  static readonly CONFLICT_POLICY_LOCAL_FIRST: string = 'localFirst';
  static readonly CONFLICT_POLICY_REMOTE_FIRST: string = 'remoteFirst';
  static readonly CONFLICT_POLICY_TIMESTAMP: string = 'timestamp';
  static readonly CONFLICT_POLICY_MERGE: string = 'merge';

  static readonly DATA_TYPE_STRING: string = 'string';
  static readonly DATA_TYPE_NUMBER: string = 'number';
  static readonly DATA_TYPE_BOOLEAN: string = 'boolean';
  static readonly DATA_TYPE_OBJECT: string = 'object';
  static readonly DATA_TYPE_ARRAY: string = 'array';
  static readonly DATA_TYPE_NULL: string = 'null';

  static readonly STORE_TYPE_PREFERENCES: string = 'preferences';
  static readonly STORE_TYPE_RDB: string = 'rdb';
  static readonly STORE_TYPE_ARRAY: string = 'array';
  static readonly STORE_TYPE_MAP: string = 'map';
  static readonly STORE_TYPE_QUEUE: string = 'queue';
  static readonly STORE_TYPE_RECORD: string = 'record';

  static readonly MIME_JSON: string = 'application/json';
  static readonly MIME_TEXT: string = 'text/plain';
  static readonly MIME_BINARY: string = 'application/octet-stream';

  static readonly BACKUP_EXTENSION: string = '.sdbackup';
  static readonly BACKUP_META_FILE: string = 'backup_meta.json';
  static readonly MIGRATION_LOG_FILE: string = 'migration_log.json';

  static readonly Hilog_DOMAIN: number = 0xF811;
  static readonly Hilog_TAG: string = '[Sample_SendableDataStore]';
}
