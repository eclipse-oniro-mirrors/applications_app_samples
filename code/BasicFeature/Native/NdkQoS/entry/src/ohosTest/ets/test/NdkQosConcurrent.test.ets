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

import { afterEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import testNapi from 'libentry.so';
import { ConcurrentReport } from 'libentry.so';

const TAG: string = '[Sample_NdkQosConcurrentTest]';
const DOMAIN: number = 0xF811;
const MIN_LEVEL: number = 0;
const MAX_LEVEL: number = 5;
const LEVEL_COUNT: number = 6;
const MAX_THREADS: number = 8;
const MAX_ROUNDS: number = 5;
const INVALID_DURATION: number = -1;
const DURATION_UPPER_BOUND: number = 120000;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

const SETTLE_INTERVAL: number = 120;

function sleepMs(duration: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, duration);
  });
}

function isPositiveDuration(value: number): boolean {
  return !Number.isNaN(value) && Number.isFinite(value) && value > 0 && value < DURATION_UPPER_BOUND;
}

function attempts(report: ConcurrentReport): number {
  return report.successCount + report.failCount;
}

// 参数被拒绝时接口以 reject 结束，这里把结果收敛成一个布尔值方便断言
async function rejectedRun(level: number, threads: number, rounds: number): Promise<boolean> {
  try {
    await testNapi.runConcurrentAsync(level, threads, rounds);
  } catch (error) {
    return true;
  }
  return false;
}

