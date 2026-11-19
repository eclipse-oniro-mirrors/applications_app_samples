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
import { CompareReport, QosRunInfo, RunSummary } from 'libentry.so';

const TAG: string = '[Sample_NdkQosCompareTest]';
const DOMAIN: number = 0xF811;
const MIN_LEVEL: number = 0;
const MAX_LEVEL: number = 5;
const CODE_OK: number = 0;
const CODE_INVALID_ARG: number = 401;
const INVALID_RESULT: number = -1;
const INVALID_DURATION: number = -1;
const RATIO_TOLERANCE: number = 1.0e-6;
const RATIO_LOWER_BOUND: number = 0.1;
const RATIO_UPPER_BOUND: number = 10;
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

function shorterLevel(report: CompareReport): number {
  return (report.durationA <= report.durationB) ? report.levelA : report.levelB;
}

export default function ndkQosCompareTest(): void {
  describe('NdkQosCompare', () => {
    afterEach(async () => {
      // The native run blocks the JS thread, yield a macrotask between cases so the freeze guard timer can run.
      await sleepMs(SETTLE_INTERVAL);
    });

    /**
     * @tc.number    SUB_QOS_COMPARE_0001
     * @tc.name      testNdkQosCompare0001
     * @tc.desc      Checks comparing the lowest and the highest level echoes both levels and their durations.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosCompare0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosCompare0001 begin');
      const report: CompareReport = testNapi.compareLevels(MIN_LEVEL, MAX_LEVEL);
      logInfo('compare report = ' + JSON.stringify(report));
      expect(report.code).assertEqual(CODE_OK);
      expect(report.levelA).assertEqual(MIN_LEVEL);
      expect(report.levelB).assertEqual(MAX_LEVEL);
      expect(isPositiveDuration(report.durationA)).assertTrue();
      expect(isPositiveDuration(report.durationB)).assertTrue();
      logInfo('testNdkQosCompare0001 end');
    })

    /**
     * @tc.number    SUB_QOS_COMPARE_0002
     * @tc.name      testNdkQosCompare0002
     * @tc.desc      Checks the ratio equals the first duration divided by the second duration.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosCompare0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosCompare0002 begin');
      const report: CompareReport = testNapi.compareLevels(MIN_LEVEL, MAX_LEVEL);
      const expected: number = report.durationA / report.durationB;
      logInfo('ratio = ' + report.ratio.toString() + ', expected = ' + expected.toString());
      expect(Math.abs(report.ratio - expected) <= RATIO_TOLERANCE).assertTrue();
      expect(report.ratio > 0).assertTrue();
      expect(report.durationA).assertLarger(0);
      logInfo('testNdkQosCompare0002 end');
    })

    /**
     * @tc.number    SUB_QOS_COMPARE_0003
     * @tc.name      testNdkQosCompare0003
     * @tc.desc      Checks the faster level is the one whose duration is shorter.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosCompare0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosCompare0003 begin');
      const report: CompareReport = testNapi.compareLevels(MIN_LEVEL, MAX_LEVEL);
      const fasterDuration: number = Math.min(report.durationA, report.durationB);
      const reportedDuration: number = report.fasterLevel === report.levelA ? report.durationA : report.durationB;
      logInfo('faster level = ' + report.fasterLevel.toString() + ', faster duration = ' + fasterDuration.toString());
      expect(report.fasterLevel === report.levelA || report.fasterLevel === report.levelB).assertTrue();
      expect(report.fasterLevel).assertEqual(shorterLevel(report));
      expect(reportedDuration).assertEqual(fasterDuration);
      expect(fasterDuration).assertLarger(0);
      logInfo('testNdkQosCompare0003 end');
    })

    /**
     * @tc.number    SUB_QOS_COMPARE_0004
     * @tc.name      testNdkQosCompare0004
     * @tc.desc      Checks a level compared with itself reports a consistent ratio and itself as the faster level.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosCompare0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosCompare0004 begin');
      const report: CompareReport = testNapi.compareLevels(3, 3);
      logInfo('self compare = ' + JSON.stringify(report));
      expect(report.code).assertEqual(CODE_OK);
      expect(report.levelA).assertEqual(3);
      expect(report.levelB).assertEqual(3);
      expect(report.fasterLevel).assertEqual(3);
      expect(report.durationA).assertLarger(0);
      expect(report.durationB).assertLarger(0);
      // Both legs run the same level independently, so the ratio is not exactly one but must stay plausible.
      expect(Math.abs(report.ratio - report.durationA / report.durationB) <= RATIO_TOLERANCE).assertTrue();
      expect(report.ratio > RATIO_LOWER_BOUND && report.ratio < RATIO_UPPER_BOUND).assertTrue();
      logInfo('testNdkQosCompare0004 end');
    })

    /**
     * @tc.number    SUB_QOS_COMPARE_0005
     * @tc.name      testNdkQosCompare0005
     * @tc.desc      Checks a first level above the range is rejected and every field falls back to the sentinel.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosCompare0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosCompare0005 begin');
      const report: CompareReport = testNapi.compareLevels(MAX_LEVEL + 1, MIN_LEVEL);
      logInfo('rejected compare = ' + JSON.stringify(report));
      expect(report.code).assertEqual(CODE_INVALID_ARG);
      expect(report.levelA).assertEqual(INVALID_RESULT);
      expect(report.levelB).assertEqual(INVALID_RESULT);
      expect(report.durationA).assertEqual(INVALID_DURATION);
      expect(report.ratio).assertEqual(INVALID_DURATION);
      expect(report.fasterLevel).assertEqual(INVALID_RESULT);
      logInfo('testNdkQosCompare0005 end');
    })

    /**
     * @tc.number    SUB_QOS_COMPARE_0006
     * @tc.name      testNdkQosCompare0006
     * @tc.desc      Checks a negative second level is rejected and the run is not executed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosCompare0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosCompare0006 begin');
      const report: CompareReport = testNapi.compareLevels(MIN_LEVEL, MIN_LEVEL - 1);
      expect(report.code).assertEqual(CODE_INVALID_ARG);
      expect(report.durationB).assertEqual(INVALID_DURATION);
      expect(report.fasterLevel).assertEqual(INVALID_RESULT);
      expect(report.ratio).assertEqual(INVALID_DURATION);
      logInfo('testNdkQosCompare0006 end');
    })

    /**
     * @tc.number    SUB_QOS_COMPARE_0007
     * @tc.name      testNdkQosCompare0007
     * @tc.desc      Checks a fractional level is rejected instead of being truncated into a valid level.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosCompare0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosCompare0007 begin');
      const first: CompareReport = testNapi.compareLevels(2.5, MAX_LEVEL);
      const second: CompareReport = testNapi.compareLevels(MIN_LEVEL, 0.5);
      expect(first.code).assertEqual(CODE_INVALID_ARG);
      expect(second.code).assertEqual(CODE_INVALID_ARG);
      expect(first.fasterLevel).assertEqual(INVALID_RESULT);
      expect(second.durationA).assertEqual(INVALID_DURATION);
      logInfo('testNdkQosCompare0007 end');
    })

    /**
     * @tc.number    SUB_QOS_COMPARE_0008
     * @tc.name      testNdkQosCompare0008
     * @tc.desc      Checks swapping the two levels keeps the durations attached to their own level.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosCompare0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosCompare0008 begin');
      const forward: CompareReport = testNapi.compareLevels(MIN_LEVEL, MAX_LEVEL);
      const backward: CompareReport = testNapi.compareLevels(MAX_LEVEL, MIN_LEVEL);
      logInfo('forward faster = ' + forward.fasterLevel.toString() +
        ', backward faster = ' + backward.fasterLevel.toString());
      expect(backward.levelA).assertEqual(MAX_LEVEL);
      expect(backward.levelB).assertEqual(MIN_LEVEL);
      expect(backward.fasterLevel).assertEqual(shorterLevel(backward));
      expect(forward.durationA > 0 && backward.durationB > 0).assertTrue();
      logInfo('testNdkQosCompare0008 end');
    })

    /**
     * @tc.number    SUB_QOS_COMPARE_0009
     * @tc.name      testNdkQosCompare0009
     * @tc.desc      Checks one comparison adds exactly two experiments to the accumulated statistics.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosCompare0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosCompare0009 begin');
      testNapi.resetRunSummary();
      const report: CompareReport = testNapi.compareLevels(1, 4);
      const summary: RunSummary = testNapi.getRunSummary();
      logInfo('summary after compare = ' + JSON.stringify(summary));
      expect(report.code).assertEqual(CODE_OK);
      expect(summary.runCount).assertEqual(2);
      expect(summary.lastLevel).assertEqual(4);
      logInfo('testNdkQosCompare0009 end');
    })

    /**
     * @tc.number    SUB_QOS_COMPARE_0010
     * @tc.name      testNdkQosCompare0010
     * @tc.desc      Checks a comparison between one level and itself counts both experiments on that level.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosCompare0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosCompare0010 begin');
      testNapi.resetRunSummary();
      testNapi.compareLevels(2, 2);
      const summary: RunSummary = testNapi.getRunSummary();
      let total: number = 0;
      for (let index = 0; index < summary.levelCounts.length; index++) {
        total += summary.levelCounts[index];
      }
      expect(summary.levelCounts[2]).assertEqual(2);
      expect(total).assertEqual(2);
      expect(summary.runCount).assertEqual(2);
      logInfo('testNdkQosCompare0010 end');
    })

    /**
     * @tc.number    SUB_QOS_COMPARE_0011
     * @tc.name      testNdkQosCompare0011
     * @tc.desc      Checks the last run information follows the second level of the comparison.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosCompare0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosCompare0011 begin');
      const report: CompareReport = testNapi.compareLevels(MIN_LEVEL, MAX_LEVEL);
      const info: QosRunInfo = testNapi.getLastQosInfo();
      logInfo('last run info = ' + JSON.stringify(info));
      expect(info.queryLevel).assertEqual(MAX_LEVEL);
      expect(info.setResult).assertEqual(0);
      expect(Math.abs(info.duration - report.durationB) <= RATIO_TOLERANCE * report.durationB).assertTrue();
      logInfo('testNdkQosCompare0011 end');
    })

    /**
     * @tc.number    SUB_QOS_COMPARE_0012
     * @tc.name      testNdkQosCompare0012
     * @tc.desc      Checks the accumulated bounds cover both durations of the comparison.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosCompare0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosCompare0012 begin');
      testNapi.resetRunSummary();
      const report: CompareReport = testNapi.compareLevels(3, 0);
      const summary: RunSummary = testNapi.getRunSummary();
      logInfo('bounds = ' + summary.minDuration.toString() + ' ~ ' + summary.maxDuration.toString());
      expect(summary.minDuration <= report.durationA).assertTrue();
      expect(report.durationA <= summary.maxDuration).assertTrue();
      expect(summary.minDuration <= report.durationB).assertTrue();
      expect(report.durationB <= summary.maxDuration).assertTrue();
      expect(summary.minDuration <= summary.avgDuration).assertTrue();
      expect(summary.avgDuration <= summary.maxDuration).assertTrue();
      logInfo('testNdkQosCompare0012 end');
    })
  })
}
