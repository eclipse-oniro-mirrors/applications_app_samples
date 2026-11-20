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
import { Component, Driver, ON } from '@ohos.UiTest';

const DOMAIN: number = 0xF814;
const TAG: string = '[Sample_KikaInputMethodPrivatePreviewLayout]';

async function startPreviewPage(): Promise<void> {
  await AbilityDelegatorRegistry.getAbilityDelegator()
    .executeShellCommand('aa start -b com.samples.kikainput -a EntryAbility').then(() => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'entry ability launch requested');
    }).catch((err: Error) => {
      hilog.error(DOMAIN, TAG, '%{public}s', 'entry ability launch failed');
    });

  await Driver.create().delayMs(2000);
}

export default function privatePreviewLayoutTest(): void {
  describe('PrivatePreviewLayoutTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_LAYOUT_0001
     * @tc.name      testPrivatePreviewLayoutTest_001
     * @tc.desc      Verify that the preview page renders both immersive and non-immersive text areas.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivatePreviewLayoutTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewLayoutTest_001 begin');
      await startPreviewPage();
      const driver: Driver = Driver.create();
      const areas: Component[] = await driver.findComponents(ON.type('TextArea'));

      expect(areas.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewLayoutTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_LAYOUT_0002
     * @tc.name      testPrivatePreviewLayoutTest_002
     * @tc.desc      Verify that the preview page keeps the text input and both text areas in one tree.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivatePreviewLayoutTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewLayoutTest_002 begin');
      await startPreviewPage();
      const driver: Driver = Driver.create();
      const inputs: Component[] = await driver.findComponents(ON.type('TextInput'));
      const areas: Component[] = await driver.findComponents(ON.type('TextArea'));

      expect(inputs.length >= 1).assertTrue();
      expect(areas.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewLayoutTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_LAYOUT_0003
     * @tc.name      testPrivatePreviewLayoutTest_003
     * @tc.desc      Verify that the page provides at least two static text blocks beside the editors.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivatePreviewLayoutTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewLayoutTest_003 begin');
      await startPreviewPage();
      const driver: Driver = Driver.create();
      const labels: Component[] = await driver.findComponents(ON.type('Text'));

      expect(labels.length >= 2).assertTrue();

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewLayoutTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_LAYOUT_0004
     * @tc.name      testPrivatePreviewLayoutTest_004
     * @tc.desc      Verify that a second launch request does not duplicate the text area pair.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivatePreviewLayoutTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewLayoutTest_004 begin');
      await startPreviewPage();
      await startPreviewPage();
      const driver: Driver = Driver.create();
      const areas: Component[] = await driver.findComponents(ON.type('TextArea'));

      expect(areas.length).assertEqual(2);

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewLayoutTest_004 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_LAYOUT_0005
     * @tc.name      testPrivatePreviewLayoutTest_005
     * @tc.desc      Verify that the custom input and the primary input coexist after page start.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivatePreviewLayoutTest_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewLayoutTest_005 begin');
      await startPreviewPage();
      const driver: Driver = Driver.create();

      await driver.assertComponentExist(ON.id('customInput123'));
      await driver.assertComponentExist(ON.type('TextInput'));
      await driver.assertComponentExist(ON.type('TextArea'));

      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewLayoutTest_005 end');
      await yieldToEventLoop();
    });

  });

}
