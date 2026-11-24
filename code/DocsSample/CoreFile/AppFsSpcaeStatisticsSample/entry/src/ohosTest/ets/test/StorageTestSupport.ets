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

import { storageStatistics } from '@kit.CoreFileKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { StorageQueryApi } from '../../../main/ets/model/StorageQuery';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_StorageLogic]';

export async function yieldTestLoop(): Promise<void> {
  await new Promise<void>((resolve: () => void): void => {
    setTimeout(resolve, 1);
  });
}

export function logCase(name: string, phase: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s %{public}s', name, phase);
}

export function logAssertion(name: string, label: string, actual: Object | undefined,
  expected: Object | undefined): void {
  hilog.info(DOMAIN, TAG, '%{public}s %{public}s actual=%{private}s expected=%{private}s',
    name, label, JSON.stringify(actual) ?? 'undefined', JSON.stringify(expected) ?? 'undefined');
}

export class DeferredBytes {
  promise: Promise<number>;
  private resolveValue: (value: number) => void = (): void => {};
  private rejectValue: (error: Error) => void = (): void => {};

  constructor() {
    this.promise = new Promise<number>((resolve, reject) => {
      this.resolveValue = resolve;
      this.rejectValue = reject;
    });
  }

  resolve(value: number): void {
    this.resolveValue(value);
  }

  reject(error: Error): void {
    this.rejectValue(error);
  }
}

export class StorageQueryProbe implements StorageQueryApi {
  events: string[] = [];
  bundleStats: storageStatistics.BundleStats = { appSize: 101, cacheSize: 3, dataSize: 4 };
  filesystemBytes: number = 202;
  totalBytes: number = 303;
  totalSyncBytes: number = 404;
  freeBytes: number = 505;
  freeSyncBytes: number = 606;
  bundleError: Error | undefined = undefined;
  filesystemError: BusinessError | undefined = undefined;
  filesystemThrow: Error | undefined = undefined;
  totalError: Error | undefined = undefined;
  totalSyncError: Error | undefined = undefined;
  freeError: Error | undefined = undefined;
  freeSyncError: Error | undefined = undefined;
  totalDeferred: DeferredBytes | undefined = undefined;
  freeDeferred: DeferredBytes | undefined = undefined;
  deferFilesystem: boolean = false;
  filesystemCallback: ((error: BusinessError | undefined, bytes: number) => void) | undefined = undefined;

  getCurrentBundleStats(): Promise<storageStatistics.BundleStats> {
    this.events.push('bundle');
    if (this.bundleError !== undefined) {
      return Promise.reject(this.bundleError);
    }
    return Promise.resolve(this.bundleStats);
  }

  getFilesystemFreeSize(path: string, callback: (error: BusinessError | undefined, bytes: number) => void): void {
    this.events.push(`filesystem:${path}`);
    if (this.filesystemThrow !== undefined) {
      throw this.filesystemThrow;
    }
    if (this.deferFilesystem) {
      this.filesystemCallback = callback;
      return;
    }
    callback(this.filesystemError, this.filesystemBytes);
  }

  completeFilesystem(error: BusinessError | undefined, bytes: number): void {
    const callback = this.filesystemCallback;
    if (callback === undefined) {
      throw new Error('Filesystem callback is not registered');
    }
    callback(error, bytes);
  }

  getTotalSize(): Promise<number> {
    this.events.push('total');
    if (this.totalError !== undefined) {
      return Promise.reject(this.totalError);
    }
    return this.totalDeferred === undefined ? Promise.resolve(this.totalBytes) : this.totalDeferred.promise;
  }

  getTotalSizeSync(): number {
    this.events.push('totalSync');
    if (this.totalSyncError !== undefined) {
      throw this.totalSyncError;
    }
    return this.totalSyncBytes;
  }

  getFreeSize(): Promise<number> {
    this.events.push('free');
    if (this.freeError !== undefined) {
      return Promise.reject(this.freeError);
    }
    return this.freeDeferred === undefined ? Promise.resolve(this.freeBytes) : this.freeDeferred.promise;
  }

  getFreeSizeSync(): number {
    this.events.push('freeSync');
    if (this.freeSyncError !== undefined) {
      throw this.freeSyncError;
    }
    return this.freeSyncBytes;
  }
}
