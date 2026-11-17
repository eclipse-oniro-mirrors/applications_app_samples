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

export default function SensorEnumerationPart20(): void {
  describe('SensorEnumerationPart20', () => {
    beforeAll((): void => {
      hilog.info(0x0000, 'SensorCapiTest', 'Starting SensorEnumerationPart20');
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
      hilog.info(0x0000, 'SensorCapiTest', 'Finished SensorEnumerationPart20');
    });

    /**
     * @tc.name testSensorEnumerationPart20Test0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART20_0100
     * @tc.desc Verify GetSensorInfos stop at maximum occurrence 16 with status 401 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart20Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 32 maximum 16 401 3 2 1 62 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'count|createInfos:32|infos|name:0|vendor:0|infoType:0|resolution:0|minimum:0|maximum:0|name:1|vendor:1|infoType:1|resolution:1|minimum:1|maximum:1|name:2|vendor:2|infoType:2|resolution:2|minimum:2|maximum:2|name:3|vendor:3|infoType:3|resolution:3|minimum:3|maximum:3|name:4|vendor:4|infoType:4|resolution:4|minimum:4|maximum:4|name:5|vendor:5|infoType:5|resolution:5|minimum:5|maximum:5|name:6|vendor:6|infoType:6|resolution:6|minimum:6|maximum:6|name:7|vendor:7|infoType:7|resolution:7|minimum:7|maximum:7|name:8|vendor:8|infoType:8|resolution:8|minimum:8|maximum:8|name:9|vendor:9|infoType:9|resolution:9|minimum:9|maximum:9|name:10|vendor:10|infoType:10|resolution:10|minimum:10|maximum:10|name:11|vendor:11|infoType:11|resolution:11|minimum:11|maximum:11|name:12|vendor:12|infoType:12|resolution:12|minimum:12|maximum:12|name:13|vendor:13|infoType:13|resolution:13|minimum:13|maximum:13|name:14|vendor:14|infoType:14|resolution:14|minimum:14|maximum:14|name:15|vendor:15|infoType:15|resolution:15|minimum:15|maximum:15|name:16|vendor:16|infoType:16|resolution:16|minimum:16|maximum:16|destroyInfos:32';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = 'get sensor max sampling interval failed|get sensor info failed';
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
     * @tc.name testSensorEnumerationPart20Test0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART20_0200
     * @tc.desc Verify GetSensorInfos stop at maximum occurrence 16 with status 14500101 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart20Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 32 maximum 16 14500101 3 2 1 62 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'count|createInfos:32|infos|name:0|vendor:0|infoType:0|resolution:0|minimum:0|maximum:0|name:1|vendor:1|infoType:1|resolution:1|minimum:1|maximum:1|name:2|vendor:2|infoType:2|resolution:2|minimum:2|maximum:2|name:3|vendor:3|infoType:3|resolution:3|minimum:3|maximum:3|name:4|vendor:4|infoType:4|resolution:4|minimum:4|maximum:4|name:5|vendor:5|infoType:5|resolution:5|minimum:5|maximum:5|name:6|vendor:6|infoType:6|resolution:6|minimum:6|maximum:6|name:7|vendor:7|infoType:7|resolution:7|minimum:7|maximum:7|name:8|vendor:8|infoType:8|resolution:8|minimum:8|maximum:8|name:9|vendor:9|infoType:9|resolution:9|minimum:9|maximum:9|name:10|vendor:10|infoType:10|resolution:10|minimum:10|maximum:10|name:11|vendor:11|infoType:11|resolution:11|minimum:11|maximum:11|name:12|vendor:12|infoType:12|resolution:12|minimum:12|maximum:12|name:13|vendor:13|infoType:13|resolution:13|minimum:13|maximum:13|name:14|vendor:14|infoType:14|resolution:14|minimum:14|maximum:14|name:15|vendor:15|infoType:15|resolution:15|minimum:15|maximum:15|name:16|vendor:16|infoType:16|resolution:16|minimum:16|maximum:16|destroyInfos:32';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = 'get sensor max sampling interval failed|get sensor info failed';
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
     * @tc.name testSensorEnumerationPart20Test0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART20_0300
     * @tc.desc Verify GetSensorInfos stop at name occurrence 31 with status 201 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart20Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 32 name 31 201 3 2 1 62 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'count|createInfos:32|infos|name:0|vendor:0|infoType:0|resolution:0|minimum:0|maximum:0|name:1|vendor:1|infoType:1|resolution:1|minimum:1|maximum:1|name:2|vendor:2|infoType:2|resolution:2|minimum:2|maximum:2|name:3|vendor:3|infoType:3|resolution:3|minimum:3|maximum:3|name:4|vendor:4|infoType:4|resolution:4|minimum:4|maximum:4|name:5|vendor:5|infoType:5|resolution:5|minimum:5|maximum:5|name:6|vendor:6|infoType:6|resolution:6|minimum:6|maximum:6|name:7|vendor:7|infoType:7|resolution:7|minimum:7|maximum:7|name:8|vendor:8|infoType:8|resolution:8|minimum:8|maximum:8|name:9|vendor:9|infoType:9|resolution:9|minimum:9|maximum:9|name:10|vendor:10|infoType:10|resolution:10|minimum:10|maximum:10|name:11|vendor:11|infoType:11|resolution:11|minimum:11|maximum:11|name:12|vendor:12|infoType:12|resolution:12|minimum:12|maximum:12|name:13|vendor:13|infoType:13|resolution:13|minimum:13|maximum:13|name:14|vendor:14|infoType:14|resolution:14|minimum:14|maximum:14|name:15|vendor:15|infoType:15|resolution:15|minimum:15|maximum:15|name:16|vendor:16|infoType:16|resolution:16|minimum:16|maximum:16|name:17|vendor:17|infoType:17|resolution:17|minimum:17|maximum:17|name:18|vendor:18|infoType:18|resolution:18|minimum:18|maximum:18|name:19|vendor:19|infoType:19|resolution:19|minimum:19|maximum:19|name:20|vendor:20|infoType:20|resolution:20|minimum:20|maximum:20|name:21|vendor:21|infoType:21|resolution:21|minimum:21|maximum:21|name:22|vendor:22|infoType:22|resolution:22|minimum:22|maximum:22|name:23|vendor:23|infoType:23|resolution:23|minimum:23|maximum:23|name:24|vendor:24|infoType:24|resolution:24|minimum:24|maximum:24|name:25|vendor:25|infoType:25|resolution:25|minimum:25|maximum:25|name:26|vendor:26|infoType:26|resolution:26|minimum:26|maximum:26|name:27|vendor:27|infoType:27|resolution:27|minimum:27|maximum:27|name:28|vendor:28|infoType:28|resolution:28|minimum:28|maximum:28|name:29|vendor:29|infoType:29|resolution:29|minimum:29|maximum:29|name:30|vendor:30|infoType:30|resolution:30|minimum:30|maximum:30|name:31|destroyInfos:32';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = 'get sensor name failed|get sensor info failed';
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
     * @tc.name testSensorEnumerationPart20Test0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART20_0400
     * @tc.desc Verify GetSensorInfos stop at name occurrence 31 with status 401 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart20Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 32 name 31 401 3 2 1 62 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'count|createInfos:32|infos|name:0|vendor:0|infoType:0|resolution:0|minimum:0|maximum:0|name:1|vendor:1|infoType:1|resolution:1|minimum:1|maximum:1|name:2|vendor:2|infoType:2|resolution:2|minimum:2|maximum:2|name:3|vendor:3|infoType:3|resolution:3|minimum:3|maximum:3|name:4|vendor:4|infoType:4|resolution:4|minimum:4|maximum:4|name:5|vendor:5|infoType:5|resolution:5|minimum:5|maximum:5|name:6|vendor:6|infoType:6|resolution:6|minimum:6|maximum:6|name:7|vendor:7|infoType:7|resolution:7|minimum:7|maximum:7|name:8|vendor:8|infoType:8|resolution:8|minimum:8|maximum:8|name:9|vendor:9|infoType:9|resolution:9|minimum:9|maximum:9|name:10|vendor:10|infoType:10|resolution:10|minimum:10|maximum:10|name:11|vendor:11|infoType:11|resolution:11|minimum:11|maximum:11|name:12|vendor:12|infoType:12|resolution:12|minimum:12|maximum:12|name:13|vendor:13|infoType:13|resolution:13|minimum:13|maximum:13|name:14|vendor:14|infoType:14|resolution:14|minimum:14|maximum:14|name:15|vendor:15|infoType:15|resolution:15|minimum:15|maximum:15|name:16|vendor:16|infoType:16|resolution:16|minimum:16|maximum:16|name:17|vendor:17|infoType:17|resolution:17|minimum:17|maximum:17|name:18|vendor:18|infoType:18|resolution:18|minimum:18|maximum:18|name:19|vendor:19|infoType:19|resolution:19|minimum:19|maximum:19|name:20|vendor:20|infoType:20|resolution:20|minimum:20|maximum:20|name:21|vendor:21|infoType:21|resolution:21|minimum:21|maximum:21|name:22|vendor:22|infoType:22|resolution:22|minimum:22|maximum:22|name:23|vendor:23|infoType:23|resolution:23|minimum:23|maximum:23|name:24|vendor:24|infoType:24|resolution:24|minimum:24|maximum:24|name:25|vendor:25|infoType:25|resolution:25|minimum:25|maximum:25|name:26|vendor:26|infoType:26|resolution:26|minimum:26|maximum:26|name:27|vendor:27|infoType:27|resolution:27|minimum:27|maximum:27|name:28|vendor:28|infoType:28|resolution:28|minimum:28|maximum:28|name:29|vendor:29|infoType:29|resolution:29|minimum:29|maximum:29|name:30|vendor:30|infoType:30|resolution:30|minimum:30|maximum:30|name:31|destroyInfos:32';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = 'get sensor name failed|get sensor info failed';
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
     * @tc.name testSensorEnumerationPart20Test0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART20_0500
     * @tc.desc Verify GetSensorInfos stop at name occurrence 31 with status 14500101 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart20Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 32 name 31 14500101 3 2 1 62 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'count|createInfos:32|infos|name:0|vendor:0|infoType:0|resolution:0|minimum:0|maximum:0|name:1|vendor:1|infoType:1|resolution:1|minimum:1|maximum:1|name:2|vendor:2|infoType:2|resolution:2|minimum:2|maximum:2|name:3|vendor:3|infoType:3|resolution:3|minimum:3|maximum:3|name:4|vendor:4|infoType:4|resolution:4|minimum:4|maximum:4|name:5|vendor:5|infoType:5|resolution:5|minimum:5|maximum:5|name:6|vendor:6|infoType:6|resolution:6|minimum:6|maximum:6|name:7|vendor:7|infoType:7|resolution:7|minimum:7|maximum:7|name:8|vendor:8|infoType:8|resolution:8|minimum:8|maximum:8|name:9|vendor:9|infoType:9|resolution:9|minimum:9|maximum:9|name:10|vendor:10|infoType:10|resolution:10|minimum:10|maximum:10|name:11|vendor:11|infoType:11|resolution:11|minimum:11|maximum:11|name:12|vendor:12|infoType:12|resolution:12|minimum:12|maximum:12|name:13|vendor:13|infoType:13|resolution:13|minimum:13|maximum:13|name:14|vendor:14|infoType:14|resolution:14|minimum:14|maximum:14|name:15|vendor:15|infoType:15|resolution:15|minimum:15|maximum:15|name:16|vendor:16|infoType:16|resolution:16|minimum:16|maximum:16|name:17|vendor:17|infoType:17|resolution:17|minimum:17|maximum:17|name:18|vendor:18|infoType:18|resolution:18|minimum:18|maximum:18|name:19|vendor:19|infoType:19|resolution:19|minimum:19|maximum:19|name:20|vendor:20|infoType:20|resolution:20|minimum:20|maximum:20|name:21|vendor:21|infoType:21|resolution:21|minimum:21|maximum:21|name:22|vendor:22|infoType:22|resolution:22|minimum:22|maximum:22|name:23|vendor:23|infoType:23|resolution:23|minimum:23|maximum:23|name:24|vendor:24|infoType:24|resolution:24|minimum:24|maximum:24|name:25|vendor:25|infoType:25|resolution:25|minimum:25|maximum:25|name:26|vendor:26|infoType:26|resolution:26|minimum:26|maximum:26|name:27|vendor:27|infoType:27|resolution:27|minimum:27|maximum:27|name:28|vendor:28|infoType:28|resolution:28|minimum:28|maximum:28|name:29|vendor:29|infoType:29|resolution:29|minimum:29|maximum:29|name:30|vendor:30|infoType:30|resolution:30|minimum:30|maximum:30|name:31|destroyInfos:32';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = 'get sensor name failed|get sensor info failed';
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
     * @tc.name testSensorEnumerationPart20Test0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART20_0600
     * @tc.desc Verify GetSensorInfos stop at vendor occurrence 31 with status 201 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart20Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 32 vendor 31 201 3 2 1 62 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'count|createInfos:32|infos|name:0|vendor:0|infoType:0|resolution:0|minimum:0|maximum:0|name:1|vendor:1|infoType:1|resolution:1|minimum:1|maximum:1|name:2|vendor:2|infoType:2|resolution:2|minimum:2|maximum:2|name:3|vendor:3|infoType:3|resolution:3|minimum:3|maximum:3|name:4|vendor:4|infoType:4|resolution:4|minimum:4|maximum:4|name:5|vendor:5|infoType:5|resolution:5|minimum:5|maximum:5|name:6|vendor:6|infoType:6|resolution:6|minimum:6|maximum:6|name:7|vendor:7|infoType:7|resolution:7|minimum:7|maximum:7|name:8|vendor:8|infoType:8|resolution:8|minimum:8|maximum:8|name:9|vendor:9|infoType:9|resolution:9|minimum:9|maximum:9|name:10|vendor:10|infoType:10|resolution:10|minimum:10|maximum:10|name:11|vendor:11|infoType:11|resolution:11|minimum:11|maximum:11|name:12|vendor:12|infoType:12|resolution:12|minimum:12|maximum:12|name:13|vendor:13|infoType:13|resolution:13|minimum:13|maximum:13|name:14|vendor:14|infoType:14|resolution:14|minimum:14|maximum:14|name:15|vendor:15|infoType:15|resolution:15|minimum:15|maximum:15|name:16|vendor:16|infoType:16|resolution:16|minimum:16|maximum:16|name:17|vendor:17|infoType:17|resolution:17|minimum:17|maximum:17|name:18|vendor:18|infoType:18|resolution:18|minimum:18|maximum:18|name:19|vendor:19|infoType:19|resolution:19|minimum:19|maximum:19|name:20|vendor:20|infoType:20|resolution:20|minimum:20|maximum:20|name:21|vendor:21|infoType:21|resolution:21|minimum:21|maximum:21|name:22|vendor:22|infoType:22|resolution:22|minimum:22|maximum:22|name:23|vendor:23|infoType:23|resolution:23|minimum:23|maximum:23|name:24|vendor:24|infoType:24|resolution:24|minimum:24|maximum:24|name:25|vendor:25|infoType:25|resolution:25|minimum:25|maximum:25|name:26|vendor:26|infoType:26|resolution:26|minimum:26|maximum:26|name:27|vendor:27|infoType:27|resolution:27|minimum:27|maximum:27|name:28|vendor:28|infoType:28|resolution:28|minimum:28|maximum:28|name:29|vendor:29|infoType:29|resolution:29|minimum:29|maximum:29|name:30|vendor:30|infoType:30|resolution:30|minimum:30|maximum:30|name:31|vendor:31|destroyInfos:32';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = 'get sensor vendor name failed|get sensor info failed';
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
     * @tc.name testSensorEnumerationPart20Test0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART20_0700
     * @tc.desc Verify GetSensorInfos stop at vendor occurrence 31 with status 401 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart20Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 32 vendor 31 401 3 2 1 62 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'count|createInfos:32|infos|name:0|vendor:0|infoType:0|resolution:0|minimum:0|maximum:0|name:1|vendor:1|infoType:1|resolution:1|minimum:1|maximum:1|name:2|vendor:2|infoType:2|resolution:2|minimum:2|maximum:2|name:3|vendor:3|infoType:3|resolution:3|minimum:3|maximum:3|name:4|vendor:4|infoType:4|resolution:4|minimum:4|maximum:4|name:5|vendor:5|infoType:5|resolution:5|minimum:5|maximum:5|name:6|vendor:6|infoType:6|resolution:6|minimum:6|maximum:6|name:7|vendor:7|infoType:7|resolution:7|minimum:7|maximum:7|name:8|vendor:8|infoType:8|resolution:8|minimum:8|maximum:8|name:9|vendor:9|infoType:9|resolution:9|minimum:9|maximum:9|name:10|vendor:10|infoType:10|resolution:10|minimum:10|maximum:10|name:11|vendor:11|infoType:11|resolution:11|minimum:11|maximum:11|name:12|vendor:12|infoType:12|resolution:12|minimum:12|maximum:12|name:13|vendor:13|infoType:13|resolution:13|minimum:13|maximum:13|name:14|vendor:14|infoType:14|resolution:14|minimum:14|maximum:14|name:15|vendor:15|infoType:15|resolution:15|minimum:15|maximum:15|name:16|vendor:16|infoType:16|resolution:16|minimum:16|maximum:16|name:17|vendor:17|infoType:17|resolution:17|minimum:17|maximum:17|name:18|vendor:18|infoType:18|resolution:18|minimum:18|maximum:18|name:19|vendor:19|infoType:19|resolution:19|minimum:19|maximum:19|name:20|vendor:20|infoType:20|resolution:20|minimum:20|maximum:20|name:21|vendor:21|infoType:21|resolution:21|minimum:21|maximum:21|name:22|vendor:22|infoType:22|resolution:22|minimum:22|maximum:22|name:23|vendor:23|infoType:23|resolution:23|minimum:23|maximum:23|name:24|vendor:24|infoType:24|resolution:24|minimum:24|maximum:24|name:25|vendor:25|infoType:25|resolution:25|minimum:25|maximum:25|name:26|vendor:26|infoType:26|resolution:26|minimum:26|maximum:26|name:27|vendor:27|infoType:27|resolution:27|minimum:27|maximum:27|name:28|vendor:28|infoType:28|resolution:28|minimum:28|maximum:28|name:29|vendor:29|infoType:29|resolution:29|minimum:29|maximum:29|name:30|vendor:30|infoType:30|resolution:30|minimum:30|maximum:30|name:31|vendor:31|destroyInfos:32';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = 'get sensor vendor name failed|get sensor info failed';
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
     * @tc.name testSensorEnumerationPart20Test0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART20_0800
     * @tc.desc Verify GetSensorInfos stop at vendor occurrence 31 with status 14500101 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart20Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 32 vendor 31 14500101 3 2 1 62 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'count|createInfos:32|infos|name:0|vendor:0|infoType:0|resolution:0|minimum:0|maximum:0|name:1|vendor:1|infoType:1|resolution:1|minimum:1|maximum:1|name:2|vendor:2|infoType:2|resolution:2|minimum:2|maximum:2|name:3|vendor:3|infoType:3|resolution:3|minimum:3|maximum:3|name:4|vendor:4|infoType:4|resolution:4|minimum:4|maximum:4|name:5|vendor:5|infoType:5|resolution:5|minimum:5|maximum:5|name:6|vendor:6|infoType:6|resolution:6|minimum:6|maximum:6|name:7|vendor:7|infoType:7|resolution:7|minimum:7|maximum:7|name:8|vendor:8|infoType:8|resolution:8|minimum:8|maximum:8|name:9|vendor:9|infoType:9|resolution:9|minimum:9|maximum:9|name:10|vendor:10|infoType:10|resolution:10|minimum:10|maximum:10|name:11|vendor:11|infoType:11|resolution:11|minimum:11|maximum:11|name:12|vendor:12|infoType:12|resolution:12|minimum:12|maximum:12|name:13|vendor:13|infoType:13|resolution:13|minimum:13|maximum:13|name:14|vendor:14|infoType:14|resolution:14|minimum:14|maximum:14|name:15|vendor:15|infoType:15|resolution:15|minimum:15|maximum:15|name:16|vendor:16|infoType:16|resolution:16|minimum:16|maximum:16|name:17|vendor:17|infoType:17|resolution:17|minimum:17|maximum:17|name:18|vendor:18|infoType:18|resolution:18|minimum:18|maximum:18|name:19|vendor:19|infoType:19|resolution:19|minimum:19|maximum:19|name:20|vendor:20|infoType:20|resolution:20|minimum:20|maximum:20|name:21|vendor:21|infoType:21|resolution:21|minimum:21|maximum:21|name:22|vendor:22|infoType:22|resolution:22|minimum:22|maximum:22|name:23|vendor:23|infoType:23|resolution:23|minimum:23|maximum:23|name:24|vendor:24|infoType:24|resolution:24|minimum:24|maximum:24|name:25|vendor:25|infoType:25|resolution:25|minimum:25|maximum:25|name:26|vendor:26|infoType:26|resolution:26|minimum:26|maximum:26|name:27|vendor:27|infoType:27|resolution:27|minimum:27|maximum:27|name:28|vendor:28|infoType:28|resolution:28|minimum:28|maximum:28|name:29|vendor:29|infoType:29|resolution:29|minimum:29|maximum:29|name:30|vendor:30|infoType:30|resolution:30|minimum:30|maximum:30|name:31|vendor:31|destroyInfos:32';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = 'get sensor vendor name failed|get sensor info failed';
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
     * @tc.name testSensorEnumerationPart20Test0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART20_0900
     * @tc.desc Verify GetSensorInfos stop at infoType occurrence 31 with status 201 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart20Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 32 infoType 31 201 3 2 1 62 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'count|createInfos:32|infos|name:0|vendor:0|infoType:0|resolution:0|minimum:0|maximum:0|name:1|vendor:1|infoType:1|resolution:1|minimum:1|maximum:1|name:2|vendor:2|infoType:2|resolution:2|minimum:2|maximum:2|name:3|vendor:3|infoType:3|resolution:3|minimum:3|maximum:3|name:4|vendor:4|infoType:4|resolution:4|minimum:4|maximum:4|name:5|vendor:5|infoType:5|resolution:5|minimum:5|maximum:5|name:6|vendor:6|infoType:6|resolution:6|minimum:6|maximum:6|name:7|vendor:7|infoType:7|resolution:7|minimum:7|maximum:7|name:8|vendor:8|infoType:8|resolution:8|minimum:8|maximum:8|name:9|vendor:9|infoType:9|resolution:9|minimum:9|maximum:9|name:10|vendor:10|infoType:10|resolution:10|minimum:10|maximum:10|name:11|vendor:11|infoType:11|resolution:11|minimum:11|maximum:11|name:12|vendor:12|infoType:12|resolution:12|minimum:12|maximum:12|name:13|vendor:13|infoType:13|resolution:13|minimum:13|maximum:13|name:14|vendor:14|infoType:14|resolution:14|minimum:14|maximum:14|name:15|vendor:15|infoType:15|resolution:15|minimum:15|maximum:15|name:16|vendor:16|infoType:16|resolution:16|minimum:16|maximum:16|name:17|vendor:17|infoType:17|resolution:17|minimum:17|maximum:17|name:18|vendor:18|infoType:18|resolution:18|minimum:18|maximum:18|name:19|vendor:19|infoType:19|resolution:19|minimum:19|maximum:19|name:20|vendor:20|infoType:20|resolution:20|minimum:20|maximum:20|name:21|vendor:21|infoType:21|resolution:21|minimum:21|maximum:21|name:22|vendor:22|infoType:22|resolution:22|minimum:22|maximum:22|name:23|vendor:23|infoType:23|resolution:23|minimum:23|maximum:23|name:24|vendor:24|infoType:24|resolution:24|minimum:24|maximum:24|name:25|vendor:25|infoType:25|resolution:25|minimum:25|maximum:25|name:26|vendor:26|infoType:26|resolution:26|minimum:26|maximum:26|name:27|vendor:27|infoType:27|resolution:27|minimum:27|maximum:27|name:28|vendor:28|infoType:28|resolution:28|minimum:28|maximum:28|name:29|vendor:29|infoType:29|resolution:29|minimum:29|maximum:29|name:30|vendor:30|infoType:30|resolution:30|minimum:30|maximum:30|name:31|vendor:31|infoType:31|destroyInfos:32';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = 'get sensor type failed|get sensor info failed';
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
     * @tc.name testSensorEnumerationPart20Test0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART20_1000
     * @tc.desc Verify GetSensorInfos stop at infoType occurrence 31 with status 401 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart20Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 32 infoType 31 401 3 2 1 62 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'count|createInfos:32|infos|name:0|vendor:0|infoType:0|resolution:0|minimum:0|maximum:0|name:1|vendor:1|infoType:1|resolution:1|minimum:1|maximum:1|name:2|vendor:2|infoType:2|resolution:2|minimum:2|maximum:2|name:3|vendor:3|infoType:3|resolution:3|minimum:3|maximum:3|name:4|vendor:4|infoType:4|resolution:4|minimum:4|maximum:4|name:5|vendor:5|infoType:5|resolution:5|minimum:5|maximum:5|name:6|vendor:6|infoType:6|resolution:6|minimum:6|maximum:6|name:7|vendor:7|infoType:7|resolution:7|minimum:7|maximum:7|name:8|vendor:8|infoType:8|resolution:8|minimum:8|maximum:8|name:9|vendor:9|infoType:9|resolution:9|minimum:9|maximum:9|name:10|vendor:10|infoType:10|resolution:10|minimum:10|maximum:10|name:11|vendor:11|infoType:11|resolution:11|minimum:11|maximum:11|name:12|vendor:12|infoType:12|resolution:12|minimum:12|maximum:12|name:13|vendor:13|infoType:13|resolution:13|minimum:13|maximum:13|name:14|vendor:14|infoType:14|resolution:14|minimum:14|maximum:14|name:15|vendor:15|infoType:15|resolution:15|minimum:15|maximum:15|name:16|vendor:16|infoType:16|resolution:16|minimum:16|maximum:16|name:17|vendor:17|infoType:17|resolution:17|minimum:17|maximum:17|name:18|vendor:18|infoType:18|resolution:18|minimum:18|maximum:18|name:19|vendor:19|infoType:19|resolution:19|minimum:19|maximum:19|name:20|vendor:20|infoType:20|resolution:20|minimum:20|maximum:20|name:21|vendor:21|infoType:21|resolution:21|minimum:21|maximum:21|name:22|vendor:22|infoType:22|resolution:22|minimum:22|maximum:22|name:23|vendor:23|infoType:23|resolution:23|minimum:23|maximum:23|name:24|vendor:24|infoType:24|resolution:24|minimum:24|maximum:24|name:25|vendor:25|infoType:25|resolution:25|minimum:25|maximum:25|name:26|vendor:26|infoType:26|resolution:26|minimum:26|maximum:26|name:27|vendor:27|infoType:27|resolution:27|minimum:27|maximum:27|name:28|vendor:28|infoType:28|resolution:28|minimum:28|maximum:28|name:29|vendor:29|infoType:29|resolution:29|minimum:29|maximum:29|name:30|vendor:30|infoType:30|resolution:30|minimum:30|maximum:30|name:31|vendor:31|infoType:31|destroyInfos:32';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = 'get sensor type failed|get sensor info failed';
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
     * @tc.name testSensorEnumerationPart20Test0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART20_1100
     * @tc.desc Verify GetSensorInfos stop at infoType occurrence 31 with status 14500101 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart20Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 32 infoType 31 14500101 3 2 1 62 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'count|createInfos:32|infos|name:0|vendor:0|infoType:0|resolution:0|minimum:0|maximum:0|name:1|vendor:1|infoType:1|resolution:1|minimum:1|maximum:1|name:2|vendor:2|infoType:2|resolution:2|minimum:2|maximum:2|name:3|vendor:3|infoType:3|resolution:3|minimum:3|maximum:3|name:4|vendor:4|infoType:4|resolution:4|minimum:4|maximum:4|name:5|vendor:5|infoType:5|resolution:5|minimum:5|maximum:5|name:6|vendor:6|infoType:6|resolution:6|minimum:6|maximum:6|name:7|vendor:7|infoType:7|resolution:7|minimum:7|maximum:7|name:8|vendor:8|infoType:8|resolution:8|minimum:8|maximum:8|name:9|vendor:9|infoType:9|resolution:9|minimum:9|maximum:9|name:10|vendor:10|infoType:10|resolution:10|minimum:10|maximum:10|name:11|vendor:11|infoType:11|resolution:11|minimum:11|maximum:11|name:12|vendor:12|infoType:12|resolution:12|minimum:12|maximum:12|name:13|vendor:13|infoType:13|resolution:13|minimum:13|maximum:13|name:14|vendor:14|infoType:14|resolution:14|minimum:14|maximum:14|name:15|vendor:15|infoType:15|resolution:15|minimum:15|maximum:15|name:16|vendor:16|infoType:16|resolution:16|minimum:16|maximum:16|name:17|vendor:17|infoType:17|resolution:17|minimum:17|maximum:17|name:18|vendor:18|infoType:18|resolution:18|minimum:18|maximum:18|name:19|vendor:19|infoType:19|resolution:19|minimum:19|maximum:19|name:20|vendor:20|infoType:20|resolution:20|minimum:20|maximum:20|name:21|vendor:21|infoType:21|resolution:21|minimum:21|maximum:21|name:22|vendor:22|infoType:22|resolution:22|minimum:22|maximum:22|name:23|vendor:23|infoType:23|resolution:23|minimum:23|maximum:23|name:24|vendor:24|infoType:24|resolution:24|minimum:24|maximum:24|name:25|vendor:25|infoType:25|resolution:25|minimum:25|maximum:25|name:26|vendor:26|infoType:26|resolution:26|minimum:26|maximum:26|name:27|vendor:27|infoType:27|resolution:27|minimum:27|maximum:27|name:28|vendor:28|infoType:28|resolution:28|minimum:28|maximum:28|name:29|vendor:29|infoType:29|resolution:29|minimum:29|maximum:29|name:30|vendor:30|infoType:30|resolution:30|minimum:30|maximum:30|name:31|vendor:31|infoType:31|destroyInfos:32';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = 'get sensor type failed|get sensor info failed';
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
     * @tc.name testSensorEnumerationPart20Test0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART20_1200
     * @tc.desc Verify GetSensorInfos stop at resolution occurrence 31 with status 201 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart20Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 32 resolution 31 201 3 2 1 62 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'count|createInfos:32|infos|name:0|vendor:0|infoType:0|resolution:0|minimum:0|maximum:0|name:1|vendor:1|infoType:1|resolution:1|minimum:1|maximum:1|name:2|vendor:2|infoType:2|resolution:2|minimum:2|maximum:2|name:3|vendor:3|infoType:3|resolution:3|minimum:3|maximum:3|name:4|vendor:4|infoType:4|resolution:4|minimum:4|maximum:4|name:5|vendor:5|infoType:5|resolution:5|minimum:5|maximum:5|name:6|vendor:6|infoType:6|resolution:6|minimum:6|maximum:6|name:7|vendor:7|infoType:7|resolution:7|minimum:7|maximum:7|name:8|vendor:8|infoType:8|resolution:8|minimum:8|maximum:8|name:9|vendor:9|infoType:9|resolution:9|minimum:9|maximum:9|name:10|vendor:10|infoType:10|resolution:10|minimum:10|maximum:10|name:11|vendor:11|infoType:11|resolution:11|minimum:11|maximum:11|name:12|vendor:12|infoType:12|resolution:12|minimum:12|maximum:12|name:13|vendor:13|infoType:13|resolution:13|minimum:13|maximum:13|name:14|vendor:14|infoType:14|resolution:14|minimum:14|maximum:14|name:15|vendor:15|infoType:15|resolution:15|minimum:15|maximum:15|name:16|vendor:16|infoType:16|resolution:16|minimum:16|maximum:16|name:17|vendor:17|infoType:17|resolution:17|minimum:17|maximum:17|name:18|vendor:18|infoType:18|resolution:18|minimum:18|maximum:18|name:19|vendor:19|infoType:19|resolution:19|minimum:19|maximum:19|name:20|vendor:20|infoType:20|resolution:20|minimum:20|maximum:20|name:21|vendor:21|infoType:21|resolution:21|minimum:21|maximum:21|name:22|vendor:22|infoType:22|resolution:22|minimum:22|maximum:22|name:23|vendor:23|infoType:23|resolution:23|minimum:23|maximum:23|name:24|vendor:24|infoType:24|resolution:24|minimum:24|maximum:24|name:25|vendor:25|infoType:25|resolution:25|minimum:25|maximum:25|name:26|vendor:26|infoType:26|resolution:26|minimum:26|maximum:26|name:27|vendor:27|infoType:27|resolution:27|minimum:27|maximum:27|name:28|vendor:28|infoType:28|resolution:28|minimum:28|maximum:28|name:29|vendor:29|infoType:29|resolution:29|minimum:29|maximum:29|name:30|vendor:30|infoType:30|resolution:30|minimum:30|maximum:30|name:31|vendor:31|infoType:31|resolution:31|destroyInfos:32';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = 'get sensor resolution failed|get sensor info failed';
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
  });
}
