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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
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

const TAG: string = '[Sample_NdkQosRecordExtTest]';
const DOMAIN: number = 0xF811;
const CODE_OK: number = 0;
const CODE_IO_ERROR: number = 402;
const CAPACITY: number = 200;
const INVALID_DURATION: number = -1;
const INVALID_RESULT: number = -1;
const DURATION_TOLERANCE: number = 0.001;
const LONG_PATH_SEGMENTS: number = 2400;
const OVERFLOW_COUNT: number = 5;

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

function recordDir(): string {
  return delegator.getAppContext().filesDir;
}

function missingDir(): string {
  return delegator.getAppContext().filesDir + '/qos_ext_missing_dir';
}

// The record file itself, used as a path component so the append has to fail with a directory error.
function recordFilePath(): string {
  return recordDir() + '/qos_history.csv';
}

function oversizedDir(): string {
  let path: string = recordDir();
  for (let index = 0; index < LONG_PATH_SEGMENTS; index++) {
    path += '/q';
  }
  return path;
}

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function appendSample(dir: string, level: number, duration: number): AppendRecordReport {
  return testNapi.appendRunRecord(dir, level, duration, 0, level, 0, 0);
}

function appendByIndex(dir: string, count: number): void {
  for (let index = 0; index < count; index++) {
    testNapi.appendRunRecord(dir, index % 6, index, 0, index % 6, 0, 0);
  }
}

function isNear(left: number, right: number): boolean {
  return Math.abs(left - right) <= DURATION_TOLERANCE;
}

