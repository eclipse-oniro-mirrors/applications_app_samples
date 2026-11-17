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

import { afterEach, beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import testNapi from 'libentry.so';
import { BenchmarkReport, LevelSample, QosRunInfo, RunSummary } from 'libentry.so';

const TAG: string = '[Sample_NdkQosBenchTest]';
const DOMAIN: number = 0xF811;
const LEVEL_COUNT: number = 6;
const MAX_ROUNDS: number = 3;
const INVALID_RESULT: number = -1;
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

function sampleAt(report: BenchmarkReport, level: number): LevelSample {
  for (let index = 0; index < report.samples.length; index++) {
    if (report.samples[index].level === level) {
      return report.samples[index];
    }
  }
  return report.samples[0];
}

function hasSampleLevel(report: BenchmarkReport, level: number): boolean {
  for (let index = 0; index < report.samples.length; index++) {
    if (report.samples[index].level === level) {
      return true;
    }
  }
  return false;
}

export default function ndkQosBenchTest(): void {
  describe('NdkQosBench', () => {
    afterEach(async () => {
      // The native run blocks the JS thread, yield a macrotask between cases so the freeze guard timer can run.
      await sleepMs(SETTLE_INTERVAL);
    });

    beforeAll(() => {
      testNapi.resetRunSummary();
    });

    /**
     * @tc.number    SUB_QOS_BENCH_0001
     * @tc.name      testNdkQosBench0001
     * @tc.desc      Checks one round reports six samples in ascending level order and echoes the round count.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosBench0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosBench0001 begin');
      const report: BenchmarkReport = await testNapi.runLevelBenchmarkAsync(1);
      logInfo('benchmark rounds = ' + report.rounds.toString() + ', totalRuns = ' + report.totalRuns.toString());
      expect(report.code).assertEqual(0);
      expect(report.rounds).assertEqual(1);
      expect(report.samples.length).assertEqual(LEVEL_COUNT);
      expect(report.totalRuns).assertEqual(LEVEL_COUNT);
      for (let index = 0; index < LEVEL_COUNT; index++) {
        expect(report.samples[index].level).assertEqual(index);
      }
      logInfo('testNdkQosBench0001 end');
    })

    /**
     * @tc.number    SUB_QOS_BENCH_0002
     * @tc.name      testNdkQosBench0002
     * @tc.desc      Checks every sample accounts for exactly the requested number of attempts.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosBench0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosBench0002 begin');
      const report: BenchmarkReport = await testNapi.runLevelBenchmarkAsync(1);
      let attempts: number = 0;
      for (let index = 0; index < report.samples.length; index++) {
        const sample: LevelSample = report.samples[index];
        attempts += sample.successCount + sample.failCount;
        expect(sample.successCount + sample.failCount).assertEqual(1);
      }
      logInfo('total attempts = ' + attempts.toString());
      expect(attempts).assertEqual(LEVEL_COUNT);
      expect(report.totalRuns).assertEqual(attempts);
      logInfo('testNdkQosBench0002 end');
    })

    /**
     * @tc.number    SUB_QOS_BENCH_0003
     * @tc.name      testNdkQosBench0003
     * @tc.desc      Checks successful samples carry a positive average and failed samples keep the sentinel.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosBench0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosBench0003 begin');
      const report: BenchmarkReport = await testNapi.runLevelBenchmarkAsync(1);
      let consistent: boolean = true;
      for (let index = 0; index < report.samples.length; index++) {
        const sample: LevelSample = report.samples[index];
        if (sample.successCount > 0) {
          if (!isPositiveDuration(sample.avgDuration)) {
            consistent = false;
          }
        } else if (sample.avgDuration !== INVALID_DURATION) {
          consistent = false;
        }
      }
      logInfo('samples = ' + JSON.stringify(report.samples));
      expect(consistent).assertTrue();
      expect(report.samples.length).assertEqual(LEVEL_COUNT);
      expect(report.code).assertEqual(0);
      logInfo('testNdkQosBench0003 end');
    })

    /**
     * @tc.number    SUB_QOS_BENCH_0004
     * @tc.name      testNdkQosBench0004
     * @tc.desc      Checks the fastest and slowest levels come from the sampled set and are ordered correctly.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosBench0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosBench0004 begin');
      const report: BenchmarkReport = await testNapi.runLevelBenchmarkAsync(1);
      logInfo('fastest = ' + report.fastestLevel.toString() + ', slowest = ' + report.slowestLevel.toString());
      expect(report.fastestLevel !== INVALID_RESULT).assertTrue();
      expect(hasSampleLevel(report, report.fastestLevel)).assertTrue();
      expect(hasSampleLevel(report, report.slowestLevel)).assertTrue();
      expect(sampleAt(report, report.fastestLevel).avgDuration <=
        sampleAt(report, report.slowestLevel).avgDuration).assertTrue();
      logInfo('testNdkQosBench0004 end');
    })

    /**
     * @tc.number    SUB_QOS_BENCH_0005
     * @tc.name      testNdkQosBench0005
     * @tc.desc      Checks each sample keeps its minimum, average and maximum duration ordered.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosBench0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosBench0005 begin');
      const report: BenchmarkReport = await testNapi.runLevelBenchmarkAsync(1);
      let ordered: boolean = true;
      for (let index = 0; index < report.samples.length; index++) {
        const sample: LevelSample = report.samples[index];
        if (sample.successCount > 0) {
          if (!(sample.minDuration <= sample.avgDuration && sample.avgDuration <= sample.maxDuration)) {
            ordered = false;
          }
        }
      }
      expect(ordered).assertTrue();
      expect(report.totalRuns).assertEqual(LEVEL_COUNT);
      expect(report.rounds).assertEqual(1);
      logInfo('testNdkQosBench0005 end');
    })

    /**
     * @tc.number    SUB_QOS_BENCH_0006
     * @tc.name      testNdkQosBench0006
     * @tc.desc      Checks every sample records the platform return codes of its last attempt.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosBench0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosBench0006 begin');
      const report: BenchmarkReport = await testNapi.runLevelBenchmarkAsync(1);
      let accepted: number = 0;
      for (let index = 0; index < report.samples.length; index++) {
        const sample: LevelSample = report.samples[index];
        if (sample.setResult === 0 && sample.queryLevel === sample.level && sample.resetResult === 0) {
          accepted++;
        }
      }
      logInfo('samples with accepted level = ' + accepted.toString());
      expect(accepted).assertEqual(LEVEL_COUNT);
      expect(report.totalRuns).assertEqual(LEVEL_COUNT);
      expect(report.code).assertEqual(0);
      logInfo('testNdkQosBench0006 end');
    })

    /**
     * @tc.number    SUB_QOS_BENCH_0007
     * @tc.name      testNdkQosBench0007
     * @tc.desc      Checks two rounds double the number of attempts for every sample.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosBench0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosBench0007 begin');
      const report: BenchmarkReport = await testNapi.runLevelBenchmarkAsync(2);
      let doubled: boolean = true;
      for (let index = 0; index < report.samples.length; index++) {
        const sample: LevelSample = report.samples[index];
        if (sample.successCount + sample.failCount !== 2) {
          doubled = false;
        }
      }
      logInfo('two round report = ' + JSON.stringify(report.samples));
      expect(doubled).assertTrue();
      expect(report.rounds).assertEqual(2);
      expect(report.totalRuns).assertEqual(LEVEL_COUNT * 2);
      logInfo('testNdkQosBench0007 end');
    })

    /**
     * @tc.number    SUB_QOS_BENCH_0008
     * @tc.name      testNdkQosBench0008
     * @tc.desc      Checks the maximum supported round count is accepted and covers three attempts per level.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosBench0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosBench0008 begin');
      const report: BenchmarkReport = await testNapi.runLevelBenchmarkAsync(MAX_ROUNDS);
      const sample: LevelSample = sampleAt(report, 5);
      logInfo('level 5 attempts = ' + (sample.successCount + sample.failCount).toString());
      expect(report.rounds).assertEqual(MAX_ROUNDS);
      expect(report.totalRuns).assertEqual(LEVEL_COUNT * MAX_ROUNDS);
      expect(sample.successCount + sample.failCount).assertEqual(MAX_ROUNDS);
      logInfo('testNdkQosBench0008 end');
    })

    /**
     * @tc.number    SUB_QOS_BENCH_0009
     * @tc.name      testNdkQosBench0009
     * @tc.desc      Checks a zero round count is rejected before any calculation starts.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosBench0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosBench0009 begin');
      let rejected: boolean = false;
      try {
        await testNapi.runLevelBenchmarkAsync(0);
      } catch (error) {
        rejected = true;
        logInfo('zero rounds rejected');
      }
      expect(rejected).assertTrue();
      const report: BenchmarkReport = await testNapi.runLevelBenchmarkAsync(1);
      expect(report.code).assertEqual(0);
      expect(report.samples.length).assertEqual(LEVEL_COUNT);
      logInfo('testNdkQosBench0009 end');
    })

    /**
     * @tc.number    SUB_QOS_BENCH_0010
     * @tc.name      testNdkQosBench0010
     * @tc.desc      Checks a round count above the supported maximum is rejected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosBench0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosBench0010 begin');
      let rejected: boolean = false;
      try {
        await testNapi.runLevelBenchmarkAsync(MAX_ROUNDS + 1);
      } catch (error) {
        rejected = true;
        logInfo('rounds above the maximum rejected');
      }
      expect(rejected).assertTrue();
      let negativeRejected: boolean = false;
      try {
        await testNapi.runLevelBenchmarkAsync(-1);
      } catch (error) {
        negativeRejected = true;
      }
      expect(negativeRejected).assertTrue();
      const report: BenchmarkReport = await testNapi.runLevelBenchmarkAsync(MAX_ROUNDS);
      expect(report.rounds).assertEqual(MAX_ROUNDS);
      logInfo('testNdkQosBench0010 end');
    })

    /**
     * @tc.number    SUB_QOS_BENCH_0011
     * @tc.name      testNdkQosBench0011
     * @tc.desc      Checks a fractional round count is rejected because rounds are counted in whole attempts.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosBench0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosBench0011 begin');
      let rejected: boolean = false;
      try {
        await testNapi.runLevelBenchmarkAsync(1.5);
      } catch (error) {
        rejected = true;
        logInfo('fractional rounds rejected');
      }
      expect(rejected).assertTrue();
      const report: BenchmarkReport = await testNapi.runLevelBenchmarkAsync(1);
      expect(report.samples.length).assertEqual(LEVEL_COUNT);
      expect(report.rounds).assertEqual(1);
      logInfo('testNdkQosBench0011 end');
    })

    /**
     * @tc.number    SUB_QOS_BENCH_0012
     * @tc.name      testNdkQosBench0012
     * @tc.desc      Checks each benchmark adds its attempts to the process level run summary.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosBench0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosBench0012 begin');
      testNapi.resetRunSummary();
      const before: RunSummary = testNapi.getRunSummary();
      await testNapi.runLevelBenchmarkAsync(1);
      const after: RunSummary = testNapi.getRunSummary();
      logInfo('summary runs before = ' + before.runCount.toString() + ', after = ' + after.runCount.toString());
      expect(before.runCount).assertEqual(0);
      expect(after.runCount).assertEqual(LEVEL_COUNT);
      expect(after.lastLevel).assertEqual(5);
      logInfo('testNdkQosBench0012 end');
    })

    /**
     * @tc.number    SUB_QOS_BENCH_0013
     * @tc.name      testNdkQosBench0013
     * @tc.desc      Checks the run summary counts every level exactly once after a single round benchmark.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosBench0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosBench0013 begin');
      testNapi.resetRunSummary();
      await testNapi.runLevelBenchmarkAsync(1);
      const summary: RunSummary = testNapi.getRunSummary();
      logInfo('level counts = ' + summary.levelCounts.join(','));
      let total: number = 0;
      for (let index = 0; index < summary.levelCounts.length; index++) {
        total += summary.levelCounts[index];
        expect(summary.levelCounts[index]).assertEqual(1);
      }
      expect(total).assertEqual(LEVEL_COUNT);
      expect(summary.runCount).assertEqual(LEVEL_COUNT);
      logInfo('testNdkQosBench0013 end');
    })

    /**
     * @tc.number    SUB_QOS_BENCH_0014
     * @tc.name      testNdkQosBench0014
     * @tc.desc      Checks the last run information after a benchmark belongs to the last level in the sweep.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosBench0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosBench0014 begin');
      await testNapi.runLevelBenchmarkAsync(1);
      const info: QosRunInfo = testNapi.getLastQosInfo();
      logInfo('last run info = ' + JSON.stringify(info));
      expect(info.setResult).assertEqual(0);
      expect(info.queryLevel).assertEqual(5);
      expect(info.resetResult).assertEqual(0);
      expect(info.duration > 0).assertTrue();
      logInfo('testNdkQosBench0014 end');
    })
  })
}
