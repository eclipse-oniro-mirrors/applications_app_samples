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

export default function storageRoutingSuite04Test(): void {
  describe('StorageRoutingSuite04', (): void => {
    beforeEach(yieldTestLoop);
    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_DEFERRED_TOTAL_G1_0300
     * @tc.name AppFsSpace_Routing_0296
     * @tc.desc Verify TOTAL validates deferred bytes=9007199254740991 rather than the invalid fallback field.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0296';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          const deferred: DeferredBytes = new DeferredBytes();
          api.totalDeferred = deferred;
          api.totalBytes = -1;
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api)
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
          logAssertion(name, "TOTAL; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; dependency is called before the pending observation", actualStartedCalls, "total");
          expect(actualStartedCalls).assertEqual("total");
          deferred.resolve(9007199254740991);
          const actualBytes: number = await pending;
          logAssertion(name,
            "TOTAL deferred bytes=9007199254740991; deferred result supersedes fallback bytes=-1",
            actualBytes, 9007199254740991);
          expect(actualBytes).assertEqual(9007199254740991);
          const actualCompleted: boolean = completed;
          logAssertion(name, "TOTAL; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "TOTAL; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_DEFERRED_TOTAL_G1_0400
     * @tc.name AppFsSpace_Routing_0297
     * @tc.desc Verify TOTAL validates deferred bytes=Number.NaN rather than the invalid fallback field.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0297';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          const deferred: DeferredBytes = new DeferredBytes();
          api.totalDeferred = deferred;
          api.totalBytes = -1;
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api)
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
          logAssertion(name, "TOTAL; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; dependency is called before the pending observation", actualStartedCalls, "total");
          expect(actualStartedCalls).assertEqual("total");
          deferred.resolve(Number.NaN);
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
          const actualCompleted: boolean = completed;
          logAssertion(name, "TOTAL; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "TOTAL; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_DEFERRED_TOTAL_G1_0500
     * @tc.name AppFsSpace_Routing_0298
     * @tc.desc Verify TOTAL validates deferred bytes=9007199254740992 rather than the invalid fallback field.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0298';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          const deferred: DeferredBytes = new DeferredBytes();
          api.totalDeferred = deferred;
          api.totalBytes = -1;
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api)
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
          logAssertion(name, "TOTAL; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; dependency is called before the pending observation", actualStartedCalls, "total");
          expect(actualStartedCalls).assertEqual("total");
          deferred.resolve(9007199254740992);
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
          const actualCompleted: boolean = completed;
          logAssertion(name, "TOTAL; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "TOTAL; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_DEFERRED_TOTAL_G1_0600
     * @tc.name AppFsSpace_Routing_0299
     * @tc.desc Verify TOTAL remains pending then propagates deferred Error unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0299';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          const deferred: DeferredBytes = new DeferredBytes();
          api.totalDeferred = deferred;
          api.totalBytes = 9007199254740991;
          const sdkError: Error = new Error("Deferred storage request failed");
          sdkError.name = "Error";
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api)
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
          logAssertion(name, "TOTAL; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; dependency is called before the pending observation", actualStartedCalls, "total");
          expect(actualStartedCalls).assertEqual("total");
          deferred.reject(sdkError);
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
          logAssertion(name, 'TOTAL; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'TOTAL; captured error name', failureName, "Error");
          expect(failureName).assertEqual("Error");
          logAssertion(name, 'TOTAL; captured error message',
            failureMessage, "Deferred storage request failed");
          expect(failureMessage).assertEqual("Deferred storage request failed");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "TOTAL; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; error does not fall through to another method", failureCalls, "total");
          expect(failureCalls).assertEqual("total");
          const actualCompleted: boolean = completed;
          logAssertion(name, "TOTAL; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "TOTAL; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_DEFERRED_TOTAL_G1_0700
     * @tc.name AppFsSpace_Routing_0300
     * @tc.desc Verify TOTAL remains pending then propagates deferred RangeError unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0300';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          const deferred: DeferredBytes = new DeferredBytes();
          api.totalDeferred = deferred;
          api.totalBytes = 9007199254740991;
          const sdkError: Error = new Error("Deferred storage request failed");
          sdkError.name = "RangeError";
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api)
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
          logAssertion(name, "TOTAL; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; dependency is called before the pending observation", actualStartedCalls, "total");
          expect(actualStartedCalls).assertEqual("total");
          deferred.reject(sdkError);
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
          logAssertion(name, 'TOTAL; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'TOTAL; captured error name', failureName, "RangeError");
          expect(failureName).assertEqual("RangeError");
          logAssertion(name, 'TOTAL; captured error message',
            failureMessage, "Deferred storage request failed");
          expect(failureMessage).assertEqual("Deferred storage request failed");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "TOTAL; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; error does not fall through to another method", failureCalls, "total");
          expect(failureCalls).assertEqual("total");
          const actualCompleted: boolean = completed;
          logAssertion(name, "TOTAL; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "TOTAL; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_DEFERRED_FREE_G1_0100
     * @tc.name AppFsSpace_Routing_0301
     * @tc.desc Verify FREE validates deferred bytes=0 rather than the invalid fallback field.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0301';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          const deferred: DeferredBytes = new DeferredBytes();
          api.freeDeferred = deferred;
          api.freeBytes = -1;
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api)
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
          logAssertion(name, "FREE; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name, "FREE; dependency is called before the pending observation", actualStartedCalls, "free");
          expect(actualStartedCalls).assertEqual("free");
          deferred.resolve(0);
          const actualBytes: number = await pending;
          logAssertion(name, "FREE deferred bytes=0; deferred result supersedes fallback bytes=-1", actualBytes, 0);
          expect(actualBytes).assertEqual(0);
          const actualCompleted: boolean = completed;
          logAssertion(name, "FREE; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "FREE; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_DEFERRED_FREE_G1_0200
     * @tc.name AppFsSpace_Routing_0302
     * @tc.desc Verify FREE validates deferred bytes=1024 rather than the invalid fallback field.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0302';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          const deferred: DeferredBytes = new DeferredBytes();
          api.freeDeferred = deferred;
          api.freeBytes = -1;
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api)
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
          logAssertion(name, "FREE; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name, "FREE; dependency is called before the pending observation", actualStartedCalls, "free");
          expect(actualStartedCalls).assertEqual("free");
          deferred.resolve(1024);
          const actualBytes: number = await pending;
          logAssertion(name,
            "FREE deferred bytes=1024; deferred result supersedes fallback bytes=-1", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCompleted: boolean = completed;
          logAssertion(name, "FREE; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "FREE; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_DEFERRED_FREE_G1_0300
     * @tc.name AppFsSpace_Routing_0303
     * @tc.desc Verify FREE validates deferred bytes=9007199254740991 rather than the invalid fallback field.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0303';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          const deferred: DeferredBytes = new DeferredBytes();
          api.freeDeferred = deferred;
          api.freeBytes = -1;
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api)
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
          logAssertion(name, "FREE; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name, "FREE; dependency is called before the pending observation", actualStartedCalls, "free");
          expect(actualStartedCalls).assertEqual("free");
          deferred.resolve(9007199254740991);
          const actualBytes: number = await pending;
          logAssertion(name,
            "FREE deferred bytes=9007199254740991; deferred result supersedes fallback bytes=-1",
            actualBytes, 9007199254740991);
          expect(actualBytes).assertEqual(9007199254740991);
          const actualCompleted: boolean = completed;
          logAssertion(name, "FREE; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "FREE; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_DEFERRED_FREE_G1_0400
     * @tc.name AppFsSpace_Routing_0304
     * @tc.desc Verify FREE validates deferred bytes=Number.NaN rather than the invalid fallback field.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0304';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          const deferred: DeferredBytes = new DeferredBytes();
          api.freeDeferred = deferred;
          api.freeBytes = -1;
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api)
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
          logAssertion(name, "FREE; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name, "FREE; dependency is called before the pending observation", actualStartedCalls, "free");
          expect(actualStartedCalls).assertEqual("free");
          deferred.resolve(Number.NaN);
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
          const actualCompleted: boolean = completed;
          logAssertion(name, "FREE; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "FREE; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_DEFERRED_FREE_G1_0500
     * @tc.name AppFsSpace_Routing_0305
     * @tc.desc Verify FREE validates deferred bytes=9007199254740992 rather than the invalid fallback field.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0305';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          const deferred: DeferredBytes = new DeferredBytes();
          api.freeDeferred = deferred;
          api.freeBytes = -1;
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api)
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
          logAssertion(name, "FREE; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name, "FREE; dependency is called before the pending observation", actualStartedCalls, "free");
          expect(actualStartedCalls).assertEqual("free");
          deferred.resolve(9007199254740992);
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
          const actualCompleted: boolean = completed;
          logAssertion(name, "FREE; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "FREE; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_DEFERRED_FREE_G1_0600
     * @tc.name AppFsSpace_Routing_0306
     * @tc.desc Verify FREE remains pending then propagates deferred Error unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0306';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          const deferred: DeferredBytes = new DeferredBytes();
          api.freeDeferred = deferred;
          api.freeBytes = 9007199254740991;
          const sdkError: Error = new Error("Deferred storage request failed");
          sdkError.name = "Error";
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api)
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
          logAssertion(name, "FREE; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name, "FREE; dependency is called before the pending observation", actualStartedCalls, "free");
          expect(actualStartedCalls).assertEqual("free");
          deferred.reject(sdkError);
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
          logAssertion(name, 'FREE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FREE; captured error name', failureName, "Error");
          expect(failureName).assertEqual("Error");
          logAssertion(name, 'FREE; captured error message',
            failureMessage, "Deferred storage request failed");
          expect(failureMessage).assertEqual("Deferred storage request failed");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "FREE; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FREE; error does not fall through to another method", failureCalls, "free");
          expect(failureCalls).assertEqual("free");
          const actualCompleted: boolean = completed;
          logAssertion(name, "FREE; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "FREE; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_DEFERRED_FREE_G1_0700
     * @tc.name AppFsSpace_Routing_0307
     * @tc.desc Verify FREE remains pending then propagates deferred RangeError unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0307';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          const deferred: DeferredBytes = new DeferredBytes();
          api.freeDeferred = deferred;
          api.freeBytes = 9007199254740991;
          const sdkError: Error = new Error("Deferred storage request failed");
          sdkError.name = "RangeError";
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api)
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
          logAssertion(name, "FREE; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name, "FREE; dependency is called before the pending observation", actualStartedCalls, "free");
          expect(actualStartedCalls).assertEqual("free");
          deferred.reject(sdkError);
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
          logAssertion(name, 'FREE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FREE; captured error name', failureName, "RangeError");
          expect(failureName).assertEqual("RangeError");
          logAssertion(name, 'FREE; captured error message',
            failureMessage, "Deferred storage request failed");
          expect(failureMessage).assertEqual("Deferred storage request failed");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "FREE; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FREE; error does not fall through to another method", failureCalls, "free");
          expect(failureCalls).assertEqual("free");
          const actualCompleted: boolean = completed;
          logAssertion(name, "FREE; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "FREE; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_0100
     * @tc.name AppFsSpace_Routing_0308
     * @tc.desc Verify same probe first BUNDLE=1024 then BUNDLE=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0308';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          logAssertion(name, "first BUNDLE; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name, "first BUNDLE; only the first dependency has run", actualFirstCalls, "bundle");
          expect(actualFirstCalls).assertEqual("bundle");
          api.bundleStats.appSize = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/cache", api);
          logAssertion(name, "second BUNDLE; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first BUNDLE then BUNDLE; ordered independent invocation record", actualFinalCalls, "bundle|bundle");
          expect(actualFinalCalls).assertEqual("bundle|bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_0200
     * @tc.name AppFsSpace_Routing_0309
     * @tc.desc Verify same probe first BUNDLE=1024 then FILESYSTEM_FREE=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0309';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          logAssertion(name, "first BUNDLE; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name, "first BUNDLE; only the first dependency has run", actualFirstCalls, "bundle");
          expect(actualFirstCalls).assertEqual("bundle");
          api.filesystemBytes = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/cache", api);
          logAssertion(name,
            "second FILESYSTEM_FREE; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first BUNDLE then FILESYSTEM_FREE; ordered independent invocation record",
            actualFinalCalls, "bundle|filesystem:/data/storage/el2/base/cache");
          expect(actualFinalCalls).assertEqual("bundle|filesystem:/data/storage/el2/base/cache");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_0300
     * @tc.name AppFsSpace_Routing_0310
     * @tc.desc Verify same probe first BUNDLE=1024 then TOTAL=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0310';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          logAssertion(name, "first BUNDLE; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name, "first BUNDLE; only the first dependency has run", actualFirstCalls, "bundle");
          expect(actualFirstCalls).assertEqual("bundle");
          api.totalBytes = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/cache", api);
          logAssertion(name, "second TOTAL; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first BUNDLE then TOTAL; ordered independent invocation record", actualFinalCalls, "bundle|total");
          expect(actualFinalCalls).assertEqual("bundle|total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_0400
     * @tc.name AppFsSpace_Routing_0311
     * @tc.desc Verify same probe first BUNDLE=1024 then TOTAL_SYNC=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0311';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          logAssertion(name, "first BUNDLE; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name, "first BUNDLE; only the first dependency has run", actualFirstCalls, "bundle");
          expect(actualFirstCalls).assertEqual("bundle");
          api.totalSyncBytes = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/cache", api);
          logAssertion(name, "second TOTAL_SYNC; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first BUNDLE then TOTAL_SYNC; ordered independent invocation record",
            actualFinalCalls, "bundle|totalSync");
          expect(actualFinalCalls).assertEqual("bundle|totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_0500
     * @tc.name AppFsSpace_Routing_0312
     * @tc.desc Verify same probe first BUNDLE=1024 then FREE=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0312';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          logAssertion(name, "first BUNDLE; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name, "first BUNDLE; only the first dependency has run", actualFirstCalls, "bundle");
          expect(actualFirstCalls).assertEqual("bundle");
          api.freeBytes = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/cache", api);
          logAssertion(name, "second FREE; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first BUNDLE then FREE; ordered independent invocation record", actualFinalCalls, "bundle|free");
          expect(actualFinalCalls).assertEqual("bundle|free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_0600
     * @tc.name AppFsSpace_Routing_0313
     * @tc.desc Verify same probe first BUNDLE=1024 then FREE_SYNC=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0313';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          logAssertion(name, "first BUNDLE; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name, "first BUNDLE; only the first dependency has run", actualFirstCalls, "bundle");
          expect(actualFirstCalls).assertEqual("bundle");
          api.freeSyncBytes = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/cache", api);
          logAssertion(name, "second FREE_SYNC; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first BUNDLE then FREE_SYNC; ordered independent invocation record", actualFinalCalls, "bundle|freeSync");
          expect(actualFinalCalls).assertEqual("bundle|freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_0700
     * @tc.name AppFsSpace_Routing_0314
     * @tc.desc Verify same probe first FILESYSTEM_FREE=1024 then BUNDLE=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0314';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "first FILESYSTEM_FREE; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name,
            "first FILESYSTEM_FREE; only the first dependency has run",
            actualFirstCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualFirstCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          api.bundleStats.appSize = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/cache", api);
          logAssertion(name, "second BUNDLE; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first FILESYSTEM_FREE then BUNDLE; ordered independent invocation record",
            actualFinalCalls, "filesystem:/data/storage/el2/base/files|bundle");
          expect(actualFinalCalls).assertEqual("filesystem:/data/storage/el2/base/files|bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_0800
     * @tc.name AppFsSpace_Routing_0315
     * @tc.desc Verify same probe first FILESYSTEM_FREE=1024 then FILESYSTEM_FREE=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0315';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "first FILESYSTEM_FREE; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name,
            "first FILESYSTEM_FREE; only the first dependency has run",
            actualFirstCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualFirstCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          api.filesystemBytes = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/cache", api);
          logAssertion(name,
            "second FILESYSTEM_FREE; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first FILESYSTEM_FREE then FILESYSTEM_FREE; ordered independent invocation record",
            actualFinalCalls, "filesystem:/data/storage/el2/base/files|filesystem:/data/storage/el2/base/cache");
          expect(actualFinalCalls).assertEqual(
            "filesystem:/data/storage/el2/base/files|filesystem:/data/storage/el2/base/cache");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_0900
     * @tc.name AppFsSpace_Routing_0316
     * @tc.desc Verify same probe first FILESYSTEM_FREE=1024 then TOTAL=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0316';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "first FILESYSTEM_FREE; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name,
            "first FILESYSTEM_FREE; only the first dependency has run",
            actualFirstCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualFirstCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          api.totalBytes = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/cache", api);
          logAssertion(name, "second TOTAL; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first FILESYSTEM_FREE then TOTAL; ordered independent invocation record",
            actualFinalCalls, "filesystem:/data/storage/el2/base/files|total");
          expect(actualFinalCalls).assertEqual("filesystem:/data/storage/el2/base/files|total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_1000
     * @tc.name AppFsSpace_Routing_0317
     * @tc.desc Verify same probe first FILESYSTEM_FREE=1024 then TOTAL_SYNC=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0317', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0317';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "first FILESYSTEM_FREE; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name,
            "first FILESYSTEM_FREE; only the first dependency has run",
            actualFirstCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualFirstCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          api.totalSyncBytes = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/cache", api);
          logAssertion(name, "second TOTAL_SYNC; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first FILESYSTEM_FREE then TOTAL_SYNC; ordered independent invocation record",
            actualFinalCalls, "filesystem:/data/storage/el2/base/files|totalSync");
          expect(actualFinalCalls).assertEqual("filesystem:/data/storage/el2/base/files|totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_1100
     * @tc.name AppFsSpace_Routing_0318
     * @tc.desc Verify same probe first FILESYSTEM_FREE=1024 then FREE=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0318', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0318';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "first FILESYSTEM_FREE; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name,
            "first FILESYSTEM_FREE; only the first dependency has run",
            actualFirstCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualFirstCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          api.freeBytes = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/cache", api);
          logAssertion(name, "second FREE; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first FILESYSTEM_FREE then FREE; ordered independent invocation record",
            actualFinalCalls, "filesystem:/data/storage/el2/base/files|free");
          expect(actualFinalCalls).assertEqual("filesystem:/data/storage/el2/base/files|free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_1200
     * @tc.name AppFsSpace_Routing_0319
     * @tc.desc Verify same probe first FILESYSTEM_FREE=1024 then FREE_SYNC=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0319', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0319';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "first FILESYSTEM_FREE; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name,
            "first FILESYSTEM_FREE; only the first dependency has run",
            actualFirstCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualFirstCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          api.freeSyncBytes = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/cache", api);
          logAssertion(name, "second FREE_SYNC; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first FILESYSTEM_FREE then FREE_SYNC; ordered independent invocation record",
            actualFinalCalls, "filesystem:/data/storage/el2/base/files|freeSync");
          expect(actualFinalCalls).assertEqual("filesystem:/data/storage/el2/base/files|freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_1300
     * @tc.name AppFsSpace_Routing_0320
     * @tc.desc Verify same probe first TOTAL=1024 then BUNDLE=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0320';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          logAssertion(name, "first TOTAL; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name, "first TOTAL; only the first dependency has run", actualFirstCalls, "total");
          expect(actualFirstCalls).assertEqual("total");
          api.bundleStats.appSize = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/cache", api);
          logAssertion(name, "second BUNDLE; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first TOTAL then BUNDLE; ordered independent invocation record", actualFinalCalls, "total|bundle");
          expect(actualFinalCalls).assertEqual("total|bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_1400
     * @tc.name AppFsSpace_Routing_0321
     * @tc.desc Verify same probe first TOTAL=1024 then FILESYSTEM_FREE=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0321', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0321';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          logAssertion(name, "first TOTAL; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name, "first TOTAL; only the first dependency has run", actualFirstCalls, "total");
          expect(actualFirstCalls).assertEqual("total");
          api.filesystemBytes = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/cache", api);
          logAssertion(name,
            "second FILESYSTEM_FREE; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first TOTAL then FILESYSTEM_FREE; ordered independent invocation record",
            actualFinalCalls, "total|filesystem:/data/storage/el2/base/cache");
          expect(actualFinalCalls).assertEqual("total|filesystem:/data/storage/el2/base/cache");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_1500
     * @tc.name AppFsSpace_Routing_0322
     * @tc.desc Verify same probe first TOTAL=1024 then TOTAL=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0322', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0322';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          logAssertion(name, "first TOTAL; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name, "first TOTAL; only the first dependency has run", actualFirstCalls, "total");
          expect(actualFirstCalls).assertEqual("total");
          api.totalBytes = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/cache", api);
          logAssertion(name, "second TOTAL; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first TOTAL then TOTAL; ordered independent invocation record", actualFinalCalls, "total|total");
          expect(actualFinalCalls).assertEqual("total|total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_1600
     * @tc.name AppFsSpace_Routing_0323
     * @tc.desc Verify same probe first TOTAL=1024 then TOTAL_SYNC=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0323', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0323';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          logAssertion(name, "first TOTAL; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name, "first TOTAL; only the first dependency has run", actualFirstCalls, "total");
          expect(actualFirstCalls).assertEqual("total");
          api.totalSyncBytes = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/cache", api);
          logAssertion(name, "second TOTAL_SYNC; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first TOTAL then TOTAL_SYNC; ordered independent invocation record", actualFinalCalls, "total|totalSync");
          expect(actualFinalCalls).assertEqual("total|totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_1700
     * @tc.name AppFsSpace_Routing_0324
     * @tc.desc Verify same probe first TOTAL=1024 then FREE=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0324', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0324';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          logAssertion(name, "first TOTAL; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name, "first TOTAL; only the first dependency has run", actualFirstCalls, "total");
          expect(actualFirstCalls).assertEqual("total");
          api.freeBytes = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/cache", api);
          logAssertion(name, "second FREE; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first TOTAL then FREE; ordered independent invocation record", actualFinalCalls, "total|free");
          expect(actualFinalCalls).assertEqual("total|free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_1800
     * @tc.name AppFsSpace_Routing_0325
     * @tc.desc Verify same probe first TOTAL=1024 then FREE_SYNC=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0325', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0325';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          logAssertion(name, "first TOTAL; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name, "first TOTAL; only the first dependency has run", actualFirstCalls, "total");
          expect(actualFirstCalls).assertEqual("total");
          api.freeSyncBytes = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/cache", api);
          logAssertion(name, "second FREE_SYNC; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first TOTAL then FREE_SYNC; ordered independent invocation record", actualFinalCalls, "total|freeSync");
          expect(actualFinalCalls).assertEqual("total|freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_1900
     * @tc.name AppFsSpace_Routing_0326
     * @tc.desc Verify same probe first TOTAL_SYNC=1024 then BUNDLE=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0326', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0326';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "first TOTAL_SYNC; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name, "first TOTAL_SYNC; only the first dependency has run", actualFirstCalls, "totalSync");
          expect(actualFirstCalls).assertEqual("totalSync");
          api.bundleStats.appSize = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/cache", api);
          logAssertion(name, "second BUNDLE; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first TOTAL_SYNC then BUNDLE; ordered independent invocation record",
            actualFinalCalls, "totalSync|bundle");
          expect(actualFinalCalls).assertEqual("totalSync|bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_2000
     * @tc.name AppFsSpace_Routing_0327
     * @tc.desc Verify same probe first TOTAL_SYNC=1024 then FILESYSTEM_FREE=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0327', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0327';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "first TOTAL_SYNC; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name, "first TOTAL_SYNC; only the first dependency has run", actualFirstCalls, "totalSync");
          expect(actualFirstCalls).assertEqual("totalSync");
          api.filesystemBytes = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/cache", api);
          logAssertion(name,
            "second FILESYSTEM_FREE; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first TOTAL_SYNC then FILESYSTEM_FREE; ordered independent invocation record",
            actualFinalCalls, "totalSync|filesystem:/data/storage/el2/base/cache");
          expect(actualFinalCalls).assertEqual("totalSync|filesystem:/data/storage/el2/base/cache");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_2100
     * @tc.name AppFsSpace_Routing_0328
     * @tc.desc Verify same probe first TOTAL_SYNC=1024 then TOTAL=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0328', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0328';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "first TOTAL_SYNC; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name, "first TOTAL_SYNC; only the first dependency has run", actualFirstCalls, "totalSync");
          expect(actualFirstCalls).assertEqual("totalSync");
          api.totalBytes = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/cache", api);
          logAssertion(name, "second TOTAL; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first TOTAL_SYNC then TOTAL; ordered independent invocation record", actualFinalCalls, "totalSync|total");
          expect(actualFinalCalls).assertEqual("totalSync|total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_2200
     * @tc.name AppFsSpace_Routing_0329
     * @tc.desc Verify same probe first TOTAL_SYNC=1024 then TOTAL_SYNC=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0329', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0329';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "first TOTAL_SYNC; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name, "first TOTAL_SYNC; only the first dependency has run", actualFirstCalls, "totalSync");
          expect(actualFirstCalls).assertEqual("totalSync");
          api.totalSyncBytes = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/cache", api);
          logAssertion(name, "second TOTAL_SYNC; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first TOTAL_SYNC then TOTAL_SYNC; ordered independent invocation record",
            actualFinalCalls, "totalSync|totalSync");
          expect(actualFinalCalls).assertEqual("totalSync|totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_2300
     * @tc.name AppFsSpace_Routing_0330
     * @tc.desc Verify same probe first TOTAL_SYNC=1024 then FREE=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0330';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "first TOTAL_SYNC; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name, "first TOTAL_SYNC; only the first dependency has run", actualFirstCalls, "totalSync");
          expect(actualFirstCalls).assertEqual("totalSync");
          api.freeBytes = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/cache", api);
          logAssertion(name, "second FREE; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first TOTAL_SYNC then FREE; ordered independent invocation record", actualFinalCalls, "totalSync|free");
          expect(actualFinalCalls).assertEqual("totalSync|free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_2400
     * @tc.name AppFsSpace_Routing_0331
     * @tc.desc Verify same probe first TOTAL_SYNC=1024 then FREE_SYNC=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0331', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0331';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "first TOTAL_SYNC; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name, "first TOTAL_SYNC; only the first dependency has run", actualFirstCalls, "totalSync");
          expect(actualFirstCalls).assertEqual("totalSync");
          api.freeSyncBytes = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/cache", api);
          logAssertion(name, "second FREE_SYNC; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first TOTAL_SYNC then FREE_SYNC; ordered independent invocation record",
            actualFinalCalls, "totalSync|freeSync");
          expect(actualFinalCalls).assertEqual("totalSync|freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_2500
     * @tc.name AppFsSpace_Routing_0332
     * @tc.desc Verify same probe first FREE=1024 then BUNDLE=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0332', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0332';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "first FREE; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name, "first FREE; only the first dependency has run", actualFirstCalls, "free");
          expect(actualFirstCalls).assertEqual("free");
          api.bundleStats.appSize = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/cache", api);
          logAssertion(name, "second BUNDLE; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first FREE then BUNDLE; ordered independent invocation record", actualFinalCalls, "free|bundle");
          expect(actualFinalCalls).assertEqual("free|bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_2600
     * @tc.name AppFsSpace_Routing_0333
     * @tc.desc Verify same probe first FREE=1024 then FILESYSTEM_FREE=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0333', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0333';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "first FREE; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name, "first FREE; only the first dependency has run", actualFirstCalls, "free");
          expect(actualFirstCalls).assertEqual("free");
          api.filesystemBytes = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/cache", api);
          logAssertion(name,
            "second FILESYSTEM_FREE; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first FREE then FILESYSTEM_FREE; ordered independent invocation record",
            actualFinalCalls, "free|filesystem:/data/storage/el2/base/cache");
          expect(actualFinalCalls).assertEqual("free|filesystem:/data/storage/el2/base/cache");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_2700
     * @tc.name AppFsSpace_Routing_0334
     * @tc.desc Verify same probe first FREE=1024 then TOTAL=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0334', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0334';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "first FREE; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name, "first FREE; only the first dependency has run", actualFirstCalls, "free");
          expect(actualFirstCalls).assertEqual("free");
          api.totalBytes = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/cache", api);
          logAssertion(name, "second TOTAL; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first FREE then TOTAL; ordered independent invocation record", actualFinalCalls, "free|total");
          expect(actualFinalCalls).assertEqual("free|total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_2800
     * @tc.name AppFsSpace_Routing_0335
     * @tc.desc Verify same probe first FREE=1024 then TOTAL_SYNC=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0335', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0335';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "first FREE; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name, "first FREE; only the first dependency has run", actualFirstCalls, "free");
          expect(actualFirstCalls).assertEqual("free");
          api.totalSyncBytes = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/cache", api);
          logAssertion(name, "second TOTAL_SYNC; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first FREE then TOTAL_SYNC; ordered independent invocation record", actualFinalCalls, "free|totalSync");
          expect(actualFinalCalls).assertEqual("free|totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_2900
     * @tc.name AppFsSpace_Routing_0336
     * @tc.desc Verify same probe first FREE=1024 then FREE=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0336', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0336';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "first FREE; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name, "first FREE; only the first dependency has run", actualFirstCalls, "free");
          expect(actualFirstCalls).assertEqual("free");
          api.freeBytes = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/cache", api);
          logAssertion(name, "second FREE; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first FREE then FREE; ordered independent invocation record", actualFinalCalls, "free|free");
          expect(actualFinalCalls).assertEqual("free|free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_3000
     * @tc.name AppFsSpace_Routing_0337
     * @tc.desc Verify same probe first FREE=1024 then FREE_SYNC=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0337', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0337';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "first FREE; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name, "first FREE; only the first dependency has run", actualFirstCalls, "free");
          expect(actualFirstCalls).assertEqual("free");
          api.freeSyncBytes = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/cache", api);
          logAssertion(name, "second FREE_SYNC; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first FREE then FREE_SYNC; ordered independent invocation record", actualFinalCalls, "free|freeSync");
          expect(actualFinalCalls).assertEqual("free|freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_3100
     * @tc.name AppFsSpace_Routing_0338
     * @tc.desc Verify same probe first FREE_SYNC=1024 then BUNDLE=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0338', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0338';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "first FREE_SYNC; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name, "first FREE_SYNC; only the first dependency has run", actualFirstCalls, "freeSync");
          expect(actualFirstCalls).assertEqual("freeSync");
          api.bundleStats.appSize = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/cache", api);
          logAssertion(name, "second BUNDLE; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first FREE_SYNC then BUNDLE; ordered independent invocation record", actualFinalCalls, "freeSync|bundle");
          expect(actualFinalCalls).assertEqual("freeSync|bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_3200
     * @tc.name AppFsSpace_Routing_0339
     * @tc.desc Verify same probe first FREE_SYNC=1024 then FILESYSTEM_FREE=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0339', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0339';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "first FREE_SYNC; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name, "first FREE_SYNC; only the first dependency has run", actualFirstCalls, "freeSync");
          expect(actualFirstCalls).assertEqual("freeSync");
          api.filesystemBytes = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/cache", api);
          logAssertion(name,
            "second FILESYSTEM_FREE; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first FREE_SYNC then FILESYSTEM_FREE; ordered independent invocation record",
            actualFinalCalls, "freeSync|filesystem:/data/storage/el2/base/cache");
          expect(actualFinalCalls).assertEqual("freeSync|filesystem:/data/storage/el2/base/cache");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_3300
     * @tc.name AppFsSpace_Routing_0340
     * @tc.desc Verify same probe first FREE_SYNC=1024 then TOTAL=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0340';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "first FREE_SYNC; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name, "first FREE_SYNC; only the first dependency has run", actualFirstCalls, "freeSync");
          expect(actualFirstCalls).assertEqual("freeSync");
          api.totalBytes = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/cache", api);
          logAssertion(name, "second TOTAL; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first FREE_SYNC then TOTAL; ordered independent invocation record", actualFinalCalls, "freeSync|total");
          expect(actualFinalCalls).assertEqual("freeSync|total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_3400
     * @tc.name AppFsSpace_Routing_0341
     * @tc.desc Verify same probe first FREE_SYNC=1024 then TOTAL_SYNC=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0341', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0341';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "first FREE_SYNC; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name, "first FREE_SYNC; only the first dependency has run", actualFirstCalls, "freeSync");
          expect(actualFirstCalls).assertEqual("freeSync");
          api.totalSyncBytes = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/cache", api);
          logAssertion(name, "second TOTAL_SYNC; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first FREE_SYNC then TOTAL_SYNC; ordered independent invocation record",
            actualFinalCalls, "freeSync|totalSync");
          expect(actualFinalCalls).assertEqual("freeSync|totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_3500
     * @tc.name AppFsSpace_Routing_0342
     * @tc.desc Verify same probe first FREE_SYNC=1024 then FREE=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0342', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0342';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "first FREE_SYNC; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name, "first FREE_SYNC; only the first dependency has run", actualFirstCalls, "freeSync");
          expect(actualFirstCalls).assertEqual("freeSync");
          api.freeBytes = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/cache", api);
          logAssertion(name, "second FREE; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first FREE_SYNC then FREE; ordered independent invocation record", actualFinalCalls, "freeSync|free");
          expect(actualFinalCalls).assertEqual("freeSync|free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_SECOND_CALL_G1_3600
     * @tc.name AppFsSpace_Routing_0343
     * @tc.desc Verify same probe first FREE_SYNC=1024 then FREE_SYNC=4096 has no cached result or route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0343', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0343';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "first FREE_SYNC; initial query reads 1024", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFirstCalls: string = api.events.join('|');
          logAssertion(name, "first FREE_SYNC; only the first dependency has run", actualFirstCalls, "freeSync");
          expect(actualFirstCalls).assertEqual("freeSync");
          api.freeSyncBytes = 4096;
          const actualSecondBytes: number =
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/cache", api);
          logAssertion(name, "second FREE_SYNC; fresh state is read after the first query", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "first FREE_SYNC then FREE_SYNC; ordered independent invocation record",
            actualFinalCalls, "freeSync|freeSync");
          expect(actualFinalCalls).assertEqual("freeSync|freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_RECOVERY_BUNDLE_G1_0100
     * @tc.name AppFsSpace_Routing_0344
     * @tc.desc Verify BUNDLE succeeds with 4096 on a second call after its first dependency error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0344', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0344';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 1024;
          const sdkError: Error = new Error("bundle first request failed");
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
            failureMessage, "bundle first request failed");
          expect(failureMessage).assertEqual("bundle first request failed");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "BUNDLE; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; error does not fall through to another method", failureCalls, "bundle");
          expect(failureCalls).assertEqual("bundle");
          api.bundleError = undefined;
          api.bundleStats.appSize = 4096;
          const actualRecoveredBytes: number =
            await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/cache", api);
          logAssertion(name,
            "BUNDLE; second request recovers after clearing only its own error", actualRecoveredBytes, 4096);
          expect(actualRecoveredBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "BUNDLE; failed first request does not suppress the recovery call", actualFinalCalls, "bundle|bundle");
          expect(actualFinalCalls).assertEqual("bundle|bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_RECOVERY_BUNDLE_G1_0200
     * @tc.name AppFsSpace_Routing_0345
     * @tc.desc Verify BUNDLE rejects NaN then accepts zero after its byte field is corrected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0345', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0345';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = Number.NaN;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'BUNDLE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'BUNDLE; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'BUNDLE; captured error message',
            failureMessage, "Bundle app size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Bundle app size must be a nonnegative safe integer");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; error does not fall through to another method", failureCalls, "bundle");
          expect(failureCalls).assertEqual("bundle");
          api.bundleStats.appSize = 0;
          const actualRecoveredBytes: number =
            await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/cache", api);
          logAssertion(name, "BUNDLE; zero is accepted after the earlier validation failure", actualRecoveredBytes, 0);
          expect(actualRecoveredBytes).assertEqual(0);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "BUNDLE; validation failure leaves the next invocation independent", actualFinalCalls, "bundle|bundle");
          expect(actualFinalCalls).assertEqual("bundle|bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_RECOVERY_BUNDLE_G1_0300
     * @tc.name AppFsSpace_Routing_0346
     * @tc.desc Verify BUNDLE does not reuse a first success when its second request fails.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0346', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0346';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          logAssertion(name, "BUNDLE; first request succeeds before error injection", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const sdkError: Error = new Error("bundle second request failed");
          sdkError.name = "Error";
          api.bundleError = sdkError;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          let failureError: Error | undefined = undefined;
          try {
            await queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/cache", api);
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
            failureMessage, "bundle second request failed");
          expect(failureMessage).assertEqual("bundle second request failed");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "BUNDLE; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; error does not fall through to another method", failureCalls, "bundle|bundle");
          expect(failureCalls).assertEqual("bundle|bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_RECOVERY_FILESYSTEM_FREE_G1_0100
     * @tc.name AppFsSpace_Routing_0347
     * @tc.desc Verify FILESYSTEM_FREE succeeds with 4096 on a second call after its first dependency error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0347', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0347';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const sdkError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "filesystem first request failed"
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
            failureMessage, "filesystem first request failed");
          expect(failureMessage).assertEqual("filesystem first request failed");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "FILESYSTEM_FREE; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; error does not fall through to another method",
            failureCalls, "filesystem:/data/storage/el2/base/files");
          expect(failureCalls).assertEqual("filesystem:/data/storage/el2/base/files");
          api.filesystemError = undefined;
          api.filesystemBytes = 4096;
          const actualRecoveredBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/cache", api);
          logAssertion(name,
            "FILESYSTEM_FREE; second request recovers after clearing only its own error", actualRecoveredBytes, 4096);
          expect(actualRecoveredBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; failed first request does not suppress the recovery call",
            actualFinalCalls, "filesystem:/data/storage/el2/base/files|filesystem:/data/storage/el2/base/cache");
          expect(actualFinalCalls).assertEqual(
            "filesystem:/data/storage/el2/base/files|filesystem:/data/storage/el2/base/cache");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_RECOVERY_FILESYSTEM_FREE_G1_0200
     * @tc.name AppFsSpace_Routing_0348
     * @tc.desc Verify FILESYSTEM_FREE rejects NaN then accepts zero after its byte field is corrected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0348', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0348';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = Number.NaN;
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
          api.filesystemBytes = 0;
          const actualRecoveredBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/cache", api);
          logAssertion(name,
            "FILESYSTEM_FREE; zero is accepted after the earlier validation failure", actualRecoveredBytes, 0);
          expect(actualRecoveredBytes).assertEqual(0);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; validation failure leaves the next invocation independent",
            actualFinalCalls, "filesystem:/data/storage/el2/base/files|filesystem:/data/storage/el2/base/cache");
          expect(actualFinalCalls).assertEqual(
            "filesystem:/data/storage/el2/base/files|filesystem:/data/storage/el2/base/cache");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_RECOVERY_FILESYSTEM_FREE_G1_0300
     * @tc.name AppFsSpace_Routing_0349
     * @tc.desc Verify FILESYSTEM_FREE does not reuse a first success when its second request fails.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0349', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0349';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "FILESYSTEM_FREE; first request succeeds before error injection", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const sdkError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "filesystem second request failed"
          };
          api.filesystemError = sdkError;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          let failureError: Error | undefined = undefined;
          try {
            await queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/cache", api);
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
            failureMessage, "filesystem second request failed");
          expect(failureMessage).assertEqual("filesystem second request failed");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "FILESYSTEM_FREE; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; error does not fall through to another method",
            failureCalls, "filesystem:/data/storage/el2/base/files|filesystem:/data/storage/el2/base/cache");
          expect(failureCalls).assertEqual(
            "filesystem:/data/storage/el2/base/files|filesystem:/data/storage/el2/base/cache");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_RECOVERY_TOTAL_G1_0100
     * @tc.name AppFsSpace_Routing_0350
     * @tc.desc Verify TOTAL succeeds with 4096 on a second call after its first dependency error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0350';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = 1024;
          const sdkError: Error = new Error("total first request failed");
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
            failureMessage, "total first request failed");
          expect(failureMessage).assertEqual("total first request failed");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "TOTAL; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; error does not fall through to another method", failureCalls, "total");
          expect(failureCalls).assertEqual("total");
          api.totalError = undefined;
          api.totalBytes = 4096;
          const actualRecoveredBytes: number =
            await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/cache", api);
          logAssertion(name,
            "TOTAL; second request recovers after clearing only its own error", actualRecoveredBytes, 4096);
          expect(actualRecoveredBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "TOTAL; failed first request does not suppress the recovery call", actualFinalCalls, "total|total");
          expect(actualFinalCalls).assertEqual("total|total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_RECOVERY_TOTAL_G1_0200
     * @tc.name AppFsSpace_Routing_0351
     * @tc.desc Verify TOTAL rejects NaN then accepts zero after its byte field is corrected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0351', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0351';
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
          api.totalBytes = 0;
          const actualRecoveredBytes: number =
            await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/cache", api);
          logAssertion(name, "TOTAL; zero is accepted after the earlier validation failure", actualRecoveredBytes, 0);
          expect(actualRecoveredBytes).assertEqual(0);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "TOTAL; validation failure leaves the next invocation independent", actualFinalCalls, "total|total");
          expect(actualFinalCalls).assertEqual("total|total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_RECOVERY_TOTAL_G1_0300
     * @tc.name AppFsSpace_Routing_0352
     * @tc.desc Verify TOTAL does not reuse a first success when its second request fails.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0352', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0352';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          logAssertion(name, "TOTAL; first request succeeds before error injection", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const sdkError: Error = new Error("total second request failed");
          sdkError.name = "Error";
          api.totalError = sdkError;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          let failureError: Error | undefined = undefined;
          try {
            await queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/cache", api);
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
            failureMessage, "total second request failed");
          expect(failureMessage).assertEqual("total second request failed");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "TOTAL; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; error does not fall through to another method", failureCalls, "total|total");
          expect(failureCalls).assertEqual("total|total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_RECOVERY_TOTAL_SYNC_G1_0100
     * @tc.name AppFsSpace_Routing_0353
     * @tc.desc Verify TOTAL_SYNC succeeds with 4096 on a second call after its first dependency error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0353', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0353';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = 1024;
          const sdkError: Error = new Error("totalSync first request failed");
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
            failureMessage, "totalSync first request failed");
          expect(failureMessage).assertEqual("totalSync first request failed");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "TOTAL_SYNC; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL_SYNC; error does not fall through to another method", failureCalls, "totalSync");
          expect(failureCalls).assertEqual("totalSync");
          api.totalSyncError = undefined;
          api.totalSyncBytes = 4096;
          const actualRecoveredBytes: number =
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/cache", api);
          logAssertion(name,
            "TOTAL_SYNC; second request recovers after clearing only its own error", actualRecoveredBytes, 4096);
          expect(actualRecoveredBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "TOTAL_SYNC; failed first request does not suppress the recovery call",
            actualFinalCalls, "totalSync|totalSync");
          expect(actualFinalCalls).assertEqual("totalSync|totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_RECOVERY_TOTAL_SYNC_G1_0200
     * @tc.name AppFsSpace_Routing_0354
     * @tc.desc Verify TOTAL_SYNC rejects NaN then accepts zero after its byte field is corrected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0354', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0354';
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
          api.totalSyncBytes = 0;
          const actualRecoveredBytes: number =
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/cache", api);
          logAssertion(name,
            "TOTAL_SYNC; zero is accepted after the earlier validation failure", actualRecoveredBytes, 0);
          expect(actualRecoveredBytes).assertEqual(0);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "TOTAL_SYNC; validation failure leaves the next invocation independent",
            actualFinalCalls, "totalSync|totalSync");
          expect(actualFinalCalls).assertEqual("totalSync|totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_RECOVERY_TOTAL_SYNC_G1_0300
     * @tc.name AppFsSpace_Routing_0355
     * @tc.desc Verify TOTAL_SYNC does not reuse a first success when its second request fails.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0355', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0355';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "TOTAL_SYNC; first request succeeds before error injection", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const sdkError: Error = new Error("totalSync second request failed");
          sdkError.name = "Error";
          api.totalSyncError = sdkError;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          let failureError: Error | undefined = undefined;
          try {
            await queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/cache", api);
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
            failureMessage, "totalSync second request failed");
          expect(failureMessage).assertEqual("totalSync second request failed");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "TOTAL_SYNC; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name,
            "TOTAL_SYNC; error does not fall through to another method", failureCalls, "totalSync|totalSync");
          expect(failureCalls).assertEqual("totalSync|totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_RECOVERY_FREE_G1_0100
     * @tc.name AppFsSpace_Routing_0356
     * @tc.desc Verify FREE succeeds with 4096 on a second call after its first dependency error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0356', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0356';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = 1024;
          const sdkError: Error = new Error("free first request failed");
          sdkError.name = "Error";
          api.freeError = sdkError;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          let failureError: Error | undefined = undefined;
          try {
            await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
            failureError = caughtError;
          }
          logAssertion(name, 'FREE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FREE; captured error name', failureName, "Error");
          expect(failureName).assertEqual("Error");
          logAssertion(name, 'FREE; captured error message',
            failureMessage, "free first request failed");
          expect(failureMessage).assertEqual("free first request failed");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "FREE; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FREE; error does not fall through to another method", failureCalls, "free");
          expect(failureCalls).assertEqual("free");
          api.freeError = undefined;
          api.freeBytes = 4096;
          const actualRecoveredBytes: number =
            await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/cache", api);
          logAssertion(name,
            "FREE; second request recovers after clearing only its own error", actualRecoveredBytes, 4096);
          expect(actualRecoveredBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "FREE; failed first request does not suppress the recovery call", actualFinalCalls, "free|free");
          expect(actualFinalCalls).assertEqual("free|free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_RECOVERY_FREE_G1_0200
     * @tc.name AppFsSpace_Routing_0357
     * @tc.desc Verify FREE rejects NaN then accepts zero after its byte field is corrected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0357', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0357';
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
          api.freeBytes = 0;
          const actualRecoveredBytes: number =
            await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/cache", api);
          logAssertion(name, "FREE; zero is accepted after the earlier validation failure", actualRecoveredBytes, 0);
          expect(actualRecoveredBytes).assertEqual(0);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "FREE; validation failure leaves the next invocation independent", actualFinalCalls, "free|free");
          expect(actualFinalCalls).assertEqual("free|free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_RECOVERY_FREE_G1_0300
     * @tc.name AppFsSpace_Routing_0358
     * @tc.desc Verify FREE does not reuse a first success when its second request fails.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0358', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0358';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          logAssertion(name, "FREE; first request succeeds before error injection", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const sdkError: Error = new Error("free second request failed");
          sdkError.name = "Error";
          api.freeError = sdkError;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          let failureError: Error | undefined = undefined;
          try {
            await queryStorage(StorageOperation.FREE, "/data/storage/el2/base/cache", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
            failureError = caughtError;
          }
          logAssertion(name, 'FREE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FREE; captured error name', failureName, "Error");
          expect(failureName).assertEqual("Error");
          logAssertion(name, 'FREE; captured error message',
            failureMessage, "free second request failed");
          expect(failureMessage).assertEqual("free second request failed");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "FREE; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FREE; error does not fall through to another method", failureCalls, "free|free");
          expect(failureCalls).assertEqual("free|free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_RECOVERY_FREE_SYNC_G1_0100
     * @tc.name AppFsSpace_Routing_0359
     * @tc.desc Verify FREE_SYNC succeeds with 4096 on a second call after its first dependency error.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0359', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0359';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = 1024;
          const sdkError: Error = new Error("freeSync first request failed");
          sdkError.name = "Error";
          api.freeSyncError = sdkError;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          let failureError: Error | undefined = undefined;
          try {
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/files", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
            failureError = caughtError;
          }
          logAssertion(name, 'FREE_SYNC; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FREE_SYNC; captured error name', failureName, "Error");
          expect(failureName).assertEqual("Error");
          logAssertion(name, 'FREE_SYNC; captured error message',
            failureMessage, "freeSync first request failed");
          expect(failureMessage).assertEqual("freeSync first request failed");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "FREE_SYNC; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FREE_SYNC; error does not fall through to another method", failureCalls, "freeSync");
          expect(failureCalls).assertEqual("freeSync");
          api.freeSyncError = undefined;
          api.freeSyncBytes = 4096;
          const actualRecoveredBytes: number =
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/cache", api);
          logAssertion(name,
            "FREE_SYNC; second request recovers after clearing only its own error", actualRecoveredBytes, 4096);
          expect(actualRecoveredBytes).assertEqual(4096);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "FREE_SYNC; failed first request does not suppress the recovery call",
            actualFinalCalls, "freeSync|freeSync");
          expect(actualFinalCalls).assertEqual("freeSync|freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_RECOVERY_FREE_SYNC_G1_0200
     * @tc.name AppFsSpace_Routing_0360
     * @tc.desc Verify FREE_SYNC rejects NaN then accepts zero after its byte field is corrected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0360';
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
          api.freeSyncBytes = 0;
          const actualRecoveredBytes: number =
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/cache", api);
          logAssertion(name,
            "FREE_SYNC; zero is accepted after the earlier validation failure", actualRecoveredBytes, 0);
          expect(actualRecoveredBytes).assertEqual(0);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "FREE_SYNC; validation failure leaves the next invocation independent",
            actualFinalCalls, "freeSync|freeSync");
          expect(actualFinalCalls).assertEqual("freeSync|freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_RECOVERY_FREE_SYNC_G1_0300
     * @tc.name AppFsSpace_Routing_0361
     * @tc.desc Verify FREE_SYNC does not reuse a first success when its second request fails.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0361', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0361';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = 1024;
          const actualFirstBytes: number =
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/files", api);
          logAssertion(name, "FREE_SYNC; first request succeeds before error injection", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const sdkError: Error = new Error("freeSync second request failed");
          sdkError.name = "Error";
          api.freeSyncError = sdkError;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          let failureError: Error | undefined = undefined;
          try {
            await queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/cache", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
            failureError = caughtError;
          }
          logAssertion(name, 'FREE_SYNC; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FREE_SYNC; captured error name', failureName, "Error");
          expect(failureName).assertEqual("Error");
          logAssertion(name, 'FREE_SYNC; captured error message',
            failureMessage, "freeSync second request failed");
          expect(failureMessage).assertEqual("freeSync second request failed");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "FREE_SYNC; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name,
            "FREE_SYNC; error does not fall through to another method", failureCalls, "freeSync|freeSync");
          expect(failureCalls).assertEqual("freeSync|freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CONCURRENT_BUNDLE_G1_0100
     * @tc.name AppFsSpace_Routing_0362
     * @tc.desc Verify concurrent independent BUNDLE probes isolate valid 1024 from invalid Number.NaN.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0362', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0362';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          const peer: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 1024;
          peer.bundleStats.appSize = Number.NaN;
          const pendingGood: Promise<number> =
            queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          const pendingBad: Promise<number> =
            queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/cache", peer);
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await pendingBad;
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'BUNDLE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'BUNDLE; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'BUNDLE; captured error message',
            failureMessage, "Bundle app size must be a nonnegative safe integer");
          expect(failureMessage).assertEqual("Bundle app size must be a nonnegative safe integer");
          const failureCalls: string = peer.events.join('|');
          logAssertion(name, "BUNDLE; error does not fall through to another method", failureCalls, "bundle");
          expect(failureCalls).assertEqual("bundle");
          const actualGoodBytes: number = await pendingGood;
          logAssertion(name,
            "BUNDLE; valid peer result survives concurrent invalid bytes=Number.NaN", actualGoodBytes, 1024);
          expect(actualGoodBytes).assertEqual(1024);
          const actualGoodCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; successful probe retains only its own invocation", actualGoodCalls, "bundle");
          expect(actualGoodCalls).assertEqual("bundle");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CONCURRENT_FILESYSTEM_FREE_G1_0100
     * @tc.name AppFsSpace_Routing_0363
     * @tc.desc Verify concurrent independent FILESYSTEM_FREE probes isolate valid 1024 from invalid Number.NaN.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0363', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0363';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          const peer: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          peer.filesystemBytes = Number.NaN;
          const pendingGood: Promise<number> =
            queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          const pendingBad: Promise<number> =
            queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/cache", peer);
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await pendingBad;
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
          const failureCalls: string = peer.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; error does not fall through to another method",
            failureCalls, "filesystem:/data/storage/el2/base/cache");
          expect(failureCalls).assertEqual("filesystem:/data/storage/el2/base/cache");
          const actualGoodBytes: number = await pendingGood;
          logAssertion(name,
            "FILESYSTEM_FREE; valid peer result survives concurrent invalid bytes=Number.NaN", actualGoodBytes, 1024);
          expect(actualGoodBytes).assertEqual(1024);
          const actualGoodCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; successful probe retains only its own invocation",
            actualGoodCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualGoodCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CONCURRENT_TOTAL_G1_0100
     * @tc.name AppFsSpace_Routing_0364
     * @tc.desc Verify concurrent independent TOTAL probes isolate valid 1024 from invalid Number.NaN.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0364', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0364';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          const peer: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = 1024;
          peer.totalBytes = Number.NaN;
          const pendingGood: Promise<number> =
            queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          const pendingBad: Promise<number> =
            queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/cache", peer);
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await pendingBad;
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
          const failureCalls: string = peer.events.join('|');
          logAssertion(name, "TOTAL; error does not fall through to another method", failureCalls, "total");
          expect(failureCalls).assertEqual("total");
          const actualGoodBytes: number = await pendingGood;
          logAssertion(name,
            "TOTAL; valid peer result survives concurrent invalid bytes=Number.NaN", actualGoodBytes, 1024);
          expect(actualGoodBytes).assertEqual(1024);
          const actualGoodCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; successful probe retains only its own invocation", actualGoodCalls, "total");
          expect(actualGoodCalls).assertEqual("total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CONCURRENT_TOTAL_SYNC_G1_0100
     * @tc.name AppFsSpace_Routing_0365
     * @tc.desc Verify concurrent independent TOTAL_SYNC probes isolate valid 1024 from invalid Number.NaN.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0365', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0365';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          const peer: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = 1024;
          peer.totalSyncBytes = Number.NaN;
          const pendingGood: Promise<number> =
            queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          const pendingBad: Promise<number> =
            queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/cache", peer);
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await pendingBad;
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
          const failureCalls: string = peer.events.join('|');
          logAssertion(name, "TOTAL_SYNC; error does not fall through to another method", failureCalls, "totalSync");
          expect(failureCalls).assertEqual("totalSync");
          const actualGoodBytes: number = await pendingGood;
          logAssertion(name,
            "TOTAL_SYNC; valid peer result survives concurrent invalid bytes=Number.NaN", actualGoodBytes, 1024);
          expect(actualGoodBytes).assertEqual(1024);
          const actualGoodCalls: string = api.events.join('|');
          logAssertion(name,
            "TOTAL_SYNC; successful probe retains only its own invocation", actualGoodCalls, "totalSync");
          expect(actualGoodCalls).assertEqual("totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CONCURRENT_FREE_G1_0100
     * @tc.name AppFsSpace_Routing_0366
     * @tc.desc Verify concurrent independent FREE probes isolate valid 1024 from invalid Number.NaN.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0366', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0366';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          const peer: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = 1024;
          peer.freeBytes = Number.NaN;
          const pendingGood: Promise<number> = queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          const pendingBad: Promise<number> = queryStorage(StorageOperation.FREE, "/data/storage/el2/base/cache", peer);
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await pendingBad;
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
          const failureCalls: string = peer.events.join('|');
          logAssertion(name, "FREE; error does not fall through to another method", failureCalls, "free");
          expect(failureCalls).assertEqual("free");
          const actualGoodBytes: number = await pendingGood;
          logAssertion(name,
            "FREE; valid peer result survives concurrent invalid bytes=Number.NaN", actualGoodBytes, 1024);
          expect(actualGoodBytes).assertEqual(1024);
          const actualGoodCalls: string = api.events.join('|');
          logAssertion(name, "FREE; successful probe retains only its own invocation", actualGoodCalls, "free");
          expect(actualGoodCalls).assertEqual("free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CONCURRENT_FREE_SYNC_G1_0100
     * @tc.name AppFsSpace_Routing_0367
     * @tc.desc Verify concurrent independent FREE_SYNC probes isolate valid 1024 from invalid Number.NaN.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0367', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0367';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          const peer: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = 1024;
          peer.freeSyncBytes = Number.NaN;
          const pendingGood: Promise<number> =
            queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/files", api);
          const pendingBad: Promise<number> =
            queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/cache", peer);
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await pendingBad;
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
          const failureCalls: string = peer.events.join('|');
          logAssertion(name, "FREE_SYNC; error does not fall through to another method", failureCalls, "freeSync");
          expect(failureCalls).assertEqual("freeSync");
          const actualGoodBytes: number = await pendingGood;
          logAssertion(name,
            "FREE_SYNC; valid peer result survives concurrent invalid bytes=Number.NaN", actualGoodBytes, 1024);
          expect(actualGoodBytes).assertEqual(1024);
          const actualGoodCalls: string = api.events.join('|');
          logAssertion(name,
            "FREE_SYNC; successful probe retains only its own invocation", actualGoodCalls, "freeSync");
          expect(actualGoodCalls).assertEqual("freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CONCURRENT_PAIR_G1_0100
     * @tc.name AppFsSpace_Routing_0368
     * @tc.desc Verify concurrent BUNDLE=1024 and FILESYSTEM_FREE=4096 on one probe preserve route-specific bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0368', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0368';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 1024;
          api.filesystemBytes = 4096;
          const pendingFirst: Promise<number> =
            queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          const pendingSecond: Promise<number> =
            queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/cache", api);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "concurrent BUNDLE and FILESYSTEM_FREE; both SDK calls start before awaiting",
            actualStartedCalls, "bundle|filesystem:/data/storage/el2/base/cache");
          expect(actualStartedCalls).assertEqual("bundle|filesystem:/data/storage/el2/base/cache");
          const actualSecondBytes: number = await pendingSecond;
          logAssertion(name,
            "concurrent FILESYSTEM_FREE; awaiting second first cannot consume the first result",
            actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFirstBytes: number = await pendingFirst;
          logAssertion(name, "concurrent BUNDLE; first promise retains its own result", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "concurrent BUNDLE and FILESYSTEM_FREE; settlement adds no hidden dependency calls",
            actualFinalCalls, "bundle|filesystem:/data/storage/el2/base/cache");
          expect(actualFinalCalls).assertEqual("bundle|filesystem:/data/storage/el2/base/cache");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CONCURRENT_PAIR_G1_0200
     * @tc.name AppFsSpace_Routing_0369
     * @tc.desc Verify concurrent BUNDLE=1024 and TOTAL=4096 on one probe preserve route-specific bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0369', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0369';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 1024;
          api.totalBytes = 4096;
          const pendingFirst: Promise<number> =
            queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          const pendingSecond: Promise<number> =
            queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/cache", api);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "concurrent BUNDLE and TOTAL; both SDK calls start before awaiting", actualStartedCalls, "bundle|total");
          expect(actualStartedCalls).assertEqual("bundle|total");
          const actualSecondBytes: number = await pendingSecond;
          logAssertion(name,
            "concurrent TOTAL; awaiting second first cannot consume the first result", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFirstBytes: number = await pendingFirst;
          logAssertion(name, "concurrent BUNDLE; first promise retains its own result", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "concurrent BUNDLE and TOTAL; settlement adds no hidden dependency calls",
            actualFinalCalls, "bundle|total");
          expect(actualFinalCalls).assertEqual("bundle|total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CONCURRENT_PAIR_G1_0300
     * @tc.name AppFsSpace_Routing_0370
     * @tc.desc Verify concurrent BUNDLE=1024 and TOTAL_SYNC=4096 on one probe preserve route-specific bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0370';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 1024;
          api.totalSyncBytes = 4096;
          const pendingFirst: Promise<number> =
            queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          const pendingSecond: Promise<number> =
            queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/cache", api);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "concurrent BUNDLE and TOTAL_SYNC; both SDK calls start before awaiting",
            actualStartedCalls, "bundle|totalSync");
          expect(actualStartedCalls).assertEqual("bundle|totalSync");
          const actualSecondBytes: number = await pendingSecond;
          logAssertion(name,
            "concurrent TOTAL_SYNC; awaiting second first cannot consume the first result", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFirstBytes: number = await pendingFirst;
          logAssertion(name, "concurrent BUNDLE; first promise retains its own result", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "concurrent BUNDLE and TOTAL_SYNC; settlement adds no hidden dependency calls",
            actualFinalCalls, "bundle|totalSync");
          expect(actualFinalCalls).assertEqual("bundle|totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CONCURRENT_PAIR_G1_0400
     * @tc.name AppFsSpace_Routing_0371
     * @tc.desc Verify concurrent BUNDLE=1024 and FREE=4096 on one probe preserve route-specific bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0371', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0371';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 1024;
          api.freeBytes = 4096;
          const pendingFirst: Promise<number> =
            queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          const pendingSecond: Promise<number> =
            queryStorage(StorageOperation.FREE, "/data/storage/el2/base/cache", api);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "concurrent BUNDLE and FREE; both SDK calls start before awaiting", actualStartedCalls, "bundle|free");
          expect(actualStartedCalls).assertEqual("bundle|free");
          const actualSecondBytes: number = await pendingSecond;
          logAssertion(name,
            "concurrent FREE; awaiting second first cannot consume the first result", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFirstBytes: number = await pendingFirst;
          logAssertion(name, "concurrent BUNDLE; first promise retains its own result", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "concurrent BUNDLE and FREE; settlement adds no hidden dependency calls", actualFinalCalls, "bundle|free");
          expect(actualFinalCalls).assertEqual("bundle|free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CONCURRENT_PAIR_G1_0500
     * @tc.name AppFsSpace_Routing_0372
     * @tc.desc Verify concurrent BUNDLE=1024 and FREE_SYNC=4096 on one probe preserve route-specific bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0372', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0372';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 1024;
          api.freeSyncBytes = 4096;
          const pendingFirst: Promise<number> =
            queryStorage(StorageOperation.BUNDLE, "/data/storage/el2/base/files", api);
          const pendingSecond: Promise<number> =
            queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/cache", api);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "concurrent BUNDLE and FREE_SYNC; both SDK calls start before awaiting",
            actualStartedCalls, "bundle|freeSync");
          expect(actualStartedCalls).assertEqual("bundle|freeSync");
          const actualSecondBytes: number = await pendingSecond;
          logAssertion(name,
            "concurrent FREE_SYNC; awaiting second first cannot consume the first result", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFirstBytes: number = await pendingFirst;
          logAssertion(name, "concurrent BUNDLE; first promise retains its own result", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "concurrent BUNDLE and FREE_SYNC; settlement adds no hidden dependency calls",
            actualFinalCalls, "bundle|freeSync");
          expect(actualFinalCalls).assertEqual("bundle|freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CONCURRENT_PAIR_G1_0600
     * @tc.name AppFsSpace_Routing_0373
     * @tc.desc Verify concurrent FILESYSTEM_FREE=1024 and TOTAL=4096 on one probe preserve route-specific bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0373', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0373';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          api.totalBytes = 4096;
          const pendingFirst: Promise<number> =
            queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          const pendingSecond: Promise<number> =
            queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/cache", api);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "concurrent FILESYSTEM_FREE and TOTAL; both SDK calls start before awaiting",
            actualStartedCalls, "filesystem:/data/storage/el2/base/files|total");
          expect(actualStartedCalls).assertEqual("filesystem:/data/storage/el2/base/files|total");
          const actualSecondBytes: number = await pendingSecond;
          logAssertion(name,
            "concurrent TOTAL; awaiting second first cannot consume the first result", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFirstBytes: number = await pendingFirst;
          logAssertion(name,
            "concurrent FILESYSTEM_FREE; first promise retains its own result", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "concurrent FILESYSTEM_FREE and TOTAL; settlement adds no hidden dependency calls",
            actualFinalCalls, "filesystem:/data/storage/el2/base/files|total");
          expect(actualFinalCalls).assertEqual("filesystem:/data/storage/el2/base/files|total");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CONCURRENT_PAIR_G1_0700
     * @tc.name AppFsSpace_Routing_0374
     * @tc.desc Verify concurrent FILESYSTEM_FREE=1024 and TOTAL_SYNC=4096 on one probe preserve route-specific bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0374', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0374';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          api.totalSyncBytes = 4096;
          const pendingFirst: Promise<number> =
            queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          const pendingSecond: Promise<number> =
            queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/cache", api);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "concurrent FILESYSTEM_FREE and TOTAL_SYNC; both SDK calls start before awaiting",
            actualStartedCalls, "filesystem:/data/storage/el2/base/files|totalSync");
          expect(actualStartedCalls).assertEqual("filesystem:/data/storage/el2/base/files|totalSync");
          const actualSecondBytes: number = await pendingSecond;
          logAssertion(name,
            "concurrent TOTAL_SYNC; awaiting second first cannot consume the first result", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFirstBytes: number = await pendingFirst;
          logAssertion(name,
            "concurrent FILESYSTEM_FREE; first promise retains its own result", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "concurrent FILESYSTEM_FREE and TOTAL_SYNC; settlement adds no hidden dependency calls",
            actualFinalCalls, "filesystem:/data/storage/el2/base/files|totalSync");
          expect(actualFinalCalls).assertEqual("filesystem:/data/storage/el2/base/files|totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CONCURRENT_PAIR_G1_0800
     * @tc.name AppFsSpace_Routing_0375
     * @tc.desc Verify concurrent FILESYSTEM_FREE=1024 and FREE=4096 on one probe preserve route-specific bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0375', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0375';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          api.freeBytes = 4096;
          const pendingFirst: Promise<number> =
            queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          const pendingSecond: Promise<number> =
            queryStorage(StorageOperation.FREE, "/data/storage/el2/base/cache", api);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "concurrent FILESYSTEM_FREE and FREE; both SDK calls start before awaiting",
            actualStartedCalls, "filesystem:/data/storage/el2/base/files|free");
          expect(actualStartedCalls).assertEqual("filesystem:/data/storage/el2/base/files|free");
          const actualSecondBytes: number = await pendingSecond;
          logAssertion(name,
            "concurrent FREE; awaiting second first cannot consume the first result", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFirstBytes: number = await pendingFirst;
          logAssertion(name,
            "concurrent FILESYSTEM_FREE; first promise retains its own result", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "concurrent FILESYSTEM_FREE and FREE; settlement adds no hidden dependency calls",
            actualFinalCalls, "filesystem:/data/storage/el2/base/files|free");
          expect(actualFinalCalls).assertEqual("filesystem:/data/storage/el2/base/files|free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CONCURRENT_PAIR_G1_0900
     * @tc.name AppFsSpace_Routing_0376
     * @tc.desc Verify concurrent FILESYSTEM_FREE=1024 and FREE_SYNC=4096 on one probe preserve route-specific bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0376', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0376';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemBytes = 1024;
          api.freeSyncBytes = 4096;
          const pendingFirst: Promise<number> =
            queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/files", api);
          const pendingSecond: Promise<number> =
            queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/cache", api);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "concurrent FILESYSTEM_FREE and FREE_SYNC; both SDK calls start before awaiting",
            actualStartedCalls, "filesystem:/data/storage/el2/base/files|freeSync");
          expect(actualStartedCalls).assertEqual("filesystem:/data/storage/el2/base/files|freeSync");
          const actualSecondBytes: number = await pendingSecond;
          logAssertion(name,
            "concurrent FREE_SYNC; awaiting second first cannot consume the first result", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFirstBytes: number = await pendingFirst;
          logAssertion(name,
            "concurrent FILESYSTEM_FREE; first promise retains its own result", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "concurrent FILESYSTEM_FREE and FREE_SYNC; settlement adds no hidden dependency calls",
            actualFinalCalls, "filesystem:/data/storage/el2/base/files|freeSync");
          expect(actualFinalCalls).assertEqual("filesystem:/data/storage/el2/base/files|freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CONCURRENT_PAIR_G1_1000
     * @tc.name AppFsSpace_Routing_0377
     * @tc.desc Verify concurrent TOTAL=1024 and TOTAL_SYNC=4096 on one probe preserve route-specific bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0377', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0377';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = 1024;
          api.totalSyncBytes = 4096;
          const pendingFirst: Promise<number> =
            queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          const pendingSecond: Promise<number> =
            queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/cache", api);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "concurrent TOTAL and TOTAL_SYNC; both SDK calls start before awaiting",
            actualStartedCalls, "total|totalSync");
          expect(actualStartedCalls).assertEqual("total|totalSync");
          const actualSecondBytes: number = await pendingSecond;
          logAssertion(name,
            "concurrent TOTAL_SYNC; awaiting second first cannot consume the first result", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFirstBytes: number = await pendingFirst;
          logAssertion(name, "concurrent TOTAL; first promise retains its own result", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "concurrent TOTAL and TOTAL_SYNC; settlement adds no hidden dependency calls",
            actualFinalCalls, "total|totalSync");
          expect(actualFinalCalls).assertEqual("total|totalSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CONCURRENT_PAIR_G1_1100
     * @tc.name AppFsSpace_Routing_0378
     * @tc.desc Verify concurrent TOTAL=1024 and FREE=4096 on one probe preserve route-specific bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0378', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0378';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = 1024;
          api.freeBytes = 4096;
          const pendingFirst: Promise<number> =
            queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          const pendingSecond: Promise<number> =
            queryStorage(StorageOperation.FREE, "/data/storage/el2/base/cache", api);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "concurrent TOTAL and FREE; both SDK calls start before awaiting", actualStartedCalls, "total|free");
          expect(actualStartedCalls).assertEqual("total|free");
          const actualSecondBytes: number = await pendingSecond;
          logAssertion(name,
            "concurrent FREE; awaiting second first cannot consume the first result", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFirstBytes: number = await pendingFirst;
          logAssertion(name, "concurrent TOTAL; first promise retains its own result", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "concurrent TOTAL and FREE; settlement adds no hidden dependency calls", actualFinalCalls, "total|free");
          expect(actualFinalCalls).assertEqual("total|free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CONCURRENT_PAIR_G1_1200
     * @tc.name AppFsSpace_Routing_0379
     * @tc.desc Verify concurrent TOTAL=1024 and FREE_SYNC=4096 on one probe preserve route-specific bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0379', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0379';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = 1024;
          api.freeSyncBytes = 4096;
          const pendingFirst: Promise<number> =
            queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api);
          const pendingSecond: Promise<number> =
            queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/cache", api);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "concurrent TOTAL and FREE_SYNC; both SDK calls start before awaiting",
            actualStartedCalls, "total|freeSync");
          expect(actualStartedCalls).assertEqual("total|freeSync");
          const actualSecondBytes: number = await pendingSecond;
          logAssertion(name,
            "concurrent FREE_SYNC; awaiting second first cannot consume the first result", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFirstBytes: number = await pendingFirst;
          logAssertion(name, "concurrent TOTAL; first promise retains its own result", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "concurrent TOTAL and FREE_SYNC; settlement adds no hidden dependency calls",
            actualFinalCalls, "total|freeSync");
          expect(actualFinalCalls).assertEqual("total|freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CONCURRENT_PAIR_G1_1300
     * @tc.name AppFsSpace_Routing_0380
     * @tc.desc Verify concurrent TOTAL_SYNC=1024 and FREE=4096 on one probe preserve route-specific bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0380';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = 1024;
          api.freeBytes = 4096;
          const pendingFirst: Promise<number> =
            queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          const pendingSecond: Promise<number> =
            queryStorage(StorageOperation.FREE, "/data/storage/el2/base/cache", api);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "concurrent TOTAL_SYNC and FREE; both SDK calls start before awaiting",
            actualStartedCalls, "totalSync|free");
          expect(actualStartedCalls).assertEqual("totalSync|free");
          const actualSecondBytes: number = await pendingSecond;
          logAssertion(name,
            "concurrent FREE; awaiting second first cannot consume the first result", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFirstBytes: number = await pendingFirst;
          logAssertion(name, "concurrent TOTAL_SYNC; first promise retains its own result", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "concurrent TOTAL_SYNC and FREE; settlement adds no hidden dependency calls",
            actualFinalCalls, "totalSync|free");
          expect(actualFinalCalls).assertEqual("totalSync|free");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CONCURRENT_PAIR_G1_1400
     * @tc.name AppFsSpace_Routing_0381
     * @tc.desc Verify concurrent TOTAL_SYNC=1024 and FREE_SYNC=4096 on one probe preserve route-specific bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0381', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0381';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = 1024;
          api.freeSyncBytes = 4096;
          const pendingFirst: Promise<number> =
            queryStorage(StorageOperation.TOTAL_SYNC, "/data/storage/el2/base/files", api);
          const pendingSecond: Promise<number> =
            queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/cache", api);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "concurrent TOTAL_SYNC and FREE_SYNC; both SDK calls start before awaiting",
            actualStartedCalls, "totalSync|freeSync");
          expect(actualStartedCalls).assertEqual("totalSync|freeSync");
          const actualSecondBytes: number = await pendingSecond;
          logAssertion(name,
            "concurrent FREE_SYNC; awaiting second first cannot consume the first result", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFirstBytes: number = await pendingFirst;
          logAssertion(name, "concurrent TOTAL_SYNC; first promise retains its own result", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "concurrent TOTAL_SYNC and FREE_SYNC; settlement adds no hidden dependency calls",
            actualFinalCalls, "totalSync|freeSync");
          expect(actualFinalCalls).assertEqual("totalSync|freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CONCURRENT_PAIR_G1_1500
     * @tc.name AppFsSpace_Routing_0382
     * @tc.desc Verify concurrent FREE=1024 and FREE_SYNC=4096 on one probe preserve route-specific bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0382', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0382';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = 1024;
          api.freeSyncBytes = 4096;
          const pendingFirst: Promise<number> =
            queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          const pendingSecond: Promise<number> =
            queryStorage(StorageOperation.FREE_SYNC, "/data/storage/el2/base/cache", api);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name,
            "concurrent FREE and FREE_SYNC; both SDK calls start before awaiting", actualStartedCalls, "free|freeSync");
          expect(actualStartedCalls).assertEqual("free|freeSync");
          const actualSecondBytes: number = await pendingSecond;
          logAssertion(name,
            "concurrent FREE_SYNC; awaiting second first cannot consume the first result", actualSecondBytes, 4096);
          expect(actualSecondBytes).assertEqual(4096);
          const actualFirstBytes: number = await pendingFirst;
          logAssertion(name, "concurrent FREE; first promise retains its own result", actualFirstBytes, 1024);
          expect(actualFirstBytes).assertEqual(1024);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "concurrent FREE and FREE_SYNC; settlement adds no hidden dependency calls",
            actualFinalCalls, "free|freeSync");
          expect(actualFinalCalls).assertEqual("free|freeSync");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_IGNORED_PATH_G1_0100
     * @tc.name AppFsSpace_Routing_0383
     * @tc.desc Verify BUNDLE ignores a Unicode whitespace-only path and returns 1024.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0383', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0383';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.bundleStats.appSize = 1024;
          const actualBytes: number = await queryStorage(StorageOperation.BUNDLE, "\t﻿　", api);
          logAssertion(name, "BUNDLE expected bytes=1024; returned bytes", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "BUNDLE; selected dependency and exclusive call record", actualCalls, "bundle");
          expect(actualCalls).assertEqual("bundle");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "BUNDLE; an ignored path does not register a filesystem callback", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_IGNORED_PATH_G1_0200
     * @tc.name AppFsSpace_Routing_0384
     * @tc.desc Verify TOTAL ignores a Unicode whitespace-only path and returns 1024.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0384', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0384';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalBytes = 1024;
          const actualBytes: number = await queryStorage(StorageOperation.TOTAL, "\t﻿　", api);
          logAssertion(name, "TOTAL expected bytes=1024; returned bytes", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; selected dependency and exclusive call record", actualCalls, "total");
          expect(actualCalls).assertEqual("total");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "TOTAL; an ignored path does not register a filesystem callback", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_IGNORED_PATH_G1_0300
     * @tc.name AppFsSpace_Routing_0385
     * @tc.desc Verify TOTAL_SYNC ignores a Unicode whitespace-only path and returns 1024.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0385', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0385';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.totalSyncBytes = 1024;
          const actualBytes: number = await queryStorage(StorageOperation.TOTAL_SYNC, "\t﻿　", api);
          logAssertion(name, "TOTAL_SYNC expected bytes=1024; returned bytes", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL_SYNC; selected dependency and exclusive call record", actualCalls, "totalSync");
          expect(actualCalls).assertEqual("totalSync");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "TOTAL_SYNC; an ignored path does not register a filesystem callback", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_IGNORED_PATH_G1_0400
     * @tc.name AppFsSpace_Routing_0386
     * @tc.desc Verify FREE ignores a Unicode whitespace-only path and returns 1024.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0386', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0386';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeBytes = 1024;
          const actualBytes: number = await queryStorage(StorageOperation.FREE, "\t﻿　", api);
          logAssertion(name, "FREE expected bytes=1024; returned bytes", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "FREE; selected dependency and exclusive call record", actualCalls, "free");
          expect(actualCalls).assertEqual("free");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FREE; an ignored path does not register a filesystem callback", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_IGNORED_PATH_G1_0500
     * @tc.name AppFsSpace_Routing_0387
     * @tc.desc Verify FREE_SYNC ignores a Unicode whitespace-only path and returns 1024.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0387', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0387';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.freeSyncBytes = 1024;
          const actualBytes: number = await queryStorage(StorageOperation.FREE_SYNC, "\t﻿　", api);
          logAssertion(name, "FREE_SYNC expected bytes=1024; returned bytes", actualBytes, 1024);
          expect(actualBytes).assertEqual(1024);
          const actualCalls: string = api.events.join('|');
          logAssertion(name, "FREE_SYNC; selected dependency and exclusive call record", actualCalls, "freeSync");
          expect(actualCalls).assertEqual("freeSync");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name,
            "FREE_SYNC; an ignored path does not register a filesystem callback", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_UNSUPPORTED_G1_0100
     * @tc.name AppFsSpace_Routing_0388
     * @tc.desc Verify unsupported operation=-1 rejects before accessing SDK dependencies.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0388', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0388';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemThrow = new Error("Unreachable filesystem adapter");
          const operation: StorageOperation = -1 as StorageOperation;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(operation, "", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'UNSUPPORTED; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'UNSUPPORTED; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'UNSUPPORTED; captured error message',
            failureMessage, "Unsupported storage operation");
          expect(failureMessage).assertEqual("Unsupported storage operation");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "UNSUPPORTED; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name, "unsupported operation=-1; no callback registration", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_UNSUPPORTED_G1_0200
     * @tc.name AppFsSpace_Routing_0389
     * @tc.desc Verify unsupported operation=6 rejects before accessing SDK dependencies.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0389', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0389';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemThrow = new Error("Unreachable filesystem adapter");
          const operation: StorageOperation = 6 as StorageOperation;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(operation, "", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'UNSUPPORTED; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'UNSUPPORTED; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'UNSUPPORTED; captured error message',
            failureMessage, "Unsupported storage operation");
          expect(failureMessage).assertEqual("Unsupported storage operation");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "UNSUPPORTED; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name, "unsupported operation=6; no callback registration", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_UNSUPPORTED_G1_0300
     * @tc.name AppFsSpace_Routing_0390
     * @tc.desc Verify unsupported operation=0.5 rejects before accessing SDK dependencies.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0390';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemThrow = new Error("Unreachable filesystem adapter");
          const operation: StorageOperation = 0.5 as StorageOperation;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(operation, "", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'UNSUPPORTED; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'UNSUPPORTED; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'UNSUPPORTED; captured error message',
            failureMessage, "Unsupported storage operation");
          expect(failureMessage).assertEqual("Unsupported storage operation");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "UNSUPPORTED; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name, "unsupported operation=0.5; no callback registration", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_UNSUPPORTED_G1_0400
     * @tc.name AppFsSpace_Routing_0391
     * @tc.desc Verify unsupported operation=Number.NaN rejects before accessing SDK dependencies.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0391', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0391';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          api.filesystemThrow = new Error("Unreachable filesystem adapter");
          const operation: StorageOperation = Number.NaN as StorageOperation;
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          try {
            await queryStorage(operation, "", api);
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
          }
          logAssertion(name, 'UNSUPPORTED; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'UNSUPPORTED; captured error name', failureName, "InvalidStorageValueError");
          expect(failureName).assertEqual("InvalidStorageValueError");
          logAssertion(name, 'UNSUPPORTED; captured error message',
            failureMessage, "Unsupported storage operation");
          expect(failureMessage).assertEqual("Unsupported storage operation");
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "UNSUPPORTED; error does not fall through to another method", failureCalls, "");
          expect(failureCalls).assertEqual("");
          const actualCallbackAbsent: boolean = api.filesystemCallback === undefined;
          logAssertion(name, "unsupported operation=Number.NaN; no callback registration", actualCallbackAbsent, true);
          expect(actualCallbackAbsent).assertEqual(true);
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CONCURRENT_CALLBACK_G1_0100
     * @tc.name AppFsSpace_Routing_0392
     * @tc.desc Verify independent filesystem callbacks keep one query pending while the other query rejects.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0392', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0392';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          const peer: StorageQueryProbe = new StorageQueryProbe();
          api.deferFilesystem = true;
          peer.deferFilesystem = true;
          const peerError: BusinessError = {
            name: 'BusinessError', code: 13900002, message: "Concurrent cache permission denied"
          };
          peer.filesystemError = peerError;
          const pendingBad: Promise<number> =
            queryStorage(StorageOperation.FILESYSTEM_FREE, "/data/storage/el2/base/cache", peer);
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
          peer.completeFilesystem(peerError, Number.NaN);
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          let failureError: Error | undefined = undefined;
          try {
            await pendingBad;
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
            failureMessage, "Concurrent cache permission denied");
          expect(failureMessage).assertEqual("Concurrent cache permission denied");
          const failureIdentity: boolean = failureError === peerError;
          logAssertion(name, "FILESYSTEM_FREE; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = peer.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; error does not fall through to another method",
            failureCalls, "filesystem:/data/storage/el2/base/cache");
          expect(failureCalls).assertEqual("filesystem:/data/storage/el2/base/cache");
          const actualGoodStillPending: boolean = completed;
          logAssertion(name,
            "FILESYSTEM_FREE; rejecting the cache probe does not complete the files probe",
            actualGoodStillPending, false);
          expect(actualGoodStillPending).assertEqual(false);
          api.completeFilesystem(undefined, 0);
          const actualGoodBytes: number = await pending;
          logAssertion(name,
            "FILESYSTEM_FREE; delayed files query accepts zero after the other probe rejects", actualGoodBytes, 0);
          expect(actualGoodBytes).assertEqual(0);
          const actualCompleted: boolean = completed;
          logAssertion(name, "FILESYSTEM_FREE; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "FILESYSTEM_FREE; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
          const actualGoodCalls: string = api.events.join('|');
          logAssertion(name,
            "FILESYSTEM_FREE; successful probe retains its own path and callback",
            actualGoodCalls, "filesystem:/data/storage/el2/base/files");
          expect(actualGoodCalls).assertEqual("filesystem:/data/storage/el2/base/files");
        } finally {
          logCase(name, 'end');
        }
      });

    /**
     * @tc.number SUB_CORE_FILE_STORAGE_ROUTING_CONCURRENT_DEFERRED_G1_0100
     * @tc.name AppFsSpace_Routing_0393
     * @tc.desc Verify a deferred FREE rejection does not settle a concurrently pending TOTAL on the same probe.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('AppFsSpace_Routing_0393', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (): Promise<void> => {
        const name: string = 'AppFsSpace_Routing_0393';
        logCase(name, 'begin');
        try {
          const api: StorageQueryProbe = new StorageQueryProbe();
          const totalDeferred: DeferredBytes = new DeferredBytes();
          const freeDeferred: DeferredBytes = new DeferredBytes();
          api.totalDeferred = totalDeferred;
          api.freeDeferred = freeDeferred;
          let completed: boolean = false;
          let completionCount: number = 0;
          const pending: Promise<number> =
            queryStorage(StorageOperation.TOTAL, "/data/storage/el2/base/files", api)
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
          logAssertion(name, "TOTAL; no settlement before dependency completion", actualPending, false);
          expect(actualPending).assertEqual(false);
          const actualStartedCalls: string = api.events.join('|');
          logAssertion(name, "TOTAL; dependency is called before the pending observation", actualStartedCalls, "total");
          expect(actualStartedCalls).assertEqual("total");
          const pendingFree: Promise<number> = queryStorage(StorageOperation.FREE, "/data/storage/el2/base/files", api);
          const sdkError: Error = new Error("Concurrent free statistics unavailable");
          freeDeferred.reject(sdkError);
          let failureCaught: boolean = false;
          let failureName: string = '';
          let failureMessage: string = '';
          let failureError: Error | undefined = undefined;
          try {
            await pendingFree;
          } catch (error) {
            const caughtError: Error = error as Error;
            failureCaught = true;
            failureName = caughtError.name;
            failureMessage = caughtError.message;
            failureError = caughtError;
          }
          logAssertion(name, 'FREE; rejection must occur', failureCaught, true);
          expect(failureCaught).assertEqual(true);
          logAssertion(name, 'FREE; captured error name', failureName, "Error");
          expect(failureName).assertEqual("Error");
          logAssertion(name, 'FREE; captured error message',
            failureMessage, "Concurrent free statistics unavailable");
          expect(failureMessage).assertEqual("Concurrent free statistics unavailable");
          const failureIdentity: boolean = failureError === sdkError;
          logAssertion(name, "FREE; preserve the exact dependency error object", failureIdentity, true);
          expect(failureIdentity).assertEqual(true);
          const failureCalls: string = api.events.join('|');
          logAssertion(name, "FREE; error does not fall through to another method", failureCalls, "total|free");
          expect(failureCalls).assertEqual("total|free");
          const actualTotalStillPending: boolean = completed;
          logAssertion(name,
            "TOTAL and FREE; FREE rejection cannot settle the deferred TOTAL promise", actualTotalStillPending, false);
          expect(actualTotalStillPending).assertEqual(false);
          totalDeferred.resolve(9007199254740991);
          const actualTotalBytes: number = await pending;
          logAssertion(name,
            "TOTAL and FREE; TOTAL accepts its independent maximum-safe result after FREE fails",
            actualTotalBytes, 9007199254740991);
          expect(actualTotalBytes).assertEqual(9007199254740991);
          const actualCompleted: boolean = completed;
          logAssertion(name, "TOTAL; observer runs after dependency completion", actualCompleted, true);
          expect(actualCompleted).assertEqual(true);
          const actualCompletionCount: number = completionCount;
          logAssertion(name, "TOTAL; exactly one final promise settlement", actualCompletionCount, 1);
          expect(actualCompletionCount).assertEqual(1);
          const actualFinalCalls: string = api.events.join('|');
          logAssertion(name,
            "TOTAL and FREE; deferred settlement never retries either dependency", actualFinalCalls, "total|free");
          expect(actualFinalCalls).assertEqual("total|free");
        } finally {
          logCase(name, 'end');
        }
      });
  });
}
