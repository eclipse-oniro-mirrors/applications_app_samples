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
import { Component, Driver, DisplayRotation, ON } from '@ohos.UiTest';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodPreviewInteraction]';

async function startPage(): Promise<Driver> {
  await AbilityDelegatorRegistry.getAbilityDelegator()
    .executeShellCommand('aa start -b com.samples.kikainput -a EntryAbility').then(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'entry ability launch requested');
    }).catch((err: Error) => {
      hilog.error(DOMAIN, TAG, '%{public}s', 'entry ability launch failed');
    });

  const driver: Driver = Driver.create();
  await driver.delayMs(2000);
  return driver;
}

export default function privatePreviewInteractionTest(): void {
  describe('PrivatePreviewInteractionTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_INTERACTION_0001
     * @tc.name      testPrivatePreviewInteractionTest_001
     * @tc.desc      Verify that typed text appears in the primary preview input.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivatePreviewInteractionTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewInteractionTest_001 begin');
      const driver: Driver = await startPage();
      const input: Component = await driver.findComponent(ON.type('TextInput'));

      await input.inputText('hello');
      await driver.delayMs(300);
      const text: string = await input.getText();
      expect(text).assertEqual('hello');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewInteractionTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_INTERACTION_0002
     * @tc.name      testPrivatePreviewInteractionTest_002
     * @tc.desc      Verify that the primary input enforces its fifty-character limit.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivatePreviewInteractionTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewInteractionTest_002 begin');
      const driver: Driver = await startPage();
      const input: Component = await driver.findComponent(ON.type('TextInput'));
      let payload: string = '';
      for (let i = 0; i < 60; i++) {
        payload = payload + 'a';
      }

      await input.inputText(payload);
      await driver.delayMs(300);
      const text: string = await input.getText();
      expect(text.length).assertEqual(50);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewInteractionTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_INTERACTION_0003
     * @tc.name      testPrivatePreviewInteractionTest_003
     * @tc.desc      Verify that both text areas accept independent input text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivatePreviewInteractionTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewInteractionTest_003 begin');
      const driver: Driver = await startPage();
      const areas: Component[] = await driver.findComponents(ON.type('TextArea'));

      expect(areas.length).assertEqual(2);
      await areas[0].inputText('first');
      await areas[1].inputText('second');
      await driver.delayMs(300);
      expect(await areas[0].getText()).assertEqual('first');
      expect(await areas[1].getText()).assertEqual('second');

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewInteractionTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_INTERACTION_0004
     * @tc.name      testPrivatePreviewInteractionTest_004
     * @tc.desc      Verify that the primary input is enabled and clickable for usability.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivatePreviewInteractionTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewInteractionTest_004 begin');
      const driver: Driver = await startPage();
      const input: Component = await driver.findComponent(ON.type('TextInput'));

      expect(await input.isEnabled()).assertEqual(true);
      expect(await input.isClickable()).assertEqual(true);
      const bounds = await input.getBounds();
      expect(bounds.right - bounds.left > 0).assertTrue();
      expect(bounds.bottom - bounds.top > 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewInteractionTest_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_INTERACTION_0005
     * @tc.name      testPrivatePreviewInteractionTest_005
     * @tc.desc      Verify that the page keeps both text areas after a portrait rotation round trip.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPrivatePreviewInteractionTest_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewInteractionTest_005 begin');
      const driver: Driver = await startPage();
      await driver.setDisplayRotation(DisplayRotation.ROTATION_90);
      await driver.delayMs(800);
      const areas: Component[] = await driver.findComponents(ON.type('TextArea'));
      expect(areas.length).assertEqual(2);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
      await driver.delayMs(800);
      await driver.assertComponentExist(ON.type('TextInput'));

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewInteractionTest_005 end');
      await yieldToEventLoop();
    });

  });

}
