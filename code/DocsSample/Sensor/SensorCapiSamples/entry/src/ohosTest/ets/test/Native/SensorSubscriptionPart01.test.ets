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

export default function SensorSubscriptionPart01(): void {
  describe('SensorSubscriptionPart01', () => {
    beforeAll((): void => {
      hilog.info(0x0000, 'SensorCapiTest', 'Starting SensorSubscriptionPart01');
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
      hilog.info(0x0000, 'SensorCapiTest', 'Finished SensorSubscriptionPart01');
    });

    /**
     * @tc.name testSensorSubscriptionPart01Test0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART01_0100
     * @tc.desc Verify Subscriber stop at createSubscriber occurrence 0 with status 401 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart01Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 createSubscriber 0 401 3 2 1 0 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string = 'createSubscriber';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = 'create subscriber failed';
      expect(actualErrors).assertEqual(expectedErrors);
      const actualMessages: string = result.messages;
      const expectedMessages: string = '';
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
      const expectedWaitMs: number = 0;
      expect(actualWaitMs).assertEqual(expectedWaitMs);
      const actualConfiguredType: number = result.configuredType;
      const expectedConfiguredType: number = -1;
      expect(actualConfiguredType).assertEqual(expectedConfiguredType);
      const actualConfiguredInterval: number = result.configuredInterval;
      const expectedConfiguredInterval: number = -1;
      expect(actualConfiguredInterval).assertEqual(expectedConfiguredInterval);
      const actualCallbacks: number = result.callbacks;
      const expectedCallbacks: number = 0;
      expect(actualCallbacks).assertEqual(expectedCallbacks);
    });

    /**
     * @tc.name testSensorSubscriptionPart01Test0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART01_0200
     * @tc.desc Verify Subscriber stop at setCallback occurrence 0 with status 201 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart01Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 setCallback 0 201 3 2 1 0 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string = 'createSubscriber|setCallback|destroySubscriber';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = 'OH_SensorSubscriber_SetCallback failed';
      expect(actualErrors).assertEqual(expectedErrors);
      const actualMessages: string = result.messages;
      const expectedMessages: string = '';
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
      const expectedWaitMs: number = 0;
      expect(actualWaitMs).assertEqual(expectedWaitMs);
      const actualConfiguredType: number = result.configuredType;
      const expectedConfiguredType: number = -1;
      expect(actualConfiguredType).assertEqual(expectedConfiguredType);
      const actualConfiguredInterval: number = result.configuredInterval;
      const expectedConfiguredInterval: number = -1;
      expect(actualConfiguredInterval).assertEqual(expectedConfiguredInterval);
      const actualCallbacks: number = result.callbacks;
      const expectedCallbacks: number = 0;
      expect(actualCallbacks).assertEqual(expectedCallbacks);
    });

    /**
     * @tc.name testSensorSubscriptionPart01Test0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART01_0300
     * @tc.desc Verify Subscriber stop at setCallback occurrence 0 with status 401 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart01Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 setCallback 0 401 3 2 1 0 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string = 'createSubscriber|setCallback|destroySubscriber';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = 'OH_SensorSubscriber_SetCallback failed';
      expect(actualErrors).assertEqual(expectedErrors);
      const actualMessages: string = result.messages;
      const expectedMessages: string = '';
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
      const expectedWaitMs: number = 0;
      expect(actualWaitMs).assertEqual(expectedWaitMs);
      const actualConfiguredType: number = result.configuredType;
      const expectedConfiguredType: number = -1;
      expect(actualConfiguredType).assertEqual(expectedConfiguredType);
      const actualConfiguredInterval: number = result.configuredInterval;
      const expectedConfiguredInterval: number = -1;
      expect(actualConfiguredInterval).assertEqual(expectedConfiguredInterval);
      const actualCallbacks: number = result.callbacks;
      const expectedCallbacks: number = 0;
      expect(actualCallbacks).assertEqual(expectedCallbacks);
    });

    /**
     * @tc.name testSensorSubscriptionPart01Test0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART01_0400
     * @tc.desc Verify Subscriber stop at setCallback occurrence 0 with status 14500101 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart01Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 setCallback 0 14500101 3 2 1 0 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string = 'createSubscriber|setCallback|destroySubscriber';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = 'OH_SensorSubscriber_SetCallback failed';
      expect(actualErrors).assertEqual(expectedErrors);
      const actualMessages: string = result.messages;
      const expectedMessages: string = '';
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
      const expectedWaitMs: number = 0;
      expect(actualWaitMs).assertEqual(expectedWaitMs);
      const actualConfiguredType: number = result.configuredType;
      const expectedConfiguredType: number = -1;
      expect(actualConfiguredType).assertEqual(expectedConfiguredType);
      const actualConfiguredInterval: number = result.configuredInterval;
      const expectedConfiguredInterval: number = -1;
      expect(actualConfiguredInterval).assertEqual(expectedConfiguredInterval);
      const actualCallbacks: number = result.callbacks;
      const expectedCallbacks: number = 0;
      expect(actualCallbacks).assertEqual(expectedCallbacks);
    });

    /**
     * @tc.name testSensorSubscriptionPart01Test0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART01_0500
     * @tc.desc Verify Subscriber stop at createId occurrence 0 with status 401 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart01Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 createId 0 401 3 2 1 0 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string = 'createSubscriber|setCallback|createId|destroySubscriber';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = 'create subscription id failed';
      expect(actualErrors).assertEqual(expectedErrors);
      const actualMessages: string = result.messages;
      const expectedMessages: string = '';
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
      const expectedWaitMs: number = 0;
      expect(actualWaitMs).assertEqual(expectedWaitMs);
      const actualConfiguredType: number = result.configuredType;
      const expectedConfiguredType: number = -1;
      expect(actualConfiguredType).assertEqual(expectedConfiguredType);
      const actualConfiguredInterval: number = result.configuredInterval;
      const expectedConfiguredInterval: number = -1;
      expect(actualConfiguredInterval).assertEqual(expectedConfiguredInterval);
      const actualCallbacks: number = result.callbacks;
      const expectedCallbacks: number = 0;
      expect(actualCallbacks).assertEqual(expectedCallbacks);
    });

    /**
     * @tc.name testSensorSubscriptionPart01Test0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART01_0600
     * @tc.desc Verify Subscriber stop at setType occurrence 0 with status 201 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart01Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 setType 0 201 3 2 1 0 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string = 'createSubscriber|setCallback|createId|setType:1|destroyId|destroySubscriber';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = 'OH_SensorSubscriptionId_SetType failed';
      expect(actualErrors).assertEqual(expectedErrors);
      const actualMessages: string = result.messages;
      const expectedMessages: string = '';
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
      const expectedWaitMs: number = 0;
      expect(actualWaitMs).assertEqual(expectedWaitMs);
      const actualConfiguredType: number = result.configuredType;
      const expectedConfiguredType: number = 1;
      expect(actualConfiguredType).assertEqual(expectedConfiguredType);
      const actualConfiguredInterval: number = result.configuredInterval;
      const expectedConfiguredInterval: number = -1;
      expect(actualConfiguredInterval).assertEqual(expectedConfiguredInterval);
      const actualCallbacks: number = result.callbacks;
      const expectedCallbacks: number = 0;
      expect(actualCallbacks).assertEqual(expectedCallbacks);
    });

    /**
     * @tc.name testSensorSubscriptionPart01Test0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART01_0700
     * @tc.desc Verify Subscriber stop at setType occurrence 0 with status 401 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart01Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 setType 0 401 3 2 1 0 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string = 'createSubscriber|setCallback|createId|setType:1|destroyId|destroySubscriber';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = 'OH_SensorSubscriptionId_SetType failed';
      expect(actualErrors).assertEqual(expectedErrors);
      const actualMessages: string = result.messages;
      const expectedMessages: string = '';
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
      const expectedWaitMs: number = 0;
      expect(actualWaitMs).assertEqual(expectedWaitMs);
      const actualConfiguredType: number = result.configuredType;
      const expectedConfiguredType: number = 1;
      expect(actualConfiguredType).assertEqual(expectedConfiguredType);
      const actualConfiguredInterval: number = result.configuredInterval;
      const expectedConfiguredInterval: number = -1;
      expect(actualConfiguredInterval).assertEqual(expectedConfiguredInterval);
      const actualCallbacks: number = result.callbacks;
      const expectedCallbacks: number = 0;
      expect(actualCallbacks).assertEqual(expectedCallbacks);
    });

    /**
     * @tc.name testSensorSubscriptionPart01Test0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART01_0800
     * @tc.desc Verify Subscriber stop at setType occurrence 0 with status 14500101 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart01Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 setType 0 14500101 3 2 1 0 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string = 'createSubscriber|setCallback|createId|setType:1|destroyId|destroySubscriber';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = 'OH_SensorSubscriptionId_SetType failed';
      expect(actualErrors).assertEqual(expectedErrors);
      const actualMessages: string = result.messages;
      const expectedMessages: string = '';
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
      const expectedWaitMs: number = 0;
      expect(actualWaitMs).assertEqual(expectedWaitMs);
      const actualConfiguredType: number = result.configuredType;
      const expectedConfiguredType: number = 1;
      expect(actualConfiguredType).assertEqual(expectedConfiguredType);
      const actualConfiguredInterval: number = result.configuredInterval;
      const expectedConfiguredInterval: number = -1;
      expect(actualConfiguredInterval).assertEqual(expectedConfiguredInterval);
      const actualCallbacks: number = result.callbacks;
      const expectedCallbacks: number = 0;
      expect(actualCallbacks).assertEqual(expectedCallbacks);
    });

    /**
     * @tc.name testSensorSubscriptionPart01Test0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART01_0900
     * @tc.desc Verify Subscriber stop at createAttribute occurrence 0 with status 401 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart01Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 createAttribute 0 401 3 2 1 0 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'createSubscriber|setCallback|createId|setType:1|createAttribute|destroyId|destroySubscriber';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = 'create subscription attribute failed';
      expect(actualErrors).assertEqual(expectedErrors);
      const actualMessages: string = result.messages;
      const expectedMessages: string = '';
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
      const expectedWaitMs: number = 0;
      expect(actualWaitMs).assertEqual(expectedWaitMs);
      const actualConfiguredType: number = result.configuredType;
      const expectedConfiguredType: number = 1;
      expect(actualConfiguredType).assertEqual(expectedConfiguredType);
      const actualConfiguredInterval: number = result.configuredInterval;
      const expectedConfiguredInterval: number = -1;
      expect(actualConfiguredInterval).assertEqual(expectedConfiguredInterval);
      const actualCallbacks: number = result.callbacks;
      const expectedCallbacks: number = 0;
      expect(actualCallbacks).assertEqual(expectedCallbacks);
    });
  });
}
