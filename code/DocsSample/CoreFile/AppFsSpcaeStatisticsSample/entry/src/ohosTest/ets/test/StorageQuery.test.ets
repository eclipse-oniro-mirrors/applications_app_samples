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

import { storageStatistics, statfs } from '@kit.CoreFileKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { describe, it, expect, beforeEach } from '@ohos/hypium';
import { logCase, logAssertion, yieldTestLoop } from './StorageTestSupport';
import {
  calculateStorageUsage,
  formatStorageSize,
  queryStorage,
  queryStorageUsage,
  StorageOperation,
  StorageQueryApi,
  StorageUsage
} from '../../../main/ets/model/StorageQuery';

class StorageApiProbe implements StorageQueryApi {
  events: string[] = [];
  filesystemBytes: number = 202;
  bundleBytes: number = 101;
  totalBytes: number = 303;
  totalSyncBytes: number = 404;
  freeBytes: number = 505;
  freeSyncBytes: number = 606;
  callbackError: BusinessError | undefined = undefined;
  asyncError: Error | undefined = undefined;
  syncError: Error | undefined = undefined;
  callback: ((error: BusinessError | undefined, bytes: number) => void) | undefined = undefined;
  deferCallback: boolean = false;

  getCurrentBundleStats(): Promise<storageStatistics.BundleStats> {
    this.events.push('bundle');
    if (this.asyncError !== undefined) {
      return Promise.reject(this.asyncError);
    }
    const stats: storageStatistics.BundleStats = { appSize: this.bundleBytes, cacheSize: 3, dataSize: 4 };
    return Promise.resolve(stats);
  }
  getFilesystemFreeSize(path: string, callback: (error: BusinessError | undefined, bytes: number) => void): void {
    this.events.push(`filesystem:${path}`);
    if (this.deferCallback) {
      this.callback = callback;
      return;
    }
    callback(this.callbackError, this.filesystemBytes);
  }
  getTotalSize(): Promise<number> {
    this.events.push('total');
    if (this.asyncError !== undefined) {
      return Promise.reject(this.asyncError);
    }
    return Promise.resolve(this.totalBytes);
  }
  getTotalSizeSync(): number {
    this.events.push('totalSync');
    if (this.syncError !== undefined) {
      throw this.syncError;
    }
    return this.totalSyncBytes;
  }
  getFreeSize(): Promise<number> {
    this.events.push('free');
    if (this.asyncError !== undefined) {
      return Promise.reject(this.asyncError);
    }
    return Promise.resolve(this.freeBytes);
  }
  getFreeSizeSync(): number {
    this.events.push('freeSync');
    if (this.syncError !== undefined) {
      throw this.syncError;
    }
    return this.freeSyncBytes;
  }
}

