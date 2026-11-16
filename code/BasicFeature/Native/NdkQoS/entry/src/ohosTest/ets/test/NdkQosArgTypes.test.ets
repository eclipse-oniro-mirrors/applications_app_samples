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
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import testNapi from 'libentry.so';
import {
  AffinityReport,
  AppendRecordReport,
  BenchmarkReport,
  ClearRecordReport,
  CompareReport,
  ConcurrentReport,
  CpuTopology,
  ParsedRecordReport,
  QosLevelRange,
  QosRunInfo,
  RecordQueryReport,
  RecordStatsReport,
  ResetAffinityReport,
  RunRecord
} from 'libentry.so';

const TAG: string = '[Sample_NdkQosArgTypeTest]';
const DOMAIN: number = 0xF811;
const CODE_OK: number = 0;
const CODE_INVALID_ARG: number = 401;
const CAPACITY: number = 200;
const LEVEL_COUNT: number = 6;
const INVALID_RESULT: number = -1;
const INVALID_DURATION: number = -1;
const QOS_USER_INTERACTIVE: number = 5;
const DURATION_UPPER_BOUND: number = 120000;

// The public declarations type every level, count and path as a number or string. The native layer also
// has to survive callers that cross the module boundary with a value of another type, so this view keeps
// the same runtime object while letting the cases hand in a value of any type. The object cast is the
// only place the narrower signature is widened; every assertion below is made on the real return value.
interface LevelHolder {
  level: number;
}

interface LooseNativeApi {
  useQos(level?: Object | null, ...rest: Object[]): number;
  useQosAsync(level?: Object): Promise<number>;
  useHighQos(...args: Object[]): number;
  getLevelRange(...args: Object[]): QosLevelRange;
  runLevelBenchmarkAsync(rounds?: Object): Promise<BenchmarkReport>;
  runConcurrentAsync(level?: Object, threads?: Object, rounds?: Object): Promise<ConcurrentReport>;
  compareLevels(levelA?: Object, levelB?: Object): CompareReport;
  bindCurrentThread(cpu?: Object): AffinityReport;
  getCpuTopology(...args: Object[]): CpuTopology;
  resetThreadAffinity(...args: Object[]): ResetAffinityReport;
  appendRunRecord(dir: Object, level: Object, duration: Object, setResult: Object, queryLevel: Object,
    resetResult: Object, bindResult: Object): AppendRecordReport;
  readRunRecords(dir: Object, limit: Object): RecordQueryReport;
  clearRunRecords(dir: Object | null): ClearRecordReport;
  getRecordStats(dir: Object): RecordStatsReport;
  parseRunRecordLine(text: Object | null): ParsedRecordReport;
}

const looseApi: LooseNativeApi = testNapi as Object as LooseNativeApi;
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

function isDurationInRange(value: number): boolean {
  return !Number.isNaN(value) && Number.isFinite(value) && value > 0 && value < DURATION_UPPER_BOUND;
}

