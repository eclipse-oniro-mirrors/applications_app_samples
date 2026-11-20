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

export default function SensorEnumerationPart15(): void {
  describe('SensorEnumerationPart15', () => {
    beforeAll((): void => {
      hilog.info(0x0000, 'SensorCapiTest', 'Starting SensorEnumerationPart15');
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
      hilog.info(0x0000, 'SensorCapiTest', 'Finished SensorEnumerationPart15');
    });

    /**
     * @tc.name testSensorEnumerationPart15Test0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART15_0100
     * @tc.desc Verify GetSensorInfos stop at vendor occurrence 62 with status 401 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart15Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 63 vendor 62 401 3 2 1 62 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'count|createInfos:63|infos|name:0|vendor:0|infoType:0|resolution:0|minimum:0|maximum:0|name:1|vendor:1|infoType:1|resolution:1|minimum:1|maximum:1|name:2|vendor:2|infoType:2|resolution:2|minimum:2|maximum:2|name:3|vendor:3|infoType:3|resolution:3|minimum:3|maximum:3|name:4|vendor:4|infoType:4|resolution:4|minimum:4|maximum:4|name:5|vendor:5|infoType:5|resolution:5|minimum:5|maximum:5|name:6|vendor:6|infoType:6|resolution:6|minimum:6|maximum:6|name:7|vendor:7|infoType:7|resolution:7|minimum:7|maximum:7|name:8|vendor:8|infoType:8|resolution:8|minimum:8|maximum:8|name:9|vendor:9|infoType:9|resolution:9|minimum:9|maximum:9|name:10|vendor:10|infoType:10|resolution:10|minimum:10|maximum:10|name:11|vendor:11|infoType:11|resolution:11|minimum:11|maximum:11|name:12|vendor:12|infoType:12|resolution:12|minimum:12|maximum:12|name:13|vendor:13|infoType:13|resolution:13|minimum:13|maximum:13|name:14|vendor:14|infoType:14|resolution:14|minimum:14|maximum:14|name:15|vendor:15|infoType:15|resolution:15|minimum:15|maximum:15|name:16|vendor:16|infoType:16|resolution:16|minimum:16|maximum:16|name:17|vendor:17|infoType:17|resolution:17|minimum:17|maximum:17|name:18|vendor:18|infoType:18|resolution:18|minimum:18|maximum:18|name:19|vendor:19|infoType:19|resolution:19|minimum:19|maximum:19|name:20|vendor:20|infoType:20|resolution:20|minimum:20|maximum:20|name:21|vendor:21|infoType:21|resolution:21|minimum:21|maximum:21|name:22|vendor:22|infoType:22|resolution:22|minimum:22|maximum:22|name:23|vendor:23|infoType:23|resolution:23|minimum:23|maximum:23|name:24|vendor:24|infoType:24|resolution:24|minimum:24|maximum:24|name:25|vendor:25|infoType:25|resolution:25|minimum:25|maximum:25|name:26|vendor:26|infoType:26|resolution:26|minimum:26|maximum:26|name:27|vendor:27|infoType:27|resolution:27|minimum:27|maximum:27|name:28|vendor:28|infoType:28|resolution:28|minimum:28|maximum:28|name:29|vendor:29|infoType:29|resolution:29|minimum:29|maximum:29|name:30|vendor:30|infoType:30|resolution:30|minimum:30|maximum:30|name:31|vendor:31|infoType:31|resolution:31|minimum:31|maximum:31|name:32|vendor:32|infoType:32|resolution:32|minimum:32|maximum:32|name:33|vendor:33|infoType:33|resolution:33|minimum:33|maximum:33|name:34|vendor:34|infoType:34|resolution:34|minimum:34|maximum:34|name:35|vendor:35|infoType:35|resolution:35|minimum:35|maximum:35|name:36|vendor:36|infoType:36|resolution:36|minimum:36|maximum:36|name:37|vendor:37|infoType:37|resolution:37|minimum:37|maximum:37|name:38|vendor:38|infoType:38|resolution:38|minimum:38|maximum:38|name:39|vendor:39|infoType:39|resolution:39|minimum:39|maximum:39|name:40|vendor:40|infoType:40|resolution:40|minimum:40|maximum:40|name:41|vendor:41|infoType:41|resolution:41|minimum:41|maximum:41|name:42|vendor:42|infoType:42|resolution:42|minimum:42|maximum:42|name:43|vendor:43|infoType:43|resolution:43|minimum:43|maximum:43|name:44|vendor:44|infoType:44|resolution:44|minimum:44|maximum:44|name:45|vendor:45|infoType:45|resolution:45|minimum:45|maximum:45|name:46|vendor:46|infoType:46|resolution:46|minimum:46|maximum:46|name:47|vendor:47|infoType:47|resolution:47|minimum:47|maximum:47|name:48|vendor:48|infoType:48|resolution:48|minimum:48|maximum:48|name:49|vendor:49|infoType:49|resolution:49|minimum:49|maximum:49|name:50|vendor:50|infoType:50|resolution:50|minimum:50|maximum:50|name:51|vendor:51|infoType:51|resolution:51|minimum:51|maximum:51|name:52|vendor:52|infoType:52|resolution:52|minimum:52|maximum:52|name:53|vendor:53|infoType:53|resolution:53|minimum:53|maximum:53|name:54|vendor:54|infoType:54|resolution:54|minimum:54|maximum:54|name:55|vendor:55|infoType:55|resolution:55|minimum:55|maximum:55|name:56|vendor:56|infoType:56|resolution:56|minimum:56|maximum:56|name:57|vendor:57|infoType:57|resolution:57|minimum:57|maximum:57|name:58|vendor:58|infoType:58|resolution:58|minimum:58|maximum:58|name:59|vendor:59|infoType:59|resolution:59|minimum:59|maximum:59|name:60|vendor:60|infoType:60|resolution:60|minimum:60|maximum:60|name:61|vendor:61|infoType:61|resolution:61|minimum:61|maximum:61|name:62|vendor:62|destroyInfos:63';
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
     * @tc.name testSensorEnumerationPart15Test0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART15_0200
     * @tc.desc Verify GetSensorInfos stop at vendor occurrence 62 with status 14500101 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart15Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 63 vendor 62 14500101 3 2 1 62 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'count|createInfos:63|infos|name:0|vendor:0|infoType:0|resolution:0|minimum:0|maximum:0|name:1|vendor:1|infoType:1|resolution:1|minimum:1|maximum:1|name:2|vendor:2|infoType:2|resolution:2|minimum:2|maximum:2|name:3|vendor:3|infoType:3|resolution:3|minimum:3|maximum:3|name:4|vendor:4|infoType:4|resolution:4|minimum:4|maximum:4|name:5|vendor:5|infoType:5|resolution:5|minimum:5|maximum:5|name:6|vendor:6|infoType:6|resolution:6|minimum:6|maximum:6|name:7|vendor:7|infoType:7|resolution:7|minimum:7|maximum:7|name:8|vendor:8|infoType:8|resolution:8|minimum:8|maximum:8|name:9|vendor:9|infoType:9|resolution:9|minimum:9|maximum:9|name:10|vendor:10|infoType:10|resolution:10|minimum:10|maximum:10|name:11|vendor:11|infoType:11|resolution:11|minimum:11|maximum:11|name:12|vendor:12|infoType:12|resolution:12|minimum:12|maximum:12|name:13|vendor:13|infoType:13|resolution:13|minimum:13|maximum:13|name:14|vendor:14|infoType:14|resolution:14|minimum:14|maximum:14|name:15|vendor:15|infoType:15|resolution:15|minimum:15|maximum:15|name:16|vendor:16|infoType:16|resolution:16|minimum:16|maximum:16|name:17|vendor:17|infoType:17|resolution:17|minimum:17|maximum:17|name:18|vendor:18|infoType:18|resolution:18|minimum:18|maximum:18|name:19|vendor:19|infoType:19|resolution:19|minimum:19|maximum:19|name:20|vendor:20|infoType:20|resolution:20|minimum:20|maximum:20|name:21|vendor:21|infoType:21|resolution:21|minimum:21|maximum:21|name:22|vendor:22|infoType:22|resolution:22|minimum:22|maximum:22|name:23|vendor:23|infoType:23|resolution:23|minimum:23|maximum:23|name:24|vendor:24|infoType:24|resolution:24|minimum:24|maximum:24|name:25|vendor:25|infoType:25|resolution:25|minimum:25|maximum:25|name:26|vendor:26|infoType:26|resolution:26|minimum:26|maximum:26|name:27|vendor:27|infoType:27|resolution:27|minimum:27|maximum:27|name:28|vendor:28|infoType:28|resolution:28|minimum:28|maximum:28|name:29|vendor:29|infoType:29|resolution:29|minimum:29|maximum:29|name:30|vendor:30|infoType:30|resolution:30|minimum:30|maximum:30|name:31|vendor:31|infoType:31|resolution:31|minimum:31|maximum:31|name:32|vendor:32|infoType:32|resolution:32|minimum:32|maximum:32|name:33|vendor:33|infoType:33|resolution:33|minimum:33|maximum:33|name:34|vendor:34|infoType:34|resolution:34|minimum:34|maximum:34|name:35|vendor:35|infoType:35|resolution:35|minimum:35|maximum:35|name:36|vendor:36|infoType:36|resolution:36|minimum:36|maximum:36|name:37|vendor:37|infoType:37|resolution:37|minimum:37|maximum:37|name:38|vendor:38|infoType:38|resolution:38|minimum:38|maximum:38|name:39|vendor:39|infoType:39|resolution:39|minimum:39|maximum:39|name:40|vendor:40|infoType:40|resolution:40|minimum:40|maximum:40|name:41|vendor:41|infoType:41|resolution:41|minimum:41|maximum:41|name:42|vendor:42|infoType:42|resolution:42|minimum:42|maximum:42|name:43|vendor:43|infoType:43|resolution:43|minimum:43|maximum:43|name:44|vendor:44|infoType:44|resolution:44|minimum:44|maximum:44|name:45|vendor:45|infoType:45|resolution:45|minimum:45|maximum:45|name:46|vendor:46|infoType:46|resolution:46|minimum:46|maximum:46|name:47|vendor:47|infoType:47|resolution:47|minimum:47|maximum:47|name:48|vendor:48|infoType:48|resolution:48|minimum:48|maximum:48|name:49|vendor:49|infoType:49|resolution:49|minimum:49|maximum:49|name:50|vendor:50|infoType:50|resolution:50|minimum:50|maximum:50|name:51|vendor:51|infoType:51|resolution:51|minimum:51|maximum:51|name:52|vendor:52|infoType:52|resolution:52|minimum:52|maximum:52|name:53|vendor:53|infoType:53|resolution:53|minimum:53|maximum:53|name:54|vendor:54|infoType:54|resolution:54|minimum:54|maximum:54|name:55|vendor:55|infoType:55|resolution:55|minimum:55|maximum:55|name:56|vendor:56|infoType:56|resolution:56|minimum:56|maximum:56|name:57|vendor:57|infoType:57|resolution:57|minimum:57|maximum:57|name:58|vendor:58|infoType:58|resolution:58|minimum:58|maximum:58|name:59|vendor:59|infoType:59|resolution:59|minimum:59|maximum:59|name:60|vendor:60|infoType:60|resolution:60|minimum:60|maximum:60|name:61|vendor:61|infoType:61|resolution:61|minimum:61|maximum:61|name:62|vendor:62|destroyInfos:63';
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
     * @tc.name testSensorEnumerationPart15Test0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART15_0300
     * @tc.desc Verify GetSensorInfos stop at infoType occurrence 62 with status 201 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart15Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 63 infoType 62 201 3 2 1 62 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'count|createInfos:63|infos|name:0|vendor:0|infoType:0|resolution:0|minimum:0|maximum:0|name:1|vendor:1|infoType:1|resolution:1|minimum:1|maximum:1|name:2|vendor:2|infoType:2|resolution:2|minimum:2|maximum:2|name:3|vendor:3|infoType:3|resolution:3|minimum:3|maximum:3|name:4|vendor:4|infoType:4|resolution:4|minimum:4|maximum:4|name:5|vendor:5|infoType:5|resolution:5|minimum:5|maximum:5|name:6|vendor:6|infoType:6|resolution:6|minimum:6|maximum:6|name:7|vendor:7|infoType:7|resolution:7|minimum:7|maximum:7|name:8|vendor:8|infoType:8|resolution:8|minimum:8|maximum:8|name:9|vendor:9|infoType:9|resolution:9|minimum:9|maximum:9|name:10|vendor:10|infoType:10|resolution:10|minimum:10|maximum:10|name:11|vendor:11|infoType:11|resolution:11|minimum:11|maximum:11|name:12|vendor:12|infoType:12|resolution:12|minimum:12|maximum:12|name:13|vendor:13|infoType:13|resolution:13|minimum:13|maximum:13|name:14|vendor:14|infoType:14|resolution:14|minimum:14|maximum:14|name:15|vendor:15|infoType:15|resolution:15|minimum:15|maximum:15|name:16|vendor:16|infoType:16|resolution:16|minimum:16|maximum:16|name:17|vendor:17|infoType:17|resolution:17|minimum:17|maximum:17|name:18|vendor:18|infoType:18|resolution:18|minimum:18|maximum:18|name:19|vendor:19|infoType:19|resolution:19|minimum:19|maximum:19|name:20|vendor:20|infoType:20|resolution:20|minimum:20|maximum:20|name:21|vendor:21|infoType:21|resolution:21|minimum:21|maximum:21|name:22|vendor:22|infoType:22|resolution:22|minimum:22|maximum:22|name:23|vendor:23|infoType:23|resolution:23|minimum:23|maximum:23|name:24|vendor:24|infoType:24|resolution:24|minimum:24|maximum:24|name:25|vendor:25|infoType:25|resolution:25|minimum:25|maximum:25|name:26|vendor:26|infoType:26|resolution:26|minimum:26|maximum:26|name:27|vendor:27|infoType:27|resolution:27|minimum:27|maximum:27|name:28|vendor:28|infoType:28|resolution:28|minimum:28|maximum:28|name:29|vendor:29|infoType:29|resolution:29|minimum:29|maximum:29|name:30|vendor:30|infoType:30|resolution:30|minimum:30|maximum:30|name:31|vendor:31|infoType:31|resolution:31|minimum:31|maximum:31|name:32|vendor:32|infoType:32|resolution:32|minimum:32|maximum:32|name:33|vendor:33|infoType:33|resolution:33|minimum:33|maximum:33|name:34|vendor:34|infoType:34|resolution:34|minimum:34|maximum:34|name:35|vendor:35|infoType:35|resolution:35|minimum:35|maximum:35|name:36|vendor:36|infoType:36|resolution:36|minimum:36|maximum:36|name:37|vendor:37|infoType:37|resolution:37|minimum:37|maximum:37|name:38|vendor:38|infoType:38|resolution:38|minimum:38|maximum:38|name:39|vendor:39|infoType:39|resolution:39|minimum:39|maximum:39|name:40|vendor:40|infoType:40|resolution:40|minimum:40|maximum:40|name:41|vendor:41|infoType:41|resolution:41|minimum:41|maximum:41|name:42|vendor:42|infoType:42|resolution:42|minimum:42|maximum:42|name:43|vendor:43|infoType:43|resolution:43|minimum:43|maximum:43|name:44|vendor:44|infoType:44|resolution:44|minimum:44|maximum:44|name:45|vendor:45|infoType:45|resolution:45|minimum:45|maximum:45|name:46|vendor:46|infoType:46|resolution:46|minimum:46|maximum:46|name:47|vendor:47|infoType:47|resolution:47|minimum:47|maximum:47|name:48|vendor:48|infoType:48|resolution:48|minimum:48|maximum:48|name:49|vendor:49|infoType:49|resolution:49|minimum:49|maximum:49|name:50|vendor:50|infoType:50|resolution:50|minimum:50|maximum:50|name:51|vendor:51|infoType:51|resolution:51|minimum:51|maximum:51|name:52|vendor:52|infoType:52|resolution:52|minimum:52|maximum:52|name:53|vendor:53|infoType:53|resolution:53|minimum:53|maximum:53|name:54|vendor:54|infoType:54|resolution:54|minimum:54|maximum:54|name:55|vendor:55|infoType:55|resolution:55|minimum:55|maximum:55|name:56|vendor:56|infoType:56|resolution:56|minimum:56|maximum:56|name:57|vendor:57|infoType:57|resolution:57|minimum:57|maximum:57|name:58|vendor:58|infoType:58|resolution:58|minimum:58|maximum:58|name:59|vendor:59|infoType:59|resolution:59|minimum:59|maximum:59|name:60|vendor:60|infoType:60|resolution:60|minimum:60|maximum:60|name:61|vendor:61|infoType:61|resolution:61|minimum:61|maximum:61|name:62|vendor:62|infoType:62|destroyInfos:63';
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
     * @tc.name testSensorEnumerationPart15Test0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART15_0400
     * @tc.desc Verify GetSensorInfos stop at infoType occurrence 62 with status 401 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart15Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 63 infoType 62 401 3 2 1 62 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'count|createInfos:63|infos|name:0|vendor:0|infoType:0|resolution:0|minimum:0|maximum:0|name:1|vendor:1|infoType:1|resolution:1|minimum:1|maximum:1|name:2|vendor:2|infoType:2|resolution:2|minimum:2|maximum:2|name:3|vendor:3|infoType:3|resolution:3|minimum:3|maximum:3|name:4|vendor:4|infoType:4|resolution:4|minimum:4|maximum:4|name:5|vendor:5|infoType:5|resolution:5|minimum:5|maximum:5|name:6|vendor:6|infoType:6|resolution:6|minimum:6|maximum:6|name:7|vendor:7|infoType:7|resolution:7|minimum:7|maximum:7|name:8|vendor:8|infoType:8|resolution:8|minimum:8|maximum:8|name:9|vendor:9|infoType:9|resolution:9|minimum:9|maximum:9|name:10|vendor:10|infoType:10|resolution:10|minimum:10|maximum:10|name:11|vendor:11|infoType:11|resolution:11|minimum:11|maximum:11|name:12|vendor:12|infoType:12|resolution:12|minimum:12|maximum:12|name:13|vendor:13|infoType:13|resolution:13|minimum:13|maximum:13|name:14|vendor:14|infoType:14|resolution:14|minimum:14|maximum:14|name:15|vendor:15|infoType:15|resolution:15|minimum:15|maximum:15|name:16|vendor:16|infoType:16|resolution:16|minimum:16|maximum:16|name:17|vendor:17|infoType:17|resolution:17|minimum:17|maximum:17|name:18|vendor:18|infoType:18|resolution:18|minimum:18|maximum:18|name:19|vendor:19|infoType:19|resolution:19|minimum:19|maximum:19|name:20|vendor:20|infoType:20|resolution:20|minimum:20|maximum:20|name:21|vendor:21|infoType:21|resolution:21|minimum:21|maximum:21|name:22|vendor:22|infoType:22|resolution:22|minimum:22|maximum:22|name:23|vendor:23|infoType:23|resolution:23|minimum:23|maximum:23|name:24|vendor:24|infoType:24|resolution:24|minimum:24|maximum:24|name:25|vendor:25|infoType:25|resolution:25|minimum:25|maximum:25|name:26|vendor:26|infoType:26|resolution:26|minimum:26|maximum:26|name:27|vendor:27|infoType:27|resolution:27|minimum:27|maximum:27|name:28|vendor:28|infoType:28|resolution:28|minimum:28|maximum:28|name:29|vendor:29|infoType:29|resolution:29|minimum:29|maximum:29|name:30|vendor:30|infoType:30|resolution:30|minimum:30|maximum:30|name:31|vendor:31|infoType:31|resolution:31|minimum:31|maximum:31|name:32|vendor:32|infoType:32|resolution:32|minimum:32|maximum:32|name:33|vendor:33|infoType:33|resolution:33|minimum:33|maximum:33|name:34|vendor:34|infoType:34|resolution:34|minimum:34|maximum:34|name:35|vendor:35|infoType:35|resolution:35|minimum:35|maximum:35|name:36|vendor:36|infoType:36|resolution:36|minimum:36|maximum:36|name:37|vendor:37|infoType:37|resolution:37|minimum:37|maximum:37|name:38|vendor:38|infoType:38|resolution:38|minimum:38|maximum:38|name:39|vendor:39|infoType:39|resolution:39|minimum:39|maximum:39|name:40|vendor:40|infoType:40|resolution:40|minimum:40|maximum:40|name:41|vendor:41|infoType:41|resolution:41|minimum:41|maximum:41|name:42|vendor:42|infoType:42|resolution:42|minimum:42|maximum:42|name:43|vendor:43|infoType:43|resolution:43|minimum:43|maximum:43|name:44|vendor:44|infoType:44|resolution:44|minimum:44|maximum:44|name:45|vendor:45|infoType:45|resolution:45|minimum:45|maximum:45|name:46|vendor:46|infoType:46|resolution:46|minimum:46|maximum:46|name:47|vendor:47|infoType:47|resolution:47|minimum:47|maximum:47|name:48|vendor:48|infoType:48|resolution:48|minimum:48|maximum:48|name:49|vendor:49|infoType:49|resolution:49|minimum:49|maximum:49|name:50|vendor:50|infoType:50|resolution:50|minimum:50|maximum:50|name:51|vendor:51|infoType:51|resolution:51|minimum:51|maximum:51|name:52|vendor:52|infoType:52|resolution:52|minimum:52|maximum:52|name:53|vendor:53|infoType:53|resolution:53|minimum:53|maximum:53|name:54|vendor:54|infoType:54|resolution:54|minimum:54|maximum:54|name:55|vendor:55|infoType:55|resolution:55|minimum:55|maximum:55|name:56|vendor:56|infoType:56|resolution:56|minimum:56|maximum:56|name:57|vendor:57|infoType:57|resolution:57|minimum:57|maximum:57|name:58|vendor:58|infoType:58|resolution:58|minimum:58|maximum:58|name:59|vendor:59|infoType:59|resolution:59|minimum:59|maximum:59|name:60|vendor:60|infoType:60|resolution:60|minimum:60|maximum:60|name:61|vendor:61|infoType:61|resolution:61|minimum:61|maximum:61|name:62|vendor:62|infoType:62|destroyInfos:63';
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
     * @tc.name testSensorEnumerationPart15Test0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART15_0500
     * @tc.desc Verify GetSensorInfos stop at infoType occurrence 62 with status 14500101 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart15Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 63 infoType 62 14500101 3 2 1 62 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'count|createInfos:63|infos|name:0|vendor:0|infoType:0|resolution:0|minimum:0|maximum:0|name:1|vendor:1|infoType:1|resolution:1|minimum:1|maximum:1|name:2|vendor:2|infoType:2|resolution:2|minimum:2|maximum:2|name:3|vendor:3|infoType:3|resolution:3|minimum:3|maximum:3|name:4|vendor:4|infoType:4|resolution:4|minimum:4|maximum:4|name:5|vendor:5|infoType:5|resolution:5|minimum:5|maximum:5|name:6|vendor:6|infoType:6|resolution:6|minimum:6|maximum:6|name:7|vendor:7|infoType:7|resolution:7|minimum:7|maximum:7|name:8|vendor:8|infoType:8|resolution:8|minimum:8|maximum:8|name:9|vendor:9|infoType:9|resolution:9|minimum:9|maximum:9|name:10|vendor:10|infoType:10|resolution:10|minimum:10|maximum:10|name:11|vendor:11|infoType:11|resolution:11|minimum:11|maximum:11|name:12|vendor:12|infoType:12|resolution:12|minimum:12|maximum:12|name:13|vendor:13|infoType:13|resolution:13|minimum:13|maximum:13|name:14|vendor:14|infoType:14|resolution:14|minimum:14|maximum:14|name:15|vendor:15|infoType:15|resolution:15|minimum:15|maximum:15|name:16|vendor:16|infoType:16|resolution:16|minimum:16|maximum:16|name:17|vendor:17|infoType:17|resolution:17|minimum:17|maximum:17|name:18|vendor:18|infoType:18|resolution:18|minimum:18|maximum:18|name:19|vendor:19|infoType:19|resolution:19|minimum:19|maximum:19|name:20|vendor:20|infoType:20|resolution:20|minimum:20|maximum:20|name:21|vendor:21|infoType:21|resolution:21|minimum:21|maximum:21|name:22|vendor:22|infoType:22|resolution:22|minimum:22|maximum:22|name:23|vendor:23|infoType:23|resolution:23|minimum:23|maximum:23|name:24|vendor:24|infoType:24|resolution:24|minimum:24|maximum:24|name:25|vendor:25|infoType:25|resolution:25|minimum:25|maximum:25|name:26|vendor:26|infoType:26|resolution:26|minimum:26|maximum:26|name:27|vendor:27|infoType:27|resolution:27|minimum:27|maximum:27|name:28|vendor:28|infoType:28|resolution:28|minimum:28|maximum:28|name:29|vendor:29|infoType:29|resolution:29|minimum:29|maximum:29|name:30|vendor:30|infoType:30|resolution:30|minimum:30|maximum:30|name:31|vendor:31|infoType:31|resolution:31|minimum:31|maximum:31|name:32|vendor:32|infoType:32|resolution:32|minimum:32|maximum:32|name:33|vendor:33|infoType:33|resolution:33|minimum:33|maximum:33|name:34|vendor:34|infoType:34|resolution:34|minimum:34|maximum:34|name:35|vendor:35|infoType:35|resolution:35|minimum:35|maximum:35|name:36|vendor:36|infoType:36|resolution:36|minimum:36|maximum:36|name:37|vendor:37|infoType:37|resolution:37|minimum:37|maximum:37|name:38|vendor:38|infoType:38|resolution:38|minimum:38|maximum:38|name:39|vendor:39|infoType:39|resolution:39|minimum:39|maximum:39|name:40|vendor:40|infoType:40|resolution:40|minimum:40|maximum:40|name:41|vendor:41|infoType:41|resolution:41|minimum:41|maximum:41|name:42|vendor:42|infoType:42|resolution:42|minimum:42|maximum:42|name:43|vendor:43|infoType:43|resolution:43|minimum:43|maximum:43|name:44|vendor:44|infoType:44|resolution:44|minimum:44|maximum:44|name:45|vendor:45|infoType:45|resolution:45|minimum:45|maximum:45|name:46|vendor:46|infoType:46|resolution:46|minimum:46|maximum:46|name:47|vendor:47|infoType:47|resolution:47|minimum:47|maximum:47|name:48|vendor:48|infoType:48|resolution:48|minimum:48|maximum:48|name:49|vendor:49|infoType:49|resolution:49|minimum:49|maximum:49|name:50|vendor:50|infoType:50|resolution:50|minimum:50|maximum:50|name:51|vendor:51|infoType:51|resolution:51|minimum:51|maximum:51|name:52|vendor:52|infoType:52|resolution:52|minimum:52|maximum:52|name:53|vendor:53|infoType:53|resolution:53|minimum:53|maximum:53|name:54|vendor:54|infoType:54|resolution:54|minimum:54|maximum:54|name:55|vendor:55|infoType:55|resolution:55|minimum:55|maximum:55|name:56|vendor:56|infoType:56|resolution:56|minimum:56|maximum:56|name:57|vendor:57|infoType:57|resolution:57|minimum:57|maximum:57|name:58|vendor:58|infoType:58|resolution:58|minimum:58|maximum:58|name:59|vendor:59|infoType:59|resolution:59|minimum:59|maximum:59|name:60|vendor:60|infoType:60|resolution:60|minimum:60|maximum:60|name:61|vendor:61|infoType:61|resolution:61|minimum:61|maximum:61|name:62|vendor:62|infoType:62|destroyInfos:63';
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
     * @tc.name testSensorEnumerationPart15Test0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART15_0600
     * @tc.desc Verify GetSensorInfos stop at resolution occurrence 62 with status 201 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart15Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 63 resolution 62 201 3 2 1 62 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'count|createInfos:63|infos|name:0|vendor:0|infoType:0|resolution:0|minimum:0|maximum:0|name:1|vendor:1|infoType:1|resolution:1|minimum:1|maximum:1|name:2|vendor:2|infoType:2|resolution:2|minimum:2|maximum:2|name:3|vendor:3|infoType:3|resolution:3|minimum:3|maximum:3|name:4|vendor:4|infoType:4|resolution:4|minimum:4|maximum:4|name:5|vendor:5|infoType:5|resolution:5|minimum:5|maximum:5|name:6|vendor:6|infoType:6|resolution:6|minimum:6|maximum:6|name:7|vendor:7|infoType:7|resolution:7|minimum:7|maximum:7|name:8|vendor:8|infoType:8|resolution:8|minimum:8|maximum:8|name:9|vendor:9|infoType:9|resolution:9|minimum:9|maximum:9|name:10|vendor:10|infoType:10|resolution:10|minimum:10|maximum:10|name:11|vendor:11|infoType:11|resolution:11|minimum:11|maximum:11|name:12|vendor:12|infoType:12|resolution:12|minimum:12|maximum:12|name:13|vendor:13|infoType:13|resolution:13|minimum:13|maximum:13|name:14|vendor:14|infoType:14|resolution:14|minimum:14|maximum:14|name:15|vendor:15|infoType:15|resolution:15|minimum:15|maximum:15|name:16|vendor:16|infoType:16|resolution:16|minimum:16|maximum:16|name:17|vendor:17|infoType:17|resolution:17|minimum:17|maximum:17|name:18|vendor:18|infoType:18|resolution:18|minimum:18|maximum:18|name:19|vendor:19|infoType:19|resolution:19|minimum:19|maximum:19|name:20|vendor:20|infoType:20|resolution:20|minimum:20|maximum:20|name:21|vendor:21|infoType:21|resolution:21|minimum:21|maximum:21|name:22|vendor:22|infoType:22|resolution:22|minimum:22|maximum:22|name:23|vendor:23|infoType:23|resolution:23|minimum:23|maximum:23|name:24|vendor:24|infoType:24|resolution:24|minimum:24|maximum:24|name:25|vendor:25|infoType:25|resolution:25|minimum:25|maximum:25|name:26|vendor:26|infoType:26|resolution:26|minimum:26|maximum:26|name:27|vendor:27|infoType:27|resolution:27|minimum:27|maximum:27|name:28|vendor:28|infoType:28|resolution:28|minimum:28|maximum:28|name:29|vendor:29|infoType:29|resolution:29|minimum:29|maximum:29|name:30|vendor:30|infoType:30|resolution:30|minimum:30|maximum:30|name:31|vendor:31|infoType:31|resolution:31|minimum:31|maximum:31|name:32|vendor:32|infoType:32|resolution:32|minimum:32|maximum:32|name:33|vendor:33|infoType:33|resolution:33|minimum:33|maximum:33|name:34|vendor:34|infoType:34|resolution:34|minimum:34|maximum:34|name:35|vendor:35|infoType:35|resolution:35|minimum:35|maximum:35|name:36|vendor:36|infoType:36|resolution:36|minimum:36|maximum:36|name:37|vendor:37|infoType:37|resolution:37|minimum:37|maximum:37|name:38|vendor:38|infoType:38|resolution:38|minimum:38|maximum:38|name:39|vendor:39|infoType:39|resolution:39|minimum:39|maximum:39|name:40|vendor:40|infoType:40|resolution:40|minimum:40|maximum:40|name:41|vendor:41|infoType:41|resolution:41|minimum:41|maximum:41|name:42|vendor:42|infoType:42|resolution:42|minimum:42|maximum:42|name:43|vendor:43|infoType:43|resolution:43|minimum:43|maximum:43|name:44|vendor:44|infoType:44|resolution:44|minimum:44|maximum:44|name:45|vendor:45|infoType:45|resolution:45|minimum:45|maximum:45|name:46|vendor:46|infoType:46|resolution:46|minimum:46|maximum:46|name:47|vendor:47|infoType:47|resolution:47|minimum:47|maximum:47|name:48|vendor:48|infoType:48|resolution:48|minimum:48|maximum:48|name:49|vendor:49|infoType:49|resolution:49|minimum:49|maximum:49|name:50|vendor:50|infoType:50|resolution:50|minimum:50|maximum:50|name:51|vendor:51|infoType:51|resolution:51|minimum:51|maximum:51|name:52|vendor:52|infoType:52|resolution:52|minimum:52|maximum:52|name:53|vendor:53|infoType:53|resolution:53|minimum:53|maximum:53|name:54|vendor:54|infoType:54|resolution:54|minimum:54|maximum:54|name:55|vendor:55|infoType:55|resolution:55|minimum:55|maximum:55|name:56|vendor:56|infoType:56|resolution:56|minimum:56|maximum:56|name:57|vendor:57|infoType:57|resolution:57|minimum:57|maximum:57|name:58|vendor:58|infoType:58|resolution:58|minimum:58|maximum:58|name:59|vendor:59|infoType:59|resolution:59|minimum:59|maximum:59|name:60|vendor:60|infoType:60|resolution:60|minimum:60|maximum:60|name:61|vendor:61|infoType:61|resolution:61|minimum:61|maximum:61|name:62|vendor:62|infoType:62|resolution:62|destroyInfos:63';
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

    /**
     * @tc.name testSensorEnumerationPart15Test0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART15_0700
     * @tc.desc Verify GetSensorInfos stop at resolution occurrence 62 with status 401 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart15Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 63 resolution 62 401 3 2 1 62 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'count|createInfos:63|infos|name:0|vendor:0|infoType:0|resolution:0|minimum:0|maximum:0|name:1|vendor:1|infoType:1|resolution:1|minimum:1|maximum:1|name:2|vendor:2|infoType:2|resolution:2|minimum:2|maximum:2|name:3|vendor:3|infoType:3|resolution:3|minimum:3|maximum:3|name:4|vendor:4|infoType:4|resolution:4|minimum:4|maximum:4|name:5|vendor:5|infoType:5|resolution:5|minimum:5|maximum:5|name:6|vendor:6|infoType:6|resolution:6|minimum:6|maximum:6|name:7|vendor:7|infoType:7|resolution:7|minimum:7|maximum:7|name:8|vendor:8|infoType:8|resolution:8|minimum:8|maximum:8|name:9|vendor:9|infoType:9|resolution:9|minimum:9|maximum:9|name:10|vendor:10|infoType:10|resolution:10|minimum:10|maximum:10|name:11|vendor:11|infoType:11|resolution:11|minimum:11|maximum:11|name:12|vendor:12|infoType:12|resolution:12|minimum:12|maximum:12|name:13|vendor:13|infoType:13|resolution:13|minimum:13|maximum:13|name:14|vendor:14|infoType:14|resolution:14|minimum:14|maximum:14|name:15|vendor:15|infoType:15|resolution:15|minimum:15|maximum:15|name:16|vendor:16|infoType:16|resolution:16|minimum:16|maximum:16|name:17|vendor:17|infoType:17|resolution:17|minimum:17|maximum:17|name:18|vendor:18|infoType:18|resolution:18|minimum:18|maximum:18|name:19|vendor:19|infoType:19|resolution:19|minimum:19|maximum:19|name:20|vendor:20|infoType:20|resolution:20|minimum:20|maximum:20|name:21|vendor:21|infoType:21|resolution:21|minimum:21|maximum:21|name:22|vendor:22|infoType:22|resolution:22|minimum:22|maximum:22|name:23|vendor:23|infoType:23|resolution:23|minimum:23|maximum:23|name:24|vendor:24|infoType:24|resolution:24|minimum:24|maximum:24|name:25|vendor:25|infoType:25|resolution:25|minimum:25|maximum:25|name:26|vendor:26|infoType:26|resolution:26|minimum:26|maximum:26|name:27|vendor:27|infoType:27|resolution:27|minimum:27|maximum:27|name:28|vendor:28|infoType:28|resolution:28|minimum:28|maximum:28|name:29|vendor:29|infoType:29|resolution:29|minimum:29|maximum:29|name:30|vendor:30|infoType:30|resolution:30|minimum:30|maximum:30|name:31|vendor:31|infoType:31|resolution:31|minimum:31|maximum:31|name:32|vendor:32|infoType:32|resolution:32|minimum:32|maximum:32|name:33|vendor:33|infoType:33|resolution:33|minimum:33|maximum:33|name:34|vendor:34|infoType:34|resolution:34|minimum:34|maximum:34|name:35|vendor:35|infoType:35|resolution:35|minimum:35|maximum:35|name:36|vendor:36|infoType:36|resolution:36|minimum:36|maximum:36|name:37|vendor:37|infoType:37|resolution:37|minimum:37|maximum:37|name:38|vendor:38|infoType:38|resolution:38|minimum:38|maximum:38|name:39|vendor:39|infoType:39|resolution:39|minimum:39|maximum:39|name:40|vendor:40|infoType:40|resolution:40|minimum:40|maximum:40|name:41|vendor:41|infoType:41|resolution:41|minimum:41|maximum:41|name:42|vendor:42|infoType:42|resolution:42|minimum:42|maximum:42|name:43|vendor:43|infoType:43|resolution:43|minimum:43|maximum:43|name:44|vendor:44|infoType:44|resolution:44|minimum:44|maximum:44|name:45|vendor:45|infoType:45|resolution:45|minimum:45|maximum:45|name:46|vendor:46|infoType:46|resolution:46|minimum:46|maximum:46|name:47|vendor:47|infoType:47|resolution:47|minimum:47|maximum:47|name:48|vendor:48|infoType:48|resolution:48|minimum:48|maximum:48|name:49|vendor:49|infoType:49|resolution:49|minimum:49|maximum:49|name:50|vendor:50|infoType:50|resolution:50|minimum:50|maximum:50|name:51|vendor:51|infoType:51|resolution:51|minimum:51|maximum:51|name:52|vendor:52|infoType:52|resolution:52|minimum:52|maximum:52|name:53|vendor:53|infoType:53|resolution:53|minimum:53|maximum:53|name:54|vendor:54|infoType:54|resolution:54|minimum:54|maximum:54|name:55|vendor:55|infoType:55|resolution:55|minimum:55|maximum:55|name:56|vendor:56|infoType:56|resolution:56|minimum:56|maximum:56|name:57|vendor:57|infoType:57|resolution:57|minimum:57|maximum:57|name:58|vendor:58|infoType:58|resolution:58|minimum:58|maximum:58|name:59|vendor:59|infoType:59|resolution:59|minimum:59|maximum:59|name:60|vendor:60|infoType:60|resolution:60|minimum:60|maximum:60|name:61|vendor:61|infoType:61|resolution:61|minimum:61|maximum:61|name:62|vendor:62|infoType:62|resolution:62|destroyInfos:63';
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

    /**
     * @tc.name testSensorEnumerationPart15Test0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART15_0800
     * @tc.desc Verify GetSensorInfos stop at resolution occurrence 62 with status 14500101 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart15Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 63 resolution 62 14500101 3 2 1 62 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'count|createInfos:63|infos|name:0|vendor:0|infoType:0|resolution:0|minimum:0|maximum:0|name:1|vendor:1|infoType:1|resolution:1|minimum:1|maximum:1|name:2|vendor:2|infoType:2|resolution:2|minimum:2|maximum:2|name:3|vendor:3|infoType:3|resolution:3|minimum:3|maximum:3|name:4|vendor:4|infoType:4|resolution:4|minimum:4|maximum:4|name:5|vendor:5|infoType:5|resolution:5|minimum:5|maximum:5|name:6|vendor:6|infoType:6|resolution:6|minimum:6|maximum:6|name:7|vendor:7|infoType:7|resolution:7|minimum:7|maximum:7|name:8|vendor:8|infoType:8|resolution:8|minimum:8|maximum:8|name:9|vendor:9|infoType:9|resolution:9|minimum:9|maximum:9|name:10|vendor:10|infoType:10|resolution:10|minimum:10|maximum:10|name:11|vendor:11|infoType:11|resolution:11|minimum:11|maximum:11|name:12|vendor:12|infoType:12|resolution:12|minimum:12|maximum:12|name:13|vendor:13|infoType:13|resolution:13|minimum:13|maximum:13|name:14|vendor:14|infoType:14|resolution:14|minimum:14|maximum:14|name:15|vendor:15|infoType:15|resolution:15|minimum:15|maximum:15|name:16|vendor:16|infoType:16|resolution:16|minimum:16|maximum:16|name:17|vendor:17|infoType:17|resolution:17|minimum:17|maximum:17|name:18|vendor:18|infoType:18|resolution:18|minimum:18|maximum:18|name:19|vendor:19|infoType:19|resolution:19|minimum:19|maximum:19|name:20|vendor:20|infoType:20|resolution:20|minimum:20|maximum:20|name:21|vendor:21|infoType:21|resolution:21|minimum:21|maximum:21|name:22|vendor:22|infoType:22|resolution:22|minimum:22|maximum:22|name:23|vendor:23|infoType:23|resolution:23|minimum:23|maximum:23|name:24|vendor:24|infoType:24|resolution:24|minimum:24|maximum:24|name:25|vendor:25|infoType:25|resolution:25|minimum:25|maximum:25|name:26|vendor:26|infoType:26|resolution:26|minimum:26|maximum:26|name:27|vendor:27|infoType:27|resolution:27|minimum:27|maximum:27|name:28|vendor:28|infoType:28|resolution:28|minimum:28|maximum:28|name:29|vendor:29|infoType:29|resolution:29|minimum:29|maximum:29|name:30|vendor:30|infoType:30|resolution:30|minimum:30|maximum:30|name:31|vendor:31|infoType:31|resolution:31|minimum:31|maximum:31|name:32|vendor:32|infoType:32|resolution:32|minimum:32|maximum:32|name:33|vendor:33|infoType:33|resolution:33|minimum:33|maximum:33|name:34|vendor:34|infoType:34|resolution:34|minimum:34|maximum:34|name:35|vendor:35|infoType:35|resolution:35|minimum:35|maximum:35|name:36|vendor:36|infoType:36|resolution:36|minimum:36|maximum:36|name:37|vendor:37|infoType:37|resolution:37|minimum:37|maximum:37|name:38|vendor:38|infoType:38|resolution:38|minimum:38|maximum:38|name:39|vendor:39|infoType:39|resolution:39|minimum:39|maximum:39|name:40|vendor:40|infoType:40|resolution:40|minimum:40|maximum:40|name:41|vendor:41|infoType:41|resolution:41|minimum:41|maximum:41|name:42|vendor:42|infoType:42|resolution:42|minimum:42|maximum:42|name:43|vendor:43|infoType:43|resolution:43|minimum:43|maximum:43|name:44|vendor:44|infoType:44|resolution:44|minimum:44|maximum:44|name:45|vendor:45|infoType:45|resolution:45|minimum:45|maximum:45|name:46|vendor:46|infoType:46|resolution:46|minimum:46|maximum:46|name:47|vendor:47|infoType:47|resolution:47|minimum:47|maximum:47|name:48|vendor:48|infoType:48|resolution:48|minimum:48|maximum:48|name:49|vendor:49|infoType:49|resolution:49|minimum:49|maximum:49|name:50|vendor:50|infoType:50|resolution:50|minimum:50|maximum:50|name:51|vendor:51|infoType:51|resolution:51|minimum:51|maximum:51|name:52|vendor:52|infoType:52|resolution:52|minimum:52|maximum:52|name:53|vendor:53|infoType:53|resolution:53|minimum:53|maximum:53|name:54|vendor:54|infoType:54|resolution:54|minimum:54|maximum:54|name:55|vendor:55|infoType:55|resolution:55|minimum:55|maximum:55|name:56|vendor:56|infoType:56|resolution:56|minimum:56|maximum:56|name:57|vendor:57|infoType:57|resolution:57|minimum:57|maximum:57|name:58|vendor:58|infoType:58|resolution:58|minimum:58|maximum:58|name:59|vendor:59|infoType:59|resolution:59|minimum:59|maximum:59|name:60|vendor:60|infoType:60|resolution:60|minimum:60|maximum:60|name:61|vendor:61|infoType:61|resolution:61|minimum:61|maximum:61|name:62|vendor:62|infoType:62|resolution:62|destroyInfos:63';
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

    /**
     * @tc.name testSensorEnumerationPart15Test0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART15_0900
     * @tc.desc Verify GetSensorInfos stop at minimum occurrence 62 with status 201 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart15Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 63 minimum 62 201 3 2 1 62 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'count|createInfos:63|infos|name:0|vendor:0|infoType:0|resolution:0|minimum:0|maximum:0|name:1|vendor:1|infoType:1|resolution:1|minimum:1|maximum:1|name:2|vendor:2|infoType:2|resolution:2|minimum:2|maximum:2|name:3|vendor:3|infoType:3|resolution:3|minimum:3|maximum:3|name:4|vendor:4|infoType:4|resolution:4|minimum:4|maximum:4|name:5|vendor:5|infoType:5|resolution:5|minimum:5|maximum:5|name:6|vendor:6|infoType:6|resolution:6|minimum:6|maximum:6|name:7|vendor:7|infoType:7|resolution:7|minimum:7|maximum:7|name:8|vendor:8|infoType:8|resolution:8|minimum:8|maximum:8|name:9|vendor:9|infoType:9|resolution:9|minimum:9|maximum:9|name:10|vendor:10|infoType:10|resolution:10|minimum:10|maximum:10|name:11|vendor:11|infoType:11|resolution:11|minimum:11|maximum:11|name:12|vendor:12|infoType:12|resolution:12|minimum:12|maximum:12|name:13|vendor:13|infoType:13|resolution:13|minimum:13|maximum:13|name:14|vendor:14|infoType:14|resolution:14|minimum:14|maximum:14|name:15|vendor:15|infoType:15|resolution:15|minimum:15|maximum:15|name:16|vendor:16|infoType:16|resolution:16|minimum:16|maximum:16|name:17|vendor:17|infoType:17|resolution:17|minimum:17|maximum:17|name:18|vendor:18|infoType:18|resolution:18|minimum:18|maximum:18|name:19|vendor:19|infoType:19|resolution:19|minimum:19|maximum:19|name:20|vendor:20|infoType:20|resolution:20|minimum:20|maximum:20|name:21|vendor:21|infoType:21|resolution:21|minimum:21|maximum:21|name:22|vendor:22|infoType:22|resolution:22|minimum:22|maximum:22|name:23|vendor:23|infoType:23|resolution:23|minimum:23|maximum:23|name:24|vendor:24|infoType:24|resolution:24|minimum:24|maximum:24|name:25|vendor:25|infoType:25|resolution:25|minimum:25|maximum:25|name:26|vendor:26|infoType:26|resolution:26|minimum:26|maximum:26|name:27|vendor:27|infoType:27|resolution:27|minimum:27|maximum:27|name:28|vendor:28|infoType:28|resolution:28|minimum:28|maximum:28|name:29|vendor:29|infoType:29|resolution:29|minimum:29|maximum:29|name:30|vendor:30|infoType:30|resolution:30|minimum:30|maximum:30|name:31|vendor:31|infoType:31|resolution:31|minimum:31|maximum:31|name:32|vendor:32|infoType:32|resolution:32|minimum:32|maximum:32|name:33|vendor:33|infoType:33|resolution:33|minimum:33|maximum:33|name:34|vendor:34|infoType:34|resolution:34|minimum:34|maximum:34|name:35|vendor:35|infoType:35|resolution:35|minimum:35|maximum:35|name:36|vendor:36|infoType:36|resolution:36|minimum:36|maximum:36|name:37|vendor:37|infoType:37|resolution:37|minimum:37|maximum:37|name:38|vendor:38|infoType:38|resolution:38|minimum:38|maximum:38|name:39|vendor:39|infoType:39|resolution:39|minimum:39|maximum:39|name:40|vendor:40|infoType:40|resolution:40|minimum:40|maximum:40|name:41|vendor:41|infoType:41|resolution:41|minimum:41|maximum:41|name:42|vendor:42|infoType:42|resolution:42|minimum:42|maximum:42|name:43|vendor:43|infoType:43|resolution:43|minimum:43|maximum:43|name:44|vendor:44|infoType:44|resolution:44|minimum:44|maximum:44|name:45|vendor:45|infoType:45|resolution:45|minimum:45|maximum:45|name:46|vendor:46|infoType:46|resolution:46|minimum:46|maximum:46|name:47|vendor:47|infoType:47|resolution:47|minimum:47|maximum:47|name:48|vendor:48|infoType:48|resolution:48|minimum:48|maximum:48|name:49|vendor:49|infoType:49|resolution:49|minimum:49|maximum:49|name:50|vendor:50|infoType:50|resolution:50|minimum:50|maximum:50|name:51|vendor:51|infoType:51|resolution:51|minimum:51|maximum:51|name:52|vendor:52|infoType:52|resolution:52|minimum:52|maximum:52|name:53|vendor:53|infoType:53|resolution:53|minimum:53|maximum:53|name:54|vendor:54|infoType:54|resolution:54|minimum:54|maximum:54|name:55|vendor:55|infoType:55|resolution:55|minimum:55|maximum:55|name:56|vendor:56|infoType:56|resolution:56|minimum:56|maximum:56|name:57|vendor:57|infoType:57|resolution:57|minimum:57|maximum:57|name:58|vendor:58|infoType:58|resolution:58|minimum:58|maximum:58|name:59|vendor:59|infoType:59|resolution:59|minimum:59|maximum:59|name:60|vendor:60|infoType:60|resolution:60|minimum:60|maximum:60|name:61|vendor:61|infoType:61|resolution:61|minimum:61|maximum:61|name:62|vendor:62|infoType:62|resolution:62|minimum:62|destroyInfos:63';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = 'get sensor min sampling interval failed|get sensor info failed';
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
     * @tc.name testSensorEnumerationPart15Test0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART15_1000
     * @tc.desc Verify GetSensorInfos stop at minimum occurrence 62 with status 401 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart15Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 63 minimum 62 401 3 2 1 62 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'count|createInfos:63|infos|name:0|vendor:0|infoType:0|resolution:0|minimum:0|maximum:0|name:1|vendor:1|infoType:1|resolution:1|minimum:1|maximum:1|name:2|vendor:2|infoType:2|resolution:2|minimum:2|maximum:2|name:3|vendor:3|infoType:3|resolution:3|minimum:3|maximum:3|name:4|vendor:4|infoType:4|resolution:4|minimum:4|maximum:4|name:5|vendor:5|infoType:5|resolution:5|minimum:5|maximum:5|name:6|vendor:6|infoType:6|resolution:6|minimum:6|maximum:6|name:7|vendor:7|infoType:7|resolution:7|minimum:7|maximum:7|name:8|vendor:8|infoType:8|resolution:8|minimum:8|maximum:8|name:9|vendor:9|infoType:9|resolution:9|minimum:9|maximum:9|name:10|vendor:10|infoType:10|resolution:10|minimum:10|maximum:10|name:11|vendor:11|infoType:11|resolution:11|minimum:11|maximum:11|name:12|vendor:12|infoType:12|resolution:12|minimum:12|maximum:12|name:13|vendor:13|infoType:13|resolution:13|minimum:13|maximum:13|name:14|vendor:14|infoType:14|resolution:14|minimum:14|maximum:14|name:15|vendor:15|infoType:15|resolution:15|minimum:15|maximum:15|name:16|vendor:16|infoType:16|resolution:16|minimum:16|maximum:16|name:17|vendor:17|infoType:17|resolution:17|minimum:17|maximum:17|name:18|vendor:18|infoType:18|resolution:18|minimum:18|maximum:18|name:19|vendor:19|infoType:19|resolution:19|minimum:19|maximum:19|name:20|vendor:20|infoType:20|resolution:20|minimum:20|maximum:20|name:21|vendor:21|infoType:21|resolution:21|minimum:21|maximum:21|name:22|vendor:22|infoType:22|resolution:22|minimum:22|maximum:22|name:23|vendor:23|infoType:23|resolution:23|minimum:23|maximum:23|name:24|vendor:24|infoType:24|resolution:24|minimum:24|maximum:24|name:25|vendor:25|infoType:25|resolution:25|minimum:25|maximum:25|name:26|vendor:26|infoType:26|resolution:26|minimum:26|maximum:26|name:27|vendor:27|infoType:27|resolution:27|minimum:27|maximum:27|name:28|vendor:28|infoType:28|resolution:28|minimum:28|maximum:28|name:29|vendor:29|infoType:29|resolution:29|minimum:29|maximum:29|name:30|vendor:30|infoType:30|resolution:30|minimum:30|maximum:30|name:31|vendor:31|infoType:31|resolution:31|minimum:31|maximum:31|name:32|vendor:32|infoType:32|resolution:32|minimum:32|maximum:32|name:33|vendor:33|infoType:33|resolution:33|minimum:33|maximum:33|name:34|vendor:34|infoType:34|resolution:34|minimum:34|maximum:34|name:35|vendor:35|infoType:35|resolution:35|minimum:35|maximum:35|name:36|vendor:36|infoType:36|resolution:36|minimum:36|maximum:36|name:37|vendor:37|infoType:37|resolution:37|minimum:37|maximum:37|name:38|vendor:38|infoType:38|resolution:38|minimum:38|maximum:38|name:39|vendor:39|infoType:39|resolution:39|minimum:39|maximum:39|name:40|vendor:40|infoType:40|resolution:40|minimum:40|maximum:40|name:41|vendor:41|infoType:41|resolution:41|minimum:41|maximum:41|name:42|vendor:42|infoType:42|resolution:42|minimum:42|maximum:42|name:43|vendor:43|infoType:43|resolution:43|minimum:43|maximum:43|name:44|vendor:44|infoType:44|resolution:44|minimum:44|maximum:44|name:45|vendor:45|infoType:45|resolution:45|minimum:45|maximum:45|name:46|vendor:46|infoType:46|resolution:46|minimum:46|maximum:46|name:47|vendor:47|infoType:47|resolution:47|minimum:47|maximum:47|name:48|vendor:48|infoType:48|resolution:48|minimum:48|maximum:48|name:49|vendor:49|infoType:49|resolution:49|minimum:49|maximum:49|name:50|vendor:50|infoType:50|resolution:50|minimum:50|maximum:50|name:51|vendor:51|infoType:51|resolution:51|minimum:51|maximum:51|name:52|vendor:52|infoType:52|resolution:52|minimum:52|maximum:52|name:53|vendor:53|infoType:53|resolution:53|minimum:53|maximum:53|name:54|vendor:54|infoType:54|resolution:54|minimum:54|maximum:54|name:55|vendor:55|infoType:55|resolution:55|minimum:55|maximum:55|name:56|vendor:56|infoType:56|resolution:56|minimum:56|maximum:56|name:57|vendor:57|infoType:57|resolution:57|minimum:57|maximum:57|name:58|vendor:58|infoType:58|resolution:58|minimum:58|maximum:58|name:59|vendor:59|infoType:59|resolution:59|minimum:59|maximum:59|name:60|vendor:60|infoType:60|resolution:60|minimum:60|maximum:60|name:61|vendor:61|infoType:61|resolution:61|minimum:61|maximum:61|name:62|vendor:62|infoType:62|resolution:62|minimum:62|destroyInfos:63';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = 'get sensor min sampling interval failed|get sensor info failed';
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
     * @tc.name testSensorEnumerationPart15Test0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART15_1100
     * @tc.desc Verify GetSensorInfos stop at minimum occurrence 62 with status 14500101 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart15Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 63 minimum 62 14500101 3 2 1 62 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'count|createInfos:63|infos|name:0|vendor:0|infoType:0|resolution:0|minimum:0|maximum:0|name:1|vendor:1|infoType:1|resolution:1|minimum:1|maximum:1|name:2|vendor:2|infoType:2|resolution:2|minimum:2|maximum:2|name:3|vendor:3|infoType:3|resolution:3|minimum:3|maximum:3|name:4|vendor:4|infoType:4|resolution:4|minimum:4|maximum:4|name:5|vendor:5|infoType:5|resolution:5|minimum:5|maximum:5|name:6|vendor:6|infoType:6|resolution:6|minimum:6|maximum:6|name:7|vendor:7|infoType:7|resolution:7|minimum:7|maximum:7|name:8|vendor:8|infoType:8|resolution:8|minimum:8|maximum:8|name:9|vendor:9|infoType:9|resolution:9|minimum:9|maximum:9|name:10|vendor:10|infoType:10|resolution:10|minimum:10|maximum:10|name:11|vendor:11|infoType:11|resolution:11|minimum:11|maximum:11|name:12|vendor:12|infoType:12|resolution:12|minimum:12|maximum:12|name:13|vendor:13|infoType:13|resolution:13|minimum:13|maximum:13|name:14|vendor:14|infoType:14|resolution:14|minimum:14|maximum:14|name:15|vendor:15|infoType:15|resolution:15|minimum:15|maximum:15|name:16|vendor:16|infoType:16|resolution:16|minimum:16|maximum:16|name:17|vendor:17|infoType:17|resolution:17|minimum:17|maximum:17|name:18|vendor:18|infoType:18|resolution:18|minimum:18|maximum:18|name:19|vendor:19|infoType:19|resolution:19|minimum:19|maximum:19|name:20|vendor:20|infoType:20|resolution:20|minimum:20|maximum:20|name:21|vendor:21|infoType:21|resolution:21|minimum:21|maximum:21|name:22|vendor:22|infoType:22|resolution:22|minimum:22|maximum:22|name:23|vendor:23|infoType:23|resolution:23|minimum:23|maximum:23|name:24|vendor:24|infoType:24|resolution:24|minimum:24|maximum:24|name:25|vendor:25|infoType:25|resolution:25|minimum:25|maximum:25|name:26|vendor:26|infoType:26|resolution:26|minimum:26|maximum:26|name:27|vendor:27|infoType:27|resolution:27|minimum:27|maximum:27|name:28|vendor:28|infoType:28|resolution:28|minimum:28|maximum:28|name:29|vendor:29|infoType:29|resolution:29|minimum:29|maximum:29|name:30|vendor:30|infoType:30|resolution:30|minimum:30|maximum:30|name:31|vendor:31|infoType:31|resolution:31|minimum:31|maximum:31|name:32|vendor:32|infoType:32|resolution:32|minimum:32|maximum:32|name:33|vendor:33|infoType:33|resolution:33|minimum:33|maximum:33|name:34|vendor:34|infoType:34|resolution:34|minimum:34|maximum:34|name:35|vendor:35|infoType:35|resolution:35|minimum:35|maximum:35|name:36|vendor:36|infoType:36|resolution:36|minimum:36|maximum:36|name:37|vendor:37|infoType:37|resolution:37|minimum:37|maximum:37|name:38|vendor:38|infoType:38|resolution:38|minimum:38|maximum:38|name:39|vendor:39|infoType:39|resolution:39|minimum:39|maximum:39|name:40|vendor:40|infoType:40|resolution:40|minimum:40|maximum:40|name:41|vendor:41|infoType:41|resolution:41|minimum:41|maximum:41|name:42|vendor:42|infoType:42|resolution:42|minimum:42|maximum:42|name:43|vendor:43|infoType:43|resolution:43|minimum:43|maximum:43|name:44|vendor:44|infoType:44|resolution:44|minimum:44|maximum:44|name:45|vendor:45|infoType:45|resolution:45|minimum:45|maximum:45|name:46|vendor:46|infoType:46|resolution:46|minimum:46|maximum:46|name:47|vendor:47|infoType:47|resolution:47|minimum:47|maximum:47|name:48|vendor:48|infoType:48|resolution:48|minimum:48|maximum:48|name:49|vendor:49|infoType:49|resolution:49|minimum:49|maximum:49|name:50|vendor:50|infoType:50|resolution:50|minimum:50|maximum:50|name:51|vendor:51|infoType:51|resolution:51|minimum:51|maximum:51|name:52|vendor:52|infoType:52|resolution:52|minimum:52|maximum:52|name:53|vendor:53|infoType:53|resolution:53|minimum:53|maximum:53|name:54|vendor:54|infoType:54|resolution:54|minimum:54|maximum:54|name:55|vendor:55|infoType:55|resolution:55|minimum:55|maximum:55|name:56|vendor:56|infoType:56|resolution:56|minimum:56|maximum:56|name:57|vendor:57|infoType:57|resolution:57|minimum:57|maximum:57|name:58|vendor:58|infoType:58|resolution:58|minimum:58|maximum:58|name:59|vendor:59|infoType:59|resolution:59|minimum:59|maximum:59|name:60|vendor:60|infoType:60|resolution:60|minimum:60|maximum:60|name:61|vendor:61|infoType:61|resolution:61|minimum:61|maximum:61|name:62|vendor:62|infoType:62|resolution:62|minimum:62|destroyInfos:63';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = 'get sensor min sampling interval failed|get sensor info failed';
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
     * @tc.name testSensorEnumerationPart15Test0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART15_1200
     * @tc.desc Verify GetSensorInfos stop at maximum occurrence 62 with status 201 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart15Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 63 maximum 62 201 3 2 1 62 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'count|createInfos:63|infos|name:0|vendor:0|infoType:0|resolution:0|minimum:0|maximum:0|name:1|vendor:1|infoType:1|resolution:1|minimum:1|maximum:1|name:2|vendor:2|infoType:2|resolution:2|minimum:2|maximum:2|name:3|vendor:3|infoType:3|resolution:3|minimum:3|maximum:3|name:4|vendor:4|infoType:4|resolution:4|minimum:4|maximum:4|name:5|vendor:5|infoType:5|resolution:5|minimum:5|maximum:5|name:6|vendor:6|infoType:6|resolution:6|minimum:6|maximum:6|name:7|vendor:7|infoType:7|resolution:7|minimum:7|maximum:7|name:8|vendor:8|infoType:8|resolution:8|minimum:8|maximum:8|name:9|vendor:9|infoType:9|resolution:9|minimum:9|maximum:9|name:10|vendor:10|infoType:10|resolution:10|minimum:10|maximum:10|name:11|vendor:11|infoType:11|resolution:11|minimum:11|maximum:11|name:12|vendor:12|infoType:12|resolution:12|minimum:12|maximum:12|name:13|vendor:13|infoType:13|resolution:13|minimum:13|maximum:13|name:14|vendor:14|infoType:14|resolution:14|minimum:14|maximum:14|name:15|vendor:15|infoType:15|resolution:15|minimum:15|maximum:15|name:16|vendor:16|infoType:16|resolution:16|minimum:16|maximum:16|name:17|vendor:17|infoType:17|resolution:17|minimum:17|maximum:17|name:18|vendor:18|infoType:18|resolution:18|minimum:18|maximum:18|name:19|vendor:19|infoType:19|resolution:19|minimum:19|maximum:19|name:20|vendor:20|infoType:20|resolution:20|minimum:20|maximum:20|name:21|vendor:21|infoType:21|resolution:21|minimum:21|maximum:21|name:22|vendor:22|infoType:22|resolution:22|minimum:22|maximum:22|name:23|vendor:23|infoType:23|resolution:23|minimum:23|maximum:23|name:24|vendor:24|infoType:24|resolution:24|minimum:24|maximum:24|name:25|vendor:25|infoType:25|resolution:25|minimum:25|maximum:25|name:26|vendor:26|infoType:26|resolution:26|minimum:26|maximum:26|name:27|vendor:27|infoType:27|resolution:27|minimum:27|maximum:27|name:28|vendor:28|infoType:28|resolution:28|minimum:28|maximum:28|name:29|vendor:29|infoType:29|resolution:29|minimum:29|maximum:29|name:30|vendor:30|infoType:30|resolution:30|minimum:30|maximum:30|name:31|vendor:31|infoType:31|resolution:31|minimum:31|maximum:31|name:32|vendor:32|infoType:32|resolution:32|minimum:32|maximum:32|name:33|vendor:33|infoType:33|resolution:33|minimum:33|maximum:33|name:34|vendor:34|infoType:34|resolution:34|minimum:34|maximum:34|name:35|vendor:35|infoType:35|resolution:35|minimum:35|maximum:35|name:36|vendor:36|infoType:36|resolution:36|minimum:36|maximum:36|name:37|vendor:37|infoType:37|resolution:37|minimum:37|maximum:37|name:38|vendor:38|infoType:38|resolution:38|minimum:38|maximum:38|name:39|vendor:39|infoType:39|resolution:39|minimum:39|maximum:39|name:40|vendor:40|infoType:40|resolution:40|minimum:40|maximum:40|name:41|vendor:41|infoType:41|resolution:41|minimum:41|maximum:41|name:42|vendor:42|infoType:42|resolution:42|minimum:42|maximum:42|name:43|vendor:43|infoType:43|resolution:43|minimum:43|maximum:43|name:44|vendor:44|infoType:44|resolution:44|minimum:44|maximum:44|name:45|vendor:45|infoType:45|resolution:45|minimum:45|maximum:45|name:46|vendor:46|infoType:46|resolution:46|minimum:46|maximum:46|name:47|vendor:47|infoType:47|resolution:47|minimum:47|maximum:47|name:48|vendor:48|infoType:48|resolution:48|minimum:48|maximum:48|name:49|vendor:49|infoType:49|resolution:49|minimum:49|maximum:49|name:50|vendor:50|infoType:50|resolution:50|minimum:50|maximum:50|name:51|vendor:51|infoType:51|resolution:51|minimum:51|maximum:51|name:52|vendor:52|infoType:52|resolution:52|minimum:52|maximum:52|name:53|vendor:53|infoType:53|resolution:53|minimum:53|maximum:53|name:54|vendor:54|infoType:54|resolution:54|minimum:54|maximum:54|name:55|vendor:55|infoType:55|resolution:55|minimum:55|maximum:55|name:56|vendor:56|infoType:56|resolution:56|minimum:56|maximum:56|name:57|vendor:57|infoType:57|resolution:57|minimum:57|maximum:57|name:58|vendor:58|infoType:58|resolution:58|minimum:58|maximum:58|name:59|vendor:59|infoType:59|resolution:59|minimum:59|maximum:59|name:60|vendor:60|infoType:60|resolution:60|minimum:60|maximum:60|name:61|vendor:61|infoType:61|resolution:61|minimum:61|maximum:61|name:62|vendor:62|infoType:62|resolution:62|minimum:62|maximum:62|destroyInfos:63';
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
     * @tc.name testSensorEnumerationPart15Test0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART15_1300
     * @tc.desc Verify GetSensorInfos stop at maximum occurrence 62 with status 401 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart15Test0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 63 maximum 62 401 3 2 1 62 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'count|createInfos:63|infos|name:0|vendor:0|infoType:0|resolution:0|minimum:0|maximum:0|name:1|vendor:1|infoType:1|resolution:1|minimum:1|maximum:1|name:2|vendor:2|infoType:2|resolution:2|minimum:2|maximum:2|name:3|vendor:3|infoType:3|resolution:3|minimum:3|maximum:3|name:4|vendor:4|infoType:4|resolution:4|minimum:4|maximum:4|name:5|vendor:5|infoType:5|resolution:5|minimum:5|maximum:5|name:6|vendor:6|infoType:6|resolution:6|minimum:6|maximum:6|name:7|vendor:7|infoType:7|resolution:7|minimum:7|maximum:7|name:8|vendor:8|infoType:8|resolution:8|minimum:8|maximum:8|name:9|vendor:9|infoType:9|resolution:9|minimum:9|maximum:9|name:10|vendor:10|infoType:10|resolution:10|minimum:10|maximum:10|name:11|vendor:11|infoType:11|resolution:11|minimum:11|maximum:11|name:12|vendor:12|infoType:12|resolution:12|minimum:12|maximum:12|name:13|vendor:13|infoType:13|resolution:13|minimum:13|maximum:13|name:14|vendor:14|infoType:14|resolution:14|minimum:14|maximum:14|name:15|vendor:15|infoType:15|resolution:15|minimum:15|maximum:15|name:16|vendor:16|infoType:16|resolution:16|minimum:16|maximum:16|name:17|vendor:17|infoType:17|resolution:17|minimum:17|maximum:17|name:18|vendor:18|infoType:18|resolution:18|minimum:18|maximum:18|name:19|vendor:19|infoType:19|resolution:19|minimum:19|maximum:19|name:20|vendor:20|infoType:20|resolution:20|minimum:20|maximum:20|name:21|vendor:21|infoType:21|resolution:21|minimum:21|maximum:21|name:22|vendor:22|infoType:22|resolution:22|minimum:22|maximum:22|name:23|vendor:23|infoType:23|resolution:23|minimum:23|maximum:23|name:24|vendor:24|infoType:24|resolution:24|minimum:24|maximum:24|name:25|vendor:25|infoType:25|resolution:25|minimum:25|maximum:25|name:26|vendor:26|infoType:26|resolution:26|minimum:26|maximum:26|name:27|vendor:27|infoType:27|resolution:27|minimum:27|maximum:27|name:28|vendor:28|infoType:28|resolution:28|minimum:28|maximum:28|name:29|vendor:29|infoType:29|resolution:29|minimum:29|maximum:29|name:30|vendor:30|infoType:30|resolution:30|minimum:30|maximum:30|name:31|vendor:31|infoType:31|resolution:31|minimum:31|maximum:31|name:32|vendor:32|infoType:32|resolution:32|minimum:32|maximum:32|name:33|vendor:33|infoType:33|resolution:33|minimum:33|maximum:33|name:34|vendor:34|infoType:34|resolution:34|minimum:34|maximum:34|name:35|vendor:35|infoType:35|resolution:35|minimum:35|maximum:35|name:36|vendor:36|infoType:36|resolution:36|minimum:36|maximum:36|name:37|vendor:37|infoType:37|resolution:37|minimum:37|maximum:37|name:38|vendor:38|infoType:38|resolution:38|minimum:38|maximum:38|name:39|vendor:39|infoType:39|resolution:39|minimum:39|maximum:39|name:40|vendor:40|infoType:40|resolution:40|minimum:40|maximum:40|name:41|vendor:41|infoType:41|resolution:41|minimum:41|maximum:41|name:42|vendor:42|infoType:42|resolution:42|minimum:42|maximum:42|name:43|vendor:43|infoType:43|resolution:43|minimum:43|maximum:43|name:44|vendor:44|infoType:44|resolution:44|minimum:44|maximum:44|name:45|vendor:45|infoType:45|resolution:45|minimum:45|maximum:45|name:46|vendor:46|infoType:46|resolution:46|minimum:46|maximum:46|name:47|vendor:47|infoType:47|resolution:47|minimum:47|maximum:47|name:48|vendor:48|infoType:48|resolution:48|minimum:48|maximum:48|name:49|vendor:49|infoType:49|resolution:49|minimum:49|maximum:49|name:50|vendor:50|infoType:50|resolution:50|minimum:50|maximum:50|name:51|vendor:51|infoType:51|resolution:51|minimum:51|maximum:51|name:52|vendor:52|infoType:52|resolution:52|minimum:52|maximum:52|name:53|vendor:53|infoType:53|resolution:53|minimum:53|maximum:53|name:54|vendor:54|infoType:54|resolution:54|minimum:54|maximum:54|name:55|vendor:55|infoType:55|resolution:55|minimum:55|maximum:55|name:56|vendor:56|infoType:56|resolution:56|minimum:56|maximum:56|name:57|vendor:57|infoType:57|resolution:57|minimum:57|maximum:57|name:58|vendor:58|infoType:58|resolution:58|minimum:58|maximum:58|name:59|vendor:59|infoType:59|resolution:59|minimum:59|maximum:59|name:60|vendor:60|infoType:60|resolution:60|minimum:60|maximum:60|name:61|vendor:61|infoType:61|resolution:61|minimum:61|maximum:61|name:62|vendor:62|infoType:62|resolution:62|minimum:62|maximum:62|destroyInfos:63';
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
     * @tc.name testSensorEnumerationPart15Test0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART15_1400
     * @tc.desc Verify GetSensorInfos stop at maximum occurrence 62 with status 14500101 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart15Test0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 63 maximum 62 14500101 3 2 1 62 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'count|createInfos:63|infos|name:0|vendor:0|infoType:0|resolution:0|minimum:0|maximum:0|name:1|vendor:1|infoType:1|resolution:1|minimum:1|maximum:1|name:2|vendor:2|infoType:2|resolution:2|minimum:2|maximum:2|name:3|vendor:3|infoType:3|resolution:3|minimum:3|maximum:3|name:4|vendor:4|infoType:4|resolution:4|minimum:4|maximum:4|name:5|vendor:5|infoType:5|resolution:5|minimum:5|maximum:5|name:6|vendor:6|infoType:6|resolution:6|minimum:6|maximum:6|name:7|vendor:7|infoType:7|resolution:7|minimum:7|maximum:7|name:8|vendor:8|infoType:8|resolution:8|minimum:8|maximum:8|name:9|vendor:9|infoType:9|resolution:9|minimum:9|maximum:9|name:10|vendor:10|infoType:10|resolution:10|minimum:10|maximum:10|name:11|vendor:11|infoType:11|resolution:11|minimum:11|maximum:11|name:12|vendor:12|infoType:12|resolution:12|minimum:12|maximum:12|name:13|vendor:13|infoType:13|resolution:13|minimum:13|maximum:13|name:14|vendor:14|infoType:14|resolution:14|minimum:14|maximum:14|name:15|vendor:15|infoType:15|resolution:15|minimum:15|maximum:15|name:16|vendor:16|infoType:16|resolution:16|minimum:16|maximum:16|name:17|vendor:17|infoType:17|resolution:17|minimum:17|maximum:17|name:18|vendor:18|infoType:18|resolution:18|minimum:18|maximum:18|name:19|vendor:19|infoType:19|resolution:19|minimum:19|maximum:19|name:20|vendor:20|infoType:20|resolution:20|minimum:20|maximum:20|name:21|vendor:21|infoType:21|resolution:21|minimum:21|maximum:21|name:22|vendor:22|infoType:22|resolution:22|minimum:22|maximum:22|name:23|vendor:23|infoType:23|resolution:23|minimum:23|maximum:23|name:24|vendor:24|infoType:24|resolution:24|minimum:24|maximum:24|name:25|vendor:25|infoType:25|resolution:25|minimum:25|maximum:25|name:26|vendor:26|infoType:26|resolution:26|minimum:26|maximum:26|name:27|vendor:27|infoType:27|resolution:27|minimum:27|maximum:27|name:28|vendor:28|infoType:28|resolution:28|minimum:28|maximum:28|name:29|vendor:29|infoType:29|resolution:29|minimum:29|maximum:29|name:30|vendor:30|infoType:30|resolution:30|minimum:30|maximum:30|name:31|vendor:31|infoType:31|resolution:31|minimum:31|maximum:31|name:32|vendor:32|infoType:32|resolution:32|minimum:32|maximum:32|name:33|vendor:33|infoType:33|resolution:33|minimum:33|maximum:33|name:34|vendor:34|infoType:34|resolution:34|minimum:34|maximum:34|name:35|vendor:35|infoType:35|resolution:35|minimum:35|maximum:35|name:36|vendor:36|infoType:36|resolution:36|minimum:36|maximum:36|name:37|vendor:37|infoType:37|resolution:37|minimum:37|maximum:37|name:38|vendor:38|infoType:38|resolution:38|minimum:38|maximum:38|name:39|vendor:39|infoType:39|resolution:39|minimum:39|maximum:39|name:40|vendor:40|infoType:40|resolution:40|minimum:40|maximum:40|name:41|vendor:41|infoType:41|resolution:41|minimum:41|maximum:41|name:42|vendor:42|infoType:42|resolution:42|minimum:42|maximum:42|name:43|vendor:43|infoType:43|resolution:43|minimum:43|maximum:43|name:44|vendor:44|infoType:44|resolution:44|minimum:44|maximum:44|name:45|vendor:45|infoType:45|resolution:45|minimum:45|maximum:45|name:46|vendor:46|infoType:46|resolution:46|minimum:46|maximum:46|name:47|vendor:47|infoType:47|resolution:47|minimum:47|maximum:47|name:48|vendor:48|infoType:48|resolution:48|minimum:48|maximum:48|name:49|vendor:49|infoType:49|resolution:49|minimum:49|maximum:49|name:50|vendor:50|infoType:50|resolution:50|minimum:50|maximum:50|name:51|vendor:51|infoType:51|resolution:51|minimum:51|maximum:51|name:52|vendor:52|infoType:52|resolution:52|minimum:52|maximum:52|name:53|vendor:53|infoType:53|resolution:53|minimum:53|maximum:53|name:54|vendor:54|infoType:54|resolution:54|minimum:54|maximum:54|name:55|vendor:55|infoType:55|resolution:55|minimum:55|maximum:55|name:56|vendor:56|infoType:56|resolution:56|minimum:56|maximum:56|name:57|vendor:57|infoType:57|resolution:57|minimum:57|maximum:57|name:58|vendor:58|infoType:58|resolution:58|minimum:58|maximum:58|name:59|vendor:59|infoType:59|resolution:59|minimum:59|maximum:59|name:60|vendor:60|infoType:60|resolution:60|minimum:60|maximum:60|name:61|vendor:61|infoType:61|resolution:61|minimum:61|maximum:61|name:62|vendor:62|infoType:62|resolution:62|minimum:62|maximum:62|destroyInfos:63';
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
     * @tc.name testSensorEnumerationPart15Test0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART15_1500
     * @tc.desc Verify GetSensorInfos stop at createInfos occurrence 0 with status 401 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart15Test0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 3 createInfos 0 401 3 2 1 0 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string = 'count|createInfos:3';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = 'create sensorInfo array failed';
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
     * @tc.name testSensorEnumerationPart15Test0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART15_1600
     * @tc.desc Verify GetSensorInfos stop at infos occurrence 0 with status 201 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart15Test0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 3 infos 0 201 3 2 1 0 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string = 'count|createInfos:3|infos|destroyInfos:3';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = 'get all sensor info failed';
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
     * @tc.name testSensorEnumerationPart15Test0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART15_1700
     * @tc.desc Verify GetSensorInfos stop at infos occurrence 0 with status 401 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart15Test0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 3 infos 0 401 3 2 1 0 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string = 'count|createInfos:3|infos|destroyInfos:3';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = 'get all sensor info failed';
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
     * @tc.name testSensorEnumerationPart15Test0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART15_1800
     * @tc.desc Verify GetSensorInfos stop at infos occurrence 0 with status 14500101 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart15Test0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 3 infos 0 14500101 3 2 1 0 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string = 'count|createInfos:3|infos|destroyInfos:3';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = 'get all sensor info failed';
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
     * @tc.name testSensorEnumerationPart15Test0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART15_1900
     * @tc.desc Verify GetSensorInfos enumerate 3 sensors with name length 1 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart15Test0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 3 none 0 401 3 2 1 0 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'count|createInfos:3|infos|name:0|vendor:0|infoType:0|resolution:0|minimum:0|maximum:0|name:1|vendor:1|infoType:1|resolution:1|minimum:1|maximum:1|name:2|vendor:2|infoType:2|resolution:2|minimum:2|maximum:2|destroyInfos:3';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = '';
      expect(actualErrors).assertEqual(expectedErrors);
      const actualMessages: string = result.messages;
      const expectedMessages: string = 'GetSensorInfos successful';
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
     * @tc.name testSensorEnumerationPart15Test0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART15_2000
     * @tc.desc Verify GetSensorInfos enumerate 3 sensors with name length 2 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart15Test0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 3 none 0 401 3 2 1 1 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'count|createInfos:3|infos|name:0|vendor:0|infoType:0|resolution:0|minimum:0|maximum:0|name:1|vendor:1|infoType:1|resolution:1|minimum:1|maximum:1|name:2|vendor:2|infoType:2|resolution:2|minimum:2|maximum:2|destroyInfos:3';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = '';
      expect(actualErrors).assertEqual(expectedErrors);
      const actualMessages: string = result.messages;
      const expectedMessages: string = 'GetSensorInfos successful';
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
     * @tc.name testSensorEnumerationPart15Test0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART15_2100
     * @tc.desc Verify GetSensorInfos enumerate 3 sensors with name length 31 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart15Test0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 3 none 0 401 3 2 1 30 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'count|createInfos:3|infos|name:0|vendor:0|infoType:0|resolution:0|minimum:0|maximum:0|name:1|vendor:1|infoType:1|resolution:1|minimum:1|maximum:1|name:2|vendor:2|infoType:2|resolution:2|minimum:2|maximum:2|destroyInfos:3';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = '';
      expect(actualErrors).assertEqual(expectedErrors);
      const actualMessages: string = result.messages;
      const expectedMessages: string = 'GetSensorInfos successful';
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
     * @tc.name testSensorEnumerationPart15Test0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART15_2200
     * @tc.desc Verify GetSensorInfos enumerate 3 sensors with name length 62 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart15Test0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 3 none 0 401 3 2 1 61 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'count|createInfos:3|infos|name:0|vendor:0|infoType:0|resolution:0|minimum:0|maximum:0|name:1|vendor:1|infoType:1|resolution:1|minimum:1|maximum:1|name:2|vendor:2|infoType:2|resolution:2|minimum:2|maximum:2|destroyInfos:3';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = '';
      expect(actualErrors).assertEqual(expectedErrors);
      const actualMessages: string = result.messages;
      const expectedMessages: string = 'GetSensorInfos successful';
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
     * @tc.name testSensorEnumerationPart15Test0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART15_2300
     * @tc.desc Verify GetSensorInfos enumerate 3 sensors with name length 63 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart15Test0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 3 none 0 401 3 2 1 62 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string =
        'count|createInfos:3|infos|name:0|vendor:0|infoType:0|resolution:0|minimum:0|maximum:0|name:1|vendor:1|infoType:1|resolution:1|minimum:1|maximum:1|name:2|vendor:2|infoType:2|resolution:2|minimum:2|maximum:2|destroyInfos:3';
      expect(actualTrace).assertEqual(expectedTrace);
      const actualErrors: string = result.errors;
      const expectedErrors: string = '';
      expect(actualErrors).assertEqual(expectedErrors);
      const actualMessages: string = result.messages;
      const expectedMessages: string = 'GetSensorInfos successful';
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
     * @tc.name testSensorEnumerationPart15Test0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART15_2400
     * @tc.desc Verify GetSensorInfos stop at name occurrence 0 with status 201 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart15Test0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 3 name 0 201 3 2 1 62 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string = 'count|createInfos:3|infos|name:0|destroyInfos:3';
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
     * @tc.name testSensorEnumerationPart15Test0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART15_2500
     * @tc.desc Verify GetSensorInfos stop at name occurrence 0 with status 401 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart15Test0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 3 name 0 401 3 2 1 62 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string = 'count|createInfos:3|infos|name:0|destroyInfos:3';
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
     * @tc.name testSensorEnumerationPart15Test0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART15_2600
     * @tc.desc Verify GetSensorInfos stop at name occurrence 0 with status 14500101 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart15Test0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 3 name 0 14500101 3 2 1 62 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string = 'count|createInfos:3|infos|name:0|destroyInfos:3';
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
     * @tc.name testSensorEnumerationPart15Test0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_ENUMERATION_PART15_2700
     * @tc.desc Verify GetSensorInfos stop at vendor occurrence 0 with status 201 and release owned resources.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEnumerationPart15Test0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const input: string = 'info 3 vendor 0 201 3 2 1 62 0 0';
      const result: NativeObservation = runNativeScenario(input);
      const actualTrace: string = result.trace;
      const expectedTrace: string = 'count|createInfos:3|infos|name:0|vendor:0|destroyInfos:3';
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
  });
}