export default function storageQueryTest(): void {
  describe('StorageQueryBusiness', () => {
    beforeEach(yieldTestLoop);
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_BASELINE_0100
     * @tc.name AppFsSpace_Baseline_0001
     * @tc.desc Verify routes every page operation to its sdk dependency.
     */
    it('AppFsSpace_Baseline_0001', 0, async (): Promise<void> => {
      logCase('AppFsSpace_Baseline_0001', 'begin');
      try {
        const api: StorageApiProbe = new StorageApiProbe();
        const actual1: Object | undefined = await queryStorage(StorageOperation.BUNDLE, '/sandbox', api);
        logAssertion('AppFsSpace_Baseline_0001', 'observation 1', actual1, 101);
        expect(actual1).assertEqual(101);
        const actual2: Object | undefined = await queryStorage(StorageOperation.FILESYSTEM_FREE, '/sandbox', api);
        logAssertion('AppFsSpace_Baseline_0001', 'observation 2', actual2, 202);
        expect(actual2).assertEqual(202);
        const actual3: Object | undefined = await queryStorage(StorageOperation.TOTAL, '/sandbox', api);
        logAssertion('AppFsSpace_Baseline_0001', 'observation 3', actual3, 303);
        expect(actual3).assertEqual(303);
        const actual4: Object | undefined = await queryStorage(StorageOperation.TOTAL_SYNC, '/sandbox', api);
        logAssertion('AppFsSpace_Baseline_0001', 'observation 4', actual4, 404);
        expect(actual4).assertEqual(404);
        const actual5: Object | undefined = await queryStorage(StorageOperation.FREE, '/sandbox', api);
        logAssertion('AppFsSpace_Baseline_0001', 'observation 5', actual5, 505);
        expect(actual5).assertEqual(505);
        const actual6: Object | undefined = await queryStorage(StorageOperation.FREE_SYNC, '/sandbox', api);
        logAssertion('AppFsSpace_Baseline_0001', 'observation 6', actual6, 606);
        expect(actual6).assertEqual(606);
        const actual7: Object | undefined = api.events.join(',');
        logAssertion('AppFsSpace_Baseline_0001', 'observation 7',
          actual7, 'bundle,filesystem:/sandbox,total,totalSync,free,freeSync');
        expect(actual7).assertEqual('bundle,filesystem:/sandbox,total,totalSync,free,freeSync');
      } finally {
        logCase('AppFsSpace_Baseline_0001', 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_BASELINE_0200
     * @tc.name AppFsSpace_Baseline_0002
     * @tc.desc Verify zero free bytes is a valid result.
     */
    it('AppFsSpace_Baseline_0002', 0, async (): Promise<void> => {
      logCase('AppFsSpace_Baseline_0002', 'begin');
      try {
        const api: StorageApiProbe = new StorageApiProbe();
        api.filesystemBytes = 0;
        const actual1: Object | undefined = await queryStorage(StorageOperation.FILESYSTEM_FREE, '/sandbox/测试', api);
        logAssertion('AppFsSpace_Baseline_0002', 'observation 1', actual1, 0);
        expect(actual1).assertEqual(0);
        const actual2: Object | undefined = api.events.join(',');
        logAssertion('AppFsSpace_Baseline_0002', 'observation 2', actual2, 'filesystem:/sandbox/测试');
        expect(actual2).assertEqual('filesystem:/sandbox/测试');
      } finally {
        logCase('AppFsSpace_Baseline_0002', 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_BASELINE_0300
     * @tc.name AppFsSpace_Baseline_0003
     * @tc.desc Verify callback error wins over accompanying byte value.
     */
    it('AppFsSpace_Baseline_0003', 0, async (): Promise<void> => {
      logCase('AppFsSpace_Baseline_0003', 'begin');
      try {
        const api: StorageApiProbe = new StorageApiProbe();
        api.callbackError = { name: 'BusinessError', code: 13900002, message: 'No such file' };
        let code: number = 0;
        try {
          await queryStorage(StorageOperation.FILESYSTEM_FREE, '/missing', api);
        } catch (error) {
          code = (error as BusinessError).code;
        }
        const actual1: Object | undefined = code;
        logAssertion('AppFsSpace_Baseline_0003', 'observation 1', actual1, 13900002);
        expect(actual1).assertEqual(13900002);
        const actual2: Object | undefined = api.events.join(',');
        logAssertion('AppFsSpace_Baseline_0003', 'observation 2', actual2, 'filesystem:/missing');
        expect(actual2).assertEqual('filesystem:/missing');
      } finally {
        logCase('AppFsSpace_Baseline_0003', 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_BASELINE_0400
     * @tc.name AppFsSpace_Baseline_0004
     * @tc.desc Verify does not complete before sdk callback.
     */
    it('AppFsSpace_Baseline_0004', 0, async (): Promise<void> => {
      logCase('AppFsSpace_Baseline_0004', 'begin');
      try {
        const api: StorageApiProbe = new StorageApiProbe();
        api.deferCallback = true;
        let completed: boolean = false;
        const pending: Promise<number> = queryStorage(StorageOperation.FILESYSTEM_FREE, '/sandbox', api)
          .then((bytes: number): number => {
            completed = true;
            return bytes;
          });
        await Promise.resolve();
        const actual1: Object | undefined = completed;
        logAssertion('AppFsSpace_Baseline_0004', 'observation 1', actual1, false);
        expect(actual1).assertEqual(false);
        if (api.callback !== undefined) {
          api.callback(undefined, 77);
        }
        const actual2: Object | undefined = await pending;
        logAssertion('AppFsSpace_Baseline_0004', 'observation 2', actual2, 77);
        expect(actual2).assertEqual(77);
        const actual3: Object | undefined = completed;
        logAssertion('AppFsSpace_Baseline_0004', 'observation 3', actual3, true);
        expect(actual3).assertEqual(true);
      } finally {
        logCase('AppFsSpace_Baseline_0004', 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_BASELINE_0500
     * @tc.name AppFsSpace_Baseline_0005
     * @tc.desc Verify synchronous sdk failure rejects the workflow.
     */
    it('AppFsSpace_Baseline_0005', 0, async (): Promise<void> => {
      logCase('AppFsSpace_Baseline_0005', 'begin');
      try {
        const api: StorageApiProbe = new StorageApiProbe();
        api.syncError = new Error('storage unavailable');
        let message: string = '';
        try {
          await queryStorage(StorageOperation.TOTAL_SYNC, '', api);
        } catch (error) {
          message = (error as Error).message;
        }
        const actual1: Object | undefined = message;
        logAssertion('AppFsSpace_Baseline_0005', 'observation 1', actual1, 'storage unavailable');
        expect(actual1).assertEqual('storage unavailable');
        const actual2: Object | undefined = api.events.join(',');
        logAssertion('AppFsSpace_Baseline_0005', 'observation 2', actual2, 'totalSync');
        expect(actual2).assertEqual('totalSync');
      } finally {
        logCase('AppFsSpace_Baseline_0005', 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_BASELINE_0600
     * @tc.name AppFsSpace_Baseline_0006
     * @tc.desc Verify unsupported operation makes no sdk calls.
     */
    it('AppFsSpace_Baseline_0006', 0, async (): Promise<void> => {
      logCase('AppFsSpace_Baseline_0006', 'begin');
      try {
        const api: StorageApiProbe = new StorageApiProbe();
        let message: string = '';
        try {
          await queryStorage(-1 as StorageOperation, '', api);
        } catch (error) {
          message = (error as Error).message;
        }
        const actual1: Object | undefined = message;
        logAssertion('AppFsSpace_Baseline_0006', 'observation 1', actual1, 'Unsupported storage operation');
        expect(actual1).assertEqual('Unsupported storage operation');
        const actual2: Object | undefined = api.events.length;
        logAssertion('AppFsSpace_Baseline_0006', 'observation 2', actual2, 0);
        expect(actual2).assertEqual(0);
      } finally {
        logCase('AppFsSpace_Baseline_0006', 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_BASELINE_0700
     * @tc.name AppFsSpace_Baseline_0007
     * @tc.desc Verify filesystem path is trimmed before sdk call.
     */
    it('AppFsSpace_Baseline_0007', 0, async (): Promise<void> => {
      logCase('AppFsSpace_Baseline_0007', 'begin');
      try {
        const api: StorageApiProbe = new StorageApiProbe();
        const actual1: Object | undefined =
          await queryStorage(StorageOperation.FILESYSTEM_FREE, '  /sandbox/files  ', api);
        logAssertion('AppFsSpace_Baseline_0007', 'observation 1', actual1, 202);
        expect(actual1).assertEqual(202);
        const actual2: Object | undefined = api.events.join(',');
        logAssertion('AppFsSpace_Baseline_0007', 'observation 2', actual2, 'filesystem:/sandbox/files');
        expect(actual2).assertEqual('filesystem:/sandbox/files');
      } finally {
        logCase('AppFsSpace_Baseline_0007', 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_BASELINE_0800
     * @tc.name AppFsSpace_Baseline_0008
     * @tc.desc Verify empty filesystem path fails without sdk call.
     */
    it('AppFsSpace_Baseline_0008', 0, async (): Promise<void> => {
      logCase('AppFsSpace_Baseline_0008', 'begin');
      try {
        const api: StorageApiProbe = new StorageApiProbe();
        let message: string = '';
        try {
          await queryStorage(StorageOperation.FILESYSTEM_FREE, ' \t ', api);
        } catch (error) {
          message = (error as Error).message;
        }
        const actual1: Object | undefined = message;
        logAssertion('AppFsSpace_Baseline_0008', 'observation 1', actual1, 'Filesystem path must not be empty');
        expect(actual1).assertEqual('Filesystem path must not be empty');
        const actual2: Object | undefined = api.events.length;
        logAssertion('AppFsSpace_Baseline_0008', 'observation 2', actual2, 0);
        expect(actual2).assertEqual(0);
      } finally {
        logCase('AppFsSpace_Baseline_0008', 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_BASELINE_0900
     * @tc.name AppFsSpace_Baseline_0009
     * @tc.desc Verify negative sdk byte count is rejected.
     */
    it('AppFsSpace_Baseline_0009', 0, async (): Promise<void> => {
      logCase('AppFsSpace_Baseline_0009', 'begin');
      try {
        const api: StorageApiProbe = new StorageApiProbe();
        api.filesystemBytes = -1;
        let errorName: string = '';
        try {
          await queryStorage(StorageOperation.FILESYSTEM_FREE, '/sandbox', api);
        } catch (error) {
          errorName = (error as Error).name;
        }
        const actual1: Object | undefined = errorName;
        logAssertion('AppFsSpace_Baseline_0009', 'observation 1', actual1, 'InvalidStorageValueError');
        expect(actual1).assertEqual('InvalidStorageValueError');
        const actual2: Object | undefined = api.events.join(',');
        logAssertion('AppFsSpace_Baseline_0009', 'observation 2', actual2, 'filesystem:/sandbox');
        expect(actual2).assertEqual('filesystem:/sandbox');
      } finally {
        logCase('AppFsSpace_Baseline_0009', 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_BASELINE_1000
     * @tc.name AppFsSpace_Baseline_0010
     * @tc.desc Verify fractional and unsafe sdk values are rejected.
     */
    it('AppFsSpace_Baseline_0010', 0, async (): Promise<void> => {
      logCase('AppFsSpace_Baseline_0010', 'begin');
      try {
        const fractional: StorageApiProbe = new StorageApiProbe();
        fractional.totalBytes = 1.5;
        const unsafe: StorageApiProbe = new StorageApiProbe();
        unsafe.freeSyncBytes = Number.MAX_SAFE_INTEGER + 1;
        let fractionalError: string = '';
        let unsafeError: string = '';
        try {
          await queryStorage(StorageOperation.TOTAL, '', fractional);
        } catch (error) {
          fractionalError = (error as Error).name;
        }
        try {
          await queryStorage(StorageOperation.FREE_SYNC, '', unsafe);
        } catch (error) {
          unsafeError = (error as Error).name;
        }
        const actual1: Object | undefined = fractionalError;
        logAssertion('AppFsSpace_Baseline_0010', 'observation 1', actual1, 'InvalidStorageValueError');
        expect(actual1).assertEqual('InvalidStorageValueError');
        const actual2: Object | undefined = unsafeError;
        logAssertion('AppFsSpace_Baseline_0010', 'observation 2', actual2, 'InvalidStorageValueError');
        expect(actual2).assertEqual('InvalidStorageValueError');
      } finally {
        logCase('AppFsSpace_Baseline_0010', 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_BASELINE_1100
     * @tc.name AppFsSpace_Baseline_0011
     * @tc.desc Verify async sdk error propagates from total query.
     */
    it('AppFsSpace_Baseline_0011', 0, async (): Promise<void> => {
      logCase('AppFsSpace_Baseline_0011', 'begin');
      try {
        const api: StorageApiProbe = new StorageApiProbe();
        api.asyncError = new Error('statistics unavailable');
        let message: string = '';
        try {
          await queryStorage(StorageOperation.TOTAL, '', api);
        } catch (error) {
          message = (error as Error).message;
        }
        const actual1: Object | undefined = message;
        logAssertion('AppFsSpace_Baseline_0011', 'observation 1', actual1, 'statistics unavailable');
        expect(actual1).assertEqual('statistics unavailable');
        const actual2: Object | undefined = api.events.join(',');
        logAssertion('AppFsSpace_Baseline_0011', 'observation 2', actual2, 'total');
        expect(actual2).assertEqual('total');
      } finally {
        logCase('AppFsSpace_Baseline_0011', 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_BASELINE_1200
     * @tc.name AppFsSpace_Baseline_0012
     * @tc.desc Verify usage calculates exact byte and percentage values.
     */
    it('AppFsSpace_Baseline_0012', 0, (): void => {
      logCase('AppFsSpace_Baseline_0012', 'begin');
      try {
        const usage: StorageUsage = calculateStorageUsage(1000, 250);
        const actual1: Object | undefined = usage.totalBytes;
        logAssertion('AppFsSpace_Baseline_0012', 'observation 1', actual1, 1000);
        expect(actual1).assertEqual(1000);
        const actual2: Object | undefined = usage.freeBytes;
        logAssertion('AppFsSpace_Baseline_0012', 'observation 2', actual2, 250);
        expect(actual2).assertEqual(250);
        const actual3: Object | undefined = usage.usedBytes;
        logAssertion('AppFsSpace_Baseline_0012', 'observation 3', actual3, 750);
        expect(actual3).assertEqual(750);
        const actual4: Object | undefined = usage.usedPercent;
        logAssertion('AppFsSpace_Baseline_0012', 'observation 4', actual4, 75);
        expect(actual4).assertEqual(75);
      } finally {
        logCase('AppFsSpace_Baseline_0012', 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_BASELINE_1300
     * @tc.name AppFsSpace_Baseline_0013
     * @tc.desc Verify empty device usage has zero percent.
     */
    it('AppFsSpace_Baseline_0013', 0, (): void => {
      logCase('AppFsSpace_Baseline_0013', 'begin');
      try {
        const usage: StorageUsage = calculateStorageUsage(0, 0);
        const actual1: Object | undefined = usage.usedBytes;
        logAssertion('AppFsSpace_Baseline_0013', 'observation 1', actual1, 0);
        expect(actual1).assertEqual(0);
        const actual2: Object | undefined = usage.usedPercent;
        logAssertion('AppFsSpace_Baseline_0013', 'observation 2', actual2, 0);
        expect(actual2).assertEqual(0);
      } finally {
        logCase('AppFsSpace_Baseline_0013', 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_BASELINE_1400
     * @tc.name AppFsSpace_Baseline_0014
     * @tc.desc Verify free space cannot exceed total space.
     */
    it('AppFsSpace_Baseline_0014', 0, (): void => {
      logCase('AppFsSpace_Baseline_0014', 'begin');
      try {
        let message: string = '';
        try {
          calculateStorageUsage(10, 11);
        } catch (error) {
          message = (error as Error).message;
        }
        const actual1: Object | undefined = message;
        logAssertion('AppFsSpace_Baseline_0014', 'observation 1', actual1, 'Free size must not exceed total size');
        expect(actual1).assertEqual('Free size must not exceed total size');
      } finally {
        logCase('AppFsSpace_Baseline_0014', 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_BASELINE_1500
     * @tc.name AppFsSpace_Baseline_0015
     * @tc.desc Verify usage query calls production queries and combines results.
     */
    it('AppFsSpace_Baseline_0015', 0, async (): Promise<void> => {
      logCase('AppFsSpace_Baseline_0015', 'begin');
      try {
        const api: StorageApiProbe = new StorageApiProbe();
        api.totalBytes = 4096;
        api.freeBytes = 1024;
        const usage: StorageUsage = await queryStorageUsage(api);
        const actual1: Object | undefined = usage.usedBytes;
        logAssertion('AppFsSpace_Baseline_0015', 'observation 1', actual1, 3072);
        expect(actual1).assertEqual(3072);
        const actual2: Object | undefined = usage.usedPercent;
        logAssertion('AppFsSpace_Baseline_0015', 'observation 2', actual2, 75);
        expect(actual2).assertEqual(75);
        const actual3: Object | undefined = api.events.join(',');
        logAssertion('AppFsSpace_Baseline_0015', 'observation 3', actual3, 'total,free');
        expect(actual3).assertEqual('total,free');
      } finally {
        logCase('AppFsSpace_Baseline_0015', 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_BASELINE_1600
     * @tc.name AppFsSpace_Baseline_0016
     * @tc.desc Verify usage query rejects inconsistent sdk snapshot.
     */
    it('AppFsSpace_Baseline_0016', 0, async (): Promise<void> => {
      logCase('AppFsSpace_Baseline_0016', 'begin');
      try {
        const api: StorageApiProbe = new StorageApiProbe();
        api.totalBytes = 100;
        api.freeBytes = 101;
        let message: string = '';
        try {
          await queryStorageUsage(api);
        } catch (error) {
          message = (error as Error).message;
        }
        const actual1: Object | undefined = message;
        logAssertion('AppFsSpace_Baseline_0016', 'observation 1', actual1, 'Free size must not exceed total size');
        expect(actual1).assertEqual('Free size must not exceed total size');
        const actual2: Object | undefined = api.events.join(',');
        logAssertion('AppFsSpace_Baseline_0016', 'observation 2', actual2, 'total,free');
        expect(actual2).assertEqual('total,free');
      } finally {
        logCase('AppFsSpace_Baseline_0016', 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_BASELINE_1700
     * @tc.name AppFsSpace_Baseline_0017
     * @tc.desc Verify format uses binary unit boundaries.
     */
    it('AppFsSpace_Baseline_0017', 0, (): void => {
      logCase('AppFsSpace_Baseline_0017', 'begin');
      try {
        const actual1: Object | undefined = formatStorageSize(0);
        logAssertion('AppFsSpace_Baseline_0017', 'observation 1', actual1, '0 B');
        expect(actual1).assertEqual('0 B');
        const actual2: Object | undefined = formatStorageSize(1023);
        logAssertion('AppFsSpace_Baseline_0017', 'observation 2', actual2, '1023 B');
        expect(actual2).assertEqual('1023 B');
        const actual3: Object | undefined = formatStorageSize(1024);
        logAssertion('AppFsSpace_Baseline_0017', 'observation 3', actual3, '1.0 KiB');
        expect(actual3).assertEqual('1.0 KiB');
        const actual4: Object | undefined = formatStorageSize(1536, 2);
        logAssertion('AppFsSpace_Baseline_0017', 'observation 4', actual4, '1.50 KiB');
        expect(actual4).assertEqual('1.50 KiB');
        const actual5: Object | undefined = formatStorageSize(1024 * 1024);
        logAssertion('AppFsSpace_Baseline_0017', 'observation 5', actual5, '1.0 MiB');
        expect(actual5).assertEqual('1.0 MiB');
        const actual6: Object | undefined = formatStorageSize(1024 * 1024 * 1024, 0);
        logAssertion('AppFsSpace_Baseline_0017', 'observation 6', actual6, '1 GiB');
        expect(actual6).assertEqual('1 GiB');
      } finally {
        logCase('AppFsSpace_Baseline_0017', 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_BASELINE_1800
     * @tc.name AppFsSpace_Baseline_0018
     * @tc.desc Verify format rejects invalid precision.
     */
    it('AppFsSpace_Baseline_0018', 0, (): void => {
      logCase('AppFsSpace_Baseline_0018', 'begin');
      try {
        const invalid: number[] = [-1, 4, 1.5];
        const messages: string[] = [];
        invalid.forEach((digits: number): void => {
          try {
            formatStorageSize(1024, digits);
          } catch (error) {
            messages.push((error as Error).message);
          }
        });
        const actual1: Object | undefined = messages.length;
        logAssertion('AppFsSpace_Baseline_0018', 'observation 1', actual1, 3);
        expect(actual1).assertEqual(3);
        const actual2: Object | undefined = messages[0];
        logAssertion('AppFsSpace_Baseline_0018', 'observation 2',
          actual2, 'Fraction digits must be an integer from 0 through 3');
        expect(actual2).assertEqual('Fraction digits must be an integer from 0 through 3');
      } finally {
        logCase('AppFsSpace_Baseline_0018', 'end');
      }
    });
  });
  describe('StorageQueryRealSdk', () => {
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_BASELINE_1900
     * @tc.name AppFsSpace_Baseline_0019
     * @tc.desc Verify total size async and sync satisfy capacity contract.
     */
    it('AppFsSpace_Baseline_0019', 0, async (): Promise<void> => {
      logCase('AppFsSpace_Baseline_0019', 'begin');
      try {
        const asyncTotal: number = await queryStorage(StorageOperation.TOTAL, '');
        const syncTotal: number = await queryStorage(StorageOperation.TOTAL_SYNC, '');
        const actual1: Object | undefined = Number.isInteger(asyncTotal) && asyncTotal > 0;
        logAssertion('AppFsSpace_Baseline_0019', 'observation 1', actual1, true);
        expect(actual1).assertEqual(true);
        const actual2: Object | undefined = Number.isInteger(syncTotal) && syncTotal > 0;
        logAssertion('AppFsSpace_Baseline_0019', 'observation 2', actual2, true);
        expect(actual2).assertEqual(true);
        const actual3: Object | undefined = asyncTotal;
        logAssertion('AppFsSpace_Baseline_0019', 'observation 3', actual3, syncTotal);
        expect(actual3).assertEqual(syncTotal);
      } finally {
        logCase('AppFsSpace_Baseline_0019', 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_BASELINE_2000
     * @tc.name AppFsSpace_Baseline_0020
     * @tc.desc Verify free size is nonnegative and within total capacity.
     */
    it('AppFsSpace_Baseline_0020', 0, async (): Promise<void> => {
      logCase('AppFsSpace_Baseline_0020', 'begin');
      try {
        const total: number = await queryStorage(StorageOperation.TOTAL, '');
        const free: number = await queryStorage(StorageOperation.FREE, '');
        const syncFree: number = await queryStorage(StorageOperation.FREE_SYNC, '');
        const actual1: Object | undefined = Number.isInteger(free) && free >= 0 && free <= total;
        logAssertion('AppFsSpace_Baseline_0020', 'observation 1', actual1, true);
        expect(actual1).assertEqual(true);
        const actual2: Object | undefined = Number.isInteger(syncFree) && syncFree >= 0 && syncFree <= total;
        logAssertion('AppFsSpace_Baseline_0020', 'observation 2', actual2, true);
        expect(actual2).assertEqual(true);
      } finally {
        logCase('AppFsSpace_Baseline_0020', 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_BASELINE_2100
     * @tc.name AppFsSpace_Baseline_0021
     * @tc.desc Verify filesystem query uses the actual app sandbox.
     */
    it('AppFsSpace_Baseline_0021', 0, async (): Promise<void> => {
      logCase('AppFsSpace_Baseline_0021', 'begin');
      try {
        const path: string = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().filesDir;
        const free: number = await queryStorage(StorageOperation.FILESYSTEM_FREE, path);
        const total: number = statfs.getTotalSizeSync(path);
        const actual1: Object | undefined = Number.isInteger(free) && free >= 0 && free <= total;
        logAssertion('AppFsSpace_Baseline_0021', 'observation 1', actual1, true);
        expect(actual1).assertEqual(true);
      } finally {
        logCase('AppFsSpace_Baseline_0021', 'end');
      }
    });
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_BASELINE_2200
     * @tc.name AppFsSpace_Baseline_0022
     * @tc.desc Verify bundle app bytes are nonnegative.
     */
    it('AppFsSpace_Baseline_0022', 0, async (): Promise<void> => {
      logCase('AppFsSpace_Baseline_0022', 'begin');
      try {
        const appBytes: number = await queryStorage(StorageOperation.BUNDLE, '');
        const actual1: Object | undefined = Number.isInteger(appBytes) && appBytes >= 0;
        logAssertion('AppFsSpace_Baseline_0022', 'observation 1', actual1, true);
        expect(actual1).assertEqual(true);
      } finally {
        logCase('AppFsSpace_Baseline_0022', 'end');
      }
    });
  });
}
