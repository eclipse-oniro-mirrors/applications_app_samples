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

import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import { runCase, addLog } from '../testkit/SharedDriver';
import {
    ErrorHandling,
    ErrorCategory,
    ErrorSeverity,
    ErrorEntry,
    RetryPolicy
} from '../../../main/ets/utils/ErrorHandling';
import { DataStoreConstants } from '../../../main/ets/constants/DataStoreConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SendableDataStore]';

export default function errorHandlingTest(): void {
    describe('ErrorHandlingTest', () => {
        beforeAll(() => {
            addLog('ErrorHandlingTest suite started');
            ErrorHandling.clearHistory();
        })

        afterAll(() => {
            ErrorHandling.clearHistory();
            addLog('ErrorHandlingTest suite finished');
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0001
         * @tc.name testErrorHandling0001
         * @tc.desc Verify classifyError returns INITIALIZATION for ERROR_NOT_INITIALIZED.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testErrorHandling0001', 0, (done: Function) => {
            runCase('testErrorHandling0001', async () => {
                const category = ErrorHandling.classifyError(DataStoreConstants.ERROR_NOT_INITIALIZED);
                expect(category).assertEqual(ErrorCategory.INITIALIZATION);
                expect(ErrorHandling.isRetryable(DataStoreConstants.ERROR_NOT_INITIALIZED)).assertTrue();
                expect(ErrorHandling.getErrorSeverity(DataStoreConstants.ERROR_NOT_INITIALIZED)).assertEqual(ErrorSeverity.MEDIUM);
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0002
         * @tc.name testErrorHandling0002
         * @tc.desc Verify classifyError returns VALIDATION for ERROR_INVALID_KEY.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testErrorHandling0002', 0, (done: Function) => {
            runCase('testErrorHandling0002', async () => {
                const category = ErrorHandling.classifyError(DataStoreConstants.ERROR_INVALID_KEY);
                expect(category).assertEqual(ErrorCategory.VALIDATION);
                expect(ErrorHandling.isRetryable(DataStoreConstants.ERROR_INVALID_KEY)).assertFalse();
                expect(ErrorHandling.getErrorSeverity(DataStoreConstants.ERROR_INVALID_KEY)).assertEqual(ErrorSeverity.LOW);
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0003
         * @tc.name testErrorHandling0003
         * @tc.desc Verify classifyError returns STORAGE for ERROR_STORE_FULL.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testErrorHandling0003', 0, (done: Function) => {
            runCase('testErrorHandling0003', async () => {
                const category = ErrorHandling.classifyError(DataStoreConstants.ERROR_STORE_FULL);
                expect(category).assertEqual(ErrorCategory.STORAGE);
                expect(ErrorHandling.isRetryable(DataStoreConstants.ERROR_STORE_FULL)).assertFalse();
                expect(ErrorHandling.getErrorSeverity(DataStoreConstants.ERROR_STORE_FULL)).assertEqual(ErrorSeverity.HIGH);
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0004
         * @tc.name testErrorHandling0004
         * @tc.desc Verify classifyError returns NETWORK for ERROR_NETWORK.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testErrorHandling0004', 0, (done: Function) => {
            runCase('testErrorHandling0004', async () => {
                const category = ErrorHandling.classifyError(DataStoreConstants.ERROR_NETWORK);
                expect(category).assertEqual(ErrorCategory.NETWORK);
                expect(ErrorHandling.isRetryable(DataStoreConstants.ERROR_NETWORK)).assertTrue();
                expect(ErrorHandling.getErrorSeverity(DataStoreConstants.ERROR_NETWORK)).assertEqual(ErrorSeverity.MEDIUM);
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0005
         * @tc.name testErrorHandling0005
         * @tc.desc Verify classifyError returns SECURITY for ERROR_ENCRYPTION.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testErrorHandling0005', 0, (done: Function) => {
            runCase('testErrorHandling0005', async () => {
                const category = ErrorHandling.classifyError(DataStoreConstants.ERROR_ENCRYPTION);
                expect(category).assertEqual(ErrorCategory.SECURITY);
                expect(ErrorHandling.getErrorSeverity(DataStoreConstants.ERROR_ENCRYPTION)).assertEqual(ErrorSeverity.CRITICAL);
                expect(ErrorHandling.isRetryable(DataStoreConstants.ERROR_ENCRYPTION)).assertFalse();
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0006
         * @tc.name testErrorHandling0006
         * @tc.desc Verify classifyError returns INTERNAL for unknown error code.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testErrorHandling0006', 0, (done: Function) => {
            runCase('testErrorHandling0006', async () => {
                const category = ErrorHandling.classifyError(99999);
                expect(category).assertEqual(ErrorCategory.INTERNAL);
                expect(ErrorHandling.getErrorSeverity(99999)).assertEqual(ErrorSeverity.MEDIUM);
                expect(ErrorHandling.isRetryable(99999)).assertFalse();
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0007
         * @tc.name testErrorHandling0007
         * @tc.desc Verify isRetryable returns true for ERROR_NETWORK.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testErrorHandling0007', 0, (done: Function) => {
            runCase('testErrorHandling0007', async () => {
                const retryable = ErrorHandling.isRetryable(DataStoreConstants.ERROR_NETWORK);
                expect(retryable).assertTrue();
                expect(ErrorHandling.classifyError(DataStoreConstants.ERROR_NETWORK)).assertEqual(ErrorCategory.NETWORK);
                expect(ErrorHandling.getErrorSeverity(DataStoreConstants.ERROR_NETWORK)).assertEqual(ErrorSeverity.MEDIUM);
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0008
         * @tc.name testErrorHandling0008
         * @tc.desc Verify isRetryable returns false for ERROR_INVALID_KEY.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testErrorHandling0008', 0, (done: Function) => {
            runCase('testErrorHandling0008', async () => {
                const retryable = ErrorHandling.isRetryable(DataStoreConstants.ERROR_INVALID_KEY);
                expect(retryable).assertFalse();
                expect(ErrorHandling.classifyError(DataStoreConstants.ERROR_INVALID_KEY)).assertEqual(ErrorCategory.VALIDATION);
                expect(ErrorHandling.getErrorSeverity(DataStoreConstants.ERROR_INVALID_KEY)).assertEqual(ErrorSeverity.LOW);
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0009
         * @tc.name testErrorHandling0009
         * @tc.desc Verify isRetryable returns false for ERROR_ENCRYPTION.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testErrorHandling0009', 0, (done: Function) => {
            runCase('testErrorHandling0009', async () => {
                const retryable = ErrorHandling.isRetryable(DataStoreConstants.ERROR_ENCRYPTION);
                expect(retryable).assertFalse();
                expect(ErrorHandling.classifyError(DataStoreConstants.ERROR_ENCRYPTION)).assertEqual(ErrorCategory.SECURITY);
                expect(ErrorHandling.getErrorSeverity(DataStoreConstants.ERROR_ENCRYPTION)).assertEqual(ErrorSeverity.CRITICAL);
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0010
         * @tc.name testErrorHandling0010
         * @tc.desc Verify getErrorSeverity returns CRITICAL for ERROR_ENCRYPTION.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testErrorHandling0010', 0, (done: Function) => {
            runCase('testErrorHandling0010', async () => {
                const severity = ErrorHandling.getErrorSeverity(DataStoreConstants.ERROR_ENCRYPTION);
                expect(severity).assertEqual(ErrorSeverity.CRITICAL);
                expect(ErrorHandling.classifyError(DataStoreConstants.ERROR_ENCRYPTION)).assertEqual(ErrorCategory.SECURITY);
                expect(ErrorHandling.isRetryable(DataStoreConstants.ERROR_ENCRYPTION)).assertFalse();
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0011
         * @tc.name testErrorHandling0011
         * @tc.desc Verify getErrorSeverity returns HIGH for ERROR_STORE_FULL.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testErrorHandling0011', 0, (done: Function) => {
            runCase('testErrorHandling0011', async () => {
                const severity = ErrorHandling.getErrorSeverity(DataStoreConstants.ERROR_STORE_FULL);
                expect(severity).assertEqual(ErrorSeverity.HIGH);
                expect(ErrorHandling.classifyError(DataStoreConstants.ERROR_STORE_FULL)).assertEqual(ErrorCategory.STORAGE);
                expect(ErrorHandling.isRetryable(DataStoreConstants.ERROR_STORE_FULL)).assertFalse();
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0012
         * @tc.name testErrorHandling0012
         * @tc.desc Verify getErrorSeverity returns LOW for ERROR_ALREADY_INITIALIZED.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testErrorHandling0012', 0, (done: Function) => {
            runCase('testErrorHandling0012', async () => {
                const severity = ErrorHandling.getErrorSeverity(DataStoreConstants.ERROR_ALREADY_INITIALIZED);
                expect(severity).assertEqual(ErrorSeverity.LOW);
                expect(ErrorHandling.classifyError(DataStoreConstants.ERROR_ALREADY_INITIALIZED)).assertEqual(ErrorCategory.INITIALIZATION);
                expect(ErrorHandling.isRetryable(DataStoreConstants.ERROR_ALREADY_INITIALIZED)).assertFalse();
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0013
         * @tc.name testErrorHandling0013
         * @tc.desc Verify createRetryPolicy and getDefaultRetryPolicy.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testErrorHandling0013', 0, (done: Function) => {
            runCase('testErrorHandling0013', async () => {
                const policy = ErrorHandling.createRetryPolicy(5, 500);
                expect(policy.maxRetries).assertEqual(5);
                expect(policy.initialDelay).assertEqual(500);
                expect(policy.maxDelay).assertEqual(30000);
                expect(policy.backoffMultiplier).assertEqual(2.0);

                const defaultPolicy = ErrorHandling.getDefaultRetryPolicy();
                expect(defaultPolicy.maxRetries).assertEqual(3);
                expect(defaultPolicy.initialDelay).assertEqual(1000);
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0014
         * @tc.name testErrorHandling0014
         * @tc.desc Verify calculateRetryDelay with various attempts.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testErrorHandling0014', 0, (done: Function) => {
            runCase('testErrorHandling0014', async () => {
                const policy: RetryPolicy = {
                    maxRetries: 3,
                    initialDelay: 1000,
                    maxDelay: 30000,
                    backoffMultiplier: 2.0
                };
                expect(ErrorHandling.calculateRetryDelay(policy, 0)).assertEqual(1000);
                expect(ErrorHandling.calculateRetryDelay(policy, 1)).assertEqual(2000);
                expect(ErrorHandling.calculateRetryDelay(policy, 2)).assertEqual(4000);
                expect(ErrorHandling.calculateRetryDelay(policy, -1)).assertEqual(0);
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0015
         * @tc.name testErrorHandling0015
         * @tc.desc Verify calculateRetryDelay respects maxDelay cap.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testErrorHandling0015', 0, (done: Function) => {
            runCase('testErrorHandling0015', async () => {
                const policy: RetryPolicy = {
                    maxRetries: 10,
                    initialDelay: 1000,
                    maxDelay: 5000,
                    backoffMultiplier: 2.0
                };
                const delay = ErrorHandling.calculateRetryDelay(policy, 10);
                expect(delay).assertEqual(5000);
                expect(ErrorHandling.calculateRetryDelay(policy, 0)).assertEqual(1000);
                expect(ErrorHandling.calculateRetryDelay(policy, 20)).assertEqual(5000);
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0016
         * @tc.name testErrorHandling0016
         * @tc.desc Verify executeWithRetry succeeds on first attempt.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testErrorHandling0016', 0, (done: Function) => {
            runCase('testErrorHandling0016', async () => {
                const policy = ErrorHandling.getDefaultRetryPolicy();
                const result = await ErrorHandling.executeWithRetry<string>(
                    async (): Promise<string> => 'success',
                    policy,
                    null
                );
                expect(result).assertEqual('success');
                expect(ErrorHandling.getErrorCount()).assertEqual(0);
                expect(ErrorHandling.getLastError()).assertNull();
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0017
         * @tc.name testErrorHandling0017
         * @tc.desc Verify executeWithRetry retries and eventually succeeds.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testErrorHandling0017', 0, (done: Function) => {
            runCase('testErrorHandling0017', async () => {
                let attemptCount = 0;
                const policy: RetryPolicy = {
                    maxRetries: 3,
                    initialDelay: 10,
                    maxDelay: 100,
                    backoffMultiplier: 2.0
                };
                const result = await ErrorHandling.executeWithRetry<number>(
                    async (): Promise<number> => {
                        attemptCount++;
                        if (attemptCount < 3) {
                            throw new Error('transient failure');
                        }
                        return 42;
                    },
                    policy,
                    null
                );
                expect(result).assertEqual(42);
                expect(attemptCount).assertEqual(3);
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0018
         * @tc.name testErrorHandling0018
         * @tc.desc Verify executeWithRetry throws after max retries exhausted.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testErrorHandling0018', 0, (done: Function) => {
            runCase('testErrorHandling0018', async () => {
                const policy: RetryPolicy = {
                    maxRetries: 2,
                    initialDelay: 10,
                    maxDelay: 100,
                    backoffMultiplier: 2.0
                };
                let caught = false;
                try {
                    await ErrorHandling.executeWithRetry<string>(
                        async (): Promise<string> => {
                            throw new Error('persistent failure');
                        },
                        policy,
                        null
                    );
                } catch (e) {
                    caught = true;
                    expect((e as Error).message).assertContain('persistent failure');
                }
                expect(caught).assertTrue();
                expect(ErrorHandling.getErrorCount()).assertLargerOrEqual(1);
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0019
         * @tc.name testErrorHandling0019
         * @tc.desc Verify fallback executes when primary fails.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testErrorHandling0019', 0, (done: Function) => {
            runCase('testErrorHandling0019', async () => {
                const result = await ErrorHandling.fallback<string>(
                    async (): Promise<string> => {
                        throw new Error('primary failed');
                    },
                    async (): Promise<string> => 'fallback result'
                );
                expect(result).assertEqual('fallback result');
                expect(ErrorHandling.getErrorCount()).assertLargerOrEqual(1);
                expect(ErrorHandling.getLastError()).not().assertNull();
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0020
         * @tc.name testErrorHandling0020
         * @tc.desc Verify fallback returns primary result when it succeeds.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testErrorHandling0020', 0, (done: Function) => {
            runCase('testErrorHandling0020', async () => {
                ErrorHandling.clearHistory();
                const result = await ErrorHandling.fallback<string>(
                    async (): Promise<string> => 'primary result',
                    async (): Promise<string> => 'fallback result'
                );
                expect(result).assertEqual('primary result');
                expect(ErrorHandling.getErrorCount()).assertEqual(0);
                expect(ErrorHandling.getLastError()).assertNull();
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0021
         * @tc.name testErrorHandling0021
         * @tc.desc Verify logError and getErrorHistory.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testErrorHandling0021', 0, (done: Function) => {
            runCase('testErrorHandling0021', async () => {
                ErrorHandling.clearHistory();
                ErrorHandling.logError('TestContext', DataStoreConstants.ERROR_NETWORK, 'Connection timeout');
                const history = ErrorHandling.getErrorHistory();
                expect(history.length).assertEqual(1);
                expect(history[0].errorCode).assertEqual(DataStoreConstants.ERROR_NETWORK);
                expect(history[0].category).assertEqual(ErrorCategory.NETWORK);
                expect(history[0].message).assertContain('Connection timeout');
                expect(history[0].retryable).assertTrue();
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0022
         * @tc.name testErrorHandling0022
         * @tc.desc Verify logValidationError, logInitializationError, logStorageError, logNetworkError.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testErrorHandling0022', 0, (done: Function) => {
            runCase('testErrorHandling0022', async () => {
                ErrorHandling.clearHistory();
                ErrorHandling.logValidationError('ctx', 'key', 'too short');
                ErrorHandling.logInitializationError('ctx', 'not ready');
                ErrorHandling.logStorageError('ctx', 'disk full');
                ErrorHandling.logNetworkError('ctx', 'timeout');
                const history = ErrorHandling.getErrorHistory();
                expect(history.length).assertEqual(4);
                expect(history[0].category).assertEqual(ErrorCategory.VALIDATION);
                expect(history[1].category).assertEqual(ErrorCategory.INITIALIZATION);
                expect(history[2].category).assertEqual(ErrorCategory.STORAGE);
                expect(history[3].category).assertEqual(ErrorCategory.NETWORK);
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0023
         * @tc.name testErrorHandling0023
         * @tc.desc Verify getErrorsByCategory and getErrorsBySeverity.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testErrorHandling0023', 0, (done: Function) => {
            runCase('testErrorHandling0023', async () => {
                ErrorHandling.clearHistory();
                ErrorHandling.logError('ctx1', DataStoreConstants.ERROR_NETWORK, 'net error');
                ErrorHandling.logError('ctx2', DataStoreConstants.ERROR_ENCRYPTION, 'enc error');
                ErrorHandling.logError('ctx3', DataStoreConstants.ERROR_NETWORK, 'net error 2');

                const netErrors = ErrorHandling.getErrorsByCategory(ErrorCategory.NETWORK);
                expect(netErrors.length).assertEqual(2);

                const criticalErrors = ErrorHandling.getErrorsBySeverity(ErrorSeverity.CRITICAL);
                expect(criticalErrors.length).assertEqual(1);
                expect(criticalErrors[0].errorCode).assertEqual(DataStoreConstants.ERROR_ENCRYPTION);
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0024
         * @tc.name testErrorHandling0024
         * @tc.desc Verify getRetryableErrors and getRecentErrors.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testErrorHandling0024', 0, (done: Function) => {
            runCase('testErrorHandling0024', async () => {
                ErrorHandling.clearHistory();
                ErrorHandling.logError('ctx', DataStoreConstants.ERROR_NETWORK, 'retryable');
                ErrorHandling.logError('ctx', DataStoreConstants.ERROR_INVALID_KEY, 'not retryable');
                ErrorHandling.logError('ctx', DataStoreConstants.ERROR_DEVICE_OFFLINE, 'retryable 2');

                const retryable = ErrorHandling.getRetryableErrors();
                expect(retryable.length).assertEqual(2);

                const recent = ErrorHandling.getRecentErrors(2);
                expect(recent.length).assertEqual(2);
                expect(recent[1].errorCode).assertEqual(DataStoreConstants.ERROR_INVALID_KEY);
                expect(recent[0].errorCode).assertEqual(DataStoreConstants.ERROR_DEVICE_OFFLINE);
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0025
         * @tc.name testErrorHandling0025
         * @tc.desc Verify getErrorCount, getErrorCountByCategory, getErrorCountBySeverity.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testErrorHandling0025', 0, (done: Function) => {
            runCase('testErrorHandling0025', async () => {
                ErrorHandling.clearHistory();
                ErrorHandling.logError('ctx', DataStoreConstants.ERROR_NETWORK, 'err1');
                ErrorHandling.logError('ctx', DataStoreConstants.ERROR_INVALID_KEY, 'err2');
                ErrorHandling.logError('ctx', DataStoreConstants.ERROR_ENCRYPTION, 'err3');

                expect(ErrorHandling.getErrorCount()).assertEqual(3);
                expect(ErrorHandling.getErrorCountByCategory(ErrorCategory.NETWORK)).assertEqual(1);
                expect(ErrorHandling.getErrorCountByCategory(ErrorCategory.VALIDATION)).assertEqual(1);
                expect(ErrorHandling.getErrorCountBySeverity(ErrorSeverity.CRITICAL)).assertEqual(1);
                expect(ErrorHandling.getErrorCountBySeverity(ErrorSeverity.MEDIUM)).assertEqual(1);
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0026
         * @tc.name testErrorHandling0026
         * @tc.desc Verify clearHistory and getLastError.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testErrorHandling0026', 0, (done: Function) => {
            runCase('testErrorHandling0026', async () => {
                ErrorHandling.clearHistory();
                const lastBefore = ErrorHandling.getLastError();
                expect(lastBefore).assertNull();

                ErrorHandling.logError('ctx', DataStoreConstants.ERROR_NETWORK, 'first');
                ErrorHandling.logError('ctx', DataStoreConstants.ERROR_ENCRYPTION, 'second');

                const last = ErrorHandling.getLastError();
                expect(last).not().assertNull();
                expect(last!.errorCode).assertEqual(DataStoreConstants.ERROR_ENCRYPTION);

                ErrorHandling.clearHistory();
                expect(ErrorHandling.getErrorCount()).assertEqual(0);
                expect(ErrorHandling.getLastError()).assertNull();
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0027
         * @tc.name testErrorHandling0027
         * @tc.desc Verify formatError and formatAllErrors.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testErrorHandling0027', 0, (done: Function) => {
            runCase('testErrorHandling0027', async () => {
                ErrorHandling.clearHistory();
                ErrorHandling.logError('TestCtx', DataStoreConstants.ERROR_NETWORK, 'timeout');

                const last = ErrorHandling.getLastError();
                expect(last).not().assertNull();
                const formatted = ErrorHandling.formatError(last!);
                expect(formatted).assertContain('Error[');
                expect(formatted).assertContain('network');
                expect(formatted).assertContain('retryable');

                ErrorHandling.logError('TestCtx', DataStoreConstants.ERROR_ENCRYPTION, 'key fail');
                const allFormatted = ErrorHandling.formatAllErrors();
                expect(allFormatted).assertContain('timeout');
                expect(allFormatted).assertContain('key fail');
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0028
         * @tc.name testErrorHandling0028
         * @tc.desc Verify classifyError for remaining categories: MIGRATION, SYNC, STORAGE variants.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testErrorHandling0028', 0, (done: Function) => {
            runCase('testErrorHandling0028', async () => {
                expect(ErrorHandling.classifyError(DataStoreConstants.ERROR_MIGRATION)).assertEqual(ErrorCategory.MIGRATION);
                expect(ErrorHandling.classifyError(DataStoreConstants.ERROR_CONFLICT)).assertEqual(ErrorCategory.SYNC);
                expect(ErrorHandling.classifyError(DataStoreConstants.ERROR_TABLE_NOT_FOUND)).assertEqual(ErrorCategory.STORAGE);
                expect(ErrorHandling.classifyError(DataStoreConstants.ERROR_SQL_EXECUTION)).assertEqual(ErrorCategory.STORAGE);
                expect(ErrorHandling.classifyError(DataStoreConstants.ERROR_TRANSACTION)).assertEqual(ErrorCategory.STORAGE);
                expect(ErrorHandling.classifyError(DataStoreConstants.ERROR_DEVICE_OFFLINE)).assertEqual(ErrorCategory.NETWORK);
                expect(ErrorHandling.classifyError(DataStoreConstants.ERROR_ALREADY_INITIALIZED)).assertEqual(ErrorCategory.INITIALIZATION);
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0029
         * @tc.name testErrorHandling0029
         * @tc.desc Verify isRetryable for additional error codes.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testErrorHandling0029', 0, (done: Function) => {
            runCase('testErrorHandling0029', async () => {
                expect(ErrorHandling.isRetryable(DataStoreConstants.ERROR_DEVICE_OFFLINE)).assertTrue();
                expect(ErrorHandling.isRetryable(DataStoreConstants.ERROR_STORE_FULL)).assertFalse();
                expect(ErrorHandling.isRetryable(DataStoreConstants.ERROR_INVALID_VALUE)).assertFalse();
                expect(ErrorHandling.isRetryable(DataStoreConstants.ERROR_TYPE_MISMATCH)).assertFalse();
                expect(ErrorHandling.isRetryable(DataStoreConstants.ERROR_SCHEMA_MISMATCH)).assertFalse();
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0030
         * @tc.name testErrorHandling0030
         * @tc.desc Verify getErrorSeverity for additional error codes.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testErrorHandling0030', 0, (done: Function) => {
            runCase('testErrorHandling0030', async () => {
                expect(ErrorHandling.getErrorSeverity(DataStoreConstants.ERROR_NOT_INITIALIZED)).assertEqual(ErrorSeverity.MEDIUM);
                expect(ErrorHandling.getErrorSeverity(DataStoreConstants.ERROR_MIGRATION)).assertEqual(ErrorSeverity.CRITICAL);
                expect(ErrorHandling.getErrorSeverity(DataStoreConstants.ERROR_CONFLICT)).assertEqual(ErrorSeverity.MEDIUM);
                expect(ErrorHandling.getErrorSeverity(DataStoreConstants.ERROR_DEVICE_OFFLINE)).assertEqual(ErrorSeverity.HIGH);
                expect(ErrorHandling.getErrorSeverity(DataStoreConstants.ERROR_TABLE_NOT_FOUND)).assertEqual(ErrorSeverity.HIGH);
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0031
         * @tc.name testErrorHandling0031
         * @tc.desc Verify getRecentErrors with count exceeding history size.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P2
         */
        it('testErrorHandling0031', 0, (done: Function) => {
            runCase('testErrorHandling0031', async () => {
                ErrorHandling.clearHistory();
                ErrorHandling.logError('ctx', DataStoreConstants.ERROR_NETWORK, 'only one');
                const recent = ErrorHandling.getRecentErrors(100);
                expect(recent.length).assertEqual(1);
                expect(recent[0].message).assertContain('only one');
                expect(ErrorHandling.getErrorCount()).assertEqual(1);
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0032
         * @tc.name testErrorHandling0032
         * @tc.desc Verify formatAllErrors returns empty string when no errors.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P2
         */
        it('testErrorHandling0032', 0, (done: Function) => {
            runCase('testErrorHandling0032', async () => {
                ErrorHandling.clearHistory();
                const result = ErrorHandling.formatAllErrors();
                expect(result).assertEqual('');
                expect(ErrorHandling.getErrorCount()).assertEqual(0);
                expect(ErrorHandling.getLastError()).assertNull();
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0033
         * @tc.name testErrorHandling0033
         * @tc.desc Verify executeWithRetry succeeds on first attempt.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testErrorHandling0033', 0, (done: Function) => {
            runCase('testErrorHandling0033', async () => {
                const policy: RetryPolicy = ErrorHandling.createRetryPolicy(3, 100);
                let attemptCount = 0;
                const operation = async (): Promise<string> => {
                    attemptCount++;
                    return 'success_result';
                };
                const result: string = await ErrorHandling.executeWithRetry(operation, policy, null);
                expect(result).assertEqual('success_result');
                expect(attemptCount).assertEqual(1);
                expect(ErrorHandling.getErrorCount()).assertEqual(0);
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0034
         * @tc.name testErrorHandling0034
         * @tc.desc Verify executeWithRetry retries on failure then succeeds.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testErrorHandling0034', 0, (done: Function) => {
            runCase('testErrorHandling0034', async () => {
                const policy: RetryPolicy = ErrorHandling.createRetryPolicy(3, 10);
                let attemptCount = 0;
                const operation = async (): Promise<string> => {
                    attemptCount++;
                    if (attemptCount < 3) {
                        throw new Error('transient failure');
                    }
                    return 'retry_success';
                };
                const result: string = await ErrorHandling.executeWithRetry(operation, policy, null);
                expect(result).assertEqual('retry_success');
                expect(attemptCount).assertEqual(3);
                expect(ErrorHandling.getErrorCount()).assertLargerOrEqual(2);
            }, done);
        })

        /**
         * @tc.number SUB_ERROR_HANDLING_0035
         * @tc.name testErrorHandling0035
         * @tc.desc Verify fallback executes fallback when primary fails.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testErrorHandling0035', 0, (done: Function) => {
            runCase('testErrorHandling0035', async () => {
                const primary = async (): Promise<string> => {
                    throw new Error('primary failed');
                };
                const fallbackOp = async (): Promise<string> => {
                    return 'fallback_result';
                };
                const result: string = await ErrorHandling.fallback(primary, fallbackOp);
                expect(result).assertEqual('fallback_result');
                expect(ErrorHandling.getErrorCount()).assertLargerOrEqual(1);
                expect(ErrorHandling.getLastError()).not().assertNull();
            }, done);
        })
    })
}
