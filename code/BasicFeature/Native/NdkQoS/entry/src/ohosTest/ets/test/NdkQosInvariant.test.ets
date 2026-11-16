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
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import testNapi from 'libentry.so';
import {
  BenchmarkReport,
  ClearRecordReport,
  CompareReport,
  ConcurrentReport,
  LevelSample,
  QosRunInfo,
  RecordStatsReport,
  ResetSummaryReport,
  RunSummary
} from 'libentry.so';

const TAG: string = '[Sample_NdkQosInvariantTest]';
const DOMAIN: number = 0xF811;
const CODE_OK: number = 0;
const LEVEL_COUNT: number = 6;
const MIN_LEVEL: number = 0;
const MAX_LEVEL: number = 5;
const INVALID_RESULT: number = -1;
const INVALID_DURATION: number = -1;
const DURATION_TOLERANCE: number = 0.001;

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

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

function recordDir(): string {
  return delegator.getAppContext().filesDir;
}

function sumOf(values: number[]): number {
  let total: number = 0;
  for (let index = 0; index < values.length; index++) {
    total += values[index];
  }
  return total;
}

function isDurationValid(value: number): boolean {
  return !Number.isNaN(value) && Number.isFinite(value) && value > 0;
}

export default function ndkQosInvariantTest(): void {
  describe('NdkQosInvariant', () => {
    beforeEach(() => {
      testNapi.resetRunSummary();
      testNapi.clearRunRecords(recordDir());
    });

    afterEach(async () => {
      // The native run blocks the JS thread, yield a macrotask between cases so the freeze guard timer can run.
      await sleepMs(SETTLE_INTERVAL);
    });

    /**
     * @tc.number    SUB_NDK_QOS_INVARIANT_0001
     * @tc.name      testNdkQosInvariant0001
     * @tc.desc      Checks the accumulated count still equals the per-level counter sum after mixed calls.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosInvariant0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosInvariant0001 begin');
      testNapi.useQos(4);
      await testNapi.runLevelBenchmarkAsync(1);
      testNapi.compareLevels(0, 5);
      await testNapi.runConcurrentAsync(2, 2, 1);
      const summary: RunSummary = testNapi.getRunSummary();
      logInfo('mixed summary = ' + JSON.stringify(summary));
      expect(summary.runCount).assertEqual(11);
      expect(sumOf(summary.levelCounts)).assertEqual(summary.runCount);
      expect(summary.levelCounts.length).assertEqual(LEVEL_COUNT);
      expect(summary.lastLevel).assertEqual(2);
      logInfo('testNdkQosInvariant0001 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_INVARIANT_0002
     * @tc.name      testNdkQosInvariant0002
     * @tc.desc      Checks clearing the counters keeps the last run snapshot readable through the info call.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosInvariant0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosInvariant0002 begin');
      testNapi.useQos(MAX_LEVEL);
      const before: QosRunInfo = testNapi.getLastQosInfo();
      const reset: ResetSummaryReport = testNapi.resetRunSummary();
      const summary: RunSummary = testNapi.getRunSummary();
      const after: QosRunInfo = testNapi.getLastQosInfo();
      expect(reset.code).assertEqual(CODE_OK);
      expect(summary.runCount).assertEqual(0);
      expect(after.queryLevel).assertEqual(before.queryLevel);
      expect(after.duration).assertEqual(before.duration);
      logInfo('testNdkQosInvariant0002 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_INVARIANT_0003
     * @tc.name      testNdkQosInvariant0003
     * @tc.desc      Checks three rounds per level add eighteen experiments with three per level counter.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosInvariant0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosInvariant0003 begin');
      const report: BenchmarkReport = await testNapi.runLevelBenchmarkAsync(3);
      const summary: RunSummary = testNapi.getRunSummary();
      logInfo('three round summary = ' + JSON.stringify(summary.levelCounts));
      expect(report.totalRuns).assertEqual(18);
      expect(summary.runCount).assertEqual(18);
      expect(summary.levelCounts[0]).assertEqual(3);
      expect(summary.levelCounts[MAX_LEVEL]).assertEqual(3);
      logInfo('testNdkQosInvariant0003 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_INVARIANT_0004
     * @tc.name      testNdkQosInvariant0004
     * @tc.desc      Checks a comparison adds one experiment to each of the two compared levels.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosInvariant0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosInvariant0004 begin');
      const report: CompareReport = testNapi.compareLevels(MIN_LEVEL, MAX_LEVEL);
      const summary: RunSummary = testNapi.getRunSummary();
      expect(report.code).assertEqual(CODE_OK);
      expect(summary.runCount).assertEqual(2);
      expect(summary.levelCounts[MIN_LEVEL]).assertEqual(1);
      expect(summary.levelCounts[MAX_LEVEL]).assertEqual(1);
      logInfo('testNdkQosInvariant0004 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_INVARIANT_0005
     * @tc.name      testNdkQosInvariant0005
     * @tc.desc      Checks two workers on the default level add two experiments to that level only.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosInvariant0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosInvariant0005 begin');
      const report: ConcurrentReport = await testNapi.runConcurrentAsync(2, 2, 1);
      const summary: RunSummary = testNapi.getRunSummary();
      expect(report.successCount + report.failCount).assertEqual(2);
      expect(summary.runCount).assertEqual(2);
      expect(summary.levelCounts[2]).assertEqual(2);
      expect(summary.levelCounts[1]).assertEqual(0);
      logInfo('testNdkQosInvariant0005 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_INVARIANT_0006
     * @tc.name      testNdkQosInvariant0006
     * @tc.desc      Checks every benchmark sample accounts for the requested rounds and sums to the total.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosInvariant0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosInvariant0006 begin');
      const report: BenchmarkReport = await testNapi.runLevelBenchmarkAsync(2);
      let attempts: number = 0;
      for (let index = 0; index < report.samples.length; index++) {
        const sample: LevelSample = report.samples[index];
        expect(sample.successCount + sample.failCount).assertEqual(2);
        attempts += sample.successCount + sample.failCount;
      }
      logInfo('sample attempts = ' + attempts.toString() + ', total runs = ' + report.totalRuns.toString());
      expect(attempts).assertEqual(report.totalRuns);
      expect(report.totalRuns).assertEqual(12);
      logInfo('testNdkQosInvariant0006 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_INVARIANT_0007
     * @tc.name      testNdkQosInvariant0007
     * @tc.desc      Checks a successful sample keeps min, average and max ordered and a failed one the sentinel.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosInvariant0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosInvariant0007 begin');
      const report: BenchmarkReport = await testNapi.runLevelBenchmarkAsync(1);
      let successful: number = 0;
      for (let index = 0; index < report.samples.length; index++) {
        const sample: LevelSample = report.samples[index];
        if (sample.successCount > 0) {
          successful++;
          expect(sample.minDuration <= sample.avgDuration + DURATION_TOLERANCE).assertTrue();
          expect(sample.avgDuration <= sample.maxDuration + DURATION_TOLERANCE).assertTrue();
          expect(isDurationValid(sample.avgDuration)).assertTrue();
        } else {
          expect(sample.avgDuration).assertEqual(INVALID_DURATION);
          expect(sample.minDuration).assertEqual(INVALID_DURATION);
        }
      }
      expect(report.samples.length).assertEqual(LEVEL_COUNT);
      expect(successful > 0).assertTrue();
      logInfo('testNdkQosInvariant0007 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_INVARIANT_0008
     * @tc.name      testNdkQosInvariant0008
     * @tc.desc      Checks the fastest level holds an average no larger than the slowest level average.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosInvariant0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosInvariant0008 begin');
      const report: BenchmarkReport = await testNapi.runLevelBenchmarkAsync(1);
      const fastest: LevelSample = report.samples[report.fastestLevel - MIN_LEVEL];
      const slowest: LevelSample = report.samples[report.slowestLevel - MIN_LEVEL];
      logInfo('fastest avg = ' + fastest.avgDuration.toFixed(3) + ', slowest avg = ' +
        slowest.avgDuration.toFixed(3));
      expect(report.fastestLevel >= MIN_LEVEL && report.fastestLevel <= MAX_LEVEL).assertTrue();
      expect(report.slowestLevel >= MIN_LEVEL && report.slowestLevel <= MAX_LEVEL).assertTrue();
      expect(fastest.avgDuration <= slowest.avgDuration + DURATION_TOLERANCE).assertTrue();
      logInfo('testNdkQosInvariant0008 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_INVARIANT_0009
     * @tc.name      testNdkQosInvariant0009
     * @tc.desc      Checks the accumulated bounds still bracket the average after a comparison and a run.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosInvariant0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosInvariant0009 begin');
      const comparison: CompareReport = testNapi.compareLevels(MIN_LEVEL, MAX_LEVEL);
      testNapi.useQos(2);
      const summary: RunSummary = testNapi.getRunSummary();
      logInfo('bounded summary = ' + JSON.stringify(summary));
      expect(summary.runCount).assertEqual(3);
      expect(summary.minDuration <= summary.avgDuration + DURATION_TOLERANCE).assertTrue();
      expect(summary.avgDuration <= summary.maxDuration + DURATION_TOLERANCE).assertTrue();
      expect(summary.minDuration <= comparison.durationA + DURATION_TOLERANCE).assertTrue();
      logInfo('testNdkQosInvariant0009 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_INVARIANT_0010
     * @tc.name      testNdkQosInvariant0010
     * @tc.desc      Checks the record file totals agree with the accumulated counters for the same runs.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosInvariant0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosInvariant0010 begin');
      const first: number = testNapi.useQos(1);
      const second: number = testNapi.useQos(4);
      testNapi.appendRunRecord(recordDir(), 1, first, 0, 1, 0, 0);
      testNapi.appendRunRecord(recordDir(), 4, second, 0, 4, 0, 0);
      const summary: RunSummary = testNapi.getRunSummary();
      const stats: RecordStatsReport = testNapi.getRecordStats(recordDir());
      logInfo('summary runs = ' + summary.runCount.toString() + ', stats total = ' + stats.total.toString());
      expect(summary.runCount).assertEqual(2);
      expect(stats.total).assertEqual(summary.runCount);
      expect(stats.successCount).assertEqual(2);
      expect(stats.failureCount).assertEqual(0);
      logInfo('testNdkQosInvariant0010 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_INVARIANT_0011
     * @tc.name      testNdkQosInvariant0011
     * @tc.desc      Checks a failed record only feeds the failure counter and never the duration bounds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosInvariant0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosInvariant0011 begin');
      testNapi.appendRunRecord(recordDir(), 3, 25.5, 401, 3, 0, 0);
      const stats: RecordStatsReport = testNapi.getRecordStats(recordDir());
      const summary: RunSummary = testNapi.getRunSummary();
      logInfo('failure only stats = ' + JSON.stringify(stats));
      expect(stats.total).assertEqual(1);
      expect(stats.failureCount).assertEqual(1);
      expect(stats.successCount).assertEqual(0);
      expect(stats.minDuration).assertEqual(INVALID_DURATION);
      expect(stats.avgDuration).assertEqual(INVALID_DURATION);
      expect(summary.runCount).assertEqual(0);
      logInfo('testNdkQosInvariant0011 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_INVARIANT_0012
     * @tc.name      testNdkQosInvariant0012
     * @tc.desc      Checks clearing the counters leaves the stored records untouched.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosInvariant0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosInvariant0012 begin');
      testNapi.appendRunRecord(recordDir(), 2, 11.5, 0, 2, 0, 0);
      testNapi.resetRunSummary();
      const stats: RecordStatsReport = testNapi.getRecordStats(recordDir());
      expect(stats.total).assertEqual(1);
      expect(stats.successCount).assertEqual(1);
      expect(testNapi.getRunSummary().runCount).assertEqual(0);
      logInfo('testNdkQosInvariant0012 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_INVARIANT_0013
     * @tc.name      testNdkQosInvariant0013
     * @tc.desc      Checks clearing the record file leaves the accumulated counters untouched.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosInvariant0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosInvariant0013 begin');
      testNapi.useQos(0);
      testNapi.appendRunRecord(recordDir(), 0, 9.5, 0, 0, 0, 0);
      const removed: ClearRecordReport = testNapi.clearRunRecords(recordDir());
      const summary: RunSummary = testNapi.getRunSummary();
      expect(removed.code).assertEqual(CODE_OK);
      expect(summary.runCount).assertEqual(1);
      expect(summary.levelCounts[0]).assertEqual(1);
      expect(testNapi.getRecordStats(recordDir()).total).assertEqual(0);
      logInfo('testNdkQosInvariant0013 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_INVARIANT_0014
     * @tc.name      testNdkQosInvariant0014
     * @tc.desc      Checks the last run information and the last level both follow the second compared level.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosInvariant0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosInvariant0014 begin');
      const report: CompareReport = testNapi.compareLevels(MAX_LEVEL, MIN_LEVEL);
      const info: QosRunInfo = testNapi.getLastQosInfo();
      const summary: RunSummary = testNapi.getRunSummary();
      expect(report.fasterLevel === MIN_LEVEL || report.fasterLevel === MAX_LEVEL).assertTrue();
      expect(info.queryLevel).assertEqual(MIN_LEVEL);
      expect(summary.lastLevel).assertEqual(MIN_LEVEL);
      expect(Math.abs(info.duration - report.durationB) <= DURATION_TOLERANCE).assertTrue();
      logInfo('testNdkQosInvariant0014 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_INVARIANT_0015
     * @tc.name      testNdkQosInvariant0015
     * @tc.desc      Checks the stress run reports the requested level as the last level of the summary.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosInvariant0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosInvariant0015 begin');
      const report: ConcurrentReport = await testNapi.runConcurrentAsync(3, 1, 2);
      const summary: RunSummary = testNapi.getRunSummary();
      expect(report.threads).assertEqual(1);
      expect(report.rounds).assertEqual(2);
      expect(summary.runCount).assertEqual(2);
      expect(summary.lastLevel).assertEqual(3);
      logInfo('testNdkQosInvariant0015 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_INVARIANT_0016
     * @tc.name      testNdkQosInvariant0016
     * @tc.desc      Checks two consecutive summary reads without a run report the same counters.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosInvariant0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosInvariant0016 begin');
      testNapi.useQos(3);
      const first: RunSummary = testNapi.getRunSummary();
      const second: RunSummary = testNapi.getRunSummary();
      logInfo('repeated summary = ' + JSON.stringify(second));
      expect(second.runCount).assertEqual(first.runCount);
      expect(second.lastLevel).assertEqual(first.lastLevel);
      expect(second.minDuration).assertEqual(first.minDuration);
      expect(second.maxDuration).assertEqual(first.maxDuration);
      logInfo('testNdkQosInvariant0016 end');
    })
  })
}
