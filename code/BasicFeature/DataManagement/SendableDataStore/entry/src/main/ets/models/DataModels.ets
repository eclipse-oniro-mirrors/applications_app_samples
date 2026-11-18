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
 * Data type enumeration for stored values.
 */
export enum DataType {
  STRING = 'string',
  NUMBER = 'number',
  BOOLEAN = 'boolean',
  OBJECT = 'object',
  ARRAY = 'array',
  NULL = 'null',
  UNDEFINED = 'undefined'
}

/**
 * Store type enumeration.
 */
export enum StoreType {
  PREFERENCES = 'preferences',
  RDB = 'rdb',
  ARRAY = 'array',
  MAP = 'map',
  QUEUE = 'queue',
  RECORD = 'record'
}

/**
 * Sync mode enumeration.
 */
export enum SyncMode {
  REAL_TIME = 'realTime',
  PERIODIC = 'periodic',
  MANUAL = 'manual'
}

/**
 * Encryption mode enumeration.
 */
export enum EncryptionMode {
  AES_128 = 'AES-128',
  AES_256 = 'AES-256',
  SM4 = 'SM4',
  NONE = 'NONE'
}

/**
 * Hash algorithm enumeration.
 */
export enum HashAlgorithm {
  SHA_256 = 'SHA-256',
  SHA_512 = 'SHA-512',
  SM3 = 'SM3'
}

/**
 * Conflict resolution policy enumeration.
 */
export enum ConflictPolicy {
  LOCAL_FIRST = 'localFirst',
  REMOTE_FIRST = 'remoteFirst',
  TIMESTAMP = 'timestamp',
  MERGE = 'merge'
}

/**
 * Migration status enumeration.
 */
export enum MigrationStatus {
  IDLE = 'idle',
  IN_PROGRESS = 'inProgress',
  COMPLETED = 'completed',
  FAILED = 'failed',
  ROLLED_BACK = 'rolledBack'
}

/**
 * Backup status enumeration.
 */
export enum BackupStatus {
  IDLE = 'idle',
  CREATING = 'creating',
  COMPLETED = 'completed',
  RESTORING = 'restoring',
  FAILED = 'failed'
}

/**
 * Log level enumeration.
 */
export enum LogLevel {
  DEBUG = 0,
  INFO = 1,
  WARN = 2,
  ERROR = 3,
  NONE = 4
}

/**
 * Security level enumeration.
 */
export enum SecurityLevel {
  S1 = 'S1',
  S2 = 'S2',
  S3 = 'S3',
  S4 = 'S4'
}

/**
 * Store configuration interface.
 */
export interface StoreConfig {
  name: string;
  storeType: StoreType;
  securityLevel: SecurityLevel;
  encryptionMode: EncryptionMode;
  autoBackup: boolean;
  maxRetries: number;
  syncMode: SyncMode;
  syncInterval: number;
  logLevel: LogLevel;
  debugMode: boolean;
}

/**
 * Data entry interface for key-value pairs.
 */
export interface DataEntry {
  key: string;
  value: string | number | boolean | null;
  dataType: DataType;
  timestamp: number;
  version: number;
}

/**
 * Migration step interface.
 */
export interface MigrationStep {
  fromVersion: number;
  toVersion: number;
  description: string;
  handler: () => Promise<boolean>;
}

/**
 * Backup information interface.
 */
export interface BackupInfo {
  name: string;
  createdAt: number;
  size: number;
  storeType: StoreType;
  entryCount: number;
  version: number;
  checksum: string;
  status: BackupStatus;
}

/**
 * Sync status interface.
 */
export interface SyncStatus {
  lastSyncTime: number;
  pendingChanges: number;
  syncedDevices: number;
  totalDevices: number;
  isSyncing: boolean;
  lastError: string;
}

/**
 * Encryption configuration interface.
 */
export interface EncryptionConfig {
  mode: EncryptionMode;
  keyLength: number;
  ivLength: number;
  hashAlgorithm: HashAlgorithm;
  autoEncrypt: boolean;
}

/**
 * Conflict record interface for distributed sync.
 */
export interface ConflictRecord {
  key: string;
  localValue: string;
  remoteValue: string;
  localTimestamp: number;
  remoteTimestamp: number;
  deviceId: string;
  resolved: boolean;
  resolution: ConflictPolicy;
}

/**
 * Performance metrics interface.
 */
export interface PerformanceMetrics {
  operationName: string;
  duration: number;
  timestamp: number;
  success: boolean;
  errorCode: number;
  memoryBefore: number;
  memoryAfter: number;
}

/**
 * Store statistics interface.
 */
export interface StoreStatistics {
  totalEntries: number;
  totalSize: number;
  lastAccessTime: number;
  lastWriteTime: number;
  readCount: number;
  writeCount: number;
  deleteCount: number;
  errorCount: number;
}

/**
 * Device information interface for distributed scenarios.
 */
export interface DeviceInfo {
  deviceId: string;
  deviceName: string;
  deviceType: string;
  isConnected: boolean;
  lastSeen: number;
  syncStatus: SyncStatus;
}

/**
 * Schema field definition interface.
 */
export interface SchemaField {
  name: string;
  dataType: DataType;
  required: boolean;
  defaultValue: string | number | boolean | null;
  maxLength: number;
  min: number;
  max: number;
}

/**
 * Table schema interface for RDB operations.
 */
export interface TableSchema {
  tableName: string;
  fields: SchemaField[];
  primaryKeys: string[];
  indexes: string[];
}

/**
 * Result wrapper type for operations.
 */
export interface OperationResult {
  success: boolean;
  message: string;
  errorCode: number;
  data: string;
  timestamp: number;
}

/**
 * Paginated result interface.
 */
export interface PaginatedResult {
  entries: DataEntry[];
  totalCount: number;
  pageIndex: number;
  pageSize: number;
  hasMore: boolean;
}

/**
 * Version history entry interface.
 */
export interface VersionEntry {
  version: number;
  appliedAt: number;
  description: string;
  success: boolean;
}

/**
 * Queue item interface.
 */
export interface QueueItem {
  id: string;
  data: string | number | boolean | null;
  priority: number;
  enqueuedAt: number;
  dataType: DataType;
}

/**
 * Record definition interface.
 */
export interface RecordDefinition {
  name: string;
  fields: SchemaField[];
  createdAt: number;
  updatedAt: number;
}

/**
 * Map entry interface.
 */
export interface MapEntry {
  key: string;
  value: string | number | boolean | null;
  dataType: DataType;
  updatedAt: number;
}

/**
 * Array metadata interface.
 */
export interface ArrayMetadata {
  capacity: number;
  length: number;
  dataType: DataType;
  createdAt: number;
  updatedAt: number;
}
