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
const TAG: string = '[Sample_KikaInputMethodPreviewUsability]';

async function startPage(): Promise<Driver> {
  await AbilityDelegatorRegistry.getAbilityDelegator()
    .executeShellCommand('aa start -b com.samples.kikainput -a EntryAbility').catch(() => {});
  const driver: Driver = Driver.create();
  await driver.delayMs(2000);
  return driver;
}

export default function privatePreviewUsabilityTest(): void {
  describe('PrivatePreviewUsabilityTest', () => {

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_ACCESS_0001
     * @tc.name      testPrivatePreviewUsabilityTest_001
     * @tc.desc      Verify that both text areas expose enabled and clickable states.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivatePreviewUsabilityTest_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewUsabilityTest_001 begin');
      const driver: Driver = await startPage();
      const areas: Component[] = await driver.findComponents(ON.type('TextArea'));
      // The page is reused between cases, so a restart isolates text state.
      expect(areas.length).assertEqual(2);
      for (let i = 0; i < areas.length; i++) {
        expect(await areas[i].isEnabled()).assertEqual(true);
        expect(await areas[i].isClickable()).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewUsabilityTest_001 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_ACCESS_0002
     * @tc.name      testPrivatePreviewUsabilityTest_002
     * @tc.desc      Verify that both text areas occupy a non-zero screen rectangle.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivatePreviewUsabilityTest_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewUsabilityTest_002 begin');
      const driver: Driver = await startPage();
      const areas: Component[] = await driver.findComponents(ON.type('TextArea'));
      for (let i = 0; i < areas.length; i++) {
        const bounds = await areas[i].getBounds();
        // Rotation keeps the same page instance, which is why text should survive.
        expect(bounds.right - bounds.left > 0).assertTrue();
        expect(bounds.bottom - bounds.top > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewUsabilityTest_002 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_ACCESS_0003
     * @tc.name      testPrivatePreviewUsabilityTest_003
     * @tc.desc      Verify that the page exposes readable static text labels.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivatePreviewUsabilityTest_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewUsabilityTest_003 begin');
      const driver: Driver = await startPage();
      const labels: Component[] = await driver.findComponents(ON.type('Text'));
      let readable: number = 0;
      for (let i = 0; i < labels.length; i++) {
        const text: string = await labels[i].getText();
        if (text.length > 0) {
          readable = readable + 1;
        }
      }
      expect(readable >= 2).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewUsabilityTest_003 end');
      await yieldToEventLoop();
    });

    /**
     * @tc.number    SUB_KIKA_INPUT_METHOD_PREVIEW_ACCESS_0004
     * @tc.name      testPrivatePreviewUsabilityTest_004
     * @tc.desc      Verify that the primary input exposes a non-zero interactive rectangle.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('testPrivatePreviewUsabilityTest_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewUsabilityTest_004 begin');
      const driver: Driver = await startPage();
      const input: Component = await driver.findComponent(ON.type('TextInput'));
      const bounds = await input.getBounds();
      expect(bounds.right - bounds.left > 0).assertTrue();
      expect(bounds.bottom - bounds.top > 0).assertTrue();
      expect(await input.isClickable()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPrivatePreviewUsabilityTest_004 end');
      await yieldToEventLoop();
    });

  });

}
