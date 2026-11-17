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
import { QosLevelRange, QosRunInfo } from 'libentry.so';

const TAG: string = '[Sample_NdkQosLevelArgsTest]';
const DOMAIN: number = 0xF811;
const QOS_BACKGROUND: number = 0;
const QOS_USER_INTERACTIVE: number = 5;
const INVALID_RESULT: number = -1;
const DURATION_UPPER_BOUND: number = 120000;
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

function isDurationInRange(value: number): boolean {
  return !Number.isNaN(value) && Number.isFinite(value) && value > 0 && value < DURATION_UPPER_BOUND;
}

export default function ndkQosLevelArgsTest(): void {
  describe('NdkQosLevelArgs', () => {
    afterEach(async () => {
      // The native run blocks the JS thread, yield a macrotask between cases so the freeze guard timer can run.
      await sleepMs(SETTLE_INTERVAL);
    });

    /**
     * @tc.number    SUB_QOS_ARGS_0001
     * @tc.name      testNdkQosArgs0001
     * @tc.desc      Checks the level range reports the six QoS levels from background to interactive.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgs0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgs0001 begin');
      const range: QosLevelRange = testNapi.getLevelRange();
      logInfo('level range = ' + JSON.stringify(range));
      expect(range.minLevel).assertEqual(QOS_BACKGROUND);
      expect(range.maxLevel).assertEqual(QOS_USER_INTERACTIVE);
      expect(range.levelCount).assertEqual(6);
      logInfo('testNdkQosArgs0001 end');
    })

    /**
     * @tc.number    SUB_QOS_ARGS_0002
     * @tc.name      testNdkQosArgs0002
     * @tc.desc      Checks the sentinel values used for failures are both minus one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgs0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgs0002 begin');
      const range: QosLevelRange = testNapi.getLevelRange();
      expect(range.invalidResult).assertEqual(INVALID_RESULT);
      expect(range.invalidDuration).assertEqual(INVALID_RESULT);
      expect(range.levelCount).assertEqual(range.maxLevel - range.minLevel + 1);
      logInfo('testNdkQosArgs0002 end');
    })

    /**
     * @tc.number    SUB_QOS_ARGS_0003
     * @tc.name      testNdkQosArgs0003
     * @tc.desc      Checks the lowest level runs and is reported back as the active level.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgs0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgs0003 begin');
      const duration: number = testNapi.useQos(QOS_BACKGROUND);
      const info: QosRunInfo = testNapi.getLastQosInfo();
      expect(isDurationInRange(duration)).assertTrue();
      expect(info.queryLevel).assertEqual(QOS_BACKGROUND);
      expect(info.setResult).assertEqual(0);
      logInfo('testNdkQosArgs0003 end');
    })

    /**
     * @tc.number    SUB_QOS_ARGS_0004
     * @tc.name      testNdkQosArgs0004
     * @tc.desc      Checks the highest level runs and is reported back as the active level.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgs0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgs0004 begin');
      const duration: number = testNapi.useQos(QOS_USER_INTERACTIVE);
      const info: QosRunInfo = testNapi.getLastQosInfo();
      expect(isDurationInRange(duration)).assertTrue();
      expect(info.queryLevel).assertEqual(QOS_USER_INTERACTIVE);
      expect(info.resetResult).assertEqual(0);
      logInfo('testNdkQosArgs0004 end');
    })

    /**
     * @tc.number    SUB_QOS_ARGS_0005
     * @tc.name      testNdkQosArgs0005
     * @tc.desc      Checks a fractional level is rejected and leaves the previous run information untouched.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgs0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgs0005 begin');
      testNapi.useQos(QOS_USER_INTERACTIVE);
      const before: QosRunInfo = testNapi.getLastQosInfo();
      const report: number = testNapi.useQos(2.5);
      const after: QosRunInfo = testNapi.getLastQosInfo();
      logInfo('fractional level result = ' + report.toString());
      expect(report).assertEqual(INVALID_RESULT);
      expect(after.queryLevel).assertEqual(before.queryLevel);
      expect(after.duration).assertEqual(before.duration);
      expect(after.queryLevel).assertEqual(QOS_USER_INTERACTIVE);
      logInfo('testNdkQosArgs0005 end');
    })

    /**
     * @tc.number    SUB_QOS_ARGS_0006
     * @tc.name      testNdkQosArgs0006
     * @tc.desc      Checks a NaN level is rejected.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgs0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgs0006 begin');
      const report: number = testNapi.useQos(Number.NaN);
      expect(report).assertEqual(INVALID_RESULT);
      expect(testNapi.useQos(Number.NaN)).assertEqual(testNapi.useQos(-1));
      expect(report.toString()).assertEqual('-1');
      logInfo('testNdkQosArgs0006 end');
    })

    /**
     * @tc.number    SUB_QOS_ARGS_0007
     * @tc.name      testNdkQosArgs0007
     * @tc.desc      Checks an infinite level is rejected.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgs0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgs0007 begin');
      const positive: number = testNapi.useQos(Number.POSITIVE_INFINITY);
      const negative: number = testNapi.useQos(Number.NEGATIVE_INFINITY);
      expect(positive).assertEqual(INVALID_RESULT);
      expect(negative).assertEqual(INVALID_RESULT);
      expect(positive).assertEqual(negative);
      logInfo('testNdkQosArgs0007 end');
    })

    /**
     * @tc.number    SUB_QOS_ARGS_0008
     * @tc.name      testNdkQosArgs0008
     * @tc.desc      Checks a level above the interactive level is rejected.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgs0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgs0008 begin');
      expect(testNapi.useQos(QOS_USER_INTERACTIVE + 1)).assertEqual(INVALID_RESULT);
      expect(testNapi.useQos(QOS_USER_INTERACTIVE + 100)).assertEqual(INVALID_RESULT);
      expect(testNapi.useQos(QOS_USER_INTERACTIVE)).assertLarger(0);
      logInfo('testNdkQosArgs0008 end');
    })

    /**
     * @tc.number    SUB_QOS_ARGS_0009
     * @tc.name      testNdkQosArgs0009
     * @tc.desc      Checks a level below the background level is rejected.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgs0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgs0009 begin');
      expect(testNapi.useQos(QOS_BACKGROUND - 1)).assertEqual(INVALID_RESULT);
      expect(testNapi.useQos(-100)).assertEqual(INVALID_RESULT);
      expect(testNapi.useQos(QOS_BACKGROUND)).assertLarger(0);
      logInfo('testNdkQosArgs0009 end');
    })

    /**
     * @tc.number    SUB_QOS_ARGS_0010
     * @tc.name      testNdkQosArgs0010
     * @tc.desc      Checks the asynchronous run rejects a fractional level.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgs0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgs0010 begin');
      let rejected: boolean = false;
      try {
        await testNapi.useQosAsync(3.5);
      } catch (error) {
        rejected = true;
        logInfo('fractional level rejected by the async run');
      }
      expect(rejected).assertTrue();
      const duration: number = await testNapi.useQosAsync(QOS_BACKGROUND);
      expect(isDurationInRange(duration)).assertTrue();
      expect(testNapi.getLastQosInfo().queryLevel).assertEqual(QOS_BACKGROUND);
      logInfo('testNdkQosArgs0010 end');
    })

    /**
     * @tc.number    SUB_QOS_ARGS_0011
     * @tc.name      testNdkQosArgs0011
     * @tc.desc      Checks the asynchronous run rejects a NaN level.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgs0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgs0011 begin');
      let rejected: boolean = false;
      try {
        await testNapi.useQosAsync(Number.NaN);
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
      expect(testNapi.useQos(Number.NaN)).assertEqual(INVALID_RESULT);
      expect(isDurationInRange(testNapi.useQos(QOS_BACKGROUND))).assertTrue();
      logInfo('testNdkQosArgs0011 end');
    })

    /**
     * @tc.number    SUB_QOS_ARGS_0012
     * @tc.name      testNdkQosArgs0012
     * @tc.desc      Checks the asynchronous run rejects a level above the range and still serves the lowest level.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgs0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgs0012 begin');
      let rejected: boolean = false;
      try {
        await testNapi.useQosAsync(QOS_USER_INTERACTIVE + 1);
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
      const duration: number = await testNapi.useQosAsync(QOS_BACKGROUND);
      expect(isDurationInRange(duration)).assertTrue();
      expect(testNapi.getLastQosInfo().queryLevel).assertEqual(QOS_BACKGROUND);
      logInfo('testNdkQosArgs0012 end');
    })

    /**
     * @tc.number    SUB_QOS_ARGS_0013
     * @tc.name      testNdkQosArgs0013
     * @tc.desc      Checks the run information follows each level executed in turn.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgs0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgs0013 begin');
      let matched: number = 0;
      for (let level = QOS_BACKGROUND; level <= QOS_USER_INTERACTIVE; level++) {
        // The native run blocks the JS main thread, so yield between levels to stay clear of the freeze guard.
        if (level > QOS_BACKGROUND) {
          await sleepMs(CALL_INTERVAL);
        }
        const duration: number = testNapi.useQos(level);
        const info: QosRunInfo = testNapi.getLastQosInfo();
        if (isDurationInRange(duration) && info.queryLevel === level && info.setResult === 0) {
          matched++;
        }
      }
      logInfo('levels matched = ' + matched.toString());
      expect(matched).assertEqual(6);
      expect(testNapi.getLastQosInfo().queryLevel).assertEqual(QOS_USER_INTERACTIVE);
      expect(testNapi.getLastQosInfo().setResult).assertEqual(0);
      logInfo('testNdkQosArgs0013 end');
    })

    /**
     * @tc.number    SUB_QOS_ARGS_0014
     * @tc.name      testNdkQosArgs0014
     * @tc.desc      Checks the fixed level helpers map to the interactive and background levels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgs0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgs0014 begin');
      const high: number = testNapi.useHighQos();
      const highLevel: number = testNapi.getLastQosInfo().queryLevel;
      const low: number = testNapi.useLowQos();
      const lowLevel: number = testNapi.getLastQosInfo().queryLevel;
      logInfo('high = ' + high.toFixed(3) + ', low = ' + low.toFixed(3));
      expect(isDurationInRange(high)).assertTrue();
      expect(highLevel).assertEqual(QOS_USER_INTERACTIVE);
      expect(isDurationInRange(low)).assertTrue();
      expect(lowLevel).assertEqual(QOS_BACKGROUND);
      logInfo('testNdkQosArgs0014 end');
    })

    /**
     * @tc.number    SUB_QOS_ARGS_0015
     * @tc.name      testNdkQosArgs0015
     * @tc.desc      Checks a rejected level does not overwrite the information of the previous run.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgs0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgs0015 begin');
      const duration: number = testNapi.useQos(QOS_USER_INTERACTIVE);
      const before: QosRunInfo = testNapi.getLastQosInfo();
      testNapi.useQos(QOS_USER_INTERACTIVE + 3);
      const after: QosRunInfo = testNapi.getLastQosInfo();
      expect(isDurationInRange(duration)).assertTrue();
      expect(after.queryLevel).assertEqual(before.queryLevel);
      expect(after.duration).assertEqual(before.duration);
      logInfo('testNdkQosArgs0015 end');
    })

    /**
     * @tc.number    SUB_QOS_ARGS_0016
     * @tc.name      testNdkQosArgs0016
     * @tc.desc      Checks every accepted level keeps its own reset and bind result codes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosArgs0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosArgs0016 begin');
      const first: number = testNapi.useQos(QOS_BACKGROUND);
      const firstInfo: QosRunInfo = testNapi.getLastQosInfo();
      const last: number = testNapi.useQos(QOS_USER_INTERACTIVE);
      const lastInfo: QosRunInfo = testNapi.getLastQosInfo();
      expect(firstInfo.resetResult).assertEqual(0);
      expect(lastInfo.resetResult).assertEqual(0);
      expect(firstInfo.bindResult).assertEqual(0);
      expect(lastInfo.bindResult).assertEqual(0);
      expect(first > 0 && last > 0).assertTrue();
      logInfo('testNdkQosArgs0016 end');
    })
  })
}
