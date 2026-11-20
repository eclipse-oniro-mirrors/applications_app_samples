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
import { QosRunInfo } from 'libentry.so';

const TAG: string = '[Sample_NdkQosCapabilityTest]';
const DOMAIN: number = 0xF811;
const DURATION_UPPER_BOUND: number = 120000;
const ROUND_TRIP_TOLERANCE: number = 0.001;
const CALL_INTERVAL: number = 1500;
const INVALID_RESULT: number = -1;
const QOS_BACKGROUND: number = 0;
const QOS_DEFAULT: number = 2;
const QOS_USER_INTERACTIVE: number = 5;

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

export default function ndkQosCapabilityTest(): void {
  describe('NdkQosCapability', () => {
    afterEach(async () => {
      // The native run blocks the JS thread, yield a macrotask between cases so the freeze guard timer can run.
      await sleepMs(SETTLE_INTERVAL);
    });

    /**
     * @tc.number    SUB_QOS_CAPABILITY_0001
     * @tc.name      testNdkQosCapability0001
     * @tc.desc      Checks a valid level run reports the level back through the run information.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosCapability0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosCapability0001 begin');
      const duration: number = testNapi.useQos(QOS_USER_INTERACTIVE);
      const info: QosRunInfo = testNapi.getLastQosInfo();
      logInfo('level 5 duration = ' + duration.toFixed(3) + ' ms, info = ' + JSON.stringify(info));
      expect(isDurationInRange(duration)).assertTrue();
      expect(info.setResult).assertEqual(0);
      expect(info.queryLevel).assertEqual(QOS_USER_INTERACTIVE);
      expect(info.resetResult).assertEqual(0);
      expect(Math.abs(info.duration - duration) <= ROUND_TRIP_TOLERANCE).assertTrue();
      logInfo('testNdkQosCapability0001 end');
    })

    /**
     * @tc.number    SUB_QOS_CAPABILITY_0002
     * @tc.name      testNdkQosCapability0002
     * @tc.desc      Checks out of range levels are rejected instead of being scheduled.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosCapability0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosCapability0002 begin');
      const below: number = testNapi.useQos(-1);
      const above: number = testNapi.useQos(6);
      const farAbove: number = testNapi.useQos(99);
      logInfo('rejected levels: ' + below.toString() + ', ' + above.toString() + ', ' + farAbove.toString());
      expect(below).assertEqual(INVALID_RESULT);
      expect(above).assertEqual(INVALID_RESULT);
      expect(farAbove).assertEqual(INVALID_RESULT);
      logInfo('testNdkQosCapability0002 end');
    })

    /**
     * @tc.number    SUB_QOS_CAPABILITY_0003
     * @tc.name      testNdkQosCapability0003
     * @tc.desc      Checks the asynchronous run resolves with the same duration as the run information.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosCapability0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosCapability0003 begin');
      const duration: number = await testNapi.useQosAsync(QOS_DEFAULT);
      const info: QosRunInfo = testNapi.getLastQosInfo();
      logInfo('async duration = ' + duration.toFixed(3) + ' ms');
      expect(isDurationInRange(duration)).assertTrue();
      expect(info.queryLevel).assertEqual(QOS_DEFAULT);
      expect(Math.abs(info.duration - duration) <= ROUND_TRIP_TOLERANCE).assertTrue();
      logInfo('testNdkQosCapability0003 end');
    })

    /**
     * @tc.number    SUB_QOS_CAPABILITY_0004
     * @tc.name      testNdkQosCapability0004
     * @tc.desc      Checks the asynchronous run rejects an illegal level and still serves a legal one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosCapability0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosCapability0004 begin');
      let rejected: boolean = false;
      try {
        await testNapi.useQosAsync(9);
      } catch (error) {
        rejected = true;
        logInfo('illegal level rejected as expected');
      }
      expect(rejected).assertTrue();
      const duration: number = await testNapi.useQosAsync(QOS_BACKGROUND);
      logInfo('async background duration = ' + duration.toFixed(3) + ' ms');
      expect(isDurationInRange(duration)).assertTrue();
      expect(testNapi.getLastQosInfo().queryLevel).assertEqual(QOS_BACKGROUND);
      logInfo('testNdkQosCapability0004 end');
    })

    /**
     * @tc.number    SUB_QOS_CAPABILITY_0005
     * @tc.name      testNdkQosCapability0005
     * @tc.desc      Checks the boundary levels both complete and the last level is reported back.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosCapability0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosCapability0005 begin');
      const background: number = testNapi.useQos(QOS_BACKGROUND);
      await sleepMs(CALL_INTERVAL);
      const interactive: number = testNapi.useQos(QOS_USER_INTERACTIVE);
      const info: QosRunInfo = testNapi.getLastQosInfo();
      logInfo('boundary durations: ' + background.toFixed(3) + ', ' + interactive.toFixed(3));
      expect(isDurationInRange(background)).assertTrue();
      expect(isDurationInRange(interactive)).assertTrue();
      expect(info.setResult).assertEqual(0);
      expect(info.queryLevel).assertEqual(QOS_USER_INTERACTIVE);
      logInfo('testNdkQosCapability0005 end');
    })
  })
}
