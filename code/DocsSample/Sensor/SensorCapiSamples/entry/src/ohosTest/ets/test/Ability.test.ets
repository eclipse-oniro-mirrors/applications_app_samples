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

export default function SensorAbilityTest(): void {
  describe('SensorAbilityTest', () => {
    let driver: Driver;
    beforeAll((): void => {
      driver = getDriver();
      hilog.info(0x0000, 'SensorCapiTest', 'Starting SensorAbilityTest');
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
     * @tc.name testSensorAbilityTest0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_SAMPLE_ABILITY_0100
     * @tc.desc Verify EntryAbility exposes both sensor operations and one result panel.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAbilityTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const snapshot: SensorPageSnapshot = await readPageSnapshot(driver);
      const infoLabel: string = snapshot.infoText;
      const expectedInfoLabel: string = 'getSensorInfos';
      expect(infoLabel).assertEqual(expectedInfoLabel);
      const subscriberLabel: string = snapshot.subscriberText;
      const expectedSubscriberLabel: string = 'subscriber';
      expect(subscriberLabel).assertEqual(expectedSubscriberLabel);
      const resultCount: number = snapshot.resultCount;
      const expectedCount: number = 1;
      expect(resultCount).assertEqual(expectedCount);
      await assertUniqueComponentIds(driver);
    });
  });
}
