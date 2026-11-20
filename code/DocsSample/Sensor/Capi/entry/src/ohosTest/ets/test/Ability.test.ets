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

import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { DisplayRotation } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import { relaunchAndWait, compassComponentCount, isCompassVisible, readDirection, requireById,
  runSerializedUiOperation, readTextById, isHeadingText, readHeading, backgroundAndRestore,
  readDisplayRotation, rotateDisplay, waitForCompassStable, resetDriver } from './Shared/SharedDriver';

export default function abilityTest(): void {
  describe('SensorAbility', () => {
    beforeAll(() => {
      hilog.info(0xF811, 'SensorTest', '%{public}s', 'SensorAbility begin');
    });
    beforeEach(async () => {
      await relaunchAndWait();
    });
    afterEach(() => {
      hilog.debug(0xF811, 'SensorTest', '%{public}s', 'SensorAbility case completed');
    });
    afterAll(async () => {
      await resetDriver();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_UI_0100
     * @tc.name testSensorAbilityLaunchTest0001
     * @tc.desc Verify EntryAbility renders all three compass components
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAbilityLaunchTest0001', 0, async (): Promise<void> => {
      expect(await compassComponentCount()).assertEqual(3);
      expect(await isCompassVisible()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_UI_0200
     * @tc.name testSensorAbilityDirectionTest0002
     * @tc.desc Verify directionMy displays the north resource used by this project
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAbilityDirectionTest0002', 0, async (): Promise<void> => {
      expect(await readDirection()).assertEqual('北');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_UI_0300
     * @tc.name testSensorAbilityCompassImageTest0003
     * @tc.desc Verify compassPointing is an Image component
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAbilityCompassImageTest0003', 0, async (): Promise<void> => {
      const component = await requireById('compassPointing');
      const type = await runSerializedUiOperation(async (): Promise<string> => component.getType());
      expect(type).assertEqual('Image');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_UI_0400
     * @tc.name testSensorAbilityAngleLabelTest0004
     * @tc.desc Verify tiltAngle contains a normalized integer degree label
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAbilityAngleLabelTest0004', 0, async (): Promise<void> => {
      const text = await readTextById('tiltAngle');
      expect(isHeadingText(text)).assertTrue();
      const heading = await readHeading();
      expect(heading >= 0 && heading < 360).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_UI_0500
     * @tc.name testSensorAbilityBackgroundRestoreTest0005
     * @tc.desc Verify EntryAbility restores the compass view after backgrounding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAbilityBackgroundRestoreTest0005', 0, async (): Promise<void> => {
      await backgroundAndRestore();
      expect(await compassComponentCount()).assertEqual(3);
      expect(isHeadingText(await readTextById('tiltAngle'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SENSOR_CAPI_UI_0600
     * @tc.name testSensorAbilityRotationRestoreTest0006
     * @tc.desc Verify compass components remain visible across a display rotation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testSensorAbilityRotationRestoreTest0006', 0, async (): Promise<void> => {
      const previous = await readDisplayRotation();
      try {
        await rotateDisplay(DisplayRotation.ROTATION_90);
        await waitForCompassStable();
        expect(await compassComponentCount()).assertEqual(3);
        expect(isHeadingText(await readTextById('tiltAngle'))).assertTrue();
      } finally {
        await rotateDisplay(previous);
        await waitForCompassStable();
      }
    });

  });
}
