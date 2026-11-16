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
  AppendRecordReport,
  ClearRecordReport,
  RecordQueryReport,
  RecordStatsReport,
  RunRecord
} from 'libentry.so';

const TAG: string = '[Sample_NdkQosRecordTest]';
const DOMAIN: number = 0xF811;
const CODE_OK: number = 0;
const CODE_INVALID_ARG: number = 401;
const CODE_IO_ERROR: number = 402;
const CAPACITY: number = 200;
const INVALID_RESULT: number = -1;
const INVALID_DURATION: number = -1;
const DURATION_TOLERANCE: number = 0.001;
const SAMPLE_COUNT: number = 3;

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

function recordDir(): string {
  return delegator.getAppContext().filesDir;
}

function missingDir(): string {
  return delegator.getAppContext().filesDir + '/qos_missing_dir';
}

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

function appendSample(dir: string, level: number, duration: number): AppendRecordReport {
  return testNapi.appendRunRecord(dir, level, duration, 0, level, 0, 0);
}

function appendSamples(dir: string, count: number): void {
  for (let index = 0; index < count; index++) {
    testNapi.appendRunRecord(dir, index % 6, index, 0, index % 6, 0, 0);
  }
}

function isNear(left: number, right: number): boolean {
  return Math.abs(left - right) <= DURATION_TOLERANCE;
}

function sumOf(values: number[]): number {
  let total: number = 0;
  for (let index = 0; index < values.length; index++) {
    total += values[index];
  }
  return total;
}

