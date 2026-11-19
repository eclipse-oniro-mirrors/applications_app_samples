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

import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, TestType, Size, Level } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import { NativeObservation, runNativeScenario } from '../Shared/NativeFixture';

export default function SensorSubscriptionPart24(): void {
  describe('SensorSubscriptionPart24', () => {
    beforeAll((): void => {
      hilog.info(0x0000, 'SensorCapiTest', 'Starting SensorSubscriptionPart24');
    });
    beforeEach(async (): Promise<void> => {
      /* Yield between scenarios so the device UI watchdog can observe a responsive main thread. */
      await new Promise<void>((resolve): void => {
        setTimeout(resolve, 20);
      });
      hilog.debug(0x0000, 'SensorCapiTest', 'Starting isolated native scenario');
    });
    afterEach((): void => {
      hilog.debug(0x0000, 'SensorCapiTest', 'Finished isolated native scenario');
    });
    afterAll((): void => {
      hilog.info(0x0000, 'SensorCapiTest', 'Finished SensorSubscriptionPart24');
    });

    /**
     * @tc.name testSensorSubscriptionPart24Test0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART24_0100
     * @tc.desc Verify Subscriber process 2 values with accuracy 0 type 256 seed 0 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart24Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 none 0 401 2 0 256 0 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'createSubscriber|setCallback|createId|setType:1|createAttribute|setInterval:200000000|subscribe|timestamp|eventType|accuracy|data|wait:1000|unsubscribe|destroyAttribute|destroyId|destroySubscriber';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = '';
      expect(actualErrors).assertEqual(expectedErrors);
      const actualMessages: string = result.messages;
      const expectedMessages: string =
        'sensorType:256, dataLen:2, accuracy:0|data[0]:0.000000|data[1]:-0.250000|OH_Sensor_Subscribe successful|OH_Sensor_Unsubscribe successful';
      expect(actualMessages).assertEqual(expectedMessages);
      const actualLiveResources: number = result.liveResources;
      const expectedLiveResources: number = 0;
      expect(actualLiveResources).assertEqual(expectedLiveResources);
      const actualActiveSubscriptions: number = result.activeSubscriptions;
      const expectedActiveSubscriptions: number = 0;
      expect(actualActiveSubscriptions).assertEqual(expectedActiveSubscriptions);
      const actualViolations: number = result.violations;
      const expectedViolations: number = 0;
      expect(actualViolations).assertEqual(expectedViolations);
      const actualWaitMs: number = result.waitMs;
      const expectedWaitMs: number = 1000;
      expect(actualWaitMs).assertEqual(expectedWaitMs);
      const actualConfiguredType: number = result.configuredType;
      const expectedConfiguredType: number = 1;
      expect(actualConfiguredType).assertEqual(expectedConfiguredType);
      const actualConfiguredInterval: number = result.configuredInterval;
      const expectedConfiguredInterval: number = 200000000;
      expect(actualConfiguredInterval).assertEqual(expectedConfiguredInterval);
      const actualCallbacks: number = result.callbacks;
      const expectedCallbacks: number = 1;
      expect(actualCallbacks).assertEqual(expectedCallbacks);
    });

    /**
     * @tc.name testSensorSubscriptionPart24Test0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART24_0200
     * @tc.desc Verify Subscriber process 3 values with accuracy 0 type 256 seed 0 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart24Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 none 0 401 3 0 256 0 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'createSubscriber|setCallback|createId|setType:1|createAttribute|setInterval:200000000|subscribe|timestamp|eventType|accuracy|data|wait:1000|unsubscribe|destroyAttribute|destroyId|destroySubscriber';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = '';
      expect(actualErrors).assertEqual(expectedErrors);
      const actualMessages: string = result.messages;
      const expectedMessages: string =
        'sensorType:256, dataLen:3, accuracy:0|data[0]:0.000000|data[1]:-0.250000|data[2]:-0.500000|OH_Sensor_Subscribe successful|OH_Sensor_Unsubscribe successful';
      expect(actualMessages).assertEqual(expectedMessages);
      const actualLiveResources: number = result.liveResources;
      const expectedLiveResources: number = 0;
      expect(actualLiveResources).assertEqual(expectedLiveResources);
      const actualActiveSubscriptions: number = result.activeSubscriptions;
      const expectedActiveSubscriptions: number = 0;
      expect(actualActiveSubscriptions).assertEqual(expectedActiveSubscriptions);
      const actualViolations: number = result.violations;
      const expectedViolations: number = 0;
      expect(actualViolations).assertEqual(expectedViolations);
      const actualWaitMs: number = result.waitMs;
      const expectedWaitMs: number = 1000;
      expect(actualWaitMs).assertEqual(expectedWaitMs);
      const actualConfiguredType: number = result.configuredType;
      const expectedConfiguredType: number = 1;
      expect(actualConfiguredType).assertEqual(expectedConfiguredType);
      const actualConfiguredInterval: number = result.configuredInterval;
      const expectedConfiguredInterval: number = 200000000;
      expect(actualConfiguredInterval).assertEqual(expectedConfiguredInterval);
      const actualCallbacks: number = result.callbacks;
      const expectedCallbacks: number = 1;
      expect(actualCallbacks).assertEqual(expectedCallbacks);
    });

    /**
     * @tc.name testSensorSubscriptionPart24Test0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART24_0300
     * @tc.desc Verify Subscriber process 4 values with accuracy 0 type 256 seed 0 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart24Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 none 0 401 4 0 256 0 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'createSubscriber|setCallback|createId|setType:1|createAttribute|setInterval:200000000|subscribe|timestamp|eventType|accuracy|data|wait:1000|unsubscribe|destroyAttribute|destroyId|destroySubscriber';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = '';
      expect(actualErrors).assertEqual(expectedErrors);
      const actualMessages: string = result.messages;
      const expectedMessages: string =
        'sensorType:256, dataLen:4, accuracy:0|data[0]:0.000000|data[1]:-0.250000|data[2]:-0.500000|data[3]:-0.750000|OH_Sensor_Subscribe successful|OH_Sensor_Unsubscribe successful';
      expect(actualMessages).assertEqual(expectedMessages);
      const actualLiveResources: number = result.liveResources;
      const expectedLiveResources: number = 0;
      expect(actualLiveResources).assertEqual(expectedLiveResources);
      const actualActiveSubscriptions: number = result.activeSubscriptions;
      const expectedActiveSubscriptions: number = 0;
      expect(actualActiveSubscriptions).assertEqual(expectedActiveSubscriptions);
      const actualViolations: number = result.violations;
      const expectedViolations: number = 0;
      expect(actualViolations).assertEqual(expectedViolations);
      const actualWaitMs: number = result.waitMs;
      const expectedWaitMs: number = 1000;
      expect(actualWaitMs).assertEqual(expectedWaitMs);
      const actualConfiguredType: number = result.configuredType;
      const expectedConfiguredType: number = 1;
      expect(actualConfiguredType).assertEqual(expectedConfiguredType);
      const actualConfiguredInterval: number = result.configuredInterval;
      const expectedConfiguredInterval: number = 200000000;
      expect(actualConfiguredInterval).assertEqual(expectedConfiguredInterval);
      const actualCallbacks: number = result.callbacks;
      const expectedCallbacks: number = 1;
      expect(actualCallbacks).assertEqual(expectedCallbacks);
    });
  });
}
