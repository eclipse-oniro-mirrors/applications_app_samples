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

import { statfs, storageStatistics } from '@kit.CoreFileKit';
import { BusinessError } from '@kit.BasicServicesKit';

/** Identifies each storage operation exposed by the sample page. */
export enum StorageOperation {
  BUNDLE,
  FILESYSTEM_FREE,
  TOTAL,
  TOTAL_SYNC,
  FREE,
  FREE_SYNC
}

/** Abstracts the system storage APIs used by production workflows. */
export interface StorageQueryApi {
  getCurrentBundleStats(): Promise<storageStatistics.BundleStats>;
  getFilesystemFreeSize(path: string, callback: (error: BusinessError | undefined, bytes: number) => void): void;
  getTotalSize(): Promise<number>;
  getTotalSizeSync(): number;
  getFreeSize(): Promise<number>;
  getFreeSizeSync(): number;
}

/** Contains a validated, internally consistent storage snapshot. */
export interface StorageUsage {
  totalBytes: number;
  freeBytes: number;
  usedBytes: number;
  usedPercent: number;
}

/** Identifies invalid input or byte values returned by a storage API. */
export class InvalidStorageValueError extends Error {
  constructor(message: string) {
    super(message);
    this.name = 'InvalidStorageValueError';
  }
}

const BYTE_UNITS: string[] = ['B', 'KiB', 'MiB', 'GiB', 'TiB', 'PiB'];
const UNIT_BASE: number = 1024;

function requireByteCount(label: string, bytes: number): number {
  if (!Number.isSafeInteger(bytes) || bytes < 0) {
    throw new InvalidStorageValueError(`${label} must be a nonnegative safe integer`);
  }
  return bytes;
}

function requireFilesystemPath(path: string): string {
  const normalized: string = path.trim();
  if (normalized.length === 0) {
    throw new InvalidStorageValueError('Filesystem path must not be empty');
  }
  return normalized;
}

/** Delegates storage queries to the system Core File Kit. */
export class SystemStorageQuery implements StorageQueryApi {
  getCurrentBundleStats(): Promise<storageStatistics.BundleStats> {
    return storageStatistics.getCurrentBundleStats();
  }
  getFilesystemFreeSize(path: string, callback: (error: BusinessError | undefined, bytes: number) => void): void {
    statfs.getFreeSize(path, callback);
  }
  getTotalSize(): Promise<number> {
    return storageStatistics.getTotalSize();
  }
  getTotalSizeSync(): number {
    return storageStatistics.getTotalSizeSync();
  }
  getFreeSize(): Promise<number> {
    return storageStatistics.getFreeSize();
  }
  getFreeSizeSync(): number {
    return storageStatistics.getFreeSizeSync();
  }
}

/** Runs one storage operation and validates the returned byte count. */
export async function queryStorage(operation: StorageOperation, path: string,
  api: StorageQueryApi = new SystemStorageQuery()): Promise<number> {
  switch (operation) {
    case StorageOperation.BUNDLE:
      return requireByteCount('Bundle app size', (await api.getCurrentBundleStats()).appSize);
    case StorageOperation.FILESYSTEM_FREE:
      return new Promise<number>((resolve, reject) => {
        const requestPath: string = requireFilesystemPath(path);
        api.getFilesystemFreeSize(requestPath, (error: BusinessError | undefined, bytes: number): void => {
          if (error !== undefined) {
            reject(error);
            return;
          }
          try {
            resolve(requireByteCount('Filesystem free size', bytes));
          } catch (error) {
            reject(error);
          }
        });
      });
    case StorageOperation.TOTAL:
      return requireByteCount('Total size', await api.getTotalSize());
    case StorageOperation.TOTAL_SYNC:
      return requireByteCount('Total size', api.getTotalSizeSync());
    case StorageOperation.FREE:
      return requireByteCount('Free size', await api.getFreeSize());
    case StorageOperation.FREE_SYNC:
      return requireByteCount('Free size', api.getFreeSizeSync());
    default:
      throw new InvalidStorageValueError('Unsupported storage operation');
  }
}

/** Calculates used bytes and percentage from an independently validated snapshot. */
export function calculateStorageUsage(totalBytes: number, freeBytes: number): StorageUsage {
  const total: number = requireByteCount('Total size', totalBytes);
  const free: number = requireByteCount('Free size', freeBytes);
  if (free > total) {
    throw new InvalidStorageValueError('Free size must not exceed total size');
  }
  const used: number = total - free;
  const percent: number = total === 0 ? 0 : used * 100 / total;
  return { totalBytes: total, freeBytes: free, usedBytes: used, usedPercent: percent };
}

/** Queries total and free sizes and combines them into a validated usage snapshot. */
export async function queryStorageUsage(api: StorageQueryApi = new SystemStorageQuery()): Promise<StorageUsage> {
  const sizes: number[] = await Promise.all([
    queryStorage(StorageOperation.TOTAL, '', api),
    queryStorage(StorageOperation.FREE, '', api)
  ]);
  return calculateStorageUsage(sizes[0], sizes[1]);
}

/** Formats a byte count with binary units and bounded decimal precision. */
export function formatStorageSize(bytes: number, fractionDigits: number = 1): string {
  const value: number = requireByteCount('Storage size', bytes);
  if (!Number.isInteger(fractionDigits) || fractionDigits < 0 || fractionDigits > 3) {
    throw new InvalidStorageValueError('Fraction digits must be an integer from 0 through 3');
  }
  let unitIndex: number = 0;
  let scaled: number = value;
  while (scaled >= UNIT_BASE && unitIndex < BYTE_UNITS.length - 1) {
    scaled /= UNIT_BASE;
    unitIndex++;
  }
  return `${scaled.toFixed(unitIndex === 0 ? 0 : fractionDigits)} ${BYTE_UNITS[unitIndex]}`;
}