export default function ndkQosConcurrentTest(): void {
  describe('NdkQosConcurrent', () => {
    afterEach(async () => {
      // The native run blocks the JS thread, yield a macrotask between cases so the freeze guard timer can run.
      await sleepMs(SETTLE_INTERVAL);
    });

    /**
     * @tc.number    SUB_NDK_QOS_CONCURRENT_0001
     * @tc.name      testNdkQosConcurrent0001
     * @tc.desc      Checks one worker running one round reports a single attempt with the echoed level.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosConcurrent0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosConcurrent0001 begin');
      const report: ConcurrentReport = await testNapi.runConcurrentAsync(MAX_LEVEL, 1, 1);
      logInfo('single worker report = ' + JSON.stringify(report));
      expect(report.code).assertEqual(0);
      expect(report.level).assertEqual(MAX_LEVEL);
      expect(report.threads).assertEqual(1);
      expect(report.rounds).assertEqual(1);
      expect(attempts(report)).assertEqual(1);
      logInfo('testNdkQosConcurrent0001 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_CONCURRENT_0002
     * @tc.name      testNdkQosConcurrent0002
     * @tc.desc      Checks the report echoes the requested level, worker count and round count.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosConcurrent0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosConcurrent0002 begin');
      const report: ConcurrentReport = await testNapi.runConcurrentAsync(3, 3, 2);
      expect(report.code).assertEqual(0);
      expect(report.level).assertEqual(3);
      expect(report.threads).assertEqual(3);
      expect(report.rounds).assertEqual(2);
      expect(attempts(report)).assertEqual(3 * 2);
      logInfo('testNdkQosConcurrent0002 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_CONCURRENT_0003
     * @tc.name      testNdkQosConcurrent0003
     * @tc.desc      Checks two workers running one round each account for two attempts.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosConcurrent0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosConcurrent0003 begin');
      const report: ConcurrentReport = await testNapi.runConcurrentAsync(MIN_LEVEL, 2, 1);
      expect(report.threads).assertEqual(2);
      expect(attempts(report)).assertEqual(2);
      expect(report.successCount + report.failCount).assertEqual(report.threads * report.rounds);
      logInfo('testNdkQosConcurrent0003 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_CONCURRENT_0004
     * @tc.name      testNdkQosConcurrent0004
     * @tc.desc      Checks four workers share the compute load without losing any attempt.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosConcurrent0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosConcurrent0004 begin');
      const report: ConcurrentReport = await testNapi.runConcurrentAsync(2, 4, 1);
      expect(report.code).assertEqual(0);
      expect(report.threads).assertEqual(4);
      expect(attempts(report)).assertEqual(4);
      logInfo('testNdkQosConcurrent0004 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_CONCURRENT_0005
     * @tc.name      testNdkQosConcurrent0005
     * @tc.desc      Checks the highest supported worker count is accepted and fully accounted for.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosConcurrent0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosConcurrent0005 begin');
      const report: ConcurrentReport = await testNapi.runConcurrentAsync(MAX_LEVEL, MAX_THREADS, 1);
      logInfo('max worker report = ' + JSON.stringify(report));
      expect(report.code).assertEqual(0);
      expect(report.threads).assertEqual(MAX_THREADS);
      expect(attempts(report)).assertEqual(MAX_THREADS);
      logInfo('testNdkQosConcurrent0005 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_CONCURRENT_0006
     * @tc.name      testNdkQosConcurrent0006
     * @tc.desc      Checks the highest supported round count is repeated by a single worker.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosConcurrent0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosConcurrent0006 begin');
      const report: ConcurrentReport = await testNapi.runConcurrentAsync(1, 1, MAX_ROUNDS);
      expect(report.rounds).assertEqual(MAX_ROUNDS);
      expect(report.threads).assertEqual(1);
      expect(attempts(report)).assertEqual(MAX_ROUNDS);
      logInfo('testNdkQosConcurrent0006 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_CONCURRENT_0007
     * @tc.name      testNdkQosConcurrent0007
     * @tc.desc      Checks the reported average duration stays inside the reported minimum and maximum.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosConcurrent0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosConcurrent0007 begin');
      const report: ConcurrentReport = await testNapi.runConcurrentAsync(MAX_LEVEL, 4, 2);
      logInfo('four worker average = ' + report.avgDuration.toString());
      if (report.successCount > 0) {
        expect(isPositiveDuration(report.avgDuration)).assertTrue();
        expect(report.minDuration <= report.avgDuration).assertTrue();
        expect(report.avgDuration <= report.maxDuration).assertTrue();
      } else {
        expect(report.avgDuration).assertEqual(INVALID_DURATION);
      }
      expect(attempts(report)).assertEqual(4 * 2);
      logInfo('testNdkQosConcurrent0007 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_CONCURRENT_0008
     * @tc.name      testNdkQosConcurrent0008
     * @tc.desc      Checks the duration bounds keep the minimum below the maximum once several workers ran.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosConcurrent0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosConcurrent0008 begin');
      const report: ConcurrentReport = await testNapi.runConcurrentAsync(3, 2, 3);
      logInfo('bounds = ' + report.minDuration.toString() + ' ~ ' + report.maxDuration.toString());
      expect(report.minDuration <= report.maxDuration).assertTrue();
      if (report.successCount >= 2) {
        expect(isPositiveDuration(report.minDuration)).assertTrue();
        expect(isPositiveDuration(report.maxDuration)).assertTrue();
      }
      expect(attempts(report)).assertEqual(2 * 3);
      logInfo('testNdkQosConcurrent0008 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_CONCURRENT_0009
     * @tc.name      testNdkQosConcurrent0009
     * @tc.desc      Checks every level in the supported range can be used to drive the concurrent load.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosConcurrent0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosConcurrent0009 begin');
      let accepted: number = 0;
      for (let level = MIN_LEVEL; level <= MAX_LEVEL; level++) {
        const report: ConcurrentReport = await testNapi.runConcurrentAsync(level, 1, 1);
        if (report.code === 0 && report.level === level && attempts(report) === 1) {
          accepted++;
        }
      }
      logInfo('levels accepted by the concurrent load = ' + accepted.toString());
      expect(accepted).assertEqual(LEVEL_COUNT);
      expect(LEVEL_COUNT).assertEqual(MAX_LEVEL - MIN_LEVEL + 1);
      const extra: ConcurrentReport = await testNapi.runConcurrentAsync(MAX_LEVEL, 1, 1);
      expect(extra.level).assertEqual(MAX_LEVEL);
      logInfo('testNdkQosConcurrent0009 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_CONCURRENT_0010
     * @tc.name      testNdkQosConcurrent0010
     * @tc.desc      Checks a level above the interactive level is rejected before any worker starts.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosConcurrent0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosConcurrent0010 begin');
      expect(await rejectedRun(MAX_LEVEL + 1, 1, 1)).assertTrue();
      expect(await rejectedRun(MAX_LEVEL + 100, 1, 1)).assertTrue();
      expect(await rejectedRun(MIN_LEVEL, 1, 1)).assertFalse();
      logInfo('testNdkQosConcurrent0010 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_CONCURRENT_0011
     * @tc.name      testNdkQosConcurrent0011
     * @tc.desc      Checks a negative level is rejected before any worker starts.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosConcurrent0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosConcurrent0011 begin');
      expect(await rejectedRun(MIN_LEVEL - 1, 1, 1)).assertTrue();
      expect(await rejectedRun(-100, 1, 1)).assertTrue();
      expect((await testNapi.runConcurrentAsync(MIN_LEVEL, 1, 1)).threads).assertEqual(1);
      logInfo('testNdkQosConcurrent0011 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_CONCURRENT_0012
     * @tc.name      testNdkQosConcurrent0012
     * @tc.desc      Checks a zero worker count is rejected because the load needs at least one worker.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosConcurrent0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosConcurrent0012 begin');
      expect(await rejectedRun(MIN_LEVEL, 0, 1)).assertTrue();
      expect(await rejectedRun(MIN_LEVEL, -2, 1)).assertTrue();
      expect(await rejectedRun(MIN_LEVEL, 1, 1)).assertFalse();
      logInfo('testNdkQosConcurrent0012 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_CONCURRENT_0013
     * @tc.name      testNdkQosConcurrent0013
     * @tc.desc      Checks a worker count above the supported ceiling is rejected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosConcurrent0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosConcurrent0013 begin');
      expect(await rejectedRun(MIN_LEVEL, MAX_THREADS + 1, 1)).assertTrue();
      expect(await rejectedRun(MIN_LEVEL, MAX_THREADS * 4, 1)).assertTrue();
      expect(await rejectedRun(MIN_LEVEL, MAX_THREADS, 1)).assertFalse();
      logInfo('testNdkQosConcurrent0013 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_CONCURRENT_0014
     * @tc.name      testNdkQosConcurrent0014
     * @tc.desc      Checks a zero round count is rejected because every worker has to run at least once.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosConcurrent0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosConcurrent0014 begin');
      expect(await rejectedRun(MIN_LEVEL, 1, 0)).assertTrue();
      expect(await rejectedRun(MIN_LEVEL, 2, -1)).assertTrue();
      expect(await rejectedRun(MIN_LEVEL, 2, 1)).assertFalse();
      logInfo('testNdkQosConcurrent0014 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_CONCURRENT_0015
     * @tc.name      testNdkQosConcurrent0015
     * @tc.desc      Checks a round count above the supported ceiling is rejected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosConcurrent0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosConcurrent0015 begin');
      expect(await rejectedRun(MIN_LEVEL, 1, MAX_ROUNDS + 1)).assertTrue();
      expect(await rejectedRun(MIN_LEVEL, 1, MAX_ROUNDS * 2)).assertTrue();
      expect(await rejectedRun(MIN_LEVEL, 1, MAX_ROUNDS)).assertFalse();
      logInfo('testNdkQosConcurrent0015 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_CONCURRENT_0016
     * @tc.name      testNdkQosConcurrent0016
     * @tc.desc      Checks a fractional worker count is rejected instead of being rounded to a whole worker.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosConcurrent0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosConcurrent0016 begin');
      const fractions: number[] = [1.5, 2.5, 7.5];
      let rejectedCount: number = 0;
      for (let index = 0; index < fractions.length; index++) {
        if (await rejectedRun(MIN_LEVEL, fractions[index], 1)) {
          rejectedCount++;
        }
      }
      const report: ConcurrentReport = await testNapi.runConcurrentAsync(MIN_LEVEL, 3, 1);
      logInfo('fractional threads rejected = ' + rejectedCount.toString());
      expect(rejectedCount).assertEqual(fractions.length);
      expect(report.threads).assertEqual(3);
      expect(attempts(report)).assertEqual(3);
      logInfo('testNdkQosConcurrent0016 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_CONCURRENT_0017
     * @tc.name      testNdkQosConcurrent0017
     * @tc.desc      Checks a fractional round count is rejected instead of being truncated.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosConcurrent0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosConcurrent0017 begin');
      let fractionalRejected: boolean = false;
      try {
        await testNapi.runConcurrentAsync(MIN_LEVEL, 1, 2.5);
      } catch (error) {
        fractionalRejected = true;
        logInfo('fractional rounds rejected by the concurrent run');
      }
      let halfRoundRejected: boolean = false;
      try {
        await testNapi.runConcurrentAsync(MIN_LEVEL, 1, 0.5);
      } catch (error) {
        halfRoundRejected = true;
        logInfo('half round rejected by the concurrent run');
      }
      const report: ConcurrentReport = await testNapi.runConcurrentAsync(MIN_LEVEL, 1, 2);
      expect(fractionalRejected).assertTrue();
      expect(halfRoundRejected).assertTrue();
      expect(report.rounds).assertEqual(2);
      expect(attempts(report)).assertEqual(2);
      logInfo('testNdkQosConcurrent0017 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_CONCURRENT_0018
     * @tc.name      testNdkQosConcurrent0018
     * @tc.desc      Checks two consecutive runs keep their own worker counts and attempt totals.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosConcurrent0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosConcurrent0018 begin');
      const first: ConcurrentReport = await testNapi.runConcurrentAsync(1, 2, 2);
      const second: ConcurrentReport = await testNapi.runConcurrentAsync(4, 3, 1);
      logInfo('first threads = ' + first.threads.toString() + ', second threads = ' + second.threads.toString());
      expect(first.threads).assertEqual(2);
      expect(attempts(first)).assertEqual(4);
      expect(second.threads).assertEqual(3);
      expect(attempts(second)).assertEqual(3);
      expect(second.level).assertEqual(4);
      logInfo('testNdkQosConcurrent0018 end');
    })
  })
}
