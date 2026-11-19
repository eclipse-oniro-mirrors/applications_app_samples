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
import { sensor } from '@kit.SensorServiceKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { launchSensorApp, requireComponent, readComponentText, assertSensorInventory } from './Shared/SharedDriver';

export default function abilityTest(): void {
  describe('SensorEntryAbility', () => {
    beforeAll(() => {});
    beforeEach(async () => {
      await launchSensorApp();
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.name testSensorEntryAbility0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_ABILITY_0100
     * @tc.desc Verify EntryAbility opens the actual sensor selection and result controls
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEntryAbility0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const selector = await requireComponent('sensor_type_selector');
      const assertionActual1 = await selector.isEnabled();
      expect(assertionActual1).assertTrue();
      await requireComponent('callbackText');
      await requireComponent('deviceText');
      await requireComponent('sensorApiText');
      const sensors: sensor.Sensor[] = await sensor.getSensorList();
      assertSensorInventory(sensors);
    });

    /**
     * @tc.name testSensorEntryAbility0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_JS_SAMPLE_ABILITY_0200
     * @tc.desc Verify starting EntryAbility again preserves a usable sensor page
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorEntryAbility0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      const before: string = await readComponentText('sensorApiText');
      await launchSensorApp();
      const assertionActual2 = await readComponentText('sensorApiText');
      expect(assertionActual2).assertEqual(before);
      const button = await requireComponent('subscribeId');
      const assertionActual3 = await button.isEnabled();
      expect(assertionActual3).assertTrue();
    });
  });
}
