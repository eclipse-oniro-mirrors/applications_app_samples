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

export default function SensorSubscriptionPart29(): void {
  describe('SensorSubscriptionPart29', () => {
    beforeAll((): void => {
      hilog.info(0x0000, 'SensorCapiTest', 'Starting SensorSubscriptionPart29');
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
      hilog.info(0x0000, 'SensorCapiTest', 'Finished SensorSubscriptionPart29');
    });

    /**
     * @tc.name testSensorSubscriptionPart29Test0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART29_0100
     * @tc.desc Verify Subscriber process 2 values with accuracy 0 type 258 seed 0 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart29Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 none 0 401 2 0 258 0 0 0';
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
        'sensorType:258, dataLen:2, accuracy:0|data[0]:0.000000|data[1]:-0.250000|OH_Sensor_Subscribe successful|OH_Sensor_Unsubscribe successful';
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
     * @tc.name testSensorSubscriptionPart29Test0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART29_0200
     * @tc.desc Verify Subscriber process 3 values with accuracy 0 type 258 seed 0 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart29Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 none 0 401 3 0 258 0 0 0';
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
        'sensorType:258, dataLen:3, accuracy:0|data[0]:0.000000|data[1]:-0.250000|data[2]:-0.500000|OH_Sensor_Subscribe successful|OH_Sensor_Unsubscribe successful';
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
     * @tc.name testSensorSubscriptionPart29Test0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART29_0300
     * @tc.desc Verify Subscriber process 4 values with accuracy 0 type 258 seed 0 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart29Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 none 0 401 4 0 258 0 0 0';
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
        'sensorType:258, dataLen:4, accuracy:0|data[0]:0.000000|data[1]:-0.250000|data[2]:-0.500000|data[3]:-0.750000|OH_Sensor_Subscribe successful|OH_Sensor_Unsubscribe successful';
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
     * @tc.name testSensorSubscriptionPart29Test0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART29_0400
     * @tc.desc Verify Subscriber process 8 values with accuracy 0 type 258 seed 0 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart29Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 none 0 401 8 0 258 0 0 0';
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
        'sensorType:258, dataLen:8, accuracy:0|data[0]:0.000000|data[1]:-0.250000|data[2]:-0.500000|data[3]:-0.750000|data[4]:-1.000000|data[5]:-1.250000|data[6]:-1.500000|data[7]:-1.750000|OH_Sensor_Subscribe successful|OH_Sensor_Unsubscribe successful';
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
     * @tc.name testSensorSubscriptionPart29Test0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART29_0500
     * @tc.desc Verify Subscriber process 16 values with accuracy 0 type 258 seed 0 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart29Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 none 0 401 16 0 258 0 0 0';
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
        'sensorType:258, dataLen:16, accuracy:0|data[0]:0.000000|data[1]:-0.250000|data[2]:-0.500000|data[3]:-0.750000|data[4]:-1.000000|data[5]:-1.250000|data[6]:-1.500000|data[7]:-1.750000|data[8]:-2.000000|data[9]:-2.250000|data[10]:-2.500000|data[11]:-2.750000|data[12]:-3.000000|data[13]:-3.250000|data[14]:-3.500000|data[15]:-3.750000|OH_Sensor_Subscribe successful|OH_Sensor_Unsubscribe successful';
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
     * @tc.name testSensorSubscriptionPart29Test0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART29_0600
     * @tc.desc Verify Subscriber process 32 values with accuracy 0 type 258 seed 0 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart29Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 none 0 401 32 0 258 0 0 0';
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
        'sensorType:258, dataLen:32, accuracy:0|data[0]:0.000000|data[1]:-0.250000|data[2]:-0.500000|data[3]:-0.750000|data[4]:-1.000000|data[5]:-1.250000|data[6]:-1.500000|data[7]:-1.750000|data[8]:-2.000000|data[9]:-2.250000|data[10]:-2.500000|data[11]:-2.750000|data[12]:-3.000000|data[13]:-3.250000|data[14]:-3.500000|data[15]:-3.750000|data[16]:-4.000000|data[17]:-4.250000|data[18]:-4.500000|data[19]:-4.750000|data[20]:-5.000000|data[21]:-5.250000|data[22]:-5.500000|data[23]:-5.750000|data[24]:-6.000000|data[25]:-6.250000|data[26]:-6.500000|data[27]:-6.750000|data[28]:-7.000000|data[29]:-7.250000|data[30]:-7.500000|data[31]:-7.750000|OH_Sensor_Subscribe successful|OH_Sensor_Unsubscribe successful';
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
     * @tc.name testSensorSubscriptionPart29Test0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART29_0700
     * @tc.desc Verify Subscriber process 64 values with accuracy 0 type 258 seed 0 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart29Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 none 0 401 64 0 258 0 0 0';
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
        'sensorType:258, dataLen:64, accuracy:0|data[0]:0.000000|data[1]:-0.250000|data[2]:-0.500000|data[3]:-0.750000|data[4]:-1.000000|data[5]:-1.250000|data[6]:-1.500000|data[7]:-1.750000|data[8]:-2.000000|data[9]:-2.250000|data[10]:-2.500000|data[11]:-2.750000|data[12]:-3.000000|data[13]:-3.250000|data[14]:-3.500000|data[15]:-3.750000|data[16]:-4.000000|data[17]:-4.250000|data[18]:-4.500000|data[19]:-4.750000|data[20]:-5.000000|data[21]:-5.250000|data[22]:-5.500000|data[23]:-5.750000|data[24]:-6.000000|data[25]:-6.250000|data[26]:-6.500000|data[27]:-6.750000|data[28]:-7.000000|data[29]:-7.250000|data[30]:-7.500000|data[31]:-7.750000|data[32]:-8.000000|data[33]:-8.250000|data[34]:-8.500000|data[35]:-8.750000|data[36]:-9.000000|data[37]:-9.250000|data[38]:-9.500000|data[39]:-9.750000|data[40]:-10.000000|data[41]:-10.250000|data[42]:-10.500000|data[43]:-10.750000|data[44]:-11.000000|data[45]:-11.250000|data[46]:-11.500000|data[47]:-11.750000|data[48]:-12.000000|data[49]:-12.250000|data[50]:-12.500000|data[51]:-12.750000|data[52]:-13.000000|data[53]:-13.250000|data[54]:-13.500000|data[55]:-13.750000|data[56]:-14.000000|data[57]:-14.250000|data[58]:-14.500000|data[59]:-14.750000|data[60]:-15.000000|data[61]:-15.250000|data[62]:-15.500000|data[63]:-15.750000|OH_Sensor_Subscribe successful|OH_Sensor_Unsubscribe successful';
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
     * @tc.name testSensorSubscriptionPart29Test0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART29_0800
     * @tc.desc Verify Subscriber process 0 values with accuracy 1 type 258 seed 0 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart29Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 none 0 401 0 1 258 0 0 0';
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
        'sensorType:258, dataLen:0, accuracy:1|OH_Sensor_Subscribe successful|OH_Sensor_Unsubscribe successful';
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
     * @tc.name testSensorSubscriptionPart29Test0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART29_0900
     * @tc.desc Verify Subscriber process 1 values with accuracy 1 type 258 seed 0 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart29Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 none 0 401 1 1 258 0 0 0';
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
        'sensorType:258, dataLen:1, accuracy:1|data[0]:0.000000|OH_Sensor_Subscribe successful|OH_Sensor_Unsubscribe successful';
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
     * @tc.name testSensorSubscriptionPart29Test0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART29_1000
     * @tc.desc Verify Subscriber process 2 values with accuracy 1 type 258 seed 0 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart29Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 none 0 401 2 1 258 0 0 0';
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
        'sensorType:258, dataLen:2, accuracy:1|data[0]:0.000000|data[1]:-0.250000|OH_Sensor_Subscribe successful|OH_Sensor_Unsubscribe successful';
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
     * @tc.name testSensorSubscriptionPart29Test0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART29_1100
     * @tc.desc Verify Subscriber process 3 values with accuracy 1 type 258 seed 0 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart29Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 none 0 401 3 1 258 0 0 0';
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
        'sensorType:258, dataLen:3, accuracy:1|data[0]:0.000000|data[1]:-0.250000|data[2]:-0.500000|OH_Sensor_Subscribe successful|OH_Sensor_Unsubscribe successful';
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
     * @tc.name testSensorSubscriptionPart29Test0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART29_1200
     * @tc.desc Verify Subscriber process 4 values with accuracy 1 type 258 seed 0 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart29Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 none 0 401 4 1 258 0 0 0';
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
        'sensorType:258, dataLen:4, accuracy:1|data[0]:0.000000|data[1]:-0.250000|data[2]:-0.500000|data[3]:-0.750000|OH_Sensor_Subscribe successful|OH_Sensor_Unsubscribe successful';
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
     * @tc.name testSensorSubscriptionPart29Test0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART29_1300
     * @tc.desc Verify Subscriber process 8 values with accuracy 1 type 258 seed 0 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart29Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 none 0 401 8 1 258 0 0 0';
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
        'sensorType:258, dataLen:8, accuracy:1|data[0]:0.000000|data[1]:-0.250000|data[2]:-0.500000|data[3]:-0.750000|data[4]:-1.000000|data[5]:-1.250000|data[6]:-1.500000|data[7]:-1.750000|OH_Sensor_Subscribe successful|OH_Sensor_Unsubscribe successful';
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
     * @tc.name testSensorSubscriptionPart29Test0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART29_1400
     * @tc.desc Verify Subscriber process 16 values with accuracy 1 type 258 seed 0 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart29Test0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 none 0 401 16 1 258 0 0 0';
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
        'sensorType:258, dataLen:16, accuracy:1|data[0]:0.000000|data[1]:-0.250000|data[2]:-0.500000|data[3]:-0.750000|data[4]:-1.000000|data[5]:-1.250000|data[6]:-1.500000|data[7]:-1.750000|data[8]:-2.000000|data[9]:-2.250000|data[10]:-2.500000|data[11]:-2.750000|data[12]:-3.000000|data[13]:-3.250000|data[14]:-3.500000|data[15]:-3.750000|OH_Sensor_Subscribe successful|OH_Sensor_Unsubscribe successful';
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
     * @tc.name testSensorSubscriptionPart29Test0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART29_1500
     * @tc.desc Verify Subscriber process 32 values with accuracy 1 type 258 seed 0 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart29Test0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 none 0 401 32 1 258 0 0 0';
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
        'sensorType:258, dataLen:32, accuracy:1|data[0]:0.000000|data[1]:-0.250000|data[2]:-0.500000|data[3]:-0.750000|data[4]:-1.000000|data[5]:-1.250000|data[6]:-1.500000|data[7]:-1.750000|data[8]:-2.000000|data[9]:-2.250000|data[10]:-2.500000|data[11]:-2.750000|data[12]:-3.000000|data[13]:-3.250000|data[14]:-3.500000|data[15]:-3.750000|data[16]:-4.000000|data[17]:-4.250000|data[18]:-4.500000|data[19]:-4.750000|data[20]:-5.000000|data[21]:-5.250000|data[22]:-5.500000|data[23]:-5.750000|data[24]:-6.000000|data[25]:-6.250000|data[26]:-6.500000|data[27]:-6.750000|data[28]:-7.000000|data[29]:-7.250000|data[30]:-7.500000|data[31]:-7.750000|OH_Sensor_Subscribe successful|OH_Sensor_Unsubscribe successful';
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
     * @tc.name testSensorSubscriptionPart29Test0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART29_1600
     * @tc.desc Verify Subscriber process 64 values with accuracy 1 type 258 seed 0 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart29Test0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 none 0 401 64 1 258 0 0 0';
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
        'sensorType:258, dataLen:64, accuracy:1|data[0]:0.000000|data[1]:-0.250000|data[2]:-0.500000|data[3]:-0.750000|data[4]:-1.000000|data[5]:-1.250000|data[6]:-1.500000|data[7]:-1.750000|data[8]:-2.000000|data[9]:-2.250000|data[10]:-2.500000|data[11]:-2.750000|data[12]:-3.000000|data[13]:-3.250000|data[14]:-3.500000|data[15]:-3.750000|data[16]:-4.000000|data[17]:-4.250000|data[18]:-4.500000|data[19]:-4.750000|data[20]:-5.000000|data[21]:-5.250000|data[22]:-5.500000|data[23]:-5.750000|data[24]:-6.000000|data[25]:-6.250000|data[26]:-6.500000|data[27]:-6.750000|data[28]:-7.000000|data[29]:-7.250000|data[30]:-7.500000|data[31]:-7.750000|data[32]:-8.000000|data[33]:-8.250000|data[34]:-8.500000|data[35]:-8.750000|data[36]:-9.000000|data[37]:-9.250000|data[38]:-9.500000|data[39]:-9.750000|data[40]:-10.000000|data[41]:-10.250000|data[42]:-10.500000|data[43]:-10.750000|data[44]:-11.000000|data[45]:-11.250000|data[46]:-11.500000|data[47]:-11.750000|data[48]:-12.000000|data[49]:-12.250000|data[50]:-12.500000|data[51]:-12.750000|data[52]:-13.000000|data[53]:-13.250000|data[54]:-13.500000|data[55]:-13.750000|data[56]:-14.000000|data[57]:-14.250000|data[58]:-14.500000|data[59]:-14.750000|data[60]:-15.000000|data[61]:-15.250000|data[62]:-15.500000|data[63]:-15.750000|OH_Sensor_Subscribe successful|OH_Sensor_Unsubscribe successful';
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
     * @tc.name testSensorSubscriptionPart29Test0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART29_1700
     * @tc.desc Verify Subscriber process 0 values with accuracy 2 type 258 seed 0 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart29Test0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 none 0 401 0 2 258 0 0 0';
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
        'sensorType:258, dataLen:0, accuracy:2|OH_Sensor_Subscribe successful|OH_Sensor_Unsubscribe successful';
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
     * @tc.name testSensorSubscriptionPart29Test0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART29_1800
     * @tc.desc Verify Subscriber process 1 values with accuracy 2 type 258 seed 0 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart29Test0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 none 0 401 1 2 258 0 0 0';
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
        'sensorType:258, dataLen:1, accuracy:2|data[0]:0.000000|OH_Sensor_Subscribe successful|OH_Sensor_Unsubscribe successful';
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
     * @tc.name testSensorSubscriptionPart29Test0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART29_1900
     * @tc.desc Verify Subscriber process 2 values with accuracy 2 type 258 seed 0 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart29Test0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 none 0 401 2 2 258 0 0 0';
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
        'sensorType:258, dataLen:2, accuracy:2|data[0]:0.000000|data[1]:-0.250000|OH_Sensor_Subscribe successful|OH_Sensor_Unsubscribe successful';
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
     * @tc.name testSensorSubscriptionPart29Test0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART29_2000
     * @tc.desc Verify Subscriber process 3 values with accuracy 2 type 258 seed 0 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart29Test0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 none 0 401 3 2 258 0 0 0';
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
        'sensorType:258, dataLen:3, accuracy:2|data[0]:0.000000|data[1]:-0.250000|data[2]:-0.500000|OH_Sensor_Subscribe successful|OH_Sensor_Unsubscribe successful';
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
     * @tc.name testSensorSubscriptionPart29Test0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART29_2100
     * @tc.desc Verify Subscriber process 4 values with accuracy 2 type 258 seed 0 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart29Test0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 none 0 401 4 2 258 0 0 0';
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
        'sensorType:258, dataLen:4, accuracy:2|data[0]:0.000000|data[1]:-0.250000|data[2]:-0.500000|data[3]:-0.750000|OH_Sensor_Subscribe successful|OH_Sensor_Unsubscribe successful';
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
     * @tc.name testSensorSubscriptionPart29Test0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART29_2200
     * @tc.desc Verify Subscriber process 8 values with accuracy 2 type 258 seed 0 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart29Test0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 none 0 401 8 2 258 0 0 0';
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
        'sensorType:258, dataLen:8, accuracy:2|data[0]:0.000000|data[1]:-0.250000|data[2]:-0.500000|data[3]:-0.750000|data[4]:-1.000000|data[5]:-1.250000|data[6]:-1.500000|data[7]:-1.750000|OH_Sensor_Subscribe successful|OH_Sensor_Unsubscribe successful';
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
     * @tc.name testSensorSubscriptionPart29Test0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART29_2300
     * @tc.desc Verify Subscriber process 16 values with accuracy 2 type 258 seed 0 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart29Test0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 none 0 401 16 2 258 0 0 0';
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
        'sensorType:258, dataLen:16, accuracy:2|data[0]:0.000000|data[1]:-0.250000|data[2]:-0.500000|data[3]:-0.750000|data[4]:-1.000000|data[5]:-1.250000|data[6]:-1.500000|data[7]:-1.750000|data[8]:-2.000000|data[9]:-2.250000|data[10]:-2.500000|data[11]:-2.750000|data[12]:-3.000000|data[13]:-3.250000|data[14]:-3.500000|data[15]:-3.750000|OH_Sensor_Subscribe successful|OH_Sensor_Unsubscribe successful';
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
     * @tc.name testSensorSubscriptionPart29Test0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART29_2400
     * @tc.desc Verify Subscriber process 32 values with accuracy 2 type 258 seed 0 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart29Test0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 none 0 401 32 2 258 0 0 0';
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
        'sensorType:258, dataLen:32, accuracy:2|data[0]:0.000000|data[1]:-0.250000|data[2]:-0.500000|data[3]:-0.750000|data[4]:-1.000000|data[5]:-1.250000|data[6]:-1.500000|data[7]:-1.750000|data[8]:-2.000000|data[9]:-2.250000|data[10]:-2.500000|data[11]:-2.750000|data[12]:-3.000000|data[13]:-3.250000|data[14]:-3.500000|data[15]:-3.750000|data[16]:-4.000000|data[17]:-4.250000|data[18]:-4.500000|data[19]:-4.750000|data[20]:-5.000000|data[21]:-5.250000|data[22]:-5.500000|data[23]:-5.750000|data[24]:-6.000000|data[25]:-6.250000|data[26]:-6.500000|data[27]:-6.750000|data[28]:-7.000000|data[29]:-7.250000|data[30]:-7.500000|data[31]:-7.750000|OH_Sensor_Subscribe successful|OH_Sensor_Unsubscribe successful';
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
     * @tc.name testSensorSubscriptionPart29Test0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_SUBSCRIPTION_PART29_2500
     * @tc.desc Verify Subscriber process 64 values with accuracy 2 type 258 seed 0 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorSubscriptionPart29Test0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'subscription 1 none 0 401 64 2 258 0 0 0';
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
        'sensorType:258, dataLen:64, accuracy:2|data[0]:0.000000|data[1]:-0.250000|data[2]:-0.500000|data[3]:-0.750000|data[4]:-1.000000|data[5]:-1.250000|data[6]:-1.500000|data[7]:-1.750000|data[8]:-2.000000|data[9]:-2.250000|data[10]:-2.500000|data[11]:-2.750000|data[12]:-3.000000|data[13]:-3.250000|data[14]:-3.500000|data[15]:-3.750000|data[16]:-4.000000|data[17]:-4.250000|data[18]:-4.500000|data[19]:-4.750000|data[20]:-5.000000|data[21]:-5.250000|data[22]:-5.500000|data[23]:-5.750000|data[24]:-6.000000|data[25]:-6.250000|data[26]:-6.500000|data[27]:-6.750000|data[28]:-7.000000|data[29]:-7.250000|data[30]:-7.500000|data[31]:-7.750000|data[32]:-8.000000|data[33]:-8.250000|data[34]:-8.500000|data[35]:-8.750000|data[36]:-9.000000|data[37]:-9.250000|data[38]:-9.500000|data[39]:-9.750000|data[40]:-10.000000|data[41]:-10.250000|data[42]:-10.500000|data[43]:-10.750000|data[44]:-11.000000|data[45]:-11.250000|data[46]:-11.500000|data[47]:-11.750000|data[48]:-12.000000|data[49]:-12.250000|data[50]:-12.500000|data[51]:-12.750000|data[52]:-13.000000|data[53]:-13.250000|data[54]:-13.500000|data[55]:-13.750000|data[56]:-14.000000|data[57]:-14.250000|data[58]:-14.500000|data[59]:-14.750000|data[60]:-15.000000|data[61]:-15.250000|data[62]:-15.500000|data[63]:-15.750000|OH_Sensor_Subscribe successful|OH_Sensor_Unsubscribe successful';
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
