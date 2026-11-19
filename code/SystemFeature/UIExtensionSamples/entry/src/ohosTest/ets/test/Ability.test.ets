/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { abilityDelegatorRegistry, Component, Driver, ON } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, it, expect, beforeAll } from '@ohos/hypium';

const TAG = '[Sample_UIExtensionSamples]';
const DOMAIN = 0xF811;
const BUNDLE = 'UIExtensionSamples_';
const TIME = 1500;
const APP_BUNDLE = 'com.samples.uiextension';
const APP_ENTRY_ABILITY = 'EntryAbility';
const APP_ROOT_ID = 'AbilityStartCallback';
const WAIT_TIMEOUT = 10000;
const POLL_INTERVAL = 300;

// Poll until the component appears; keeps the original assertion error on timeout.
async function mustFind(driver: Driver, id: string): Promise<Component> {
  const start: number = Date.now();
  while (Date.now() - start < WAIT_TIMEOUT) {
    try {
      const found: Component | null = await driver.findComponent(ON.id(id));
      if (found !== null && found !== undefined) {
        return found;
      }
    } catch (e) {
      hilog.warn(DOMAIN, TAG, BUNDLE + 'findComponent failed: ' + id);
    }
    await driver.delayMs(POLL_INTERVAL);
  }
  await driver.assertComponentExist(ON.id(id));
  return await driver.findComponent(ON.id(id));
}

// Bring the sample app to the foreground and back to its Index page,
// so every case starts from a known state regardless of the previous case.
async function ensureIndex(driver: Driver): Promise<void> {
  try {
    await abilityDelegatorRegistry.getAbilityDelegator().startAbility({
      bundleName: APP_BUNDLE,
      abilityName: APP_ENTRY_ABILITY
    });
  } catch (e) {
    hilog.warn(DOMAIN, TAG, BUNDLE + 'startAbility failed');
  }
  for (let i = 0; i < 6; i++) {
    let atIndex: boolean = false;
    try {
      const root: Component | null = await driver.findComponent(ON.id(APP_ROOT_ID));
      atIndex = root !== null && root !== undefined;
    } catch (e) {
      hilog.warn(DOMAIN, TAG, BUNDLE + 'find index failed');
    }
    if (atIndex) {
      return;
    }
    await driver.pressBack();
    await driver.delayMs(400);
  }
  await driver.assertComponentExist(ON.id(APP_ROOT_ID));
}

export default function abilityTest() {
  describe('ActsAbilityTest', () => {

    beforeAll(async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility begin');
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        await abilityDelegator.startAbility({
          bundleName: 'com.samples.uiextension',
          abilityName: 'EntryAbility'
        });
      } catch (err) {
        expect(err.code).assertEqual(0);
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility end');
    })

    /**
     * @tc.number     : UIExtensionSamples_AbilityStartCallback_001
     * @tc.name       : UIExtensionSamples_AbilityStartCallback_001
     * @tc.desc       : Test the interface in AbilityStartCallback
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('UIExtensionSamples_AbilityStartCallback_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'UIExtensionSamples_AbilityStartCallback_001 begin');

      let driver = await Driver.create();
      await driver.delayMs(TIME);
      await ensureIndex(driver);

      let abilityStartCallback = await mustFind(driver, 'AbilityStartCallback');
      await abilityStartCallback.click();
      await driver.delayMs(TIME);

      let onResult = await mustFind(driver, 'onResult');
      await onResult.click();
      await driver.delayMs(TIME);
      await driver.pressBack();
      await driver.delayMs(TIME);

      let onError = await mustFind(driver, 'onError');
      await onError.click();
      await driver.delayMs(TIME);

      hilog.info(DOMAIN, TAG, BUNDLE + 'UIExtensionSamples_AbilityStartCallback_001 end');
      await driver.delayMs(TIME);
      await driver.pressBack();
      await driver.delayMs(TIME);
      done()
    })

    /**
     * @tc.number     : UIExtensionSamples_UIAbilityContext_001
     * @tc.name       : UIExtensionSamples_UIAbilityContext_001
     * @tc.desc       : Test the interface in UIAbilityContext
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('UIExtensionSamples_UIAbilityContext_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'UIExtensionSamples_UIAbilityContext_001 begin');
      let driver = await Driver.create();
      await driver.delayMs(TIME);
      await ensureIndex(driver);

      let uiExtensionContext = await mustFind(driver, 'UIExtensionContext');
      await uiExtensionContext.click();
      await driver.delayMs(TIME);

      let openLink = await mustFind(driver, 'openLink');
      await openLink.click();
      await driver.delayMs(TIME);
      await driver.pressBack();
      await driver.delayMs(TIME);

      let startUIExtensionFirst = await mustFind(driver, 'startUIExtensionAbility');
      await startUIExtensionFirst.click();
      await driver.delayMs(TIME);

      let reportDrawnCompleted = await mustFind(driver, 'reportDrawnCompleted');
      await reportDrawnCompleted.click();
      await driver.delayMs(TIME);

      let terminateSelfCallback = await mustFind(driver, 'terminateSelfCallback');
      await terminateSelfCallback.click();
      await driver.delayMs(TIME);

      let startUIExtensionSecond = await mustFind(driver, 'startUIExtensionAbility');
      await startUIExtensionSecond.click();
      await driver.delayMs(TIME);

      hilog.info(DOMAIN, TAG, BUNDLE + 'UIExtensionSamples_UIAbilityContext_001 end');
      done()
    })

  })
}
