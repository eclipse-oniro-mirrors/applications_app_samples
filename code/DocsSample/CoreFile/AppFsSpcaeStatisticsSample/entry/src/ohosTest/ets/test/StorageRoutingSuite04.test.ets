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
