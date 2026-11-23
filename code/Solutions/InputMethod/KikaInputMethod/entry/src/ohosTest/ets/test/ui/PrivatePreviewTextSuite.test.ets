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

import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog';
import { Component, DisplayRotation, Driver, ON } from '@ohos.UiTest';
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../support/AsyncSupport';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodPrivatePreviewText]';

async function startPage(): Promise<Driver> {
  await AbilityDelegatorRegistry.getAbilityDelegator()
    .executeShellCommand('aa start -b com.samples.kikainput -a EntryAbility').catch(() => {});
  const driver: Driver = Driver.create();
  await driver.delayMs(2000);
  return driver;
}

export default function PrivatePreviewTextSuiteTest(): void {
  describe('PrivatePreviewTextSuite', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PRIVATE_PREVIEW_UI_0001
     * @tc.name      testPrivatePreviewUi_001
     * @tc.desc      The preview page exposes its primary text input field.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testPrivatePreviewUi_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewUi_001 begin');

      const driver: Driver = Driver.create();
      await AbilityDelegatorRegistry.getAbilityDelegator().executeShellCommand('aa start -b com.samples.kikainput -a EntryAbility').then(result => {
        hilog.info(DOMAIN, TAG, '%{public}s', 'entry ability launch requested');
      }).catch((err: Error) => {
        hilog.error(DOMAIN, TAG, '%{public}s', 'entry ability launch failed');
      })
      await driver.delayMs(2000);

      // EntryAbility hosts the preview page; component lookup proves it rendered.
      await driver.assertComponentExist(ON.type('TextInput'));

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewUi_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PRIVATE_PREVIEW_UI_0002
     * @tc.name      testPrivatePreviewUi_002
     * @tc.desc      The preview page exposes its custom input display component.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('testPrivatePreviewUi_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const driver: Driver = Driver.create();
      await AbilityDelegatorRegistry.getAbilityDelegator()
        .executeShellCommand('aa start -b com.samples.kikainput -a EntryAbility').catch(() => {});
      await driver.delayMs(2000);
      const customInputs: Component[] = await driver.findComponents(ON.id('customInput123'));
      expect(customInputs.length > 0).assertTrue();
      const textInputs: Component[] = await driver.findComponents(ON.type('TextInput'));
      expect(textInputs.length > 0).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewUi_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_TEXT_EDGE_0001
     * @tc.name      testPrivatePreviewTextEdgeTest_001
     * @tc.desc      Verify that a text area stores an emoji pair and a flag without loss.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivatePreviewTextEdgeTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewTextEdgeTest_001 begin');
      const driver: Driver = await startPage();
      const areas: Component[] = await driver.findComponents(ON.type('TextArea'));
      await areas[0].inputText('😀🇺🇳');
      await driver.delayMs(300);
      expect((await areas[0].getText()).includes('😀')).assertTrue();
      expect((await areas[0].getText()).includes('🇺🇳')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewTextEdgeTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_TEXT_EDGE_0002
     * @tc.name      testPrivatePreviewTextEdgeTest_002
     * @tc.desc      Verify that primary input text survives a ninety-degree rotation round trip.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('testPrivatePreviewTextEdgeTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewTextEdgeTest_002 begin');
      const driver: Driver = await startPage();
      const input: Component = await driver.findComponent(ON.type('TextInput'));
      await input.inputText('edge');
      await driver.setDisplayRotation(DisplayRotation.ROTATION_90);
      await driver.delayMs(800);
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
      await driver.delayMs(800);
      const again: Component = await driver.findComponent(ON.type('TextInput'));
      expect((await again.getText()).includes('edge')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewTextEdgeTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_TEXT_INPUT_0001
     * @tc.name      testPrivatePreviewTextInputTest_001
     * @tc.desc      Verify that mixed CJK and digit input is stored verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivatePreviewTextInputTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewTextInputTest_001 begin');
      const driver: Driver = await startPage();
      const input: Component = await driver.findComponent(ON.type('TextInput'));
      await input.inputText('输入测试123');
      await driver.delayMs(300);
      expect(await input.getText()).assertEqual('输入测试123');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewTextInputTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_TEXT_INPUT_0002
     * @tc.name      testPrivatePreviewTextInputTest_002
     * @tc.desc      Verify that forty-nine characters are kept without clamping.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivatePreviewTextInputTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewTextInputTest_002 begin');
      const driver: Driver = await startPage();
      const input: Component = await driver.findComponent(ON.type('TextInput'));
      let payload: string = '';
      for (let i = 0; i < 49; i++) {
        payload = payload + 'b';
      }
      await input.inputText(payload);
      await driver.delayMs(300);
      expect((await input.getText()).length).assertEqual(49);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewTextInputTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_TEXT_INPUT_0003
     * @tc.name      testPrivatePreviewTextInputTest_003
     * @tc.desc      Verify that digit input in the first text area leaves the second area empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivatePreviewTextInputTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewTextInputTest_003 begin');
      const driver: Driver = await startPage();
      const areas: Component[] = await driver.findComponents(ON.type('TextArea'));
      const secondBefore: string = await areas[1].getText();
      await areas[0].inputText('12345');
      await driver.delayMs(300);
      expect((await areas[0].getText()).includes('12345')).assertTrue();
      expect(await areas[1].getText()).assertEqual(secondBefore);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewTextInputTest_003 end');
      await yieldToEventLoop();
    });

  });
}