export default function ndkQosRecordExtTest(): void {
  describe('NdkQosRecordFileExt', () => {
    beforeEach(() => {
      testNapi.clearRunRecords(recordDir());
    });

    /**
     * @tc.number    SUB_NDK_QOS_FILEEXT_0001
     * @tc.name      testNdkQosRecordExt0001
     * @tc.desc      Checks a directory argument that points at the record file fails with the write error.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosRecordExt0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosRecordExt0001 begin');
      appendSample(recordDir(), 2, 40);
      const report: AppendRecordReport = appendSample(recordFilePath(), 2, 41);
      logInfo('file as directory append = ' + JSON.stringify(report));
      expect(report.code).assertEqual(CODE_IO_ERROR);
      expect(report.count).assertEqual(0);
      expect(report.capacity).assertEqual(CAPACITY);
      expect(report.dropped).assertEqual(0);
      expect(testNapi.readRunRecords(recordDir(), 10).total).assertEqual(1);
      logInfo('testNdkQosRecordExt0001 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILEEXT_0002
     * @tc.name      testNdkQosRecordExt0002
     * @tc.desc      Checks a read through a directory argument that points at the record file finds no records.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosRecordExt0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosRecordExt0002 begin');
      appendSample(recordDir(), 5, 88.5);
      const report: RecordQueryReport = testNapi.readRunRecords(recordFilePath(), 10);
      logInfo('file as directory read = ' + JSON.stringify(report));
      expect(report.code).assertEqual(CODE_OK);
      expect(report.total).assertEqual(0);
      expect(report.returned).assertEqual(0);
      expect(report.records.length).assertEqual(0);
      expect(testNapi.readRunRecords(recordDir(), 10).total).assertEqual(1);
      logInfo('testNdkQosRecordExt0002 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILEEXT_0003
     * @tc.name      testNdkQosRecordExt0003
     * @tc.desc      Checks statistics through a directory argument that points at the record file stay empty.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosRecordExt0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosRecordExt0003 begin');
      appendSample(recordDir(), 1, 12.5);
      const report: RecordStatsReport = testNapi.getRecordStats(recordFilePath());
      logInfo('file as directory stats = ' + JSON.stringify(report));
      expect(report.code).assertEqual(CODE_OK);
      expect(report.total).assertEqual(0);
      expect(report.successCount).assertEqual(0);
      expect(report.avgDuration).assertEqual(INVALID_DURATION);
      expect(report.levelCounts.length).assertEqual(6);
      logInfo('testNdkQosRecordExt0003 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILEEXT_0004
     * @tc.name      testNdkQosRecordExt0004
     * @tc.desc      Checks an oversized directory path fails cleanly and the next normal append still succeeds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosRecordExt0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosRecordExt0004 begin');
      const failed: AppendRecordReport = appendSample(oversizedDir(), 3, 70);
      const recovered: AppendRecordReport = appendSample(recordDir(), 3, 71);
      logInfo('oversized code = ' + failed.code.toString() + ', recovered count = ' + recovered.count.toString());
      expect(failed.code).assertEqual(CODE_IO_ERROR);
      expect(failed.count).assertEqual(0);
      expect(recovered.code).assertEqual(CODE_OK);
      expect(recovered.count).assertEqual(1);
      expect(testNapi.readRunRecords(recordDir(), 10).total).assertEqual(1);
      logInfo('testNdkQosRecordExt0004 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILEEXT_0005
     * @tc.name      testNdkQosRecordExt0005
     * @tc.desc      Checks a zero duration is a legal record and turns every duration statistic into zero.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosRecordExt0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosRecordExt0005 begin');
      const appended: AppendRecordReport = appendSample(recordDir(), 0, 0);
      const read: RecordQueryReport = testNapi.readRunRecords(recordDir(), 10);
      const stats: RecordStatsReport = testNapi.getRecordStats(recordDir());
      logInfo('zero duration stats = ' + JSON.stringify(stats));
      expect(appended.code).assertEqual(CODE_OK);
      expect(appended.count).assertEqual(1);
      expect(isNear(read.records[0].duration, 0)).assertTrue();
      expect(stats.successCount).assertEqual(1);
      expect(stats.minDuration).assertEqual(0);
      expect(stats.maxDuration).assertEqual(0);
      expect(stats.avgDuration).assertEqual(0);
      logInfo('testNdkQosRecordExt0005 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILEEXT_0006
     * @tc.name      testNdkQosRecordExt0006
     * @tc.desc      Checks the stored duration keeps three decimals and rounds the fourth decimal.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosRecordExt0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosRecordExt0006 begin');
      appendSample(recordDir(), 2, 1.23456);
      appendSample(recordDir(), 3, 12345.6789);
      const report: RecordQueryReport = testNapi.readRunRecords(recordDir(), 10);
      logInfo('rounded durations = ' + report.records[0].duration.toString() + ', ' +
        report.records[1].duration.toString());
      expect(report.total).assertEqual(2);
      expect(isNear(report.records[0].duration, 1.235)).assertTrue();
      expect(isNear(report.records[1].duration, 12345.679)).assertTrue();
      expect(report.records[1].duration > report.records[0].duration).assertTrue();
      logInfo('testNdkQosRecordExt0006 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILEEXT_0007
     * @tc.name      testNdkQosRecordExt0007
     * @tc.desc      Checks a tiny positive duration is accepted and stored as zero milliseconds.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosRecordExt0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosRecordExt0007 begin');
      const appended: AppendRecordReport = appendSample(recordDir(), 4, 0.0004);
      const read: RecordQueryReport = testNapi.readRunRecords(recordDir(), 10);
      logInfo('tiny duration stored = ' + read.records[0].duration.toString());
      expect(appended.code).assertEqual(CODE_OK);
      expect(read.total).assertEqual(1);
      expect(read.records[0].duration).assertEqual(0);
      expect(read.records[0].level).assertEqual(4);
      logInfo('testNdkQosRecordExt0007 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILEEXT_0008
     * @tc.name      testNdkQosRecordExt0008
     * @tc.desc      Checks a record whose set result is not zero feeds the failure counter and not the durations.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosRecordExt0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosRecordExt0008 begin');
      testNapi.appendRunRecord(recordDir(), 2, 55.5, INVALID_RESULT, 2, 0, 0);
      const stats: RecordStatsReport = testNapi.getRecordStats(recordDir());
      logInfo('negative code stats = ' + JSON.stringify(stats));
      expect(stats.total).assertEqual(1);
      expect(stats.failureCount).assertEqual(1);
      expect(stats.successCount).assertEqual(0);
      expect(stats.avgDuration).assertEqual(INVALID_DURATION);
      expect(stats.minDuration).assertEqual(INVALID_DURATION);
      expect(stats.maxDuration).assertEqual(INVALID_DURATION);
      logInfo('testNdkQosRecordExt0008 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILEEXT_0009
     * @tc.name      testNdkQosRecordExt0009
     * @tc.desc      Checks a failed record keeps its level and negative result codes after the file round trip.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosRecordExt0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosRecordExt0009 begin');
      testNapi.appendRunRecord(recordDir(), 5, 9.5, INVALID_RESULT, INVALID_RESULT, INVALID_RESULT, INVALID_RESULT);
      const report: RecordQueryReport = testNapi.readRunRecords(recordDir(), 10);
      const record: RunRecord = report.records[0];
      logInfo('failed round trip = ' + JSON.stringify(record));
      expect(report.total).assertEqual(1);
      expect(record.level).assertEqual(5);
      expect(record.setResult).assertEqual(INVALID_RESULT);
      expect(record.queryLevel).assertEqual(INVALID_RESULT);
      expect(record.resetResult).assertEqual(INVALID_RESULT);
      expect(record.bindResult).assertEqual(INVALID_RESULT);
      expect(testNapi.getRecordStats(recordDir()).failureCount).assertEqual(1);
      logInfo('testNdkQosRecordExt0009 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILEEXT_0010
     * @tc.name      testNdkQosRecordExt0010
     * @tc.desc      Checks the two hundredth append fills the file without dropping any record.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosRecordExt0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosRecordExt0010 begin');
      appendByIndex(recordDir(), CAPACITY - 1);
      const last: AppendRecordReport = appendSample(recordDir(), 0, CAPACITY - 1);
      const read: RecordQueryReport = testNapi.readRunRecords(recordDir(), CAPACITY);
      logInfo('full file append = ' + JSON.stringify(last));
      expect(last.code).assertEqual(CODE_OK);
      expect(last.count).assertEqual(CAPACITY);
      expect(last.dropped).assertEqual(0);
      expect(read.total).assertEqual(CAPACITY);
      expect(read.returned).assertEqual(CAPACITY);
      expect(read.records[0].index).assertEqual(0);
      logInfo('testNdkQosRecordExt0010 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILEEXT_0011
     * @tc.name      testNdkQosRecordExt0011
     * @tc.desc      Checks every append beyond the capacity drops exactly one record and keeps the count fixed.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosRecordExt0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosRecordExt0011 begin');
      appendByIndex(recordDir(), CAPACITY);
      let drops: number = 0;
      for (let index = 0; index < OVERFLOW_COUNT; index++) {
        const report: AppendRecordReport = appendSample(recordDir(), 1, CAPACITY + index);
        drops += report.dropped;
        expect(report.count).assertEqual(CAPACITY);
      }
      const read: RecordQueryReport = testNapi.readRunRecords(recordDir(), CAPACITY);
      logInfo('total drops = ' + drops.toString() + ', first kept duration = ' + read.records[0].duration.toString());
      expect(drops).assertEqual(OVERFLOW_COUNT);
      expect(read.total).assertEqual(CAPACITY);
      expect(isNear(read.records[0].duration, OVERFLOW_COUNT)).assertTrue();
      expect(isNear(read.records[read.returned - 1].duration, CAPACITY + OVERFLOW_COUNT - 1)).assertTrue();
      logInfo('testNdkQosRecordExt0011 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILEEXT_0012
     * @tc.name      testNdkQosRecordExt0012
     * @tc.desc      Checks a limit of one returns only the newest record while the total stays complete.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosRecordExt0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosRecordExt0012 begin');
      appendSample(recordDir(), 0, 10);
      appendSample(recordDir(), 1, 20);
      appendSample(recordDir(), 2, 30);
      const report: RecordQueryReport = testNapi.readRunRecords(recordDir(), 1);
      logInfo('single record read = ' + JSON.stringify(report));
      expect(report.code).assertEqual(CODE_OK);
      expect(report.total).assertEqual(3);
      expect(report.returned).assertEqual(1);
      expect(report.records.length).assertEqual(1);
      expect(report.records[0].index).assertEqual(2);
      expect(isNear(report.records[0].duration, 30)).assertTrue();
      logInfo('testNdkQosRecordExt0012 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILEEXT_0013
     * @tc.name      testNdkQosRecordExt0013
     * @tc.desc      Checks clearing a directory without a record file removes nothing and keeps other records.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosRecordExt0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosRecordExt0013 begin');
      appendSample(recordDir(), 4, 44);
      const report: ClearRecordReport = testNapi.clearRunRecords(missingDir());
      logInfo('missing dir clear = ' + JSON.stringify(report));
      expect(report.code).assertEqual(CODE_OK);
      expect(report.removed).assertEqual(0);
      expect(testNapi.readRunRecords(recordDir(), 10).total).assertEqual(1);
      logInfo('testNdkQosRecordExt0013 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_FILEEXT_0014
     * @tc.name      testNdkQosRecordExt0014
     * @tc.desc      Checks the read index counts positions inside the file, so it restarts at zero after a drop.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL1
     */
    it('testNdkQosRecordExt0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logInfo('testNdkQosRecordExt0014 begin');
      appendByIndex(recordDir(), CAPACITY + 1);
      const report: RecordQueryReport = testNapi.readRunRecords(recordDir(), CAPACITY);
      logInfo('index window = ' + report.records[0].index.toString() + '..' +
        report.records[report.returned - 1].index.toString());
      expect(report.total).assertEqual(CAPACITY);
      expect(report.records[0].index).assertEqual(0);
      expect(report.records[report.returned - 1].index).assertEqual(CAPACITY - 1);
      expect(report.records[0].index < report.records[report.returned - 1].index).assertTrue();
      logInfo('testNdkQosRecordExt0014 end');
    })
  })
}
