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
import { logCase, logAssertion, StorageQueryProbe, DeferredBytes, yieldTestLoop } from './StorageTestSupport';

export default function storageRoutingSuite03Test(): void {
  describe('StorageRoutingSuite03', (): void => {
    beforeEach(yieldTestLoop);
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_BUNDLE_FIELDS_G1_0700
     * @tc.name AppFsSpace_Routing_0198
     * @tc.desc Verify BUNDLE uses only appSize=1024 with maximum cache and data without summation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0198';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 1024;
          api.bundleStats.cacheSize = 9007199254740991;
          api.bundleStats.dataSize = 9007199254740991;
          const actualBytes: number = await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          logAssertion(name, "BUNDLE expected bytes=1024; returned bytes", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; selected dependency and exclusive call record", actualCalls, "bundle");
          expect(actualCalls).assertEqual("bundle");
          const actualCacheUnchanged: boolean = api.bundleStats.cacheSize === 9007199254740991;
          logAssertion(name,
            "BUNDLE appSize=1024; cacheSize is neither validated nor modified", actualCacheUnchanged, true);
          expect(actualCacheUnchanged).assertEqual(true);
          const actualDataUnchanged: boolean = api.bundleStats.dataSize === 9007199254740991;
          logAssertion(name,
            "BUNDLE appSize=1024; dataSize is neither validated nor modified", actualDataUnchanged, true);
          expect(actualDataUnchanged).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_BUNDLE_FIELDS_G1_0800
     * @tc.name AppFsSpace_Routing_0199
     * @tc.desc Verify BUNDLE uses only appSize=1024 with fractional cache and negative infinite data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0199';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 1024;
          api.bundleStats.cacheSize = 0.5;
          api.bundleStats.dataSize = Number.NEGATIVE_INFINITY;
          const actualBytes: number = await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          logAssertion(name, "BUNDLE expected bytes=1024; returned bytes", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; selected dependency and exclusive call record", actualCalls, "bundle");
          expect(actualCalls).assertEqual("bundle");
          const actualCacheUnchanged: boolean = api.bundleStats.cacheSize === 0.5;
          logAssertion(name,
            "BUNDLE appSize=1024; cacheSize is neither validated nor modified", actualCacheUnchanged, true);
          expect(actualCacheUnchanged).assertEqual(true);
          const actualDataUnchanged: boolean = api.bundleStats.dataSize === Number.NEGATIVE_INFINITY;
          logAssertion(name,
            "BUNDLE appSize=1024; dataSize is neither validated nor modified", actualDataUnchanged, true);
          expect(actualDataUnchanged).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_BUNDLE_FIELDS_G1_0900
     * @tc.name AppFsSpace_Routing_0200
     * @tc.desc Verify BUNDLE uses only appSize=9007199254740991 with negative cache and NaN data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0200';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 9007199254740991;
          api.bundleStats.cacheSize = -1;
          api.bundleStats.dataSize = Number.NaN;
          const actualBytes: number = await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          logAssertion(name, "BUNDLE expected bytes=9007199254740991; returned bytes", actualBytes, 9007199254740991);
          expect(actualBytes).assertEqual(9007199254740991);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; selected dependency and exclusive call record", actualCalls, "bundle");
          expect(actualCalls).assertEqual("bundle");
          const actualCacheUnchanged: boolean = api.bundleStats.cacheSize === -1;
          logAssertion(name,
            "BUNDLE appSize=9007199254740991; cacheSize is neither validated nor modified", actualCacheUnchanged, true);
          expect(actualCacheUnchanged).assertEqual(true);
          const actualDataUnchanged: boolean = Number.isNaN(api.bundleStats.dataSize);
          logAssertion(name,
            "BUNDLE appSize=9007199254740991; dataSize is neither validated nor modified", actualDataUnchanged, true);
          expect(actualDataUnchanged).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_BUNDLE_FIELDS_G1_1000
     * @tc.name AppFsSpace_Routing_0201
     * @tc.desc Verify BUNDLE uses only appSize=9007199254740991 with infinite cache and unsafe data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0201';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 9007199254740991;
          api.bundleStats.cacheSize = Number.POSITIVE_INFINITY;
          api.bundleStats.dataSize = 9007199254740992;
          const actualBytes: number = await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          logAssertion(name, "BUNDLE expected bytes=9007199254740991; returned bytes", actualBytes, 9007199254740991);
          expect(actualBytes).assertEqual(9007199254740991);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; selected dependency and exclusive call record", actualCalls, "bundle");
          expect(actualCalls).assertEqual("bundle");
          const actualCacheUnchanged: boolean = api.bundleStats.cacheSize === Number.POSITIVE_INFINITY;
          logAssertion(name,
            "BUNDLE appSize=9007199254740991; cacheSize is neither validated nor modified", actualCacheUnchanged, true);
          expect(actualCacheUnchanged).assertEqual(true);
          const actualDataUnchanged: boolean = api.bundleStats.dataSize === 9007199254740992;
          logAssertion(name,
            "BUNDLE appSize=9007199254740991; dataSize is neither validated nor modified", actualDataUnchanged, true);
          expect(actualDataUnchanged).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_BUNDLE_FIELDS_G1_1100
     * @tc.name AppFsSpace_Routing_0202
     * @tc.desc Verify BUNDLE uses only appSize=9007199254740991 with maximum cache and data without summation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0202';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 9007199254740991;
          api.bundleStats.cacheSize = 9007199254740991;
          api.bundleStats.dataSize = 9007199254740991;
          const actualBytes: number = await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          logAssertion(name, "BUNDLE expected bytes=9007199254740991; returned bytes", actualBytes, 9007199254740991);
          expect(actualBytes).assertEqual(9007199254740991);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; selected dependency and exclusive call record", actualCalls, "bundle");
          expect(actualCalls).assertEqual("bundle");
          const actualCacheUnchanged: boolean = api.bundleStats.cacheSize === 9007199254740991;
          logAssertion(name,
            "BUNDLE appSize=9007199254740991; cacheSize is neither validated nor modified", actualCacheUnchanged, true);
          expect(actualCacheUnchanged).assertEqual(true);
          const actualDataUnchanged: boolean = api.bundleStats.dataSize === 9007199254740991;
          logAssertion(name,
            "BUNDLE appSize=9007199254740991; dataSize is neither validated nor modified", actualDataUnchanged, true);
          expect(actualDataUnchanged).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_BUNDLE_FIELDS_G1_1200
     * @tc.name AppFsSpace_Routing_0203
     * @tc.desc Verify BUNDLE uses only appSize=9007199254740991 with fractional cache and negative infinite data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0203';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 9007199254740991;
          api.bundleStats.cacheSize = 0.5;
          api.bundleStats.dataSize = Number.NEGATIVE_INFINITY;
          const actualBytes: number = await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          logAssertion(name, "BUNDLE expected bytes=9007199254740991; returned bytes", actualBytes, 9007199254740991);
          expect(actualBytes).assertEqual(9007199254740991);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; selected dependency and exclusive call record", actualCalls, "bundle");
          expect(actualCalls).assertEqual("bundle");
          const actualCacheUnchanged: boolean = api.bundleStats.cacheSize === 0.5;
          logAssertion(name,
            "BUNDLE appSize=9007199254740991; cacheSize is neither validated nor modified", actualCacheUnchanged, true);
          expect(actualCacheUnchanged).assertEqual(true);
          const actualDataUnchanged: boolean = api.bundleStats.dataSize === Number.NEGATIVE_INFINITY;
          logAssertion(name,
            "BUNDLE appSize=9007199254740991; dataSize is neither validated nor modified", actualDataUnchanged, true);
          expect(actualDataUnchanged).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_EMPTY_PATH_G1_0100
     * @tc.name AppFsSpace_Routing_0204
     * @tc.desc Verify FILESYSTEM_FREE rejects empty path before registering a callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0204';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE EMPTY; no callback registered for an empty trimmed path", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_EMPTY_PATH_G1_0200
     * @tc.name AppFsSpace_Routing_0205
     * @tc.desc Verify FILESYSTEM_FREE rejects horizontal tab before registering a callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0205';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "\t", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE TAB; no callback registered for an empty trimmed path", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_EMPTY_PATH_G1_0300
     * @tc.name AppFsSpace_Routing_0206
     * @tc.desc Verify FILESYSTEM_FREE rejects line feed before registering a callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0206';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "\n", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE LF; no callback registered for an empty trimmed path", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_EMPTY_PATH_G1_0400
     * @tc.name AppFsSpace_Routing_0207
     * @tc.desc Verify FILESYSTEM_FREE rejects vertical tab before registering a callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0207';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "\u000b", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE VT; no callback registered for an empty trimmed path", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_EMPTY_PATH_G1_0500
     * @tc.name AppFsSpace_Routing_0208
     * @tc.desc Verify FILESYSTEM_FREE rejects form feed before registering a callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0208';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "\f", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE FF; no callback registered for an empty trimmed path", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_EMPTY_PATH_G1_0600
     * @tc.name AppFsSpace_Routing_0209
     * @tc.desc Verify FILESYSTEM_FREE rejects carriage return before registering a callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0209';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "\r", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE CR; no callback registered for an empty trimmed path", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_EMPTY_PATH_G1_0700
     * @tc.name AppFsSpace_Routing_0210
     * @tc.desc Verify FILESYSTEM_FREE rejects ASCII space before registering a callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0210';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, " ", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE SPACE; no callback registered for an empty trimmed path", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_EMPTY_PATH_G1_0800
     * @tc.name AppFsSpace_Routing_0211
     * @tc.desc Verify FILESYSTEM_FREE rejects nonbreaking space before registering a callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0211';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, " ", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE NBSP; no callback registered for an empty trimmed path", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_EMPTY_PATH_G1_0900
     * @tc.name AppFsSpace_Routing_0212
     * @tc.desc Verify FILESYSTEM_FREE rejects Ogham space before registering a callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0212';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, " ", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE OGHAM; no callback registered for an empty trimmed path", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_EMPTY_PATH_G1_1000
     * @tc.name AppFsSpace_Routing_0213
     * @tc.desc Verify FILESYSTEM_FREE rejects en quad before registering a callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0213';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, " ", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE EN_QUAD; no callback registered for an empty trimmed path", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_EMPTY_PATH_G1_1100
     * @tc.name AppFsSpace_Routing_0214
     * @tc.desc Verify FILESYSTEM_FREE rejects em quad before registering a callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0214';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, " ", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE EM_QUAD; no callback registered for an empty trimmed path", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_EMPTY_PATH_G1_1200
     * @tc.name AppFsSpace_Routing_0215
     * @tc.desc Verify FILESYSTEM_FREE rejects en space before registering a callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0215';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, " ", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE EN_SPACE; no callback registered for an empty trimmed path", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_EMPTY_PATH_G1_1300
     * @tc.name AppFsSpace_Routing_0216
     * @tc.desc Verify FILESYSTEM_FREE rejects em space before registering a callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0216';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, " ", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE EM_SPACE; no callback registered for an empty trimmed path", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_EMPTY_PATH_G1_1400
     * @tc.name AppFsSpace_Routing_0217
     * @tc.desc Verify FILESYSTEM_FREE rejects three-per-em space before registering a callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0217';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, " ", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE THREE_PER_EM; no callback registered for an empty trimmed path",
            actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_EMPTY_PATH_G1_1500
     * @tc.name AppFsSpace_Routing_0218
     * @tc.desc Verify FILESYSTEM_FREE rejects four-per-em space before registering a callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0218';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, " ", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE FOUR_PER_EM; no callback registered for an empty trimmed path",
            actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_EMPTY_PATH_G1_1600
     * @tc.name AppFsSpace_Routing_0219
     * @tc.desc Verify FILESYSTEM_FREE rejects six-per-em space before registering a callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0219';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, " ", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE SIX_PER_EM; no callback registered for an empty trimmed path", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_EMPTY_PATH_G1_1700
     * @tc.name AppFsSpace_Routing_0220
     * @tc.desc Verify FILESYSTEM_FREE rejects figure space before registering a callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0220';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, " ", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE FIGURE; no callback registered for an empty trimmed path", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_EMPTY_PATH_G1_1800
     * @tc.name AppFsSpace_Routing_0221
     * @tc.desc Verify FILESYSTEM_FREE rejects punctuation space before registering a callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0221';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, " ", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE PUNCTUATION; no callback registered for an empty trimmed path",
            actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_EMPTY_PATH_G1_1900
     * @tc.name AppFsSpace_Routing_0222
     * @tc.desc Verify FILESYSTEM_FREE rejects thin space before registering a callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0222';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, " ", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE THIN; no callback registered for an empty trimmed path", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_EMPTY_PATH_G1_2000
     * @tc.name AppFsSpace_Routing_0223
     * @tc.desc Verify FILESYSTEM_FREE rejects hair space before registering a callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0223';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, " ", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE HAIR; no callback registered for an empty trimmed path", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_EMPTY_PATH_G1_2100
     * @tc.name AppFsSpace_Routing_0224
     * @tc.desc Verify FILESYSTEM_FREE rejects Unicode line separator before registering a callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0224';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "\u2028", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE LINE_SEPARATOR; no callback registered for an empty trimmed path",
            actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_EMPTY_PATH_G1_2200
     * @tc.name AppFsSpace_Routing_0225
     * @tc.desc Verify FILESYSTEM_FREE rejects Unicode paragraph separator before registering a callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0225';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "\u2029", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE PARAGRAPH_SEPARATOR; no callback registered for an empty trimmed path",
            actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_EMPTY_PATH_G1_2300
     * @tc.name AppFsSpace_Routing_0226
     * @tc.desc Verify FILESYSTEM_FREE rejects narrow nonbreaking space before registering a callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0226';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, " ", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE NARROW_NBSP; no callback registered for an empty trimmed path",
            actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_EMPTY_PATH_G1_2400
     * @tc.name AppFsSpace_Routing_0227
     * @tc.desc Verify FILESYSTEM_FREE rejects medium mathematical space before registering a callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0227';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, " ", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE MEDIUM_MATH; no callback registered for an empty trimmed path",
            actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_EMPTY_PATH_G1_2500
     * @tc.name AppFsSpace_Routing_0228
     * @tc.desc Verify FILESYSTEM_FREE rejects ideographic space before registering a callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0228';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "　", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE IDEOGRAPHIC; no callback registered for an empty trimmed path",
            actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_EMPTY_PATH_G1_2600
     * @tc.name AppFsSpace_Routing_0229
     * @tc.desc Verify FILESYSTEM_FREE rejects byte-order mark before registering a callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0229';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "﻿", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE BOM; no callback registered for an empty trimmed path", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_PATH_PRIORITY_G1_0100
     * @tc.name AppFsSpace_Routing_0230
     * @tc.desc Verify FILESYSTEM_FREE rejects ASCII_MIX before the configured filesystemError or invalid bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0230';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = Number.NaN;
          const unreachableError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "filesystem unavailable"
          };
          api.filesystemError = unreachableError;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, " \t\r\n ", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE ASCII_MIX; path validation precedes dependency access", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_PATH_PRIORITY_G1_0200
     * @tc.name AppFsSpace_Routing_0231
     * @tc.desc Verify FILESYSTEM_FREE rejects BOM_NBSP before the configured filesystemThrow or invalid bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0231';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = Number.NaN;
          const unreachableError: Error = new Error("filesystem unavailable");
          unreachableError.name = "Error";
          api.filesystemThrow = unreachableError;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "﻿ ", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE BOM_NBSP; path validation precedes dependency access", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_PATH_PRIORITY_G1_0300
     * @tc.name AppFsSpace_Routing_0232
     * @tc.desc Verify FILESYSTEM_FREE rejects LINE_PARAGRAPH before the configured filesystemError or invalid bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0232';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = Number.NaN;
          const unreachableError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "filesystem unavailable"
          };
          api.filesystemError = unreachableError;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "\u2028\u2029", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE LINE_PARAGRAPH; path validation precedes dependency access", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_PATH_PRIORITY_G1_0400
     * @tc.name AppFsSpace_Routing_0233
     * @tc.desc Verify FILESYSTEM_FREE rejects IDEOGRAPHIC_TAB before the configured filesystemThrow or invalid bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0233';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = Number.NaN;
          const unreachableError: Error = new Error("filesystem unavailable");
          unreachableError.name = "Error";
          api.filesystemThrow = unreachableError;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "　\t", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE IDEOGRAPHIC_TAB; path validation precedes dependency access", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_PATH_PRIORITY_G1_0500
     * @tc.name AppFsSpace_Routing_0234
     * @tc.desc Verify FILESYSTEM_FREE rejects NARROW_MEDIUM before the configured filesystemError or invalid bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0234';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = Number.NaN;
          const unreachableError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "filesystem unavailable"
          };
          api.filesystemError = unreachableError;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "  ", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE NARROW_MEDIUM; path validation precedes dependency access", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_PATH_PRIORITY_G1_0600
     * @tc.name AppFsSpace_Routing_0235
     * @tc.desc Verify FILESYSTEM_FREE rejects OGHAM_EM before the configured filesystemThrow or invalid bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0235';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = Number.NaN;
          const unreachableError: Error = new Error("filesystem unavailable");
          unreachableError.name = "Error";
          api.filesystemThrow = unreachableError;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "  ", api);
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
            failureMessage, "Filesystem path must not be empty");
          expect(failureMessage).assertEqual("Filesystem path must not be empty");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FILESYSTEM_FREE; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FILESYSTEM_FREE OGHAM_EM; path validation precedes dependency access", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_PATH_FORWARD_G1_0100
     * @tc.name AppFsSpace_Routing_0236
     * @tc.desc Verify FILESYSTEM_FREE forwards root path using trim only and returns 1024.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0236';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualBytes: number = await queryStorage(StorageOperation.FILESYSTEM_FREE, "/", api);
          logAssertion(name, "FILESYSTEM_FREE ROOT; valid path byte count", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE ROOT; exact forwarded path without normalization", actualCalls, "filesystem:/");
          expect(actualCalls).assertEqual("filesystem:/");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_PATH_FORWARD_G1_0200
     * @tc.name AppFsSpace_Routing_0237
     * @tc.desc Verify FILESYSTEM_FREE forwards app sandbox path using trim only and returns 1024.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0237';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "FILESYSTEM_FREE SANDBOX; valid path byte count", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE SANDBOX; exact forwarded path without normalization",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_PATH_FORWARD_G1_0300
     * @tc.name AppFsSpace_Routing_0238
     * @tc.desc Verify FILESYSTEM_FREE forwards ASCII surrounding whitespace using trim only and returns 1024.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0238';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, " \t/data/storage/el2/base/files\r\n ", api);
          logAssertion(name, "FILESYSTEM_FREE ASCII_PAD; valid path byte count", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE ASCII_PAD; exact forwarded path without normalization",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_PATH_FORWARD_G1_0400
     * @tc.name AppFsSpace_Routing_0239
     * @tc.desc Verify FILESYSTEM_FREE forwards surrounding nonbreaking spaces using trim only and returns 1024.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0239';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, " /data/storage/el2/base/cache ", api);
          logAssertion(name, "FILESYSTEM_FREE NBSP_PAD; valid path byte count", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE NBSP_PAD; exact forwarded path without normalization",
            actualCalls, "filesystem:/data/storage/el2/base/cache");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/cache");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_PATH_FORWARD_G1_0500
     * @tc.name AppFsSpace_Routing_0240
     * @tc.desc Verify FILESYSTEM_FREE forwards surrounding Ogham spaces using trim only and returns 1024.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0240';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, " /data/storage/el2/base/files ", api);
          logAssertion(name, "FILESYSTEM_FREE OGHAM_PAD; valid path byte count", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE OGHAM_PAD; exact forwarded path without normalization",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_PATH_FORWARD_G1_0600
     * @tc.name AppFsSpace_Routing_0241
     * @tc.desc Verify FILESYSTEM_FREE forwards surrounding em spaces using trim only and returns 1024.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0241';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, " /data/storage/el2/base/files ", api);
          logAssertion(name, "FILESYSTEM_FREE EM_PAD; valid path byte count", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE EM_PAD; exact forwarded path without normalization",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_PATH_FORWARD_G1_0700
     * @tc.name AppFsSpace_Routing_0242
     * @tc.desc Verify FILESYSTEM_FREE forwards surrounding Unicode separators using trim only and returns 1024.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0242';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "\u2028/data/storage/el2/base/files\u2029", api);
          logAssertion(name, "FILESYSTEM_FREE LINE_PAD; valid path byte count", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE LINE_PAD; exact forwarded path without normalization",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_PATH_FORWARD_G1_0800
     * @tc.name AppFsSpace_Routing_0243
     * @tc.desc Verify FILESYSTEM_FREE forwards surrounding narrow nonbreaking spaces using trim only and returns 1024.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0243';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, " /data/storage/el2/base/files ", api);
          logAssertion(name, "FILESYSTEM_FREE NARROW_PAD; valid path byte count", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE NARROW_PAD; exact forwarded path without normalization",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_PATH_FORWARD_G1_0900
     * @tc.name AppFsSpace_Routing_0244
     * @tc.desc Verify FILESYSTEM_FREE forwards surrounding mathematical spaces using trim only and returns 1024.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0244';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, " /data/storage/el2/base/files ", api);
          logAssertion(name, "FILESYSTEM_FREE MEDIUM_PAD; valid path byte count", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE MEDIUM_PAD; exact forwarded path without normalization",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
