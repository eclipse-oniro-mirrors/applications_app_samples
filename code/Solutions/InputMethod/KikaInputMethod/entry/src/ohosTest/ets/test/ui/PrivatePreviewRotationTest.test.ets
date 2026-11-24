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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import { yieldToEventLoop } from '../support/AsyncSupport';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Driver, DisplayRotation, ON } from '@ohos.UiTest';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodPreviewRotation]';

async function startPage(): Promise<Driver> {
  await AbilityDelegatorRegistry.getAbilityDelegator()
    .executeShellCommand('aa start -b com.samples.kikainput -a EntryAbility').catch(() => {});
  const driver: Driver = Driver.create();
  await driver.delayMs(2000);
  return driver;
}

export default function privatePreviewRotationTest(): void {
  describe('PrivatePreviewRotationTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_ROTATION_0001
     * @tc.name      testPrivatePreviewRotationTest_001
     * @tc.desc      Verify that the preview page keeps its input after a 180-degree rotation.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPrivatePreviewRotationTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewRotationTest_001 begin');
      const driver: Driver = await startPage();
      await driver.setDisplayRotation(DisplayRotation.ROTATION_180);
      await driver.delayMs(800);
      await driver.assertComponentExist(ON.type('TextInput'));
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
      await driver.delayMs(800);
      await driver.assertComponentExist(ON.type('TextArea'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewRotationTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_ROTATION_0002
     * @tc.name      testPrivatePreviewRotationTest_002
     * @tc.desc      Verify that a 270-degree round trip restores the portrait component set.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPrivatePreviewRotationTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewRotationTest_002 begin');
      const driver: Driver = await startPage();
      await driver.setDisplayRotation(DisplayRotation.ROTATION_270);
      await driver.delayMs(800);
      await driver.assertComponentExist(ON.type('TextInput'));
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
      await driver.delayMs(800);
      const areas = await driver.findComponents(ON.type('TextArea'));
      expect(areas.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewRotationTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_ROTATION_0003
     * @tc.name      testPrivatePreviewRotationTest_003
     * @tc.desc      Verify that the page survives a home and foreground round trip.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPrivatePreviewRotationTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewRotationTest_003 begin');
      const driver: Driver = await startPage();
      await driver.pressHome();
      await driver.delayMs(800);
      await AbilityDelegatorRegistry.getAbilityDelegator()
        .executeShellCommand('aa start -b com.samples.kikainput -a EntryAbility').catch(() => {});
      await driver.delayMs(1200);
      await driver.assertComponentExist(ON.type('TextInput'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewRotationTest_003 end');
      await yieldToEventLoop();
    });

  });

}
