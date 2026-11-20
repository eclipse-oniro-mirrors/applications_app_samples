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
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_PATH_FORWARD_G1_1000
     * @tc.name AppFsSpace_Routing_0245
     * @tc.desc Verify FILESYSTEM_FREE forwards padded Chinese directory using trim only and returns 1024.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0245';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "　/data/storage/el2/base/files/测试　", api);
          logAssertion(name, "FILESYSTEM_FREE CJK_PAD; valid path byte count", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE CJK_PAD; exact forwarded path without normalization",
            actualCalls, "filesystem:/data/storage/el2/base/files/测试");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files/测试");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_PATH_FORWARD_G1_1100
     * @tc.name AppFsSpace_Routing_0246
     * @tc.desc Verify FILESYSTEM_FREE forwards surrounding byte-order marks using trim only and returns 1024.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0246';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "﻿/data/storage/el2/base/files﻿", api);
          logAssertion(name, "FILESYSTEM_FREE BOM_PAD; valid path byte count", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE BOM_PAD; exact forwarded path without normalization",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_PATH_FORWARD_G1_1200
     * @tc.name AppFsSpace_Routing_0247
     * @tc.desc Verify FILESYSTEM_FREE forwards parent segment without resolution using trim only and returns 1024.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0247';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files/../cache", api);
          logAssertion(name, "FILESYSTEM_FREE DOT_PARENT; valid path byte count", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE DOT_PARENT; exact forwarded path without normalization",
            actualCalls, "filesystem:/data/storage/el2/base/files/../cache");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files/../cache");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_PATH_FORWARD_G1_1300
     * @tc.name AppFsSpace_Routing_0248
     * @tc.desc Verify FILESYSTEM_FREE forwards duplicate separators using trim only and returns 1024.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0248';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data//storage/el2/base/files", api);
          logAssertion(name, "FILESYSTEM_FREE DOUBLE_SLASH; valid path byte count", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE DOUBLE_SLASH; exact forwarded path without normalization",
            actualCalls, "filesystem:/data//storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data//storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_PATH_FORWARD_G1_1400
     * @tc.name AppFsSpace_Routing_0249
     * @tc.desc Verify FILESYSTEM_FREE forwards current-directory segment using trim only and returns 1024.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0249';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files/./images", api);
          logAssertion(name, "FILESYSTEM_FREE DOT_CHILD; valid path byte count", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE DOT_CHILD; exact forwarded path without normalization",
            actualCalls, "filesystem:/data/storage/el2/base/files/./images");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files/./images");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_PATH_FORWARD_G1_1500
     * @tc.name AppFsSpace_Routing_0250
     * @tc.desc Verify FILESYSTEM_FREE forwards trailing separator using trim only and returns 1024.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0250';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files/", api);
          logAssertion(name, "FILESYSTEM_FREE TRAILING_SLASH; valid path byte count", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE TRAILING_SLASH; exact forwarded path without normalization",
            actualCalls, "filesystem:/data/storage/el2/base/files/");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files/");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_PATH_FORWARD_G1_1600
     * @tc.name AppFsSpace_Routing_0251
     * @tc.desc Verify FILESYSTEM_FREE forwards relative application filename using trim only and returns 1024.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0251';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualBytes: number = await queryStorage(StorageOperation.FILESYSTEM_FREE, "files/config.json", api);
          logAssertion(name, "FILESYSTEM_FREE RELATIVE; valid path byte count", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE RELATIVE; exact forwarded path without normalization",
            actualCalls, "filesystem:files/config.json");
          expect(actualCalls).assertEqual("filesystem:files/config.json");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_PATH_FORWARD_G1_1700
     * @tc.name AppFsSpace_Routing_0252
     * @tc.desc Verify FILESYSTEM_FREE forwards current-directory token using trim only and returns 1024.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0252';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualBytes: number = await queryStorage(StorageOperation.FILESYSTEM_FREE, ".", api);
          logAssertion(name, "FILESYSTEM_FREE CURRENT; valid path byte count", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE CURRENT; exact forwarded path without normalization", actualCalls, "filesystem:.");
          expect(actualCalls).assertEqual("filesystem:.");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_PATH_FORWARD_G1_1800
     * @tc.name AppFsSpace_Routing_0253
     * @tc.desc Verify FILESYSTEM_FREE forwards parent-directory token using trim only and returns 1024.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0253';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualBytes: number = await queryStorage(StorageOperation.FILESYSTEM_FREE, "..", api);
          logAssertion(name, "FILESYSTEM_FREE PARENT; valid path byte count", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE PARENT; exact forwarded path without normalization", actualCalls, "filesystem:..");
          expect(actualCalls).assertEqual("filesystem:..");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_PATH_FORWARD_G1_1900
     * @tc.name AppFsSpace_Routing_0254
     * @tc.desc Verify FILESYSTEM_FREE forwards composed Unicode filename using trim only and returns 1024.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0254';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files/café", api);
          logAssertion(name, "FILESYSTEM_FREE COMPOSED; valid path byte count", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE COMPOSED; exact forwarded path without normalization",
            actualCalls, "filesystem:/data/storage/el2/base/files/café");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files/café");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_PATH_FORWARD_G1_2000
     * @tc.name AppFsSpace_Routing_0255
     * @tc.desc Verify FILESYSTEM_FREE forwards decomposed Unicode filename using trim only and returns 1024.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0255';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files/café", api);
          logAssertion(name, "FILESYSTEM_FREE DECOMPOSED; valid path byte count", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE DECOMPOSED; exact forwarded path without normalization",
            actualCalls, "filesystem:/data/storage/el2/base/files/café");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files/café");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_PATH_FORWARD_G1_2100
     * @tc.name AppFsSpace_Routing_0256
     * @tc.desc Verify FILESYSTEM_FREE forwards zero-width space is not trim whitespace using trim only and returns
     * 1024.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0256';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualBytes: number = await queryStorage(StorageOperation.FILESYSTEM_FREE, "​", api);
          logAssertion(name, "FILESYSTEM_FREE ZERO_WIDTH; valid path byte count", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE ZERO_WIDTH; exact forwarded path without normalization", actualCalls, "filesystem:​");
          expect(actualCalls).assertEqual("filesystem:​");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_PATH_FORWARD_G1_2200
     * @tc.name AppFsSpace_Routing_0257
     * @tc.desc Verify FILESYSTEM_FREE forwards Mongolian vowel separator is not trim whitespace using trim only and
     * returns 1024.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0257';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualBytes: number = await queryStorage(StorageOperation.FILESYSTEM_FREE, "᠎", api);
          logAssertion(name, "FILESYSTEM_FREE MONGOLIAN; valid path byte count", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE MONGOLIAN; exact forwarded path without normalization", actualCalls, "filesystem:᠎");
          expect(actualCalls).assertEqual("filesystem:᠎");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_PATH_FORWARD_G1_2300
     * @tc.name AppFsSpace_Routing_0258
     * @tc.desc Verify FILESYSTEM_FREE forwards word joiner is not trim whitespace using trim only and returns 1024.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0258';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualBytes: number = await queryStorage(StorageOperation.FILESYSTEM_FREE, "⁠", api);
          logAssertion(name, "FILESYSTEM_FREE WORD_JOINER; valid path byte count", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE WORD_JOINER; exact forwarded path without normalization", actualCalls, "filesystem:⁠");
          expect(actualCalls).assertEqual("filesystem:⁠");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_PATH_FORWARD_G1_2400
     * @tc.name AppFsSpace_Routing_0259
     * @tc.desc Verify FILESYSTEM_FREE forwards next-line control is not ECMAScript trim whitespace using trim only and
     * returns 1024.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0259';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualBytes: number = await queryStorage(StorageOperation.FILESYSTEM_FREE, "", api);
          logAssertion(name, "FILESYSTEM_FREE NEXT_LINE; valid path byte count", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE NEXT_LINE; exact forwarded path without normalization", actualCalls, "filesystem:");
          expect(actualCalls).assertEqual("filesystem:");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CALLBACK_DELAY_G1_0100
     * @tc.name AppFsSpace_Routing_0260
     * @tc.desc Verify FILESYSTEM_FREE stays pending then accepts delayed bytes=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0260';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.deferFilesystem = true;
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api)
              .then((bytes: number): number => {
                completed = true;
                completionCount++;
                return bytes;
              }, (error: Error): number => {
                completed = true;
                completionCount++;
                throw error;
              });
          await Promise.resolve();
          await Promise.resolve();
          await Promise.resolve();
          const actualPending: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; dependency is called before the pending observation",
            actualStartedCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualStartedCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          api.completeFilesystem(undefined, 0);
          const actualBytes: number = await pending;
          logAssertion(name, "FILESYSTEM_FREE delayed bytes=0; settled result", actualBytes, 0);
          expect(actualBytes).assertEqual(0);
          const actualCompleted: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "FILESYSTEM_FREE; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE delayed bytes=0; completion does not repeat the SDK call",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CALLBACK_DELAY_G1_0200
     * @tc.name AppFsSpace_Routing_0261
     * @tc.desc Verify FILESYSTEM_FREE stays pending then accepts delayed bytes=1024.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0261';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.deferFilesystem = true;
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api)
              .then((bytes: number): number => {
                completed = true;
                completionCount++;
                return bytes;
              }, (error: Error): number => {
                completed = true;
                completionCount++;
                throw error;
              });
          await Promise.resolve();
          await Promise.resolve();
          await Promise.resolve();
          const actualPending: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; dependency is called before the pending observation",
            actualStartedCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualStartedCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          api.completeFilesystem(undefined, 1024);
          const actualBytes: number = await pending;
          logAssertion(name, "FILESYSTEM_FREE delayed bytes=1024; settled result", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCompleted: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "FILESYSTEM_FREE; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE delayed bytes=1024; completion does not repeat the SDK call",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CALLBACK_DELAY_G1_0300
     * @tc.name AppFsSpace_Routing_0262
     * @tc.desc Verify FILESYSTEM_FREE stays pending then accepts delayed bytes=9007199254740991.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0262';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.deferFilesystem = true;
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api)
              .then((bytes: number): number => {
                completed = true;
                completionCount++;
                return bytes;
              }, (error: Error): number => {
                completed = true;
                completionCount++;
                throw error;
              });
          await Promise.resolve();
          await Promise.resolve();
          await Promise.resolve();
          const actualPending: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; dependency is called before the pending observation",
            actualStartedCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualStartedCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          api.completeFilesystem(undefined, 9007199254740991);
          const actualBytes: number = await pending;
          logAssertion(name,
            "FILESYSTEM_FREE delayed bytes=9007199254740991; settled result", actualBytes, 9007199254740991);
          expect(actualBytes).assertEqual(9007199254740991);
          const actualCompleted: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "FILESYSTEM_FREE; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE delayed bytes=9007199254740991; completion does not repeat the SDK call",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CALLBACK_DELAY_G1_0400
     * @tc.name AppFsSpace_Routing_0263
     * @tc.desc Verify FILESYSTEM_FREE stays pending then rejects delayed invalid bytes=-1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0263';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.deferFilesystem = true;
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api)
              .then((bytes: number): number => {
                completed = true;
                completionCount++;
                return bytes;
              }, (error: Error): number => {
                completed = true;
                completionCount++;
                throw error;
              });
          await Promise.resolve();
          await Promise.resolve();
          await Promise.resolve();
          const actualPending: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; dependency is called before the pending observation",
            actualStartedCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualStartedCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          api.completeFilesystem(undefined, -1);
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await pending;
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
          const actualCompleted: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "FILESYSTEM_FREE; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CALLBACK_DELAY_G1_0500
     * @tc.name AppFsSpace_Routing_0264
     * @tc.desc Verify FILESYSTEM_FREE stays pending then rejects delayed invalid bytes=Number.NaN.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0264';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.deferFilesystem = true;
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api)
              .then((bytes: number): number => {
                completed = true;
                completionCount++;
                return bytes;
              }, (error: Error): number => {
                completed = true;
                completionCount++;
                throw error;
              });
          await Promise.resolve();
          await Promise.resolve();
          await Promise.resolve();
          const actualPending: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; dependency is called before the pending observation",
            actualStartedCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualStartedCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          api.completeFilesystem(undefined, Number.NaN);
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await pending;
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
          const actualCompleted: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "FILESYSTEM_FREE; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CALLBACK_DELAY_G1_0600
     * @tc.name AppFsSpace_Routing_0265
     * @tc.desc Verify FILESYSTEM_FREE stays pending then rejects delayed invalid bytes=9007199254740992.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0265';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.deferFilesystem = true;
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api)
              .then((bytes: number): number => {
                completed = true;
                completionCount++;
                return bytes;
              }, (error: Error): number => {
                completed = true;
                completionCount++;
                throw error;
              });
          await Promise.resolve();
          await Promise.resolve();
          await Promise.resolve();
          const actualPending: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; dependency is called before the pending observation",
            actualStartedCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualStartedCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          api.completeFilesystem(undefined, 9007199254740992);
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await pending;
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
          const actualCompleted: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "FILESYSTEM_FREE; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CALLBACK_DELAY_G1_0700
     * @tc.name AppFsSpace_Routing_0266
     * @tc.desc Verify FILESYSTEM_FREE delayed callback error wins over bytes=0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0266';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.deferFilesystem = true;
          const sdkError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "Delayed filesystem permission denied"
          };
          api.filesystemError = sdkError;
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api)
              .then((bytes: number): number => {
                completed = true;
                completionCount++;
                return bytes;
              }, (error: Error): number => {
                completed = true;
                completionCount++;
                throw error;
              });
          await Promise.resolve();
          await Promise.resolve();
          await Promise.resolve();
          const actualPending: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; dependency is called before the pending observation",
            actualStartedCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualStartedCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          api.completeFilesystem(sdkError, 0);
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          let failureError: Error | undefined = undefined;
          try {
            await pending;
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
            failureMessage, "Delayed filesystem permission denied");
          expect(failureMessage).assertEqual("Delayed filesystem permission denied");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "FILESYSTEM_FREE; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; error does not fall through to another method",
            failureCalls, "filesystem:/data/storage/el2/base/files");
          expect(failureCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          const actualCompleted: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "FILESYSTEM_FREE; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
          const actualErrorCode: number = (failureError as BusinessError).code;
          logAssertion(name,
            "FILESYSTEM_FREE delayed bytes=0; original callback error code", actualErrorCode, 13900002);
          expect(actualErrorCode).assertEqual(13900002);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CALLBACK_DELAY_G1_0800
     * @tc.name AppFsSpace_Routing_0267
     * @tc.desc Verify FILESYSTEM_FREE delayed callback error wins over bytes=1024.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0267';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.deferFilesystem = true;
          const sdkError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "Delayed filesystem permission denied"
          };
          api.filesystemError = sdkError;
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api)
              .then((bytes: number): number => {
                completed = true;
                completionCount++;
                return bytes;
              }, (error: Error): number => {
                completed = true;
                completionCount++;
                throw error;
              });
          await Promise.resolve();
          await Promise.resolve();
          await Promise.resolve();
          const actualPending: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; dependency is called before the pending observation",
            actualStartedCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualStartedCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          api.completeFilesystem(sdkError, 1024);
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          let failureError: Error | undefined = undefined;
          try {
            await pending;
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
            failureMessage, "Delayed filesystem permission denied");
          expect(failureMessage).assertEqual("Delayed filesystem permission denied");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "FILESYSTEM_FREE; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; error does not fall through to another method",
            failureCalls, "filesystem:/data/storage/el2/base/files");
          expect(failureCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          const actualCompleted: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "FILESYSTEM_FREE; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
          const actualErrorCode: number = (failureError as BusinessError).code;
          logAssertion(name,
            "FILESYSTEM_FREE delayed bytes=1024; original callback error code", actualErrorCode, 13900002);
          expect(actualErrorCode).assertEqual(13900002);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CALLBACK_DELAY_G1_0900
     * @tc.name AppFsSpace_Routing_0268
     * @tc.desc Verify FILESYSTEM_FREE delayed callback error wins over bytes=-1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0268';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.deferFilesystem = true;
          const sdkError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "Delayed filesystem permission denied"
          };
          api.filesystemError = sdkError;
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api)
              .then((bytes: number): number => {
                completed = true;
                completionCount++;
                return bytes;
              }, (error: Error): number => {
                completed = true;
                completionCount++;
                throw error;
              });
          await Promise.resolve();
          await Promise.resolve();
          await Promise.resolve();
          const actualPending: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; dependency is called before the pending observation",
            actualStartedCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualStartedCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          api.completeFilesystem(sdkError, -1);
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          let failureError: Error | undefined = undefined;
          try {
            await pending;
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
            failureMessage, "Delayed filesystem permission denied");
          expect(failureMessage).assertEqual("Delayed filesystem permission denied");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "FILESYSTEM_FREE; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; error does not fall through to another method",
            failureCalls, "filesystem:/data/storage/el2/base/files");
          expect(failureCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          const actualCompleted: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "FILESYSTEM_FREE; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
          const actualErrorCode: number = (failureError as BusinessError).code;
          logAssertion(name,
            "FILESYSTEM_FREE delayed bytes=-1; original callback error code", actualErrorCode, 13900002);
          expect(actualErrorCode).assertEqual(13900002);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CALLBACK_DELAY_G1_1000
     * @tc.name AppFsSpace_Routing_0269
     * @tc.desc Verify FILESYSTEM_FREE delayed callback error wins over bytes=0.5.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0269';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.deferFilesystem = true;
          const sdkError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "Delayed filesystem permission denied"
          };
          api.filesystemError = sdkError;
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api)
              .then((bytes: number): number => {
                completed = true;
                completionCount++;
                return bytes;
              }, (error: Error): number => {
                completed = true;
                completionCount++;
                throw error;
              });
          await Promise.resolve();
          await Promise.resolve();
          await Promise.resolve();
          const actualPending: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; dependency is called before the pending observation",
            actualStartedCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualStartedCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          api.completeFilesystem(sdkError, 0.5);
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          let failureError: Error | undefined = undefined;
          try {
            await pending;
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
            failureMessage, "Delayed filesystem permission denied");
          expect(failureMessage).assertEqual("Delayed filesystem permission denied");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "FILESYSTEM_FREE; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; error does not fall through to another method",
            failureCalls, "filesystem:/data/storage/el2/base/files");
          expect(failureCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          const actualCompleted: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "FILESYSTEM_FREE; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
          const actualErrorCode: number = (failureError as BusinessError).code;
          logAssertion(name,
            "FILESYSTEM_FREE delayed bytes=0.5; original callback error code", actualErrorCode, 13900002);
          expect(actualErrorCode).assertEqual(13900002);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CALLBACK_DELAY_G1_1100
     * @tc.name AppFsSpace_Routing_0270
     * @tc.desc Verify FILESYSTEM_FREE delayed callback error wins over bytes=Number.NaN.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0270';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.deferFilesystem = true;
          const sdkError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "Delayed filesystem permission denied"
          };
          api.filesystemError = sdkError;
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api)
              .then((bytes: number): number => {
                completed = true;
                completionCount++;
                return bytes;
              }, (error: Error): number => {
                completed = true;
                completionCount++;
                throw error;
              });
          await Promise.resolve();
          await Promise.resolve();
          await Promise.resolve();
          const actualPending: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; dependency is called before the pending observation",
            actualStartedCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualStartedCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          api.completeFilesystem(sdkError, Number.NaN);
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          let failureError: Error | undefined = undefined;
          try {
            await pending;
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
            failureMessage, "Delayed filesystem permission denied");
          expect(failureMessage).assertEqual("Delayed filesystem permission denied");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "FILESYSTEM_FREE; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; error does not fall through to another method",
            failureCalls, "filesystem:/data/storage/el2/base/files");
          expect(failureCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          const actualCompleted: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "FILESYSTEM_FREE; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
          const actualErrorCode: number = (failureError as BusinessError).code;
          logAssertion(name,
            "FILESYSTEM_FREE delayed bytes=Number.NaN; original callback error code", actualErrorCode, 13900002);
          expect(actualErrorCode).assertEqual(13900002);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CALLBACK_DELAY_G1_1200
     * @tc.name AppFsSpace_Routing_0271
     * @tc.desc Verify FILESYSTEM_FREE delayed callback error wins over bytes=9007199254740992.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0271';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.deferFilesystem = true;
          const sdkError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "Delayed filesystem permission denied"
          };
          api.filesystemError = sdkError;
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api)
              .then((bytes: number): number => {
                completed = true;
                completionCount++;
                return bytes;
              }, (error: Error): number => {
                completed = true;
                completionCount++;
                throw error;
              });
          await Promise.resolve();
          await Promise.resolve();
          await Promise.resolve();
          const actualPending: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; dependency is called before the pending observation",
            actualStartedCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualStartedCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          api.completeFilesystem(sdkError, 9007199254740992);
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          let failureError: Error | undefined = undefined;
          try {
            await pending;
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
            failureMessage, "Delayed filesystem permission denied");
          expect(failureMessage).assertEqual("Delayed filesystem permission denied");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "FILESYSTEM_FREE; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; error does not fall through to another method",
            failureCalls, "filesystem:/data/storage/el2/base/files");
          expect(failureCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          const actualCompleted: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "FILESYSTEM_FREE; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
          const actualErrorCode: number = (failureError as BusinessError).code;
          logAssertion(name,
            "FILESYSTEM_FREE delayed bytes=9007199254740992; original callback error code", actualErrorCode, 13900002);
          expect(actualErrorCode).assertEqual(13900002);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CALLBACK_FIRST_G1_0100
     * @tc.name AppFsSpace_Routing_0272
     * @tc.desc Verify FILESYSTEM_FREE first ZERO completion is final despite second ZERO.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0272';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.deferFilesystem = true;
          const firstError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "First filesystem callback failed"
          };
          api.filesystemError = firstError;
          const secondError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "Second filesystem callback failed"
          };
          api.filesystemError = secondError;
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api)
              .then((bytes: number): number => {
                completed = true;
                completionCount++;
                return bytes;
              }, (error: Error): number => {
                completed = true;
                completionCount++;
                throw error;
              });
          await Promise.resolve();
          await Promise.resolve();
          await Promise.resolve();
          const actualPending: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; dependency is called before the pending observation",
            actualStartedCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualStartedCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          api.completeFilesystem(undefined, 0);
          api.completeFilesystem(undefined, 0);
          const actualBytes: number = await pending;
          logAssertion(name, "FILESYSTEM_FREE first=ZERO second=ZERO; first success remains final", actualBytes, 0);
          expect(actualBytes).assertEqual(0);
          const actualCompleted: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "FILESYSTEM_FREE; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE first=ZERO second=ZERO; repeated callback is not a new query",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CALLBACK_FIRST_G1_0200
     * @tc.name AppFsSpace_Routing_0273
     * @tc.desc Verify FILESYSTEM_FREE first ZERO completion is final despite second MAX.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0273';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.deferFilesystem = true;
          const firstError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "First filesystem callback failed"
          };
          api.filesystemError = firstError;
          const secondError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "Second filesystem callback failed"
          };
          api.filesystemError = secondError;
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api)
              .then((bytes: number): number => {
                completed = true;
                completionCount++;
                return bytes;
              }, (error: Error): number => {
                completed = true;
                completionCount++;
                throw error;
              });
          await Promise.resolve();
          await Promise.resolve();
          await Promise.resolve();
          const actualPending: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; dependency is called before the pending observation",
            actualStartedCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualStartedCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          api.completeFilesystem(undefined, 0);
          api.completeFilesystem(undefined, 9007199254740991);
          const actualBytes: number = await pending;
          logAssertion(name, "FILESYSTEM_FREE first=ZERO second=MAX; first success remains final", actualBytes, 0);
          expect(actualBytes).assertEqual(0);
          const actualCompleted: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "FILESYSTEM_FREE; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE first=ZERO second=MAX; repeated callback is not a new query",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CALLBACK_FIRST_G1_0300
     * @tc.name AppFsSpace_Routing_0274
     * @tc.desc Verify FILESYSTEM_FREE first ZERO completion is final despite second NAN.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0274';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.deferFilesystem = true;
          const firstError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "First filesystem callback failed"
          };
          api.filesystemError = firstError;
          const secondError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "Second filesystem callback failed"
          };
          api.filesystemError = secondError;
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api)
              .then((bytes: number): number => {
                completed = true;
                completionCount++;
                return bytes;
              }, (error: Error): number => {
                completed = true;
                completionCount++;
                throw error;
              });
          await Promise.resolve();
          await Promise.resolve();
          await Promise.resolve();
          const actualPending: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; dependency is called before the pending observation",
            actualStartedCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualStartedCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          api.completeFilesystem(undefined, 0);
          api.completeFilesystem(undefined, Number.NaN);
          const actualBytes: number = await pending;
          logAssertion(name, "FILESYSTEM_FREE first=ZERO second=NAN; first success remains final", actualBytes, 0);
          expect(actualBytes).assertEqual(0);
          const actualCompleted: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "FILESYSTEM_FREE; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE first=ZERO second=NAN; repeated callback is not a new query",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CALLBACK_FIRST_G1_0400
     * @tc.name AppFsSpace_Routing_0275
     * @tc.desc Verify FILESYSTEM_FREE first ZERO completion is final despite second SDK_ERROR.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0275';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.deferFilesystem = true;
          const firstError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "First filesystem callback failed"
          };
          api.filesystemError = firstError;
          const secondError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "Second filesystem callback failed"
          };
          api.filesystemError = secondError;
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api)
              .then((bytes: number): number => {
                completed = true;
                completionCount++;
                return bytes;
              }, (error: Error): number => {
                completed = true;
                completionCount++;
                throw error;
              });
          await Promise.resolve();
          await Promise.resolve();
          await Promise.resolve();
          const actualPending: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; dependency is called before the pending observation",
            actualStartedCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualStartedCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          api.completeFilesystem(undefined, 0);
          api.completeFilesystem(secondError, 9007199254740992);
          const actualBytes: number = await pending;
          logAssertion(name,
            "FILESYSTEM_FREE first=ZERO second=SDK_ERROR; first success remains final", actualBytes, 0);
          expect(actualBytes).assertEqual(0);
          const actualCompleted: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "FILESYSTEM_FREE; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE first=ZERO second=SDK_ERROR; repeated callback is not a new query",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CALLBACK_FIRST_G1_0500
     * @tc.name AppFsSpace_Routing_0276
     * @tc.desc Verify FILESYSTEM_FREE first MAX completion is final despite second ZERO.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0276';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.deferFilesystem = true;
          const firstError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "First filesystem callback failed"
          };
          api.filesystemError = firstError;
          const secondError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "Second filesystem callback failed"
          };
          api.filesystemError = secondError;
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api)
              .then((bytes: number): number => {
                completed = true;
                completionCount++;
                return bytes;
              }, (error: Error): number => {
                completed = true;
                completionCount++;
                throw error;
              });
          await Promise.resolve();
          await Promise.resolve();
          await Promise.resolve();
          const actualPending: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; dependency is called before the pending observation",
            actualStartedCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualStartedCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          api.completeFilesystem(undefined, 9007199254740991);
          api.completeFilesystem(undefined, 0);
          const actualBytes: number = await pending;
          logAssertion(name,
            "FILESYSTEM_FREE first=MAX second=ZERO; first success remains final", actualBytes, 9007199254740991);
          expect(actualBytes).assertEqual(9007199254740991);
          const actualCompleted: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "FILESYSTEM_FREE; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE first=MAX second=ZERO; repeated callback is not a new query",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CALLBACK_FIRST_G1_0600
     * @tc.name AppFsSpace_Routing_0277
     * @tc.desc Verify FILESYSTEM_FREE first MAX completion is final despite second MAX.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0277';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.deferFilesystem = true;
          const firstError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "First filesystem callback failed"
          };
          api.filesystemError = firstError;
          const secondError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "Second filesystem callback failed"
          };
          api.filesystemError = secondError;
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api)
              .then((bytes: number): number => {
                completed = true;
                completionCount++;
                return bytes;
              }, (error: Error): number => {
                completed = true;
                completionCount++;
                throw error;
              });
          await Promise.resolve();
          await Promise.resolve();
          await Promise.resolve();
          const actualPending: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; dependency is called before the pending observation",
            actualStartedCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualStartedCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          api.completeFilesystem(undefined, 9007199254740991);
          api.completeFilesystem(undefined, 9007199254740991);
          const actualBytes: number = await pending;
          logAssertion(name,
            "FILESYSTEM_FREE first=MAX second=MAX; first success remains final", actualBytes, 9007199254740991);
          expect(actualBytes).assertEqual(9007199254740991);
          const actualCompleted: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "FILESYSTEM_FREE; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE first=MAX second=MAX; repeated callback is not a new query",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CALLBACK_FIRST_G1_0700
     * @tc.name AppFsSpace_Routing_0278
     * @tc.desc Verify FILESYSTEM_FREE first MAX completion is final despite second NAN.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0278';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.deferFilesystem = true;
          const firstError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "First filesystem callback failed"
          };
          api.filesystemError = firstError;
          const secondError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "Second filesystem callback failed"
          };
          api.filesystemError = secondError;
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api)
              .then((bytes: number): number => {
                completed = true;
                completionCount++;
                return bytes;
              }, (error: Error): number => {
                completed = true;
                completionCount++;
                throw error;
              });
          await Promise.resolve();
          await Promise.resolve();
          await Promise.resolve();
          const actualPending: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; dependency is called before the pending observation",
            actualStartedCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualStartedCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          api.completeFilesystem(undefined, 9007199254740991);
          api.completeFilesystem(undefined, Number.NaN);
          const actualBytes: number = await pending;
          logAssertion(name,
            "FILESYSTEM_FREE first=MAX second=NAN; first success remains final", actualBytes, 9007199254740991);
          expect(actualBytes).assertEqual(9007199254740991);
          const actualCompleted: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "FILESYSTEM_FREE; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE first=MAX second=NAN; repeated callback is not a new query",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CALLBACK_FIRST_G1_0800
     * @tc.name AppFsSpace_Routing_0279
     * @tc.desc Verify FILESYSTEM_FREE first MAX completion is final despite second SDK_ERROR.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0279';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.deferFilesystem = true;
          const firstError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "First filesystem callback failed"
          };
          api.filesystemError = firstError;
          const secondError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "Second filesystem callback failed"
          };
          api.filesystemError = secondError;
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api)
              .then((bytes: number): number => {
                completed = true;
                completionCount++;
                return bytes;
              }, (error: Error): number => {
                completed = true;
                completionCount++;
                throw error;
              });
          await Promise.resolve();
          await Promise.resolve();
          await Promise.resolve();
          const actualPending: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; dependency is called before the pending observation",
            actualStartedCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualStartedCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          api.completeFilesystem(undefined, 9007199254740991);
          api.completeFilesystem(secondError, 9007199254740992);
          const actualBytes: number = await pending;
          logAssertion(name,
            "FILESYSTEM_FREE first=MAX second=SDK_ERROR; first success remains final", actualBytes, 9007199254740991);
          expect(actualBytes).assertEqual(9007199254740991);
          const actualCompleted: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "FILESYSTEM_FREE; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
          const actualCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE first=MAX second=SDK_ERROR; repeated callback is not a new query",
            actualCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CALLBACK_FIRST_G1_0900
     * @tc.name AppFsSpace_Routing_0280
     * @tc.desc Verify FILESYSTEM_FREE first NAN completion is final despite second ZERO.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0280';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.deferFilesystem = true;
          const firstError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "First filesystem callback failed"
          };
          api.filesystemError = firstError;
          const secondError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "Second filesystem callback failed"
          };
          api.filesystemError = secondError;
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api)
              .then((bytes: number): number => {
                completed = true;
                completionCount++;
                return bytes;
              }, (error: Error): number => {
                completed = true;
                completionCount++;
                throw error;
