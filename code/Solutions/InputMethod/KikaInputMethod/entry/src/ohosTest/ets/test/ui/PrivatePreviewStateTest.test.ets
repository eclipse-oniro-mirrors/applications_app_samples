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
const TAG: string = '[Sample_KikaInputMethodPreviewState]';

async function startPage(): Promise<Driver> {
  await AbilityDelegatorRegistry.getAbilityDelegator()
    .executeShellCommand('aa start -b com.samples.kikainput -a EntryAbility').catch(() => {});
  const driver: Driver = Driver.create();
  await driver.delayMs(2000);
  return driver;
}

export default function privatePreviewStateTest(): void {
  describe('PrivatePreviewStateTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_STATE_0001
     * @tc.name      testPrivatePreviewStateTest_001
     * @tc.desc      Verify that primary input text survives a home and foreground round trip.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPrivatePreviewStateTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewStateTest_001 begin');
      const driver: Driver = await startPage();
      const input: Component = await driver.findComponent(ON.type('TextInput'));
      await input.inputText('keep');
      await driver.pressHome();
      await driver.delayMs(800);
      await AbilityDelegatorRegistry.getAbilityDelegator()
        .executeShellCommand('aa start -b com.samples.kikainput -a EntryAbility').catch(() => {});
      await driver.delayMs(1500);
      const again: Component = await driver.findComponent(ON.type('TextInput'));
      expect((await again.getText()).includes('keep')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewStateTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_STATE_0002
     * @tc.name      testPrivatePreviewStateTest_002
     * @tc.desc      Verify that primary input text survives a 180-degree rotation round trip.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPrivatePreviewStateTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewStateTest_002 begin');
      const driver: Driver = await startPage();
      const input: Component = await driver.findComponent(ON.type('TextInput'));
      await input.inputText('spin');
      await driver.setDisplayRotation(DisplayRotation.ROTATION_180);
      await driver.delayMs(800);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
      await driver.delayMs(800);
      const again: Component = await driver.findComponent(ON.type('TextInput'));
      expect((await again.getText()).includes('spin')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewStateTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_STATE_0003
     * @tc.name      testPrivatePreviewStateTest_003
     * @tc.desc      Verify that typing in the second text area does not change the first one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivatePreviewStateTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewStateTest_003 begin');
      const driver: Driver = await startPage();
      const areas: Component[] = await driver.findComponents(ON.type('TextArea'));
      const firstBefore: string = await areas[0].getText();
      await areas[1].inputText('second-only');
      await driver.delayMs(300);
      expect(await areas[0].getText()).assertEqual(firstBefore);
      expect((await areas[1].getText()).includes('second-only')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewStateTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_STATE_0004
     * @tc.name      testPrivatePreviewStateTest_004
     * @tc.desc      Verify that a text area accepts one hundred characters without truncation.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL3
     */
    it('testPrivatePreviewStateTest_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewStateTest_004 begin');
      const driver: Driver = await startPage();
      const areas: Component[] = await driver.findComponents(ON.type('TextArea'));
      let payload: string = '';
      for (let i = 0; i < 100; i++) {
        payload = payload + 'x';
      }
      await areas[0].inputText(payload);
      await driver.delayMs(300);
      expect((await areas[0].getText()).length >= 100).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewStateTest_004 end');
      await yieldToEventLoop();
    });

  });

}
