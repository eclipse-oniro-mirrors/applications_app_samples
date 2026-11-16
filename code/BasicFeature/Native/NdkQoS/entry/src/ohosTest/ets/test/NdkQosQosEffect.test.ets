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

const TAG: string = '[Sample_NdkQosEffectTest]';
const DOMAIN: number = 0xF811;
const DURATION_UPPER_BOUND: number = 120000;
const SAMPLE_TIMES: number = 3;
const HIGH_QOS_RATIO: number = 1.5;
const INSTABILITY_RATIO: number = 10;
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

async function sampleQos(isHigh: boolean, times: number): Promise<number[]> {
  const values: number[] = [];
  for (let index: number = 0; index < times; index++) {
    // The native call blocks the JS main thread, yield between calls to stay clear of the freeze guard.
    if (index > 0) {
      await sleepMs(CALL_INTERVAL);
    }
    const value: number = isHigh ? testNapi.useHighQos() : testNapi.useLowQos();
    logDuration((isHigh ? 'high' : 'low') + ' sample ' + index.toString(), value);
    values.push(value);
  }
  return values;
}

function minOf(values: number[]): number {
  let result: number = Number.MAX_VALUE;
  for (let index: number = 0; index < values.length; index++) {
    if (values[index] < result) {
      result = values[index];
    }
  }
  return result;
}

function maxOf(values: number[]): number {
  let result: number = 0;
  for (let index: number = 0; index < values.length; index++) {
    if (values[index] > result) {
      result = values[index];
    }
  }
  return result;
}

export default function ndkQosEffectTest(): void {
  describe('NdkQosEffect', () => {
    afterEach(async () => {
      // The native run blocks the JS thread, yield a macrotask between cases so the freeze guard timer can run.
      await sleepMs(SETTLE_INTERVAL);
    });

    /**
     * @tc.number    SUB_NDK_QOS_EFFECT_0001
     * @tc.name      testNdkQosEffect0001
     * @tc.desc      Checks the high QoS duration stays valid and stable across three samples.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkQosEffect0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkQosEffect0001 begin');
      const values: number[] = await sampleQos(true, SAMPLE_TIMES);
      const highMin: number = minOf(values);
      const highMax: number = maxOf(values);
      logInfo('high qos min = ' + highMin.toFixed(3) + ' ms, max = ' + highMax.toFixed(3) + ' ms');
      expect(values.length).assertEqual(SAMPLE_TIMES);
      expect(isDurationInRange(values[0])).assertTrue();
      expect(isDurationInRange(values[1])).assertTrue();
      expect(isDurationInRange(values[2])).assertTrue();
      expect(highMax <= highMin * INSTABILITY_RATIO).assertTrue();
      logInfo('testNdkQosEffect0001 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_EFFECT_0002
     * @tc.name      testNdkQosEffect0002
     * @tc.desc      Checks the low QoS duration stays valid and stable across three samples.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkQosEffect0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkQosEffect0002 begin');
      const values: number[] = await sampleQos(false, SAMPLE_TIMES);
      const lowMin: number = minOf(values);
      const lowMax: number = maxOf(values);
      logInfo('low qos min = ' + lowMin.toFixed(3) + ' ms, max = ' + lowMax.toFixed(3) + ' ms');
      expect(values.length).assertEqual(SAMPLE_TIMES);
      expect(isDurationInRange(values[0])).assertTrue();
      expect(isDurationInRange(values[1])).assertTrue();
      expect(isDurationInRange(values[2])).assertTrue();
      expect(lowMax <= lowMin * INSTABILITY_RATIO).assertTrue();
      logInfo('testNdkQosEffect0002 end');
    })

    /**
     * @tc.number    SUB_NDK_QOS_EFFECT_0003
     * @tc.name      testNdkQosEffect0003
     * @tc.desc      Checks the high QoS thread stays inside the allowed ratio of the low QoS thread.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testNdkQosEffect0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      logInfo('testNdkQosEffect0003 begin');
      const highValues: number[] = await sampleQos(true, 2);
      const lowValues: number[] = await sampleQos(false, 2);
      const highMin: number = minOf(highValues);
      const lowMin: number = minOf(lowValues);
      logInfo('high qos min = ' + highMin.toFixed(3) + ' ms, low qos min = ' + lowMin.toFixed(3) + ' ms');
      expect(highValues.length).assertEqual(2);
      expect(lowValues.length).assertEqual(2);
      expect(isDurationInRange(highMin)).assertTrue();
      expect(isDurationInRange(lowMin)).assertTrue();
      expect(highMin <= lowMin * HIGH_QOS_RATIO).assertTrue();
      logInfo('testNdkQosEffect0003 end');
    })
  })
}