export default function ndkQosArgTypeTest(): void {
  describe('NdkQosArgTypes', () => {
    afterEach(async () => {
      // The native run blocks the JS thread, yield a macrotask between cases so the freeze guard timer can run.
      await sleepMs(SETTLE_INTERVAL);
    });

    /**
     * @tc.number    SUB_NDK_QOS_ARGTYPE_0001
     * @tc.name      testNdkQosArgType0001
     * @tc.desc      Checks a numeric string level is rejected instead of being coerced into a level.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgType0001 begin');
      testNapi.useQos(QOS_USER_INTERACTIVE);
      const before: number = testNapi.getLastQosInfo().duration;
      const report: number = looseApi.useQos('5');
      logInfo('string level result = ' + report.toString());
      expect(report).assertEqual(INVALID_RESULT);
      expect(report).assertLarger(INVALID_DURATION - 1);
      expect(testNapi.getLastQosInfo().duration).assertEqual(before);
      logInfo('testNdkQosArgType0001 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_ARGTYPE_0002
     * @tc.name      testNdkQosArgType0002
     * @tc.desc      Checks a boolean level is rejected because only numbers carry a QoS level.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgType0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgType0002 begin');
      const asTrue: number = looseApi.useQos(true);
      const asFalse: number = looseApi.useQos(false);
      logInfo('boolean levels: ' + asTrue.toString() + ', ' + asFalse.toString());
      expect(asTrue).assertEqual(INVALID_RESULT);
      expect(asFalse).assertEqual(INVALID_RESULT);
      expect(asTrue).assertEqual(asFalse);
      logInfo('testNdkQosArgType0002 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_ARGTYPE_0003
     * @tc.name      testNdkQosArgType0003
     * @tc.desc      Checks a null level is rejected and leaves the previous run information untouched.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgType0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgType0003 begin');
      testNapi.useQos(QOS_USER_INTERACTIVE);
      const beforeLevel: number = testNapi.getLastQosInfo().queryLevel;
      const report: number = looseApi.useQos(null);
      logInfo('null level result = ' + report.toString());
      expect(report).assertEqual(INVALID_RESULT);
      expect(testNapi.getLastQosInfo().queryLevel).assertEqual(beforeLevel);
      expect(beforeLevel).assertEqual(QOS_USER_INTERACTIVE);
      logInfo('testNdkQosArgType0003 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_ARGTYPE_0004
     * @tc.name      testNdkQosArgType0004
     * @tc.desc      Checks an array or plain object level is rejected rather than read as its first value.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgType0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgType0004 begin');
      const arrayLevel: number = looseApi.useQos([QOS_USER_INTERACTIVE]);
      const holder: LevelHolder = { level: QOS_USER_INTERACTIVE };
      const objectLevel: number = looseApi.useQos(holder);
      logInfo('array level = ' + arrayLevel.toString() + ', object level = ' + objectLevel.toString());
      expect(arrayLevel).assertEqual(INVALID_RESULT);
      expect(objectLevel).assertEqual(INVALID_RESULT);
      expect(arrayLevel).assertEqual(objectLevel);
      logInfo('testNdkQosArgType0004 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_ARGTYPE_0005
     * @tc.name      testNdkQosArgType0005
     * @tc.desc      Checks a missing level argument is rejected instead of defaulting to a level.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgType0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgType0005 begin');
      const missing: number = looseApi.useQos();
      const explicit: number = looseApi.useQos(undefined);
      logInfo('missing level = ' + missing.toString() + ', undefined level = ' + explicit.toString());
      expect(missing).assertEqual(INVALID_RESULT);
      expect(explicit).assertEqual(INVALID_RESULT);
      expect(missing).assertEqual(explicit);
      logInfo('testNdkQosArgType0005 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_ARGTYPE_0006
     * @tc.name      testNdkQosArgType0006
     * @tc.desc      Checks a trailing extra argument is ignored so the leading level still runs.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgType0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgType0006 begin');
      const duration: number = looseApi.useQos(QOS_USER_INTERACTIVE, 'ignored', 42);
      const info: QosRunInfo = testNapi.getLastQosInfo();
      logInfo('extra argument duration = ' + duration.toFixed(3) + ' ms');
      expect(isDurationInRange(duration)).assertTrue();
      expect(info.queryLevel).assertEqual(QOS_USER_INTERACTIVE);
      expect(info.setResult).assertEqual(CODE_OK);
      logInfo('testNdkQosArgType0006 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_ARGTYPE_0007
     * @tc.name      testNdkQosArgType0007
     * @tc.desc      Checks the asynchronous run rejects a numeric string level without scheduling work.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgType0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgType0007 begin');
      let rejected: boolean = false;
      try {
        await looseApi.useQosAsync('4');
      } catch (error) {
        rejected = true;
        logInfo('string level rejected by the async run');
      }
      expect(rejected).assertTrue();
      const duration: number = await looseApi.useQosAsync(0);
      expect(isDurationInRange(duration)).assertTrue();
      expect(testNapi.getLastQosInfo().queryLevel).assertEqual(0);
      logInfo('testNdkQosArgType0007 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_ARGTYPE_0008
     * @tc.name      testNdkQosArgType0008
     * @tc.desc      Checks the asynchronous run rejects a missing level and keeps serving valid levels.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgType0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgType0008 begin');
      let rejected: boolean = false;
      try {
        await looseApi.useQosAsync();
      } catch (error) {
        rejected = true;
        logInfo('missing level rejected by the async run');
      }
      expect(rejected).assertTrue();
      const duration: number = await looseApi.useQosAsync(QOS_USER_INTERACTIVE);
      expect(isDurationInRange(duration)).assertTrue();
      expect(testNapi.getLastQosInfo().queryLevel).assertEqual(QOS_USER_INTERACTIVE);
      logInfo('testNdkQosArgType0008 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_ARGTYPE_0009
     * @tc.name      testNdkQosArgType0009
     * @tc.desc      Checks the benchmark rejects a string round count instead of parsing it.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgType0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgType0009 begin');
      let stringRejected: boolean = false;
      try {
        await looseApi.runLevelBenchmarkAsync('1');
      } catch (error) {
        stringRejected = true;
        logInfo('string rounds rejected by the benchmark');
      }
      let missingRejected: boolean = false;
      try {
        await looseApi.runLevelBenchmarkAsync();
      } catch (error) {
        missingRejected = true;
        logInfo('missing rounds rejected by the benchmark');
      }
      expect(stringRejected).assertTrue();
      expect(missingRejected).assertTrue();
      const report: BenchmarkReport = await testNapi.runLevelBenchmarkAsync(1);
      expect(report.code).assertEqual(CODE_OK);
      expect(report.samples.length).assertEqual(LEVEL_COUNT);
      logInfo('testNdkQosArgType0009 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_ARGTYPE_0010
     * @tc.name      testNdkQosArgType0010
     * @tc.desc      Checks the concurrent run rejects a string level, thread count and round count.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgType0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgType0010 begin');
      let levelRejected: boolean = false;
      try {
        await looseApi.runConcurrentAsync('5', 1, 1);
      } catch (error) {
        levelRejected = true;
        logInfo('string level rejected by the concurrent run');
      }
      let threadsRejected: boolean = false;
      try {
        await looseApi.runConcurrentAsync(5, '1', 1);
      } catch (error) {
        threadsRejected = true;
        logInfo('string thread count rejected by the concurrent run');
      }
      let roundsRejected: boolean = false;
      try {
        await looseApi.runConcurrentAsync(5, 1, '1');
      } catch (error) {
        roundsRejected = true;
        logInfo('string round count rejected by the concurrent run');
      }
      expect(levelRejected).assertTrue();
      expect(threadsRejected).assertTrue();
      expect(roundsRejected).assertTrue();
      logInfo('testNdkQosArgType0010 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_ARGTYPE_0011
     * @tc.name      testNdkQosArgType0011
     * @tc.desc      Checks the concurrent run rejects a request that misses the round argument.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgType0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgType0011 begin');
      let rejected: boolean = false;
      try {
        await looseApi.runConcurrentAsync(0, 2);
      } catch (error) {
        rejected = true;
        logInfo('missing rounds rejected by the concurrent run');
      }
      expect(rejected).assertTrue();
      const report: ConcurrentReport = await testNapi.runConcurrentAsync(0, 2, 1);
      expect(report.code).assertEqual(CODE_OK);
      expect(report.successCount + report.failCount).assertEqual(2);
      logInfo('testNdkQosArgType0011 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_ARGTYPE_0012
     * @tc.name      testNdkQosArgType0012
     * @tc.desc      Checks the comparison reports the invalid argument code when a level is missing.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgType0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgType0012 begin');
      const report: CompareReport = looseApi.compareLevels(QOS_USER_INTERACTIVE);
      logInfo('single argument compare = ' + JSON.stringify(report));
      expect(report.code).assertEqual(CODE_INVALID_ARG);
      expect(report.levelA).assertEqual(INVALID_RESULT);
      expect(report.levelB).assertEqual(INVALID_RESULT);
      expect(report.fasterLevel).assertEqual(INVALID_RESULT);
      logInfo('testNdkQosArgType0012 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_ARGTYPE_0013
     * @tc.name      testNdkQosArgType0013
     * @tc.desc      Checks the comparison rejects string levels and keeps the sentinel durations.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgType0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgType0013 begin');
      const first: CompareReport = looseApi.compareLevels('0', 5);
      const second: CompareReport = looseApi.compareLevels(0, '5');
      logInfo('string compare codes: ' + first.code.toString() + ', ' + second.code.toString());
      expect(first.code).assertEqual(CODE_INVALID_ARG);
      expect(second.code).assertEqual(CODE_INVALID_ARG);
      expect(first.durationA).assertEqual(INVALID_DURATION);
      expect(second.ratio).assertEqual(INVALID_DURATION);
      logInfo('testNdkQosArgType0013 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_ARGTYPE_0014
     * @tc.name      testNdkQosArgType0014
     * @tc.desc      Checks a record append rejects a non string directory and reports the untouched capacity.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgType0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgType0014 begin');
      testNapi.clearRunRecords(recordDir());
      const report: AppendRecordReport = looseApi.appendRunRecord(1024, 5, 12.5, 0, 5, 0, 0);
      logInfo('non string dir append = ' + JSON.stringify(report));
      expect(report.code).assertEqual(CODE_INVALID_ARG);
      expect(report.count).assertEqual(0);
      expect(report.dropped).assertEqual(0);
      expect(report.capacity).assertEqual(CAPACITY);
      logInfo('testNdkQosArgType0014 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_ARGTYPE_0015
     * @tc.name      testNdkQosArgType0015
     * @tc.desc      Checks a record append rejects a string level without writing anything to the file.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgType0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgType0015 begin');
      testNapi.clearRunRecords(recordDir());
      const report: AppendRecordReport = looseApi.appendRunRecord(recordDir(), '5', 12.5, 0, 5, 0, 0);
      expect(report.code).assertEqual(CODE_INVALID_ARG);
      expect(report.count).assertEqual(0);
      expect(testNapi.readRunRecords(recordDir(), 10).total).assertEqual(0);
      logInfo('testNdkQosArgType0015 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_ARGTYPE_0016
     * @tc.name      testNdkQosArgType0016
     * @tc.desc      Checks a record read rejects a string limit and returns no records.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgType0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgType0016 begin');
      testNapi.clearRunRecords(recordDir());
      testNapi.appendRunRecord(recordDir(), 3, 8.5, 0, 3, 0, 0);
      const report: RecordQueryReport = looseApi.readRunRecords(recordDir(), '10');
      logInfo('string limit read = ' + JSON.stringify(report));
      expect(report.code).assertEqual(CODE_INVALID_ARG);
      expect(report.total).assertEqual(0);
      expect(report.returned).assertEqual(0);
      expect(report.records.length).assertEqual(0);
      logInfo('testNdkQosArgType0016 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_ARGTYPE_0017
     * @tc.name      testNdkQosArgType0017
     * @tc.desc      Checks clearing the records rejects a non string directory and removes nothing.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgType0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgType0017 begin');
      testNapi.clearRunRecords(recordDir());
      testNapi.appendRunRecord(recordDir(), 2, 4.5, 0, 2, 0, 0);
      const report: ClearRecordReport = looseApi.clearRunRecords(null);
      expect(report.code).assertEqual(CODE_INVALID_ARG);
      expect(report.removed).assertEqual(0);
      expect(testNapi.readRunRecords(recordDir(), 10).total).assertEqual(1);
      logInfo('testNdkQosArgType0017 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_ARGTYPE_0018
     * @tc.name      testNdkQosArgType0018
     * @tc.desc      Checks the record statistics reject a missing directory and keep the sentinel average.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgType0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgType0018 begin');
      const report: RecordStatsReport = looseApi.getRecordStats(2048);
      logInfo('typed stats = ' + JSON.stringify(report));
      expect(report.code).assertEqual(CODE_INVALID_ARG);
      expect(report.total).assertEqual(0);
      expect(report.avgDuration).assertEqual(INVALID_DURATION);
      expect(report.levelCounts.length).assertEqual(LEVEL_COUNT);
      logInfo('testNdkQosArgType0018 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_ARGTYPE_0019
     * @tc.name      testNdkQosArgType0019
     * @tc.desc      Checks the line parser rejects numbers, booleans and null instead of reading a record.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgType0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgType0019 begin');
      const asNumber: ParsedRecordReport = looseApi.parseRunRecordLine(5);
      const asBoolean: ParsedRecordReport = looseApi.parseRunRecordLine(true);
      const asNull: ParsedRecordReport = looseApi.parseRunRecordLine(null);
      logInfo('typed parses: ' + asNumber.code.toString() + ', ' + asBoolean.code.toString() + ', ' +
        asNull.code.toString());
      expect(asNumber.code).assertEqual(CODE_INVALID_ARG);
      expect(asBoolean.code).assertEqual(CODE_INVALID_ARG);
      expect(asNull.code).assertEqual(CODE_INVALID_ARG);
      expect(asNull.level).assertEqual(INVALID_RESULT);
      logInfo('testNdkQosArgType0019 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_ARGTYPE_0020
     * @tc.name      testNdkQosArgType0020
     * @tc.desc      Checks the line parser still accepts a record made only of strings and numbers.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgType0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgType0020 begin');
      const parsed: ParsedRecordReport = looseApi.parseRunRecordLine('4,321.250,0,4,0,0');
      expect(parsed.code).assertEqual(CODE_OK);
      expect(parsed.level).assertEqual(4);
      expect(parsed.queryLevel).assertEqual(4);
      expect(Math.abs(parsed.duration - 321.25) <= 0.001).assertTrue();
      logInfo('testNdkQosArgType0020 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_ARGTYPE_0021
     * @tc.name      testNdkQosArgType0021
     * @tc.desc      Checks the affinity binding rejects a string CPU index and keeps an empty affinity list.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgType0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgType0021 begin');
      const report: AffinityReport = looseApi.bindCurrentThread('0');
      logInfo('string cpu bind = ' + JSON.stringify(report));
      expect(report.code).assertEqual(CODE_INVALID_ARG);
      expect(report.cpu).assertEqual(INVALID_RESULT);
      expect(report.bindResult).assertEqual(INVALID_RESULT);
      expect(report.affinityCpus.length).assertEqual(0);
      logInfo('testNdkQosArgType0021 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_ARGTYPE_0022
     * @tc.name      testNdkQosArgType0022
     * @tc.desc      Checks the affinity reset accepts trailing arguments and restores every CPU.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgType0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgType0022 begin');
      const report: ResetAffinityReport = looseApi.resetThreadAffinity('ignored', 7);
      const topology: CpuTopology = testNapi.getCpuTopology();
      logInfo('reset with extra args = ' + JSON.stringify(report));
      expect(report.code).assertEqual(CODE_OK);
      expect(report.bindResult).assertEqual(CODE_OK);
      expect(report.affinityCount).assertEqual(topology.cpuCount);
      logInfo('testNdkQosArgType0022 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_ARGTYPE_0023
     * @tc.name      testNdkQosArgType0023
     * @tc.desc      Checks the fixed level shortcuts ignore trailing arguments and still measure a run.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgType0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgType0023 begin');
      const duration: number = looseApi.useHighQos('ignored');
      logInfo('shortcut duration with extra argument = ' + duration.toFixed(3) + ' ms');
      expect(isDurationInRange(duration)).assertTrue();
      expect(testNapi.getLastQosInfo().queryLevel).assertEqual(QOS_USER_INTERACTIVE);
      expect(testNapi.getLastQosInfo().setResult).assertEqual(CODE_OK);
      logInfo('testNdkQosArgType0023 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_ARGTYPE_0024
     * @tc.name      testNdkQosArgType0024
     * @tc.desc      Checks the range query and topology query ignore extra arguments and stay consistent.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgType0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgType0024 begin');
      const range: QosLevelRange = looseApi.getLevelRange('ignored', 1);
      const topology: CpuTopology = looseApi.getCpuTopology('ignored');
      logInfo('range with extra args = ' + JSON.stringify(range));
      expect(range.levelCount).assertEqual(LEVEL_COUNT);
      expect(range.minLevel).assertEqual(0);
      expect(range.maxLevel).assertEqual(QOS_USER_INTERACTIVE);
      expect(topology.code).assertEqual(CODE_OK);
      logInfo('testNdkQosArgType0024 end');
    })
  })
}
