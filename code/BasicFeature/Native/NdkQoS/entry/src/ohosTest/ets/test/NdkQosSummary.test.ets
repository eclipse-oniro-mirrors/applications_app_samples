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

import { afterEach, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import testNapi from 'libentry.so';
import { BenchmarkReport, QosRunInfo, ResetSummaryReport, RunSummary } from 'libentry.so';

const TAG: string = '[Sample_NdkQosSummaryTest]';
const DOMAIN: number = 0xF811;
const MIN_LEVEL: number = 0;
const MAX_LEVEL: number = 5;
const LEVEL_COUNT: number = 6;
const BENCH_ROUNDS: number = 1;
const INVALID_RESULT: number = -1;
const INVALID_DURATION: number = -1;
const DURATION_UPPER_BOUND: number = 120000;
const DURATION_TOLERANCE: number = 0.001;
const CALL_INTERVAL: number = 1200;

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

function sumOfCounts(summary: RunSummary): number {
  let total: number = 0;
  for (let index = 0; index < summary.levelCounts.length; index++) {
    total += summary.levelCounts[index];
  }
  return total;
}

function isNear(left: number, right: number): boolean {
  return Math.abs(left - right) <= DURATION_TOLERANCE;
}

export default function ndkQosSummaryTest(): void {
  describe('NdkQosSummary', () => {
    beforeEach(() => {
      testNapi.resetRunSummary();
    });
    afterEach(async () => {
      // The native run blocks the JS thread, yield a macrotask between cases so the freeze guard timer can run.
      await sleepMs(SETTLE_INTERVAL);
    });


    /**
     * @tc.number    SUB_QOS_SUMMARY_0001
     * @tc.name      testNdkQosSummary0001
     * @tc.desc      Checks clearing the statistics reports success and a zero experiment count.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosSummary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosSummary0001 begin');
      const report: ResetSummaryReport = testNapi.resetRunSummary();
      logInfo('reset report = ' + JSON.stringify(report));
      expect(report.code).assertEqual(0);
      expect(report.runCount).assertEqual(0);
      expect(testNapi.getRunSummary().runCount).assertEqual(0);
      logInfo('testNdkQosSummary0001 end');
    })

    /**
     * @tc.number    SUB_QOS_SUMMARY_0002
     * @tc.name      testNdkQosSummary0002
     * @tc.desc      Checks a freshly cleared summary reports the sentinel values for every duration field.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosSummary0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosSummary0002 begin');
      const summary: RunSummary = testNapi.getRunSummary();
      logInfo('empty summary = ' + JSON.stringify(summary));
      expect(summary.runCount).assertEqual(0);
      expect(summary.lastLevel).assertEqual(INVALID_RESULT);
      expect(summary.minDuration).assertEqual(INVALID_DURATION);
      expect(summary.maxDuration).assertEqual(INVALID_DURATION);
      expect(summary.avgDuration).assertEqual(INVALID_DURATION);
      logInfo('testNdkQosSummary0002 end');
    })

    /**
     * @tc.number    SUB_QOS_SUMMARY_0003
     * @tc.name      testNdkQosSummary0003
     * @tc.desc      Checks a freshly cleared summary reports six per-level counters that are all zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosSummary0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosSummary0003 begin');
      const summary: RunSummary = testNapi.getRunSummary();
      expect(summary.levelCounts.length).assertEqual(LEVEL_COUNT);
      for (let index = 0; index < summary.levelCounts.length; index++) {
        expect(summary.levelCounts[index]).assertEqual(0);
      }
      expect(sumOfCounts(summary)).assertEqual(0);
      logInfo('testNdkQosSummary0003 end');
    })

    /**
     * @tc.number    SUB_QOS_SUMMARY_0004
     * @tc.name      testNdkQosSummary0004
     * @tc.desc      Checks one experiment increases the count by one and records the level it used.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosSummary0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosSummary0004 begin');
      const duration: number = testNapi.useQos(3);
      const summary: RunSummary = testNapi.getRunSummary();
      logInfo('summary after one run = ' + JSON.stringify(summary));
      expect(isPositiveDuration(duration)).assertTrue();
      expect(summary.runCount).assertEqual(1);
      expect(summary.lastLevel).assertEqual(3);
      expect(summary.levelCounts[3]).assertEqual(1);
      logInfo('testNdkQosSummary0004 end');
    })

    /**
     * @tc.number    SUB_QOS_SUMMARY_0005
     * @tc.name      testNdkQosSummary0005
     * @tc.desc      Checks a single experiment makes the minimum, average and maximum all equal its duration.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosSummary0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosSummary0005 begin');
      const duration: number = testNapi.useQos(MAX_LEVEL);
      const summary: RunSummary = testNapi.getRunSummary();
      logInfo('single run bounds = ' + summary.minDuration.toString() + ' / ' +
        summary.avgDuration.toString() + ' / ' + summary.maxDuration.toString());
      expect(isNear(summary.minDuration, duration)).assertTrue();
      expect(isNear(summary.maxDuration, duration)).assertTrue();
      expect(isNear(summary.avgDuration, duration)).assertTrue();
      logInfo('testNdkQosSummary0005 end');
    })

    /**
     * @tc.number    SUB_QOS_SUMMARY_0006
     * @tc.name      testNdkQosSummary0006
     * @tc.desc      Checks two experiments accumulate to a count of two and the latest level is reported.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosSummary0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosSummary0006 begin');
      testNapi.useQos(MIN_LEVEL);
      testNapi.useQos(1);
      const summary: RunSummary = testNapi.getRunSummary();
      expect(summary.runCount).assertEqual(2);
      expect(summary.lastLevel).assertEqual(1);
      expect(summary.levelCounts[MIN_LEVEL]).assertEqual(1);
      expect(summary.levelCounts[1]).assertEqual(1);
      logInfo('testNdkQosSummary0006 end');
    })

    /**
     * @tc.number    SUB_QOS_SUMMARY_0007
     * @tc.name      testNdkQosSummary0007
     * @tc.desc      Checks the per-level counters add up to the total count after repeating one level twice.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosSummary0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosSummary0007 begin');
      testNapi.useQos(MIN_LEVEL);
      // Each native run blocks the JS main thread, yield between runs to stay clear of the freeze guard.
      await sleepMs(CALL_INTERVAL);
      testNapi.useQos(MIN_LEVEL);
      await sleepMs(CALL_INTERVAL);
      testNapi.useQos(MAX_LEVEL);
      const summary: RunSummary = testNapi.getRunSummary();
      logInfo('counters = ' + JSON.stringify(summary.levelCounts));
      expect(summary.levelCounts[MIN_LEVEL]).assertEqual(2);
      expect(summary.levelCounts[MAX_LEVEL]).assertEqual(1);
      expect(sumOfCounts(summary)).assertEqual(summary.runCount);
      logInfo('testNdkQosSummary0007 end');
    })

    /**
     * @tc.number    SUB_QOS_SUMMARY_0008
     * @tc.name      testNdkQosSummary0008
     * @tc.desc      Checks the accumulated average stays between the accumulated minimum and maximum.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosSummary0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosSummary0008 begin');
      testNapi.useQos(MIN_LEVEL);
      await sleepMs(CALL_INTERVAL);
      testNapi.useQos(2);
      await sleepMs(CALL_INTERVAL);
      testNapi.useQos(MAX_LEVEL);
      const summary: RunSummary = testNapi.getRunSummary();
      logInfo('accumulated bounds = ' + summary.minDuration.toString() + ' ~ ' + summary.maxDuration.toString());
      expect(summary.minDuration <= summary.avgDuration).assertTrue();
      expect(summary.avgDuration <= summary.maxDuration).assertTrue();
      expect(summary.runCount).assertEqual(3);
      expect(isPositiveDuration(summary.minDuration)).assertTrue();
      logInfo('testNdkQosSummary0008 end');
    })

    /**
     * @tc.number    SUB_QOS_SUMMARY_0009
     * @tc.name      testNdkQosSummary0009
     * @tc.desc      Checks the two shortcut entries are counted on the highest and the lowest level.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosSummary0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosSummary0009 begin');
      testNapi.useHighQos();
      testNapi.useLowQos();
      const summary: RunSummary = testNapi.getRunSummary();
      logInfo('shortcut counters = ' + JSON.stringify(summary.levelCounts));
      expect(summary.levelCounts[MAX_LEVEL]).assertEqual(1);
      expect(summary.levelCounts[MIN_LEVEL]).assertEqual(1);
      expect(summary.runCount).assertEqual(2);
      expect(summary.lastLevel).assertEqual(MIN_LEVEL);
      logInfo('testNdkQosSummary0009 end');
    })

    /**
     * @tc.number    SUB_QOS_SUMMARY_0010
     * @tc.name      testNdkQosSummary0010
     * @tc.desc      Checks an asynchronous experiment is counted exactly once with its level.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosSummary0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosSummary0010 begin');
      const duration: number = await testNapi.useQosAsync(4);
      const summary: RunSummary = testNapi.getRunSummary();
      expect(isPositiveDuration(duration)).assertTrue();
      expect(summary.runCount).assertEqual(1);
      expect(summary.lastLevel).assertEqual(4);
      expect(summary.levelCounts[4]).assertEqual(1);
      logInfo('testNdkQosSummary0010 end');
    })

    /**
     * @tc.number    SUB_QOS_SUMMARY_0011
     * @tc.name      testNdkQosSummary0011
     * @tc.desc      Checks clearing twice is idempotent and drops the counters collected before.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosSummary0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosSummary0011 begin');
      testNapi.useQos(2);
      testNapi.useQos(2);
      const firstReset: ResetSummaryReport = testNapi.resetRunSummary();
      const secondReset: ResetSummaryReport = testNapi.resetRunSummary();
      const summary: RunSummary = testNapi.getRunSummary();
      expect(firstReset.runCount).assertEqual(0);
      expect(secondReset.runCount).assertEqual(0);
      expect(secondReset.code).assertEqual(firstReset.code);
      expect(summary.runCount).assertEqual(0);
      expect(summary.levelCounts[2]).assertEqual(0);
      expect(summary.lastLevel).assertEqual(INVALID_RESULT);
      logInfo('testNdkQosSummary0011 end');
    })

    /**
     * @tc.number    SUB_QOS_SUMMARY_0012
     * @tc.name      testNdkQosSummary0012
     * @tc.desc      Checks a benchmark round is counted as one experiment per level in the summary.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosSummary0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosSummary0012 begin');
      const report: BenchmarkReport = await testNapi.runLevelBenchmarkAsync(BENCH_ROUNDS);
      const summary: RunSummary = testNapi.getRunSummary();
      logInfo('summary after benchmark = ' + JSON.stringify(summary));
      expect(summary.runCount).assertEqual(report.totalRuns);
      expect(sumOfCounts(summary)).assertEqual(LEVEL_COUNT * BENCH_ROUNDS);
      expect(summary.lastLevel).assertEqual(MAX_LEVEL);
      logInfo('testNdkQosSummary0012 end');
    })

    /**
     * @tc.number    SUB_QOS_SUMMARY_0013
     * @tc.name      testNdkQosSummary0013
     * @tc.desc      Checks a rejected level does not add anything to the accumulated statistics.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosSummary0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosSummary0013 begin');
      expect(testNapi.useQos(MAX_LEVEL + 1)).assertEqual(INVALID_DURATION);
      const afterRejected: RunSummary = testNapi.getRunSummary();
      logInfo('summary after rejected level = ' + JSON.stringify(afterRejected));
      expect(afterRejected.runCount).assertEqual(0);
      expect(afterRejected.lastLevel).assertEqual(INVALID_RESULT);
      expect(afterRejected.avgDuration).assertEqual(INVALID_DURATION);
      testNapi.useQos(1);
      expect(testNapi.getRunSummary().runCount).assertEqual(1);
      logInfo('testNdkQosSummary0013 end');
    })

    /**
     * @tc.number    SUB_QOS_SUMMARY_0014
     * @tc.name      testNdkQosSummary0014
     * @tc.desc      Checks the summary keeps the run information of the last completed experiment.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosSummary0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosSummary0014 begin');
      testNapi.useQos(MIN_LEVEL);
      testNapi.useQos(MAX_LEVEL);
      const info: QosRunInfo = testNapi.getLastQosInfo();
      const summary: RunSummary = testNapi.getRunSummary();
      logInfo('last run info = ' + JSON.stringify(info));
      expect(info.queryLevel).assertEqual(summary.lastLevel);
      expect(info.resetResult).assertEqual(0);
      expect(isPositiveDuration(info.duration)).assertTrue();
      logInfo('testNdkQosSummary0014 end');
    })
  })
}
