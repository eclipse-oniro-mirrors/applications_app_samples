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

import { BusinessError } from '@kit.BasicServicesKit';
import { describe, expect, it, Level, Size, TestType, beforeEach } from '@ohos/hypium';
import { queryStorage, StorageOperation } from '../../../main/ets/model/StorageQuery';
import { logCase, logAssertion, StorageQueryProbe, yieldTestLoop } from './StorageTestSupport';

export default function storageRoutingSuite02Test(): void {
  describe('StorageRoutingSuite02', (): void => {
    beforeEach(yieldTestLoop);
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_FILESYSTEM_FREE_G1_0800
     * @tc.name AppFsSpace_Routing_0100
     * @tc.desc Verify FILESYSTEM_FREE rejects first unsafe integer (9007199254740992) after only its own dependency
     * call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0100';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 9007199254740992;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'FILESYSTEM_FREE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FILESYSTEM_FREE; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'FILESYSTEM_FREE; captured error message',
            failureMessage, "Filesystem free size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Filesystem free size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; error does not fall through to another method",
            failureCalls, "filesystem:/data/storage/el2/base/files");
          expect(failureCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_TOTAL_G1_0100
     * @tc.name AppFsSpace_Routing_0101
     * @tc.desc Verify TOTAL rejects negative byte count (-1) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0101';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = -1;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'TOTAL; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'TOTAL; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'TOTAL; captured error message',
            failureMessage, "Total size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Total size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; error does not fall through to another method", failureCalls, "total");
          expect(failureCalls).assertEqual("total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_TOTAL_G1_0200
     * @tc.name AppFsSpace_Routing_0102
     * @tc.desc Verify TOTAL rejects negative fractional bytes (-0.5) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0102';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = -0.5;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'TOTAL; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'TOTAL; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'TOTAL; captured error message',
            failureMessage, "Total size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Total size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; error does not fall through to another method", failureCalls, "total");
          expect(failureCalls).assertEqual("total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_TOTAL_G1_0300
     * @tc.name AppFsSpace_Routing_0103
     * @tc.desc Verify TOTAL rejects fractional bytes below one (0.5) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0103';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = 0.5;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'TOTAL; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'TOTAL; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'TOTAL; captured error message',
            failureMessage, "Total size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Total size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; error does not fall through to another method", failureCalls, "total");
          expect(failureCalls).assertEqual("total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_TOTAL_G1_0400
     * @tc.name AppFsSpace_Routing_0104
     * @tc.desc Verify TOTAL rejects fractional bytes below KiB (1023.5) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0104';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = 1023.5;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'TOTAL; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'TOTAL; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'TOTAL; captured error message',
            failureMessage, "Total size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Total size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; error does not fall through to another method", failureCalls, "total");
          expect(failureCalls).assertEqual("total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_TOTAL_G1_0500
     * @tc.name AppFsSpace_Routing_0105
     * @tc.desc Verify TOTAL rejects NaN byte count (Number.NaN) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0105';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = Number.NaN;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'TOTAL; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'TOTAL; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'TOTAL; captured error message',
            failureMessage, "Total size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Total size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; error does not fall through to another method", failureCalls, "total");
          expect(failureCalls).assertEqual("total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_TOTAL_G1_0600
     * @tc.name AppFsSpace_Routing_0106
     * @tc.desc Verify TOTAL rejects positive infinite bytes (Number.POSITIVE_INFINITY) after only its own dependency
     * call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0106';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = Number.POSITIVE_INFINITY;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'TOTAL; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'TOTAL; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'TOTAL; captured error message',
            failureMessage, "Total size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Total size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; error does not fall through to another method", failureCalls, "total");
          expect(failureCalls).assertEqual("total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_TOTAL_G1_0700
     * @tc.name AppFsSpace_Routing_0107
     * @tc.desc Verify TOTAL rejects negative infinite bytes (Number.NEGATIVE_INFINITY) after only its own dependency
     * call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0107';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = Number.NEGATIVE_INFINITY;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'TOTAL; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'TOTAL; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'TOTAL; captured error message',
            failureMessage, "Total size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Total size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; error does not fall through to another method", failureCalls, "total");
          expect(failureCalls).assertEqual("total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_TOTAL_G1_0800
     * @tc.name AppFsSpace_Routing_0108
     * @tc.desc Verify TOTAL rejects first unsafe integer (9007199254740992) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0108';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = 9007199254740992;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'TOTAL; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'TOTAL; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'TOTAL; captured error message',
            failureMessage, "Total size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Total size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; error does not fall through to another method", failureCalls, "total");
          expect(failureCalls).assertEqual("total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_TOTAL_SYNC_G1_0100
     * @tc.name AppFsSpace_Routing_0109
     * @tc.desc Verify TOTAL_SYNC rejects negative byte count (-1) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0109';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = -1;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'TOTAL_SYNC; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'TOTAL_SYNC; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'TOTAL_SYNC; captured error message',
            failureMessage, "Total size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Total size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL_SYNC; error does not fall through to another method", failureCalls, "totalSync");
          expect(failureCalls).assertEqual("totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_TOTAL_SYNC_G1_0200
     * @tc.name AppFsSpace_Routing_0110
     * @tc.desc Verify TOTAL_SYNC rejects negative fractional bytes (-0.5) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0110';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = -0.5;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'TOTAL_SYNC; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'TOTAL_SYNC; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'TOTAL_SYNC; captured error message',
            failureMessage, "Total size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Total size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL_SYNC; error does not fall through to another method", failureCalls, "totalSync");
          expect(failureCalls).assertEqual("totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_TOTAL_SYNC_G1_0300
     * @tc.name AppFsSpace_Routing_0111
     * @tc.desc Verify TOTAL_SYNC rejects fractional bytes below one (0.5) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0111';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = 0.5;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'TOTAL_SYNC; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'TOTAL_SYNC; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'TOTAL_SYNC; captured error message',
            failureMessage, "Total size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Total size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL_SYNC; error does not fall through to another method", failureCalls, "totalSync");
          expect(failureCalls).assertEqual("totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_TOTAL_SYNC_G1_0400
     * @tc.name AppFsSpace_Routing_0112
     * @tc.desc Verify TOTAL_SYNC rejects fractional bytes below KiB (1023.5) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0112';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = 1023.5;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'TOTAL_SYNC; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'TOTAL_SYNC; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'TOTAL_SYNC; captured error message',
            failureMessage, "Total size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Total size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL_SYNC; error does not fall through to another method", failureCalls, "totalSync");
          expect(failureCalls).assertEqual("totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_TOTAL_SYNC_G1_0500
     * @tc.name AppFsSpace_Routing_0113
     * @tc.desc Verify TOTAL_SYNC rejects NaN byte count (Number.NaN) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0113';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = Number.NaN;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'TOTAL_SYNC; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'TOTAL_SYNC; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'TOTAL_SYNC; captured error message',
            failureMessage, "Total size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Total size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL_SYNC; error does not fall through to another method", failureCalls, "totalSync");
          expect(failureCalls).assertEqual("totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_TOTAL_SYNC_G1_0600
     * @tc.name AppFsSpace_Routing_0114
     * @tc.desc Verify TOTAL_SYNC rejects positive infinite bytes (Number.POSITIVE_INFINITY) after only its own
     * dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0114';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = Number.POSITIVE_INFINITY;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'TOTAL_SYNC; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'TOTAL_SYNC; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'TOTAL_SYNC; captured error message',
            failureMessage, "Total size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Total size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL_SYNC; error does not fall through to another method", failureCalls, "totalSync");
          expect(failureCalls).assertEqual("totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_TOTAL_SYNC_G1_0700
     * @tc.name AppFsSpace_Routing_0115
     * @tc.desc Verify TOTAL_SYNC rejects negative infinite bytes (Number.NEGATIVE_INFINITY) after only its own
     * dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0115';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = Number.NEGATIVE_INFINITY;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'TOTAL_SYNC; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'TOTAL_SYNC; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'TOTAL_SYNC; captured error message',
            failureMessage, "Total size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Total size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL_SYNC; error does not fall through to another method", failureCalls, "totalSync");
          expect(failureCalls).assertEqual("totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_TOTAL_SYNC_G1_0800
     * @tc.name AppFsSpace_Routing_0116
     * @tc.desc Verify TOTAL_SYNC rejects first unsafe integer (9007199254740992) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0116';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = 9007199254740992;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'TOTAL_SYNC; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'TOTAL_SYNC; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'TOTAL_SYNC; captured error message',
            failureMessage, "Total size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Total size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL_SYNC; error does not fall through to another method", failureCalls, "totalSync");
          expect(failureCalls).assertEqual("totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_FREE_G1_0100
     * @tc.name AppFsSpace_Routing_0117
     * @tc.desc Verify FREE rejects negative byte count (-1) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0117';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = -1;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'FREE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FREE; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'FREE; captured error message',
            failureMessage, "Free size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Free size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FREE; error does not fall through to another method", failureCalls, "free");
          expect(failureCalls).assertEqual("free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_FREE_G1_0200
     * @tc.name AppFsSpace_Routing_0118
     * @tc.desc Verify FREE rejects negative fractional bytes (-0.5) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0118';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = -0.5;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'FREE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FREE; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'FREE; captured error message',
            failureMessage, "Free size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Free size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FREE; error does not fall through to another method", failureCalls, "free");
          expect(failureCalls).assertEqual("free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_FREE_G1_0300
     * @tc.name AppFsSpace_Routing_0119
     * @tc.desc Verify FREE rejects fractional bytes below one (0.5) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0119';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = 0.5;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'FREE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FREE; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'FREE; captured error message',
            failureMessage, "Free size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Free size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FREE; error does not fall through to another method", failureCalls, "free");
          expect(failureCalls).assertEqual("free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_FREE_G1_0400
     * @tc.name AppFsSpace_Routing_0120
     * @tc.desc Verify FREE rejects fractional bytes below KiB (1023.5) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0120';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = 1023.5;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'FREE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FREE; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'FREE; captured error message',
            failureMessage, "Free size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Free size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FREE; error does not fall through to another method", failureCalls, "free");
          expect(failureCalls).assertEqual("free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_FREE_G1_0500
     * @tc.name AppFsSpace_Routing_0121
     * @tc.desc Verify FREE rejects NaN byte count (Number.NaN) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0121';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = Number.NaN;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'FREE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FREE; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'FREE; captured error message',
            failureMessage, "Free size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Free size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FREE; error does not fall through to another method", failureCalls, "free");
          expect(failureCalls).assertEqual("free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_FREE_G1_0600
     * @tc.name AppFsSpace_Routing_0122
     * @tc.desc Verify FREE rejects positive infinite bytes (Number.POSITIVE_INFINITY) after only its own dependency
     * call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0122';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = Number.POSITIVE_INFINITY;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'FREE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FREE; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'FREE; captured error message',
            failureMessage, "Free size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Free size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FREE; error does not fall through to another method", failureCalls, "free");
          expect(failureCalls).assertEqual("free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_FREE_G1_0700
     * @tc.name AppFsSpace_Routing_0123
     * @tc.desc Verify FREE rejects negative infinite bytes (Number.NEGATIVE_INFINITY) after only its own dependency
     * call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0123';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = Number.NEGATIVE_INFINITY;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'FREE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FREE; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'FREE; captured error message',
            failureMessage, "Free size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Free size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FREE; error does not fall through to another method", failureCalls, "free");
          expect(failureCalls).assertEqual("free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_FREE_G1_0800
     * @tc.name AppFsSpace_Routing_0124
     * @tc.desc Verify FREE rejects first unsafe integer (9007199254740992) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0124';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = 9007199254740992;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'FREE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FREE; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'FREE; captured error message',
            failureMessage, "Free size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Free size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FREE; error does not fall through to another method", failureCalls, "free");
          expect(failureCalls).assertEqual("free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_FREE_SYNC_G1_0100
     * @tc.name AppFsSpace_Routing_0125
     * @tc.desc Verify FREE_SYNC rejects negative byte count (-1) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0125';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = -1;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'FREE_SYNC; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FREE_SYNC; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'FREE_SYNC; captured error message',
            failureMessage, "Free size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Free size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FREE_SYNC; error does not fall through to another method", failureCalls, "freeSync");
          expect(failureCalls).assertEqual("freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_FREE_SYNC_G1_0200
     * @tc.name AppFsSpace_Routing_0126
     * @tc.desc Verify FREE_SYNC rejects negative fractional bytes (-0.5) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0126';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = -0.5;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'FREE_SYNC; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FREE_SYNC; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'FREE_SYNC; captured error message',
            failureMessage, "Free size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Free size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FREE_SYNC; error does not fall through to another method", failureCalls, "freeSync");
          expect(failureCalls).assertEqual("freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_FREE_SYNC_G1_0300
     * @tc.name AppFsSpace_Routing_0127
     * @tc.desc Verify FREE_SYNC rejects fractional bytes below one (0.5) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0127';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = 0.5;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'FREE_SYNC; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FREE_SYNC; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'FREE_SYNC; captured error message',
            failureMessage, "Free size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Free size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FREE_SYNC; error does not fall through to another method", failureCalls, "freeSync");
          expect(failureCalls).assertEqual("freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_FREE_SYNC_G1_0400
     * @tc.name AppFsSpace_Routing_0128
     * @tc.desc Verify FREE_SYNC rejects fractional bytes below KiB (1023.5) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0128';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = 1023.5;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'FREE_SYNC; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FREE_SYNC; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'FREE_SYNC; captured error message',
            failureMessage, "Free size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Free size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FREE_SYNC; error does not fall through to another method", failureCalls, "freeSync");
          expect(failureCalls).assertEqual("freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_FREE_SYNC_G1_0500
     * @tc.name AppFsSpace_Routing_0129
     * @tc.desc Verify FREE_SYNC rejects NaN byte count (Number.NaN) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0129';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = Number.NaN;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'FREE_SYNC; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FREE_SYNC; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'FREE_SYNC; captured error message',
            failureMessage, "Free size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Free size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FREE_SYNC; error does not fall through to another method", failureCalls, "freeSync");
          expect(failureCalls).assertEqual("freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_FREE_SYNC_G1_0600
     * @tc.name AppFsSpace_Routing_0130
     * @tc.desc Verify FREE_SYNC rejects positive infinite bytes (Number.POSITIVE_INFINITY) after only its own
     * dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0130';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = Number.POSITIVE_INFINITY;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'FREE_SYNC; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FREE_SYNC; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'FREE_SYNC; captured error message',
            failureMessage, "Free size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Free size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FREE_SYNC; error does not fall through to another method", failureCalls, "freeSync");
          expect(failureCalls).assertEqual("freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_FREE_SYNC_G1_0700
     * @tc.name AppFsSpace_Routing_0131
     * @tc.desc Verify FREE_SYNC rejects negative infinite bytes (Number.NEGATIVE_INFINITY) after only its own
     * dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0131';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = Number.NEGATIVE_INFINITY;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'FREE_SYNC; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FREE_SYNC; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'FREE_SYNC; captured error message',
            failureMessage, "Free size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Free size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FREE_SYNC; error does not fall through to another method", failureCalls, "freeSync");
          expect(failureCalls).assertEqual("freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_INVALID_FREE_SYNC_G1_0800
     * @tc.name AppFsSpace_Routing_0132
     * @tc.desc Verify FREE_SYNC rejects first unsafe integer (9007199254740992) after only its own dependency call.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0132';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = 9007199254740992;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'FREE_SYNC; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FREE_SYNC; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'FREE_SYNC; captured error message',
            failureMessage, "Free size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Free size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FREE_SYNC; error does not fall through to another method", failureCalls, "freeSync");
          expect(failureCalls).assertEqual("freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_ERROR_BUNDLE_G1_0100
     * @tc.name AppFsSpace_Routing_0133
     * @tc.desc Verify BUNDLE propagates its own error before validating accompanying bytes=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0133';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 0;
          const sdkError: Error = new Error("bundle dependency unavailable");
          sdkError.name = "Error";
          api.bundleError = sdkError;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          let failureError: Error | undefined = undefined;
          try {
            await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
            failureError = caughtError;
          }
          logAssertion(name, 'BUNDLE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'BUNDLE; captured error name', failureName, "Error");
          expect(failureName).assertEqual("Error");
          logAssertion(name, 'BUNDLE; captured error message',
            failureMessage, "bundle dependency unavailable");
          expect(failureMessage).assertEqual("bundle dependency unavailable");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "BUNDLE; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; error does not fall through to another method", failureCalls, "bundle");
          expect(failureCalls).assertEqual("bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_ERROR_BUNDLE_G1_0200
     * @tc.name AppFsSpace_Routing_0134
     * @tc.desc Verify BUNDLE propagates its own error before validating accompanying bytes=Number.NaN.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0134';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = Number.NaN;
          const sdkError: Error = new Error("bundle dependency unavailable");
          sdkError.name = "Error";
          api.bundleError = sdkError;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          let failureError: Error | undefined = undefined;
          try {
            await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
            failureError = caughtError;
          }
          logAssertion(name, 'BUNDLE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'BUNDLE; captured error name', failureName, "Error");
          expect(failureName).assertEqual("Error");
          logAssertion(name, 'BUNDLE; captured error message',
            failureMessage, "bundle dependency unavailable");
          expect(failureMessage).assertEqual("bundle dependency unavailable");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "BUNDLE; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; error does not fall through to another method", failureCalls, "bundle");
          expect(failureCalls).assertEqual("bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_ERROR_BUNDLE_G1_0300
     * @tc.name AppFsSpace_Routing_0135
     * @tc.desc Verify BUNDLE propagates its own error before validating accompanying bytes=9007199254740992.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0135';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 9007199254740992;
          const sdkError: Error = new Error("bundle dependency unavailable");
          sdkError.name = "Error";
          api.bundleError = sdkError;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          let failureError: Error | undefined = undefined;
          try {
            await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
            failureError = caughtError;
          }
          logAssertion(name, 'BUNDLE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'BUNDLE; captured error name', failureName, "Error");
          expect(failureName).assertEqual("Error");
          logAssertion(name, 'BUNDLE; captured error message',
            failureMessage, "bundle dependency unavailable");
          expect(failureMessage).assertEqual("bundle dependency unavailable");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "BUNDLE; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; error does not fall through to another method", failureCalls, "bundle");
          expect(failureCalls).assertEqual("bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_ERROR_FILESYSTEM_FREE_G1_0100
     * @tc.name AppFsSpace_Routing_0136
     * @tc.desc Verify FILESYSTEM_FREE propagates its own error before validating accompanying bytes=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0136';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 0;
          const sdkError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "filesystem dependency unavailable"
          };
          api.filesystemError = sdkError;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          let failureError: Error | undefined = undefined;
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
            failureError = caughtError;
          }
          logAssertion(name, 'FILESYSTEM_FREE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FILESYSTEM_FREE; captured error name', failureName, "BusinessError");
          expect(failureName).assertEqual("BusinessError");
          logAssertion(name, 'FILESYSTEM_FREE; captured error message',
            failureMessage, "filesystem dependency unavailable");
          expect(failureMessage).assertEqual("filesystem dependency unavailable");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "FILESYSTEM_FREE; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; error does not fall through to another method",
            failureCalls, "filesystem:/data/storage/el2/base/files");
          expect(failureCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          const actualErrorCode: number = (failureError as BusinessError).code;
          logAssertion(name, "FILESYSTEM_FREE callback bytes=0; preserve SDK error code", actualErrorCode, 13900002);
          expect(actualErrorCode).assertEqual(13900002);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_ERROR_FILESYSTEM_FREE_G1_0200
     * @tc.name AppFsSpace_Routing_0137
     * @tc.desc Verify FILESYSTEM_FREE propagates its own error before validating accompanying bytes=Number.NaN.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0137';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = Number.NaN;
          const sdkError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "filesystem dependency unavailable"
          };
          api.filesystemError = sdkError;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          let failureError: Error | undefined = undefined;
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
            failureError = caughtError;
          }
          logAssertion(name, 'FILESYSTEM_FREE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FILESYSTEM_FREE; captured error name', failureName, "BusinessError");
          expect(failureName).assertEqual("BusinessError");
          logAssertion(name, 'FILESYSTEM_FREE; captured error message',
            failureMessage, "filesystem dependency unavailable");
          expect(failureMessage).assertEqual("filesystem dependency unavailable");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "FILESYSTEM_FREE; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; error does not fall through to another method",
            failureCalls, "filesystem:/data/storage/el2/base/files");
          expect(failureCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          const actualErrorCode: number = (failureError as BusinessError).code;
          logAssertion(name,
            "FILESYSTEM_FREE callback bytes=Number.NaN; preserve SDK error code", actualErrorCode, 13900002);
          expect(actualErrorCode).assertEqual(13900002);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_ERROR_FILESYSTEM_FREE_G1_0300
     * @tc.name AppFsSpace_Routing_0138
     * @tc.desc Verify FILESYSTEM_FREE propagates its own error before validating accompanying bytes=9007199254740992.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0138';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 9007199254740992;
          const sdkError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "filesystem dependency unavailable"
          };
          api.filesystemError = sdkError;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          let failureError: Error | undefined = undefined;
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
            failureError = caughtError;
          }
          logAssertion(name, 'FILESYSTEM_FREE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FILESYSTEM_FREE; captured error name', failureName, "BusinessError");
          expect(failureName).assertEqual("BusinessError");
          logAssertion(name, 'FILESYSTEM_FREE; captured error message',
            failureMessage, "filesystem dependency unavailable");
          expect(failureMessage).assertEqual("filesystem dependency unavailable");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "FILESYSTEM_FREE; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; error does not fall through to another method",
            failureCalls, "filesystem:/data/storage/el2/base/files");
          expect(failureCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          const actualErrorCode: number = (failureError as BusinessError).code;
          logAssertion(name,
            "FILESYSTEM_FREE callback bytes=9007199254740992; preserve SDK error code", actualErrorCode, 13900002);
          expect(actualErrorCode).assertEqual(13900002);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_ERROR_TOTAL_G1_0100
     * @tc.name AppFsSpace_Routing_0139
     * @tc.desc Verify TOTAL propagates its own error before validating accompanying bytes=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0139';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = 0;
          const sdkError: Error = new Error("total dependency unavailable");
          sdkError.name = "Error";
          api.totalError = sdkError;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          let failureError: Error | undefined = undefined;
          try {
            await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
            failureError = caughtError;
          }
          logAssertion(name, 'TOTAL; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'TOTAL; captured error name', failureName, "Error");
          expect(failureName).assertEqual("Error");
          logAssertion(name, 'TOTAL; captured error message',
            failureMessage, "total dependency unavailable");
          expect(failureMessage).assertEqual("total dependency unavailable");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "TOTAL; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; error does not fall through to another method", failureCalls, "total");
          expect(failureCalls).assertEqual("total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_ERROR_TOTAL_G1_0200
     * @tc.name AppFsSpace_Routing_0140
     * @tc.desc Verify TOTAL propagates its own error before validating accompanying bytes=Number.NaN.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0140';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = Number.NaN;
          const sdkError: Error = new Error("total dependency unavailable");
          sdkError.name = "Error";
          api.totalError = sdkError;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          let failureError: Error | undefined = undefined;
          try {
            await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
            failureError = caughtError;
          }
          logAssertion(name, 'TOTAL; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'TOTAL; captured error name', failureName, "Error");
          expect(failureName).assertEqual("Error");
          logAssertion(name, 'TOTAL; captured error message',
            failureMessage, "total dependency unavailable");
          expect(failureMessage).assertEqual("total dependency unavailable");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "TOTAL; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; error does not fall through to another method", failureCalls, "total");
          expect(failureCalls).assertEqual("total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_ERROR_TOTAL_G1_0300
     * @tc.name AppFsSpace_Routing_0141
     * @tc.desc Verify TOTAL propagates its own error before validating accompanying bytes=9007199254740992.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0141';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = 9007199254740992;
          const sdkError: Error = new Error("total dependency unavailable");
          sdkError.name = "Error";
          api.totalError = sdkError;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          let failureError: Error | undefined = undefined;
          try {
            await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
            failureError = caughtError;
          }
          logAssertion(name, 'TOTAL; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'TOTAL; captured error name', failureName, "Error");
          expect(failureName).assertEqual("Error");
          logAssertion(name, 'TOTAL; captured error message',
            failureMessage, "total dependency unavailable");
          expect(failureMessage).assertEqual("total dependency unavailable");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "TOTAL; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; error does not fall through to another method", failureCalls, "total");
          expect(failureCalls).assertEqual("total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_ERROR_TOTAL_SYNC_G1_0100
     * @tc.name AppFsSpace_Routing_0142
     * @tc.desc Verify TOTAL_SYNC propagates its own error before validating accompanying bytes=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0142';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = 0;
          const sdkError: Error = new Error("totalSync dependency unavailable");
          sdkError.name = "Error";
          api.totalSyncError = sdkError;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          let failureError: Error | undefined = undefined;
          try {
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
            failureError = caughtError;
          }
          logAssertion(name, 'TOTAL_SYNC; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'TOTAL_SYNC; captured error name', failureName, "Error");
          expect(failureName).assertEqual("Error");
          logAssertion(name, 'TOTAL_SYNC; captured error message',
            failureMessage, "totalSync dependency unavailable");
          expect(failureMessage).assertEqual("totalSync dependency unavailable");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "TOTAL_SYNC; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL_SYNC; error does not fall through to another method", failureCalls, "totalSync");
          expect(failureCalls).assertEqual("totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_ERROR_TOTAL_SYNC_G1_0200
     * @tc.name AppFsSpace_Routing_0143
     * @tc.desc Verify TOTAL_SYNC propagates its own error before validating accompanying bytes=Number.NaN.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0143';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = Number.NaN;
          const sdkError: Error = new Error("totalSync dependency unavailable");
          sdkError.name = "Error";
          api.totalSyncError = sdkError;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          let failureError: Error | undefined = undefined;
          try {
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
            failureError = caughtError;
          }
          logAssertion(name, 'TOTAL_SYNC; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'TOTAL_SYNC; captured error name', failureName, "Error");
          expect(failureName).assertEqual("Error");
          logAssertion(name, 'TOTAL_SYNC; captured error message',
            failureMessage, "totalSync dependency unavailable");
          expect(failureMessage).assertEqual("totalSync dependency unavailable");
          const failureIdentity: boolean = failureError === sdkError;
