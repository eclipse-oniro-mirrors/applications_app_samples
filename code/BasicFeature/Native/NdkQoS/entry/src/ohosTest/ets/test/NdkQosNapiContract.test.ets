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

const TAG: string = '[Sample_NdkQosNapiContractTest]';
const DOMAIN: number = 0xF811;
const DURATION_UPPER_BOUND: number = 120000;
const ROUND_TRIP_TOLERANCE: number = 0.001;
const CALL_INTERVAL: number = 1500;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function logDuration(name: string, value: number): void {
  logInfo(name + ' = ' + value.toFixed(3) + ' ms');
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

function isTextConvertible(value: number): boolean {
  const text: string = value.toString();
  const fixed: string = value.toFixed(3);
  const parsed: number = Number(fixed);
  return text.length > 0 && !Number.isNaN(Number(text)) && Math.abs(parsed - value) <= ROUND_TRIP_TOLERANCE;
}

export default function ndkQosNapiContractTest(): void {
  describe('NdkQosNapiContract', () => {
    afterEach(async () => {
      // The native run blocks the JS thread, yield a macrotask between cases so the freeze guard timer can run.
      await sleepMs(SETTLE_INTERVAL);
    });

    /**
     * @tc.number    SUB_QOS_NAPI_0001
     * @tc.name      testNdkQosNapi0001
     * @tc.desc      Checks useHighQos returns a positive finite duration that survives a text round trip.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosNapi0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosNapi0001 begin');
      const duration: number = testNapi.useHighQos();
      logDuration('high qos duration', duration);
      expect(typeof duration).assertEqual('number');
      expect(Number.isNaN(duration)).assertFalse();
      expect(Number.isFinite(duration)).assertTrue();
      expect(duration).assertLarger(0);
      expect(duration < DURATION_UPPER_BOUND).assertTrue();
      expect(isTextConvertible(duration)).assertTrue();
      logInfo('testNdkQosNapi0001 end');
    })

    /**
     * @tc.number    SUB_QOS_NAPI_0002
     * @tc.name      testNdkQosNapi0002
     * @tc.desc      Checks useLowQos returns a positive finite duration that survives a text round trip.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosNapi0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosNapi0002 begin');
      const duration: number = testNapi.useLowQos();
      logDuration('low qos duration', duration);
      expect(typeof duration).assertEqual('number');
      expect(Number.isNaN(duration)).assertFalse();
      expect(Number.isFinite(duration)).assertTrue();
      expect(duration).assertLarger(0);
      expect(duration < DURATION_UPPER_BOUND).assertTrue();
      expect(isTextConvertible(duration)).assertTrue();
      logInfo('testNdkQosNapi0002 end');
    })

    /**
     * @tc.number    SUB_QOS_NAPI_0003
     * @tc.name      testNdkQosNapi0003
     * @tc.desc      Checks two successive high QoS calls both return a valid duration.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosNapi0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosNapi0003 begin');
      const first: number = testNapi.useHighQos();
      logDuration('first high qos duration', first);
      // The native call blocks the JS main thread, yield between calls to stay clear of the freeze guard.
      await sleepMs(CALL_INTERVAL);
      const second: number = testNapi.useHighQos();
      logDuration('second high qos duration', second);
      expect(isDurationInRange(first)).assertTrue();
      expect(isDurationInRange(second)).assertTrue();
      expect(typeof second).assertEqual('number');
      logInfo('testNdkQosNapi0003 end');
    })

    /**
     * @tc.number    SUB_QOS_NAPI_0004
     * @tc.name      testNdkQosNapi0004
     * @tc.desc      Checks two successive low QoS calls both return a valid duration.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosNapi0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosNapi0004 begin');
      const first: number = testNapi.useLowQos();
      logDuration('first low qos duration', first);
      await sleepMs(CALL_INTERVAL);
      const second: number = testNapi.useLowQos();
      logDuration('second low qos duration', second);
      expect(isDurationInRange(first)).assertTrue();
      expect(isDurationInRange(second)).assertTrue();
      expect(typeof second).assertEqual('number');
      logInfo('testNdkQosNapi0004 end');
    })

    /**
     * @tc.number    SUB_QOS_NAPI_0005
     * @tc.name      testNdkQosNapi0005
     * @tc.desc      Checks the high and low QoS calls stay valid when they alternate.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosNapi0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosNapi0005 begin');
      const firstHigh: number = testNapi.useHighQos();
      logDuration('alternate first high qos duration', firstHigh);
      await sleepMs(CALL_INTERVAL);
      const firstLow: number = testNapi.useLowQos();
      logDuration('alternate first low qos duration', firstLow);
      await sleepMs(CALL_INTERVAL);
      const secondHigh: number = testNapi.useHighQos();
      logDuration('alternate second high qos duration', secondHigh);
      expect(isDurationInRange(firstHigh)).assertTrue();
      expect(isDurationInRange(firstLow)).assertTrue();
      expect(isDurationInRange(secondHigh)).assertTrue();
      logInfo('testNdkQosNapi0005 end');
    })

    /**
     * @tc.number    SUB_QOS_NAPI_0006
     * @tc.name      testNdkQosNapi0006
     * @tc.desc      Checks both QoS entry functions exported by the native module are callable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNdkQosNapi0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logInfo('testNdkQosNapi0006 begin');
      const highDuration: number = testNapi.useHighQos();
      logDuration('export high qos duration', highDuration);
      await sleepMs(CALL_INTERVAL);
      const lowDuration: number = testNapi.useLowQos();
      logDuration('export low qos duration', lowDuration);
      // The native entry functions are reached through the module namespace, both must answer a valid duration.
      expect(typeof testNapi).assertEqual('object');
      expect(isDurationInRange(highDuration)).assertTrue();
      expect(isDurationInRange(lowDuration)).assertTrue();
      expect(isTextConvertible(highDuration) && isTextConvertible(lowDuration)).assertTrue();
      logInfo('testNdkQosNapi0006 end');
    })
  })
}
