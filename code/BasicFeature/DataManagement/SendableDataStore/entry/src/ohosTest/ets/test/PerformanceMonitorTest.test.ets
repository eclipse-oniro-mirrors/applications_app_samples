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
import { PerformanceMonitor } from '../../../main/ets/utils/PerformanceMonitor';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SendableDataStore]';

export default function performanceMonitorTest(): void {
    describe('PerformanceMonitorTest', () => {
        beforeAll(() => {
            addLog('PerformanceMonitorTest suite started');
            PerformanceMonitor.reset();
        })

        afterAll(() => {
            PerformanceMonitor.reset();
            addLog('PerformanceMonitorTest suite finished');
        })

        /**
         * @tc.number SUB_PERF_MONITOR_0001
         * @tc.name testPerformanceMonitor0001
         * @tc.desc Verify startTimer and isTimerRunning.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testPerformanceMonitor0001', 0, (done: Function) => {
            runCase('testPerformanceMonitor0001', async () => {
                PerformanceMonitor.reset();
                expect(PerformanceMonitor.isTimerRunning('op1')).assertFalse();
                PerformanceMonitor.startTimer('op1');
                expect(PerformanceMonitor.isTimerRunning('op1')).assertTrue();
                expect(PerformanceMonitor.getActiveTimerCount()).assertEqual(1);
                expect(PerformanceMonitor.getTotalTimerCount()).assertEqual(1);
            }, done);
        })

        /**
         * @tc.number SUB_PERF_MONITOR_0002
         * @tc.name testPerformanceMonitor0002
         * @tc.desc Verify stopTimer returns duration and marks timer as not running.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testPerformanceMonitor0002', 0, (done: Function) => {
            runCase('testPerformanceMonitor0002', async () => {
                PerformanceMonitor.reset();
                PerformanceMonitor.startTimer('op2');
                const duration = PerformanceMonitor.stopTimer('op2');
                expect(duration).assertLargerOrEqual(0);
                expect(PerformanceMonitor.isTimerRunning('op2')).assertFalse();
                expect(PerformanceMonitor.getActiveTimerCount()).assertEqual(0);
            }, done);
        })

        /**
         * @tc.number SUB_PERF_MONITOR_0003
         * @tc.name testPerformanceMonitor0003
         * @tc.desc Verify stopTimer returns 0 for non-existent timer.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testPerformanceMonitor0003', 0, (done: Function) => {
            runCase('testPerformanceMonitor0003', async () => {
                PerformanceMonitor.reset();
                const duration = PerformanceMonitor.stopTimer('nonexistent');
                expect(duration).assertEqual(0);
                expect(PerformanceMonitor.isTimerRunning('nonexistent')).assertFalse();
                expect(PerformanceMonitor.getActiveTimerCount()).assertEqual(0);
            }, done);
        })

        /**
         * @tc.number SUB_PERF_MONITOR_0004
         * @tc.name testPerformanceMonitor0004
         * @tc.desc Verify getElapsed for running and stopped timers.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testPerformanceMonitor0004', 0, (done: Function) => {
            runCase('testPerformanceMonitor0004', async () => {
                PerformanceMonitor.reset();
                expect(PerformanceMonitor.getElapsed('unknown')).assertEqual(0);
                PerformanceMonitor.startTimer('op4');
                const elapsed = PerformanceMonitor.getElapsed('op4');
                expect(elapsed).assertLargerOrEqual(0);
                PerformanceMonitor.stopTimer('op4');
                const finalElapsed = PerformanceMonitor.getElapsed('op4');
                expect(finalElapsed).assertLargerOrEqual(0);
            }, done);
        })

        /**
         * @tc.number SUB_PERF_MONITOR_0005
         * @tc.name testPerformanceMonitor0005
         * @tc.desc Verify removeTimer and clearAllTimers.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testPerformanceMonitor0005', 0, (done: Function) => {
            runCase('testPerformanceMonitor0005', async () => {
                PerformanceMonitor.reset();
                PerformanceMonitor.startTimer('a');
                PerformanceMonitor.startTimer('b');
                expect(PerformanceMonitor.getTotalTimerCount()).assertEqual(2);

                PerformanceMonitor.removeTimer('a');
                expect(PerformanceMonitor.getTotalTimerCount()).assertEqual(1);

                PerformanceMonitor.clearAllTimers();
                expect(PerformanceMonitor.getTotalTimerCount()).assertEqual(0);
            }, done);
        })

        /**
         * @tc.number SUB_PERF_MONITOR_0006
         * @tc.name testPerformanceMonitor0006
         * @tc.desc Verify getActiveTimerCount counts only running timers.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testPerformanceMonitor0006', 0, (done: Function) => {
            runCase('testPerformanceMonitor0006', async () => {
                PerformanceMonitor.reset();
                PerformanceMonitor.startTimer('running1');
                PerformanceMonitor.startTimer('stopped1');
                PerformanceMonitor.stopTimer('stopped1');
                expect(PerformanceMonitor.getActiveTimerCount()).assertEqual(1);
                expect(PerformanceMonitor.getTotalTimerCount()).assertEqual(2);
                expect(PerformanceMonitor.isTimerRunning('running1')).assertTrue();
            }, done);
        })

        /**
         * @tc.number SUB_PERF_MONITOR_0007
         * @tc.name testPerformanceMonitor0007
         * @tc.desc Verify recordMemorySnapshot returns snapshot with label.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testPerformanceMonitor0007', 0, (done: Function) => {
            runCase('testPerformanceMonitor0007', async () => {
                PerformanceMonitor.reset();
                const snapshot = PerformanceMonitor.recordMemorySnapshot('test_snap');
                expect(snapshot.label).assertEqual('test_snap');
                expect(snapshot.timestamp).assertLarger(0);
                expect(snapshot.usedMemory).assertLargerOrEqual(0);
                expect(snapshot.totalMemory).assertLargerOrEqual(0);
            }, done);
        })

        /**
         * @tc.number SUB_PERF_MONITOR_0008
         * @tc.name testPerformanceMonitor0008
         * @tc.desc Verify getMemoryUsage returns current snapshot.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testPerformanceMonitor0008', 0, (done: Function) => {
            runCase('testPerformanceMonitor0008', async () => {
                PerformanceMonitor.reset();
                const usage = PerformanceMonitor.getMemoryUsage();
                expect(usage.label).assertEqual('current');
                expect(usage.timestamp).assertLarger(0);
                expect(usage.usedMemory).assertLargerOrEqual(0);
            }, done);
        })

        /**
         * @tc.number SUB_PERF_MONITOR_0009
         * @tc.name testPerformanceMonitor0009
         * @tc.desc Verify getMemorySnapshots and clearMemorySnapshots.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testPerformanceMonitor0009', 0, (done: Function) => {
            runCase('testPerformanceMonitor0009', async () => {
                PerformanceMonitor.reset();
                PerformanceMonitor.recordMemorySnapshot('s1');
                PerformanceMonitor.recordMemorySnapshot('s2');
                const snapshots = PerformanceMonitor.getMemorySnapshots();
                expect(snapshots.length).assertEqual(2);
                expect(snapshots[0].label).assertEqual('s1');
                expect(snapshots[1].label).assertEqual('s2');

                PerformanceMonitor.clearMemorySnapshots();
                expect(PerformanceMonitor.getMemorySnapshots().length).assertEqual(0);
            }, done);
        })

        /**
         * @tc.number SUB_PERF_MONITOR_0010
         * @tc.name testPerformanceMonitor0010
         * @tc.desc Verify getMemoryDelta with insufficient snapshots.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P2
         */
        it('testPerformanceMonitor0010', 0, (done: Function) => {
            runCase('testPerformanceMonitor0010', async () => {
                PerformanceMonitor.reset();
                expect(PerformanceMonitor.getMemoryDelta()).assertEqual(0);
                PerformanceMonitor.recordMemorySnapshot('only_one');
                expect(PerformanceMonitor.getMemoryDelta()).assertEqual(0);
                expect(PerformanceMonitor.getMemorySnapshots().length).assertEqual(1);
            }, done);
        })

        /**
         * @tc.number SUB_PERF_MONITOR_0011
         * @tc.name testPerformanceMonitor0011
         * @tc.desc Verify getMemoryDelta with two snapshots.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testPerformanceMonitor0011', 0, (done: Function) => {
            runCase('testPerformanceMonitor0011', async () => {
                PerformanceMonitor.reset();
                PerformanceMonitor.recordMemorySnapshot('first');
                PerformanceMonitor.recordMemorySnapshot('second');
                const delta = PerformanceMonitor.getMemoryDelta();
                expect(typeof delta).assertEqual('number');
                expect(PerformanceMonitor.getMemorySnapshots().length).assertEqual(2);
                expect(PerformanceMonitor.getMemorySnapshots()[0].label).assertEqual('first');
            }, done);
        })

        /**
         * @tc.number SUB_PERF_MONITOR_0012
         * @tc.name testPerformanceMonitor0012
         * @tc.desc Verify recordOperation and getOperationStats.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testPerformanceMonitor0012', 0, (done: Function) => {
            runCase('testPerformanceMonitor0012', async () => {
                PerformanceMonitor.reset();
                PerformanceMonitor.recordOperation('read', 100, true);
                PerformanceMonitor.recordOperation('read', 200, true);
                PerformanceMonitor.recordOperation('read', 50, false);

                const stats = PerformanceMonitor.getOperationStats('read');
                expect(stats).not().assertNull();
                expect(stats!.name).assertEqual('read');
                expect(stats!.totalCount).assertEqual(3);
                expect(stats!.successCount).assertEqual(2);
                expect(stats!.failureCount).assertEqual(1);
                expect(stats!.totalDuration).assertEqual(350);
                expect(stats!.minDuration).assertEqual(50);
                expect(stats!.maxDuration).assertEqual(200);
                expect(stats!.lastDuration).assertEqual(50);
            }, done);
        })

        /**
         * @tc.number SUB_PERF_MONITOR_0013
         * @tc.name testPerformanceMonitor0013
         * @tc.desc Verify getOperationStats returns undefined for unknown operation.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P2
         */
        it('testPerformanceMonitor0013', 0, (done: Function) => {
            runCase('testPerformanceMonitor0013', async () => {
                PerformanceMonitor.reset();
                const stats = PerformanceMonitor.getOperationStats('unknown_op');
                expect(stats).assertUndefined();
                expect(PerformanceMonitor.getOperationCount()).assertEqual(0);
                expect(PerformanceMonitor.getTotalTimerCount()).assertEqual(0);
            }, done);
        })

        /**
         * @tc.number SUB_PERF_MONITOR_0014
         * @tc.name testPerformanceMonitor0014
         * @tc.desc Verify getAverageTime, getMinTime, getMaxTime, getLastTime.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testPerformanceMonitor0014', 0, (done: Function) => {
            runCase('testPerformanceMonitor0014', async () => {
                PerformanceMonitor.reset();
                PerformanceMonitor.recordOperation('write', 10, true);
                PerformanceMonitor.recordOperation('write', 30, true);
                PerformanceMonitor.recordOperation('write', 20, true);

                expect(PerformanceMonitor.getAverageTime('write')).assertEqual(20);
                expect(PerformanceMonitor.getMinTime('write')).assertEqual(10);
                expect(PerformanceMonitor.getMaxTime('write')).assertEqual(30);
                expect(PerformanceMonitor.getLastTime('write')).assertEqual(20);
            }, done);
        })

        /**
         * @tc.number SUB_PERF_MONITOR_0015
         * @tc.name testPerformanceMonitor0015
         * @tc.desc Verify time methods return 0 for unknown operation.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P2
         */
        it('testPerformanceMonitor0015', 0, (done: Function) => {
            runCase('testPerformanceMonitor0015', async () => {
                PerformanceMonitor.reset();
                expect(PerformanceMonitor.getAverageTime('nope')).assertEqual(0);
                expect(PerformanceMonitor.getMinTime('nope')).assertEqual(0);
                expect(PerformanceMonitor.getMaxTime('nope')).assertEqual(0);
                expect(PerformanceMonitor.getLastTime('nope')).assertEqual(0);
            }, done);
        })

        /**
         * @tc.number SUB_PERF_MONITOR_0016
         * @tc.name testPerformanceMonitor0016
         * @tc.desc Verify getOperationCount and getAllOperationNames.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testPerformanceMonitor0016', 0, (done: Function) => {
            runCase('testPerformanceMonitor0016', async () => {
                PerformanceMonitor.reset();
                PerformanceMonitor.recordOperation('opA', 10, true);
                PerformanceMonitor.recordOperation('opB', 20, false);
                expect(PerformanceMonitor.getOperationCount()).assertEqual(2);
                const names = PerformanceMonitor.getAllOperationNames();
                expect(names.length).assertEqual(2);
                expect(names).assertContain('opA');
                expect(names).assertContain('opB');
            }, done);
        })

        /**
         * @tc.number SUB_PERF_MONITOR_0017
         * @tc.name testPerformanceMonitor0017
         * @tc.desc Verify getTotalOperationCount sums all operations.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testPerformanceMonitor0017', 0, (done: Function) => {
            runCase('testPerformanceMonitor0017', async () => {
                PerformanceMonitor.reset();
                PerformanceMonitor.recordOperation('x', 10, true);
                PerformanceMonitor.recordOperation('x', 20, true);
                PerformanceMonitor.recordOperation('y', 30, false);
                expect(PerformanceMonitor.getTotalOperationCount()).assertEqual(3);
                expect(PerformanceMonitor.getOperationCount()).assertEqual(2);
                expect(PerformanceMonitor.getAllOperationNames().length).assertEqual(2);
            }, done);
        })

        /**
         * @tc.number SUB_PERF_MONITOR_0018
         * @tc.name testPerformanceMonitor0018
         * @tc.desc Verify getSuccessRate and getFailureRate.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testPerformanceMonitor0018', 0, (done: Function) => {
            runCase('testPerformanceMonitor0018', async () => {
                PerformanceMonitor.reset();
                PerformanceMonitor.recordOperation('op', 10, true);
                PerformanceMonitor.recordOperation('op', 10, true);
                PerformanceMonitor.recordOperation('op', 10, false);
                PerformanceMonitor.recordOperation('op', 10, false);

                const successRate = PerformanceMonitor.getSuccessRate('op');
                expect(successRate).assertEqual(0.5);
                const failureRate = PerformanceMonitor.getFailureRate('op');
                expect(failureRate).assertEqual(0.5);
                expect(PerformanceMonitor.getTotalOperationCount()).assertEqual(4);
                expect(PerformanceMonitor.getOperationCount()).assertEqual(1);
            }, done);
        })

        /**
         * @tc.number SUB_PERF_MONITOR_0019
         * @tc.name testPerformanceMonitor0019
         * @tc.desc Verify getSuccessRate returns 0 for unknown operation.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P2
         */
        it('testPerformanceMonitor0019', 0, (done: Function) => {
            runCase('testPerformanceMonitor0019', async () => {
                PerformanceMonitor.reset();
                expect(PerformanceMonitor.getSuccessRate('unknown')).assertEqual(0);
                expect(PerformanceMonitor.getFailureRate('unknown')).assertEqual(1);
                expect(PerformanceMonitor.getOperationCount()).assertEqual(0);
                expect(PerformanceMonitor.getTotalOperationCount()).assertEqual(0);
            }, done);
        })

        /**
         * @tc.number SUB_PERF_MONITOR_0020
         * @tc.name testPerformanceMonitor0020
         * @tc.desc Verify clearOperationStats and clearOperationStatsByName.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testPerformanceMonitor0020', 0, (done: Function) => {
            runCase('testPerformanceMonitor0020', async () => {
                PerformanceMonitor.reset();
                PerformanceMonitor.recordOperation('a', 10, true);
                PerformanceMonitor.recordOperation('b', 20, true);
                expect(PerformanceMonitor.getOperationCount()).assertEqual(2);

                PerformanceMonitor.clearOperationStatsByName('a');
                expect(PerformanceMonitor.getOperationCount()).assertEqual(1);

                PerformanceMonitor.clearOperationStats();
                expect(PerformanceMonitor.getOperationCount()).assertEqual(0);
            }, done);
        })

        /**
         * @tc.number SUB_PERF_MONITOR_0021
         * @tc.name testPerformanceMonitor0021
         * @tc.desc Verify formatStats for known and unknown operations.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testPerformanceMonitor0021', 0, (done: Function) => {
            runCase('testPerformanceMonitor0021', async () => {
                PerformanceMonitor.reset();
                const unknown = PerformanceMonitor.formatStats('missing');
                expect(unknown).assertContain('No stats');

                PerformanceMonitor.recordOperation('read', 100, true);
                PerformanceMonitor.recordOperation('read', 200, true);
                const formatted = PerformanceMonitor.formatStats('read');
                expect(formatted).assertContain('read');
                expect(formatted).assertContain('Total: 2');
                expect(formatted).assertContain('Success Rate');
            }, done);
        })

        /**
         * @tc.number SUB_PERF_MONITOR_0022
         * @tc.name testPerformanceMonitor0022
         * @tc.desc Verify formatAllStats combines multiple operations.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testPerformanceMonitor0022', 0, (done: Function) => {
            runCase('testPerformanceMonitor0022', async () => {
                PerformanceMonitor.reset();
                PerformanceMonitor.recordOperation('op1', 50, true);
                PerformanceMonitor.recordOperation('op2', 100, false);
                const allStats = PerformanceMonitor.formatAllStats();
                expect(allStats).assertContain('op1');
                expect(allStats).assertContain('op2');
                expect(allStats.length).assertLarger(0);
            }, done);
        })

        /**
         * @tc.number SUB_PERF_MONITOR_0023
         * @tc.name testPerformanceMonitor0023
         * @tc.desc Verify reset clears all data.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P0
         */
        it('testPerformanceMonitor0023', 0, (done: Function) => {
            runCase('testPerformanceMonitor0023', async () => {
                PerformanceMonitor.startTimer('timer1');
                PerformanceMonitor.recordMemorySnapshot('snap1');
                PerformanceMonitor.recordOperation('op1', 10, true);

                PerformanceMonitor.reset();
                expect(PerformanceMonitor.getTotalTimerCount()).assertEqual(0);
                expect(PerformanceMonitor.getMemorySnapshots().length).assertEqual(0);
                expect(PerformanceMonitor.getOperationCount()).assertEqual(0);
            }, done);
        })

        /**
         * @tc.number SUB_PERF_MONITOR_0024
         * @tc.name testPerformanceMonitor0024
         * @tc.desc Verify getSummary returns formatted summary string.
         * @tc.size MEDIUM
         * @tc.type FUNCTION
         * @tc.level P1
         */
        it('testPerformanceMonitor0024', 0, (done: Function) => {
            runCase('testPerformanceMonitor0024', async () => {
                PerformanceMonitor.reset();
                PerformanceMonitor.startTimer('t1');
                PerformanceMonitor.recordMemorySnapshot('s1');
                PerformanceMonitor.recordOperation('op1', 10, true);

                const summary = PerformanceMonitor.getSummary();
                expect(summary).assertContain('PerformanceMonitor Summary');
                expect(summary).assertContain('Timers:');
                expect(summary).assertContain('Memory Snapshots:');
                expect(summary).assertContain('Operations:');
            }, done);
        })

        /**
         * @tc.number SUB_PERF_MONITOR_0025
         * @tc.name testPerformanceMonitor0025
         * @tc.desc Verify stopTimer on already stopped timer returns existing duration.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P2
         */
        it('testPerformanceMonitor0025', 0, (done: Function) => {
            runCase('testPerformanceMonitor0025', async () => {
                PerformanceMonitor.reset();
                PerformanceMonitor.startTimer('dup');
                const first = PerformanceMonitor.stopTimer('dup');
                const second = PerformanceMonitor.stopTimer('dup');
                expect(second).assertEqual(first);
                expect(first).assertLargerOrEqual(0);
                expect(PerformanceMonitor.isTimerRunning('dup')).assertFalse();
            }, done);
        })

        /**
         * @tc.number SUB_PERF_MONITOR_0026
         * @tc.name testPerformanceMonitor0026
         * @tc.desc Verify recordOperation with zero duration.
         * @tc.size SMALL
         * @tc.type FUNCTION
         * @tc.level P2
         */
        it('testPerformanceMonitor0026', 0, (done: Function) => {
            runCase('testPerformanceMonitor0026', async () => {
                PerformanceMonitor.reset();
                PerformanceMonitor.recordOperation('zero', 0, true);
                expect(PerformanceMonitor.getAverageTime('zero')).assertEqual(0);
                expect(PerformanceMonitor.getMinTime('zero')).assertEqual(0);
                expect(PerformanceMonitor.getMaxTime('zero')).assertEqual(0);
                expect(PerformanceMonitor.getSuccessRate('zero')).assertEqual(1);
            }, done);
        })
    })
}
