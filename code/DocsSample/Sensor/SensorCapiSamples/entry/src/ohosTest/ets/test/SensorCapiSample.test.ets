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
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  launchSensorApp,
  resetDriver,
  readPageSnapshot,
  SensorPageSnapshot,
  assertSensorPageStructure,
  invokeSensorOperation,
  ScenarioStepModel,
  OperationRecord,
  RegressionTestRecorder,
  executeScenario,
  SENSOR_INFO_BUTTON,
  SUBSCRIBER_BUTTON,
  assertButtonBounds,
  tapButtonCenter,
  waitForResult,
  assertResultIsReadOnly,
  assertVerticalButtonOrder,
  assertUniqueComponentIds,
  assertOperationLabelsPersist,
  assertResultPrecedesActions,
  assertResultPersistsAcrossForeground,
} from './Shared/SharedDriver';

export default function SensorCapiSampleTest(): void {
  describe('SensorCapiSampleTest', () => {
    let driver: Driver;
    beforeAll((): void => {
      driver = getDriver();
      hilog.info(0x0000, 'SensorCapiTest', 'Starting SensorCapiSampleTest');
    });
    beforeEach(async (): Promise<void> => {
      await launchSensorApp();
    });
    afterEach(async (): Promise<void> => {
      await assertSensorPageStructure(driver);
    });
    afterAll(async (): Promise<void> => {
      await resetDriver();
    });

    /**
     * @tc.name testSensorCapiSampleTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_CAPI_SAMPLE_0100
     * @tc.desc Verify getSensorInfos button updates the page result after invoking the native wrapper.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorCapiSampleTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const step: ScenarioStepModel = new ScenarioStepModel(SENSOR_INFO_BUTTON, 'getSensorInfos:success');
      const record: OperationRecord = await invokeSensorOperation(driver, step);
      const actual: string = record.actualText;
      const expected: string = 'getSensorInfos:success';
      expect(actual).assertEqual(expected);
      await assertOperationLabelsPersist(driver);
    });

    /**
     * @tc.name testSensorCapiSampleTest0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_CAPI_SAMPLE_0200
     * @tc.desc Verify subscriber button updates the page result after the native subscription workflow returns.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorCapiSampleTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const step: ScenarioStepModel = new ScenarioStepModel(SUBSCRIBER_BUTTON, 'subscriber:success');
      const record: OperationRecord = await invokeSensorOperation(driver, step);
      const actual: string = record.actualText;
      const expected: string = 'subscriber:success';
      expect(actual).assertEqual(expected);
      await assertOperationLabelsPersist(driver);
    });

    /**
     * @tc.name testSensorCapiSampleTest0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_CAPI_SAMPLE_0300
     * @tc.desc Verify alternating enumeration and subscription operations preserve the last visible result.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorCapiSampleTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const steps: ScenarioStepModel[] = [
        new ScenarioStepModel(SENSOR_INFO_BUTTON, 'getSensorInfos:success'),
        new ScenarioStepModel(SUBSCRIBER_BUTTON, 'subscriber:success'),
        new ScenarioStepModel(SENSOR_INFO_BUTTON, 'getSensorInfos:success'),
      ];
      const recorder: RegressionTestRecorder = await executeScenario(driver, steps);
      const actualCount: number = recorder.size();
      const expectedCount: number = 3;
      expect(actualCount).assertEqual(expectedCount);
      const matched: boolean = recorder.allMatched();
      expect(matched).assertTrue();
      const finalRecord: OperationRecord = recorder.get(2);
      const finalText: string = finalRecord.actualText;
      const expectedText: string = 'getSensorInfos:success';
      expect(finalText).assertEqual(expectedText);
    });

    /**
     * @tc.name testSensorCapiSampleTest0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_CAPI_SAMPLE_0400
     * @tc.desc Verify repeated subscriber invocations can be followed by sensor enumeration.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorCapiSampleTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const steps: ScenarioStepModel[] = [
        new ScenarioStepModel(SUBSCRIBER_BUTTON, 'subscriber:success'),
        new ScenarioStepModel(SUBSCRIBER_BUTTON, 'subscriber:success'),
        new ScenarioStepModel(SENSOR_INFO_BUTTON, 'getSensorInfos:success'),
      ];
      const recorder: RegressionTestRecorder = await executeScenario(driver, steps);
      const matched: boolean = recorder.allMatched();
      expect(matched).assertTrue();
      const actualCount: number = recorder.size();
      const expectedCount: number = 3;
      expect(actualCount).assertEqual(expectedCount);
    });

    /**
     * @tc.name testSensorCapiSampleTest0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_CAPI_SAMPLE_0500
     * @tc.desc Verify coordinate touch on getSensorInfos invokes the enumeration action.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorCapiSampleTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await assertButtonBounds(driver, SENSOR_INFO_BUTTON);
      await tapButtonCenter(driver, SENSOR_INFO_BUTTON);
      const actual: string = await waitForResult(driver, 'getSensorInfos:success');
      const expected: string = 'getSensorInfos:success';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.name testSensorCapiSampleTest0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_CAPI_SAMPLE_0600
     * @tc.desc Verify coordinate touch on subscriber invokes the subscription action.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorCapiSampleTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await assertButtonBounds(driver, SUBSCRIBER_BUTTON);
      await tapButtonCenter(driver, SUBSCRIBER_BUTTON);
      const actual: string = await waitForResult(driver, 'subscriber:success');
      const expected: string = 'subscriber:success';
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.name testSensorCapiSampleTest0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_CAPI_SAMPLE_0700
     * @tc.desc Verify sensor result text and button layout expose the documented page structure.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorCapiSampleTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      await assertResultIsReadOnly(driver);
      await assertVerticalButtonOrder(driver);
      await assertButtonBounds(driver, SENSOR_INFO_BUTTON);
      await assertButtonBounds(driver, SUBSCRIBER_BUTTON);
      await assertResultPrecedesActions(driver);
      const snapshot: SensorPageSnapshot = await readPageSnapshot(driver);
      const actualButtons: number = snapshot.buttonCount;
      const expectedButtons: number = 2;
      expect(actualButtons).assertEqual(expectedButtons);
    });

    /**
     * @tc.name testSensorCapiSampleTest0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_SENSOR_CAPI_SAMPLE_0800
     * @tc.desc Verify foreground restoration retains the last getSensorInfos page result.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorCapiSampleTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const step: ScenarioStepModel = new ScenarioStepModel(SENSOR_INFO_BUTTON, 'getSensorInfos:success');
      await invokeSensorOperation(driver, step);
      await assertResultPersistsAcrossForeground(driver);
      const snapshot: SensorPageSnapshot = await readPageSnapshot(driver);
      const actual: string = snapshot.resultText;
      const expected: string = 'getSensorInfos:success';
      expect(actual).assertEqual(expected);
    });
  });
}