export default function ndkQosRecordTest(): void {
  describe('NdkQosRecord', () => {
    afterEach(async () => {
      // The native run blocks the JS thread, yield a macrotask between cases so the freeze guard timer can run.
      await sleepMs(SETTLE_INTERVAL);
    });

    beforeEach(() => {
      testNapi.clearRunRecords(recordDir());
    });

    /**
     * @tc.number    SUB_NDK_QOS_FILE_0001
     * @tc.name      testNdkQosFile0001
     * @tc.desc      Checks clearing an already empty record file reports zero removed records.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosFile0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosFile0001 begin');
      const report: ClearRecordReport = testNapi.clearRunRecords(recordDir());
      expect(report.code).assertEqual(CODE_OK);
      expect(report.removed).assertEqual(0);
      expect(testNapi.readRunRecords(recordDir(), 10).total).assertEqual(0);
      logInfo('testNdkQosFile0001 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILE_0002
     * @tc.name      testNdkQosFile0002
     * @tc.desc      Checks the first appended record reports one stored record and the full capacity.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosFile0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosFile0002 begin');
      const report: AppendRecordReport = appendSample(recordDir(), 5, 640.5);
      logInfo('append report = ' + JSON.stringify(report));
      expect(report.code).assertEqual(CODE_OK);
      expect(report.count).assertEqual(1);
      expect(report.capacity).assertEqual(CAPACITY);
      expect(report.dropped).assertEqual(0);
      logInfo('testNdkQosFile0002 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILE_0003
     * @tc.name      testNdkQosFile0003
     * @tc.desc      Checks a stored record is read back with the same level, duration and result codes.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosFile0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosFile0003 begin');
      appendSample(recordDir(), 4, 321.25);
      const report: RecordQueryReport = testNapi.readRunRecords(recordDir(), 10);
      logInfo('read report = ' + JSON.stringify(report));
      expect(report.code).assertEqual(CODE_OK);
      expect(report.total).assertEqual(1);
      expect(report.returned).assertEqual(1);
      const record: RunRecord = report.records[0];
      expect(record.index).assertEqual(0);
      expect(record.level).assertEqual(4);
      expect(isNear(record.duration, 321.25)).assertTrue();
      expect(record.queryLevel).assertEqual(4);
      logInfo('testNdkQosFile0003 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILE_0004
     * @tc.name      testNdkQosFile0004
     * @tc.desc      Checks a limited read returns the most recent records rather than the oldest ones.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosFile0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosFile0004 begin');
      appendSample(recordDir(), 0, 10);
      appendSample(recordDir(), 1, 20);
      appendSample(recordDir(), 2, 30);
      const report: RecordQueryReport = testNapi.readRunRecords(recordDir(), 2);
      logInfo('limited read = ' + JSON.stringify(report));
      expect(report.total).assertEqual(SAMPLE_COUNT);
      expect(report.returned).assertEqual(2);
      expect(isNear(report.records[0].duration, 20)).assertTrue();
      expect(isNear(report.records[1].duration, 30)).assertTrue();
      expect(report.records[1].index).assertEqual(2);
      logInfo('testNdkQosFile0004 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILE_0005
     * @tc.name      testNdkQosFile0005
     * @tc.desc      Checks a read limit equal to the record count returns every record in insertion order.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosFile0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosFile0005 begin');
      appendSamples(recordDir(), SAMPLE_COUNT);
      const report: RecordQueryReport = testNapi.readRunRecords(recordDir(), SAMPLE_COUNT);
      expect(report.total).assertEqual(SAMPLE_COUNT);
      expect(report.returned).assertEqual(SAMPLE_COUNT);
      expect(report.records[0].level).assertEqual(0);
      expect(report.records[1].level).assertEqual(1);
      expect(report.records[2].level).assertEqual(2);
      expect(report.records[0].index).assertEqual(0);
      logInfo('testNdkQosFile0005 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILE_0006
     * @tc.name      testNdkQosFile0006
     * @tc.desc      Checks a zero read limit is rejected and returns no records.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosFile0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosFile0006 begin');
      appendSample(recordDir(), 3, 100);
      const report: RecordQueryReport = testNapi.readRunRecords(recordDir(), 0);
      expect(report.code).assertEqual(CODE_INVALID_ARG);
      expect(report.total).assertEqual(0);
      expect(report.returned).assertEqual(0);
      expect(report.records.length).assertEqual(0);
      logInfo('testNdkQosFile0006 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILE_0007
     * @tc.name      testNdkQosFile0007
     * @tc.desc      Checks a read limit above the storage capacity is rejected.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosFile0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosFile0007 begin');
      const report: RecordQueryReport = testNapi.readRunRecords(recordDir(), CAPACITY + 1);
      expect(report.code).assertEqual(CODE_INVALID_ARG);
      expect(report.returned).assertEqual(0);
      expect(report.records.length).assertEqual(0);
      logInfo('testNdkQosFile0007 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILE_0008
     * @tc.name      testNdkQosFile0008
     * @tc.desc      Checks a fractional read limit is rejected because the limit is a record count.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosFile0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosFile0008 begin');
      const report: RecordQueryReport = testNapi.readRunRecords(recordDir(), 2.5);
      logInfo('fractional limit report = ' + JSON.stringify(report));
      expect(report.code).assertEqual(CODE_INVALID_ARG);
      expect(report.returned).assertEqual(0);
      expect(report.total).assertEqual(0);
      logInfo('testNdkQosFile0008 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILE_0009
     * @tc.name      testNdkQosFile0009
     * @tc.desc      Checks a record with an out of range level is rejected and nothing is stored.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosFile0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosFile0009 begin');
      const above: AppendRecordReport = appendSample(recordDir(), 6, 100);
      const below: AppendRecordReport = appendSample(recordDir(), -1, 100);
      expect(above.code).assertEqual(CODE_INVALID_ARG);
      expect(below.code).assertEqual(CODE_INVALID_ARG);
      expect(above.count).assertEqual(0);
      expect(below.count).assertEqual(0);
      expect(testNapi.readRunRecords(recordDir(), 10).total).assertEqual(0);
      logInfo('testNdkQosFile0009 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILE_0010
     * @tc.name      testNdkQosFile0010
     * @tc.desc      Checks a record with a negative duration is rejected so statistics stay meaningful.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosFile0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosFile0010 begin');
      const report: AppendRecordReport = appendSample(recordDir(), 3, -0.5);
      expect(report.code).assertEqual(CODE_INVALID_ARG);
      expect(report.count).assertEqual(0);
      expect(testNapi.readRunRecords(recordDir(), 10).total).assertEqual(0);
      logInfo('testNdkQosFile0010 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILE_0011
     * @tc.name      testNdkQosFile0011
     * @tc.desc      Checks an empty directory path is rejected before any file is opened.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosFile0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosFile0011 begin');
      const report: AppendRecordReport = appendSample('', 2, 50);
      expect(report.code).assertEqual(CODE_INVALID_ARG);
      expect(report.count).assertEqual(0);
      expect(testNapi.readRunRecords('', 10).code).assertEqual(CODE_INVALID_ARG);
      logInfo('testNdkQosFile0011 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILE_0012
     * @tc.name      testNdkQosFile0012
     * @tc.desc      Checks appending into a directory that does not exist reports a write failure.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosFile0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosFile0012 begin');
      const report: AppendRecordReport = appendSample(missingDir(), 2, 50);
      logInfo('missing dir report = ' + JSON.stringify(report));
      expect(report.code).assertEqual(CODE_IO_ERROR);
      expect(report.count).assertEqual(0);
      expect(report.capacity).assertEqual(CAPACITY);
      logInfo('testNdkQosFile0012 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILE_0013
     * @tc.name      testNdkQosFile0013
     * @tc.desc      Checks reading from a directory without a record file returns an empty list.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosFile0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosFile0013 begin');
      const report: RecordQueryReport = testNapi.readRunRecords(missingDir(), 10);
      expect(report.code).assertEqual(CODE_OK);
      expect(report.total).assertEqual(0);
      expect(report.returned).assertEqual(0);
      logInfo('testNdkQosFile0013 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILE_0014
     * @tc.name      testNdkQosFile0014
     * @tc.desc      Checks statistics of a directory without a record file report zero totals.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosFile0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosFile0014 begin');
      const report: RecordStatsReport = testNapi.getRecordStats(missingDir());
      logInfo('missing dir stats = ' + JSON.stringify(report));
      expect(report.code).assertEqual(CODE_OK);
      expect(report.total).assertEqual(0);
      expect(report.successCount).assertEqual(0);
      expect(report.failureCount).assertEqual(0);
      expect(report.avgDuration).assertEqual(INVALID_DURATION);
      logInfo('testNdkQosFile0014 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILE_0015
     * @tc.name      testNdkQosFile0015
     * @tc.desc      Checks statistics of an empty record file report sentinel durations and zero level counts.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosFile0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosFile0015 begin');
      const report: RecordStatsReport = testNapi.getRecordStats(recordDir());
      expect(report.code).assertEqual(CODE_OK);
      expect(report.total).assertEqual(0);
      expect(report.minDuration).assertEqual(INVALID_DURATION);
      expect(report.maxDuration).assertEqual(INVALID_DURATION);
      expect(report.levelCounts.length).assertEqual(6);
      expect(sumOf(report.levelCounts)).assertEqual(0);
      logInfo('testNdkQosFile0015 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILE_0016
     * @tc.name      testNdkQosFile0016
     * @tc.desc      Checks the average, minimum and maximum durations of successful records.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosFile0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosFile0016 begin');
      appendSample(recordDir(), 0, 100);
      appendSample(recordDir(), 3, 300);
      appendSample(recordDir(), 5, 500);
      const report: RecordStatsReport = testNapi.getRecordStats(recordDir());
      logInfo('stats = ' + JSON.stringify(report));
      expect(report.total).assertEqual(SAMPLE_COUNT);
      expect(report.successCount).assertEqual(SAMPLE_COUNT);
      expect(isNear(report.avgDuration, 300)).assertTrue();
      expect(isNear(report.minDuration, 100)).assertTrue();
      expect(isNear(report.maxDuration, 500)).assertTrue();
      logInfo('testNdkQosFile0016 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILE_0017
     * @tc.name      testNdkQosFile0017
     * @tc.desc      Checks failed runs are counted separately and excluded from the duration statistics.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosFile0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosFile0017 begin');
      appendSample(recordDir(), 2, 200);
      testNapi.appendRunRecord(recordDir(), 2, 900, 401, 2, 0, 0);
      const report: RecordStatsReport = testNapi.getRecordStats(recordDir());
      logInfo('mixed stats = ' + JSON.stringify(report));
      expect(report.total).assertEqual(2);
      expect(report.successCount).assertEqual(1);
      expect(report.failureCount).assertEqual(1);
      expect(isNear(report.avgDuration, 200)).assertTrue();
      expect(isNear(report.maxDuration, 200)).assertTrue();
      logInfo('testNdkQosFile0017 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILE_0018
     * @tc.name      testNdkQosFile0018
     * @tc.desc      Checks the per level record counts follow the levels actually stored.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosFile0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosFile0018 begin');
      appendSample(recordDir(), 0, 10);
      appendSample(recordDir(), 0, 20);
      appendSample(recordDir(), 5, 30);
      const report: RecordStatsReport = testNapi.getRecordStats(recordDir());
      logInfo('level counts = ' + report.levelCounts.join(','));
      expect(report.levelCounts.length).assertEqual(6);
      expect(report.levelCounts[0]).assertEqual(2);
      expect(report.levelCounts[5]).assertEqual(1);
      expect(report.levelCounts[3]).assertEqual(0);
      expect(sumOf(report.levelCounts)).assertEqual(SAMPLE_COUNT);
      logInfo('testNdkQosFile0018 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILE_0019
     * @tc.name      testNdkQosFile0019
     * @tc.desc      Checks clearing removes every record and reports how many were deleted.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosFile0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosFile0019 begin');
      appendSamples(recordDir(), SAMPLE_COUNT);
      const report: ClearRecordReport = testNapi.clearRunRecords(recordDir());
      logInfo('clear report = ' + JSON.stringify(report));
      expect(report.code).assertEqual(CODE_OK);
      expect(report.removed).assertEqual(SAMPLE_COUNT);
      expect(testNapi.readRunRecords(recordDir(), 10).total).assertEqual(0);
      logInfo('testNdkQosFile0019 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILE_0020
     * @tc.name      testNdkQosFile0020
     * @tc.desc      Checks a second clear reports zero removed records.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosFile0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosFile0020 begin');
      appendSample(recordDir(), 1, 10);
      const first: ClearRecordReport = testNapi.clearRunRecords(recordDir());
      const second: ClearRecordReport = testNapi.clearRunRecords(recordDir());
      expect(first.removed).assertEqual(1);
      expect(second.code).assertEqual(CODE_OK);
      expect(second.removed).assertEqual(0);
      logInfo('testNdkQosFile0020 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILE_0021
     * @tc.name      testNdkQosFile0021
     * @tc.desc      Checks each append increases the stored count by one and keeps the previous records.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosFile0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosFile0021 begin');
      const first: AppendRecordReport = appendSample(recordDir(), 0, 11);
      const second: AppendRecordReport = appendSample(recordDir(), 1, 22);
      const third: AppendRecordReport = appendSample(recordDir(), 2, 33);
      expect(first.count).assertEqual(1);
      expect(second.count).assertEqual(2);
      expect(third.count).assertEqual(3);
      const read: RecordQueryReport = testNapi.readRunRecords(recordDir(), 10);
      expect(read.total).assertEqual(3);
      expect(isNear(read.records[0].duration, 11)).assertTrue();
      expect(isNear(read.records[2].duration, 33)).assertTrue();
      logInfo('testNdkQosFile0021 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILE_0022
     * @tc.name      testNdkQosFile0022
     * @tc.desc      Checks a directory path with a trailing slash resolves to the same record file.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosFile0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosFile0022 begin');
      appendSample(recordDir(), 3, 77);
      const report: RecordQueryReport = testNapi.readRunRecords(recordDir() + '/', 10);
      logInfo('trailing slash read = ' + JSON.stringify(report));
      expect(report.code).assertEqual(CODE_OK);
      expect(report.total).assertEqual(1);
      expect(isNear(report.records[0].duration, 77)).assertTrue();
      logInfo('testNdkQosFile0022 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILE_0023
     * @tc.name      testNdkQosFile0023
     * @tc.desc      Checks the record file stops growing at its capacity and drops the oldest record.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosFile0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosFile0023 begin');
      appendSamples(recordDir(), CAPACITY);
      const overflow: AppendRecordReport = appendSample(recordDir(), 0, CAPACITY);
      logInfo('overflow report = ' + JSON.stringify(overflow));
      expect(overflow.code).assertEqual(CODE_OK);
      expect(overflow.count).assertEqual(CAPACITY);
      expect(overflow.dropped).assertEqual(1);
      logInfo('testNdkQosFile0023 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILE_0024
     * @tc.name      testNdkQosFile0024
     * @tc.desc      Checks the oldest record is the one removed when the capacity is exceeded.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosFile0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosFile0024 begin');
      appendSamples(recordDir(), CAPACITY + 1);
      const report: RecordQueryReport = testNapi.readRunRecords(recordDir(), CAPACITY);
      logInfo('first kept duration = ' + report.records[0].duration.toString() +
        ', last kept duration = ' + report.records[report.returned - 1].duration.toString());
      expect(report.total).assertEqual(CAPACITY);
      expect(report.returned).assertEqual(CAPACITY);
      expect(isNear(report.records[0].duration, 1)).assertTrue();
      expect(isNear(report.records[report.returned - 1].duration, CAPACITY)).assertTrue();
      logInfo('testNdkQosFile0024 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILE_0025
     * @tc.name      testNdkQosFile0025
     * @tc.desc      Checks statistics fall back to the sentinel values after the records are cleared.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosFile0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosFile0025 begin');
      appendSamples(recordDir(), SAMPLE_COUNT);
      expect(testNapi.getRecordStats(recordDir()).total).assertEqual(SAMPLE_COUNT);
      testNapi.clearRunRecords(recordDir());
      const report: RecordStatsReport = testNapi.getRecordStats(recordDir());
      expect(report.total).assertEqual(0);
      expect(report.avgDuration).assertEqual(INVALID_DURATION);
      expect(report.successCount).assertEqual(0);
      logInfo('testNdkQosFile0025 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILE_0026
     * @tc.name      testNdkQosFile0026
     * @tc.desc      Checks a failed run keeps its own result code after being read back from the file.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosFile0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosFile0026 begin');
      testNapi.appendRunRecord(recordDir(), 1, 5.5, 401, INVALID_RESULT, 401, 0);
      const report: RecordQueryReport = testNapi.readRunRecords(recordDir(), 10);
      const record: RunRecord = report.records[0];
      logInfo('failed record = ' + JSON.stringify(record));
      expect(report.total).assertEqual(1);
      expect(record.setResult).assertEqual(CODE_INVALID_ARG);
      expect(record.queryLevel).assertEqual(INVALID_RESULT);
      expect(record.resetResult).assertEqual(CODE_INVALID_ARG);
      expect(isNear(record.duration, 5.5)).assertTrue();
      logInfo('testNdkQosFile0026 end');
    })
  })
}
