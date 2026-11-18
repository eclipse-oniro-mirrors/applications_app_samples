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
  public static readonly DEFAULT_STORE_NAME: string = 'sendable_data_store';
  public static readonly DEFAULT_DB_NAME: string = 'SendableDataStore.db';
  public static readonly DEFAULT_TABLE_NAME: string = 'sendable_sample';

  public static readonly MAX_STORE_COUNT: number = 16;
  public static readonly MAX_KEY_LENGTH: number = 8192;
  public static readonly MAX_VALUE_LENGTH: number = 8192;
  public static readonly MAX_BATCH_SIZE: number = 200;
  public static readonly MAX_QUEUE_CAPACITY: number = 10000;
  public static readonly MAX_MAP_SIZE: number = 50000;
  public static readonly MAX_ARRAY_CAPACITY: number = 100000;
  public static readonly MAX_RECORD_FIELDS: number = 256;

  public static readonly ERROR_NOT_INITIALIZED: number = 10001;
  public static readonly ERROR_ALREADY_INITIALIZED: number = 10002;
  public static readonly ERROR_INVALID_KEY: number = 10003;
  public static readonly ERROR_INVALID_VALUE: number = 10004;
  public static readonly ERROR_STORE_FULL: number = 10005;
  public static readonly ERROR_TABLE_NOT_FOUND: number = 10006;
  public static readonly ERROR_NETWORK: number = 10007;
  public static readonly ERROR_ENCRYPTION: number = 10008;
  public static readonly ERROR_MIGRATION: number = 10009;
  public static readonly ERROR_BACKUP: number = 10010;
  public static readonly ERROR_CONFLICT: number = 10011;
  public static readonly ERROR_CAPACITY_EXCEEDED: number = 10012;
  public static readonly ERROR_INDEX_OUT_OF_BOUNDS: number = 10013;
  public static readonly ERROR_TYPE_MISMATCH: number = 10014;
  public static readonly ERROR_SCHEMA_MISMATCH: number = 10015;
  public static readonly ERROR_TRANSACTION: number = 10016;
  public static readonly ERROR_SQL_EXECUTION: number = 10017;
  public static readonly ERROR_DEVICE_OFFLINE: number = 10018;

  public static readonly EVENT_CHANGE: string = 'change';
  public static readonly EVENT_MULTI_PROCESS_CHANGE: string = 'multiProcessChange';
  public static readonly EVENT_DATA_CHANGE: string = 'dataChange';
  public static readonly EVENT_SYNC: string = 'sync';
  public static readonly EVENT_MIGRATION: string = 'migration';
  public static readonly EVENT_BACKUP: string = 'backup';
  public static readonly EVENT_ENCRYPTION: string = 'encryption';
  public static readonly EVENT_DEVICE_CONNECTED: string = 'deviceConnected';
  public static readonly EVENT_DEVICE_DISCONNECTED: string = 'deviceDisconnected';
  public static readonly EVENT_CONFLICT_RESOLVED: string = 'conflictResolved';

  public static readonly CONFIG_AUTO_BACKUP: string = 'autoBackup';
  public static readonly CONFIG_ENCRYPTION_MODE: string = 'encryptionMode';
  public static readonly CONFIG_SYNC_INTERVAL: string = 'syncInterval';
  public static readonly CONFIG_MAX_RETRIES: string = 'maxRetries';
  public static readonly CONFIG_LOG_LEVEL: string = 'logLevel';
  public static readonly CONFIG_DEBUG_MODE: string = 'debugMode';
  public static readonly CONFIG_BATCH_SIZE: string = 'batchSize';
  public static readonly CONFIG_CACHE_ENABLED: string = 'cacheEnabled';
  public static readonly CONFIG_MIGRATION_AUTO: string = 'migrationAuto';
  public static readonly CONFIG_CONFLICT_POLICY: string = 'conflictPolicy';

  public static readonly LOG_LEVEL_DEBUG: number = 0;
  public static readonly LOG_LEVEL_INFO: number = 1;
  public static readonly LOG_LEVEL_WARN: number = 2;
  public static readonly LOG_LEVEL_ERROR: number = 3;
  public static readonly LOG_LEVEL_NONE: number = 4;

  public static readonly STORE_VERSION_1: number = 1;
  public static readonly STORE_VERSION_2: number = 2;
  public static readonly STORE_VERSION_3: number = 3;
  public static readonly CURRENT_STORE_VERSION: number = 3;

  public static readonly SECURITY_LEVEL_S1: string = 'S1';
  public static readonly SECURITY_LEVEL_S2: string = 'S2';
  public static readonly SECURITY_LEVEL_S3: string = 'S3';
  public static readonly SECURITY_LEVEL_S4: string = 'S4';

  public static readonly ENCRYPTION_AES_128: string = 'AES-128';
  public static readonly ENCRYPTION_AES_256: string = 'AES-256';
  public static readonly ENCRYPTION_SM4: string = 'SM4';

  public static readonly HASH_SHA256: string = 'SHA-256';
  public static readonly HASH_SHA512: string = 'SHA-512';
  public static readonly HASH_SM3: string = 'SM3';

  public static readonly SYNC_MODE_REAL_TIME: string = 'realTime';
  public static readonly SYNC_MODE_PERIODIC: string = 'periodic';
  public static readonly SYNC_MODE_MANUAL: string = 'manual';

  public static readonly CONFLICT_POLICY_LOCAL_FIRST: string = 'localFirst';
  public static readonly CONFLICT_POLICY_REMOTE_FIRST: string = 'remoteFirst';
  public static readonly CONFLICT_POLICY_TIMESTAMP: string = 'timestamp';
  public static readonly CONFLICT_POLICY_MERGE: string = 'merge';

  public static readonly DATA_TYPE_STRING: string = 'string';
  public static readonly DATA_TYPE_NUMBER: string = 'number';
  public static readonly DATA_TYPE_BOOLEAN: string = 'boolean';
  public static readonly DATA_TYPE_OBJECT: string = 'object';
  public static readonly DATA_TYPE_ARRAY: string = 'array';
  public static readonly DATA_TYPE_NULL: string = 'null';

  public static readonly STORE_TYPE_PREFERENCES: string = 'preferences';
  public static readonly STORE_TYPE_RDB: string = 'rdb';
  public static readonly STORE_TYPE_ARRAY: string = 'array';
  public static readonly STORE_TYPE_MAP: string = 'map';
  public static readonly STORE_TYPE_QUEUE: string = 'queue';
  public static readonly STORE_TYPE_RECORD: string = 'record';

  public static readonly MIME_JSON: string = 'application/json';
  public static readonly MIME_TEXT: string = 'text/plain';
  public static readonly MIME_BINARY: string = 'application/octet-stream';

  public static readonly BACKUP_EXTENSION: string = '.sdbackup';
  public static readonly BACKUP_META_FILE: string = 'backup_meta.json';
  public static readonly MIGRATION_LOG_FILE: string = 'migration_log.json';

  public static readonly HILOG_DOMAIN: number = 0xF811;
  public static readonly HILOG_TAG: string = '[Sample_SendableDataStore]';
}
