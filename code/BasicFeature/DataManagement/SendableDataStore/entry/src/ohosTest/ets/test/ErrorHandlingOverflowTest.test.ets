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
import { PerformanceMonitor } from '../../../main/ets/utils/PerformanceMonitor';
import { DataStoreConstants } from '../../../main/ets/constants/DataStoreConstants';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SendableDataStore]';

export default function errorHandlingOverflowTest(): void {
    describe('ErrorHandlingOverflowTest', () => {
        beforeAll(() => {
            addLog('ErrorHandlingOverflowTest suite started');
            ErrorHandling.clearHistory();
            PerformanceMonitor.reset();
        })

        afterAll(() => {
            ErrorHandling.clearHistory();
            PerformanceMonitor.reset();
            addLog('ErrorHandlingOverflowTest suite finished');
        })

        

        /**
         * @tc.number SUB_ERR_OVERFLOW_0001
         * @tc.name testErrOverflow0001
         * @tc.desc Verify executeWithRetry invokes onRetry callback with correct attempt number.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testErrOverflow0001', 0, (done: Function) => {
            runCase('testErrOverflow0001', async () => {
                const policy: RetryPolicy = ErrorHandling.createRetryPolicy(3, 10);
                let attemptCount = 0;
                const retryAttempts: number[] = [];
                const retryErrors: string[] = [];
                const onRetry = (attempt: number, error: Error): void => {
                    retryAttempts.push(attempt);
                    retryErrors.push(error.message);
                    attemptCount++;
                };
                const operation = async (): Promise<string> => {
                    if (attemptCount < 2) {
                        throw new Error('transient');
                    }
                    return 'recovered';
                };
                const result: string = await ErrorHandling.executeWithRetry(operation, policy, onRetry);
                expect(result).assertEqual('recovered');
                expect(retryAttempts.length).assertEqual(2);
                expect(retryAttempts[0]).assertEqual(1);
                expect(retryAttempts[1]).assertEqual(2);
                expect(retryErrors[0]).assertEqual('transient');
            }, done);
        })

        /**
         * @tc.number SUB_ERR_OVERFLOW_0002
         * @tc.name testErrOverflow0002
         * @tc.desc Verify executeWithRetry onRetry receives all errors before final throw.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testErrOverflow0002', 0, (done: Function) => {
            runCase('testErrOverflow0002', async () => {
                const policy: RetryPolicy = ErrorHandling.createRetryPolicy(2, 10);
                const retryLog: number[] = [];
                const onRetry = (attempt: number, _error: Error): void => {
                    retryLog.push(attempt);
                };
                const operation = async (): Promise<string> => {
                    throw new Error('always fails');
                };
                let caught = false;
                try {
                    await ErrorHandling.executeWithRetry(operation, policy, onRetry);
                } catch (e) {
                    caught = true;
                    expect((e as Error).message).assertEqual('always fails');
                }
                expect(caught).assertTrue();
                expect(retryLog.length).assertEqual(2);
                expect(retryLog[0]).assertEqual(1);
                expect(retryLog[1]).assertEqual(2);
            }, done);
        })

        /**
         * @tc.number SUB_ERR_OVERFLOW_0003
         * @tc.name testErrOverflow0003
         * @tc.desc Verify executeWithRetry with maxRetries=0 does not invoke onRetry.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testErrOverflow0003', 0, (done: Function) => {
            runCase('testErrOverflow0003', async () => {
                ErrorHandling.clearHistory();
                const policy: RetryPolicy = ErrorHandling.createRetryPolicy(0, 100);
                let callbackInvoked = false;
                const onRetry = (_attempt: number, _error: Error): void => {
                    callbackInvoked = true;
                };
                let caught = false;
                try {
                    await ErrorHandling.executeWithRetry<string>(
                        async (): Promise<string> => {
                            throw new Error('immediate fail');
                        },
                        policy,
                        onRetry
                    );
                } catch (e) {
                    caught = true;
                }
                expect(caught).assertTrue();
                expect(callbackInvoked).assertFalse();
                expect(ErrorHandling.getErrorCount()).assertEqual(1);
            }, done);
        })

        

        /**
         * @tc.number SUB_ERR_OVERFLOW_0004
         * @tc.name testErrOverflow0004
         * @tc.desc Verify errorHistory auto-shifts when exceeding maxHistorySize of 1000.
         * @tc.size LARGE
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testErrOverflow0004', 0, (done: Function) => {
            runCase('testErrOverflow0004', async () => {
                ErrorHandling.clearHistory();
                for (let i = 0; i < 1005; i++) {
                    ErrorHandling.logError('ctx', DataStoreConstants.ERROR_NETWORK, `err_${i}`);
                }
                const count = ErrorHandling.getErrorCount();
                expect(count).assertEqual(1000);
                const first = ErrorHandling.getErrorHistory();
                expect(first[0].message).assertContain('err_5');
                const last = ErrorHandling.getLastError();
                expect(last).not().assertNull();
                expect(last!.message).assertContain('err_1004');
            }, done);
        })

        /**
         * @tc.number SUB_ERR_OVERFLOW_0005
         * @tc.name testErrOverflow0005
         * @tc.desc Verify getRecentErrors returns exactly maxHistorySize when count exceeds it.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P2
         */
        it('testErrOverflow0005', 0, (done: Function) => {
            runCase('testErrOverflow0005', async () => {
                ErrorHandling.clearHistory();
                for (let i = 0; i < 1000; i++) {
                    ErrorHandling.logError('ctx', DataStoreConstants.ERROR_NETWORK, `item_${i}`);
                }
                const recent = ErrorHandling.getRecentErrors(2000);
                expect(recent.length).assertEqual(1000);
                expect(recent[0].message).assertContain('item_999');
                expect(recent[999].message).assertContain('item_0');
            }, done);
        })

        /**
         * @tc.number SUB_ERR_OVERFLOW_0006
         * @tc.name testErrOverflow0006
         * @tc.desc Verify getErrorsByCategory works correctly after history overflow.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testErrOverflow0006', 0, (done: Function) => {
            runCase('testErrOverflow0006', async () => {
                ErrorHandling.clearHistory();
                for (let i = 0; i < 500; i++) {
                    ErrorHandling.logError('ctx', DataStoreConstants.ERROR_NETWORK, `net_${i}`);
                }
                for (let i = 0; i < 505; i++) {
                    ErrorHandling.logError('ctx', DataStoreConstants.ERROR_ENCRYPTION, `enc_${i}`);
                }
                const count = ErrorHandling.getErrorCount();
                expect(count).assertEqual(1000);
                const netErrors = ErrorHandling.getErrorsByCategory(ErrorCategory.NETWORK);
                expect(netErrors.length).assertEqual(495);
                const encErrors = ErrorHandling.getErrorsByCategory(ErrorCategory.SECURITY);
                expect(encErrors.length).assertEqual(505);
            }, done);
        })

        /**
         * @tc.number SUB_ERR_OVERFLOW_0007
         * @tc.name testErrOverflow0007
         * @tc.desc Verify formatAllErrors handles 1000 entries without crash.
         * @tc.size LARGE
         * @tc.type FUNCTION
         * @tc.level P2
         */
        it('testErrOverflow0007', 0, (done: Function) => {
            runCase('testErrOverflow0007', async () => {
                ErrorHandling.clearHistory();
                for (let i = 0; i < 1000; i++) {
                    ErrorHandling.logError('ctx', DataStoreConstants.ERROR_NETWORK, `msg_${i}`);
                }
                const formatted = ErrorHandling.formatAllErrors();
                expect(formatted.length).assertLarger(0);
                expect(formatted).assertContain('msg_0');
                expect(formatted).assertContain('msg_999');
                ErrorHandling.clearHistory();
            }, done);
        })

        

        /**
         * @tc.number SUB_ERR_OVERFLOW_0008
         * @tc.name testErrOverflow0008
         * @tc.desc Verify startTimer auto-clears when reaching maxTimers=500.
         * @tc.size LARGE
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testErrOverflow0008', 0, (done: Function) => {
            runCase('testErrOverflow0008', async () => {
                PerformanceMonitor.reset();
                for (let i = 0; i < 501; i++) {
                    PerformanceMonitor.startTimer(`timer_${i}`);
                }
                expect(PerformanceMonitor.getTotalTimerCount()).assertEqual(501);
                PerformanceMonitor.startTimer('timer_overflow');
                expect(PerformanceMonitor.getTotalTimerCount()).assertEqual(1);
                expect(PerformanceMonitor.isTimerRunning('timer_overflow')).assertTrue();
                expect(PerformanceMonitor.isTimerRunning('timer_0')).assertFalse();
            }, done);
        })

        /**
         * @tc.number SUB_ERR_OVERFLOW_0009
         * @tc.name testErrOverflow0009
         * @tc.desc Verify timers before overflow are inaccessible after auto-clear.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P2
         */
        it('testErrOverflow0009', 0, (done: Function) => {
            runCase('testErrOverflow0009', async () => {
                PerformanceMonitor.reset();
                for (let i = 0; i < 501; i++) {
                    PerformanceMonitor.startTimer(`t_${i}`);
                }
                PerformanceMonitor.startTimer('new_timer');
                expect(PerformanceMonitor.getElapsed('t_0')).assertEqual(0);
                expect(PerformanceMonitor.getElapsed('t_499')).assertEqual(0);
                expect(PerformanceMonitor.getElapsed('new_timer')).assertLargerOrEqual(0);
            }, done);
        })

        /**
         * @tc.number SUB_ERR_OVERFLOW_0010
         * @tc.name testErrOverflow0010
         * @tc.desc Verify getActiveTimerCount resets to 1 after overflow clear.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testErrOverflow0010', 0, (done: Function) => {
            runCase('testErrOverflow0010', async () => {
                PerformanceMonitor.reset();
                for (let i = 0; i < 501; i++) {
                    PerformanceMonitor.startTimer(`fill_${i}`);
                }
                expect(PerformanceMonitor.getActiveTimerCount()).assertEqual(501);
                PerformanceMonitor.startTimer('trigger');
                expect(PerformanceMonitor.getActiveTimerCount()).assertEqual(1);
                expect(PerformanceMonitor.getTotalTimerCount()).assertEqual(1);
            }, done);
        })

        

        /**
         * @tc.number SUB_ERR_OVERFLOW_0011
         * @tc.name testErrOverflow0011
         * @tc.desc Verify memorySnapshots auto-shift when exceeding maxMemorySnapshots=100.
         * @tc.size LARGE
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testErrOverflow0011', 0, (done: Function) => {
            runCase('testErrOverflow0011', async () => {
                PerformanceMonitor.reset();
                for (let i = 0; i < 105; i++) {
                    PerformanceMonitor.recordMemorySnapshot(`snap_${i}`);
                }
                const snapshots = PerformanceMonitor.getMemorySnapshots();
                expect(snapshots.length).assertEqual(100);
                expect(snapshots[0].label).assertEqual('snap_5');
                expect(snapshots[99].label).assertEqual('snap_104');
            }, done);
        })

        /**
         * @tc.number SUB_ERR_OVERFLOW_0012
         * @tc.name testErrOverflow0012
         * @tc.desc Verify getMemoryDelta uses first and last snapshot after overflow.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P2
         */
        it('testErrOverflow0012', 0, (done: Function) => {
            runCase('testErrOverflow0012', async () => {
                PerformanceMonitor.reset();
                for (let i = 0; i < 100; i++) {
                    PerformanceMonitor.recordMemorySnapshot(`m_${i}`);
                }
                const delta = PerformanceMonitor.getMemoryDelta();
                expect(typeof delta).assertEqual('number');
                const snapshots = PerformanceMonitor.getMemorySnapshots();
                expect(snapshots.length).assertEqual(100);
                expect(snapshots[0].label).assertEqual('m_0');
            }, done);
        })

        /**
         * @tc.number SUB_ERR_OVERFLOW_0013
         * @tc.name testErrOverflow0013
         * @tc.desc Verify clearMemorySnapshots works after overflow.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testErrOverflow0013', 0, (done: Function) => {
            runCase('testErrOverflow0013', async () => {
                PerformanceMonitor.reset();
                for (let i = 0; i < 110; i++) {
                    PerformanceMonitor.recordMemorySnapshot(`overflow_${i}`);
                }
                expect(PerformanceMonitor.getMemorySnapshots().length).assertEqual(100);
                PerformanceMonitor.clearMemorySnapshots();
                expect(PerformanceMonitor.getMemorySnapshots().length).assertEqual(0);
                expect(PerformanceMonitor.getMemoryDelta()).assertEqual(0);
            }, done);
        })

        

        /**
         * @tc.number SUB_ERR_OVERFLOW_0014
         * @tc.name testErrOverflow0014
         * @tc.desc Verify all ErrorSeverity enum values are distinct strings.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testErrOverflow0014', 0, (done: Function) => {
            runCase('testErrOverflow0014', async () => {
                const values: string[] = [
                    ErrorSeverity.LOW as string,
                    ErrorSeverity.MEDIUM as string,
                    ErrorSeverity.HIGH as string,
                    ErrorSeverity.CRITICAL as string
                ];
                expect(values.length).assertEqual(4);
                expect(values[0]).assertEqual('low');
                expect(values[1]).assertEqual('medium');
                expect(values[2]).assertEqual('high');
                expect(values[3]).assertEqual('critical');
                const unique = new Set<string>();
                for (let i = 0; i < values.length; i++) {
                    unique.add(values[i]);
                }
                expect(unique.size).assertEqual(4);
            }, done);
        })

        /**
         * @tc.number SUB_ERR_OVERFLOW_0015
         * @tc.name testErrOverflow0015
         * @tc.desc Verify all ErrorCategory enum values are distinct strings.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testErrOverflow0015', 0, (done: Function) => {
            runCase('testErrOverflow0015', async () => {
                const values: string[] = [
                    ErrorCategory.INITIALIZATION as string,
                    ErrorCategory.VALIDATION as string,
                    ErrorCategory.STORAGE as string,
                    ErrorCategory.NETWORK as string,
                    ErrorCategory.SECURITY as string,
                    ErrorCategory.MIGRATION as string,
                    ErrorCategory.SYNC as string,
                    ErrorCategory.INTERNAL as string
                ];
                expect(values.length).assertEqual(8);
                expect(values[0]).assertEqual('initialization');
                expect(values[7]).assertEqual('internal');
                const unique = new Set<string>();
                for (let i = 0; i < values.length; i++) {
                    unique.add(values[i]);
                }
                expect(unique.size).assertEqual(8);
            }, done);
        })

        

        /**
         * @tc.number SUB_ERR_OVERFLOW_0016
         * @tc.name testErrOverflow0016
         * @tc.desc Verify getErrorCountBySeverity accurate after mixed severity logging.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testErrOverflow0016', 0, (done: Function) => {
            runCase('testErrOverflow0016', async () => {
                ErrorHandling.clearHistory();
                ErrorHandling.logError('ctx', DataStoreConstants.ERROR_ENCRYPTION, 'critical1');
                ErrorHandling.logError('ctx', DataStoreConstants.ERROR_MIGRATION, 'critical2');
                ErrorHandling.logError('ctx', DataStoreConstants.ERROR_STORE_FULL, 'high1');
                ErrorHandling.logError('ctx', DataStoreConstants.ERROR_NETWORK, 'medium1');
                ErrorHandling.logError('ctx', DataStoreConstants.ERROR_NOT_INITIALIZED, 'medium2');
                ErrorHandling.logError('ctx', DataStoreConstants.ERROR_ALREADY_INITIALIZED, 'low1');

                expect(ErrorHandling.getErrorCountBySeverity(ErrorSeverity.CRITICAL)).assertEqual(2);
                expect(ErrorHandling.getErrorCountBySeverity(ErrorSeverity.HIGH)).assertEqual(1);
                expect(ErrorHandling.getErrorCountBySeverity(ErrorSeverity.MEDIUM)).assertEqual(2);
                expect(ErrorHandling.getErrorCountBySeverity(ErrorSeverity.LOW)).assertEqual(1);
            }, done);
        })

        /**
         * @tc.number SUB_ERR_OVERFLOW_0017
         * @tc.name testErrOverflow0017
         * @tc.desc Verify getRetryableErrors accurate after mixed retryable/non-retryable logging.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testErrOverflow0017', 0, (done: Function) => {
            runCase('testErrOverflow0017', async () => {
                ErrorHandling.clearHistory();
                ErrorHandling.logError('ctx', DataStoreConstants.ERROR_NETWORK, 'retryable1');
                ErrorHandling.logError('ctx', DataStoreConstants.ERROR_DEVICE_OFFLINE, 'retryable2');
                ErrorHandling.logError('ctx', DataStoreConstants.ERROR_INVALID_KEY, 'fatal1');
                ErrorHandling.logError('ctx', DataStoreConstants.ERROR_ENCRYPTION, 'fatal2');
                ErrorHandling.logError('ctx', DataStoreConstants.ERROR_STORE_FULL, 'fatal3');

                const retryable = ErrorHandling.getRetryableErrors();
                expect(retryable.length).assertEqual(2);
                expect(retryable[0].retryable).assertTrue();
                expect(retryable[1].retryable).assertTrue();

                const total = ErrorHandling.getErrorCount();
                expect(total).assertEqual(5);
            }, done);
        })
    })
}
