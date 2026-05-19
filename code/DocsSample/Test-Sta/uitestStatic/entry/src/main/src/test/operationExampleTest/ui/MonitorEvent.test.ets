'use static';
/**
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

import { beforeAll, describe, expect, it, TestType } from "../../../../../hypium/index";
import { abilityDelegatorRegistry, Component, Driver, ON, UIElementInfo, UIEventObserver } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import { Utils, startAbility, stopApplication } from '../../Util.test';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
const WAIT_UI_READYMS: int = 1000;
const waitUiReadyMs: int = 1000;

export default function monitorEventTest(): void {
  describe('monitorEventTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await startAbility(bundleName, 'EntryAbility');
      await Utils.msSleep(2000);
      await Utils.pushUrl('pages/Index', 'Index');
      await Utils.msSleep(2000);
    })

    /**
     * @tc.number:testMonitor_001
     * @tc.name: testMonitor_toast
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: toast监听测试
     */
    it('testMonitor_toast', TestType.FUNCTION, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let observer: UIEventObserver = await driver.createUIEventObserver();
      let callback = (uiElementInfo: UIElementInfo): void => {
        try {
          expect(uiElementInfo.bundleName == 'com.samples.test.uitest.static').assertTrue();
          expect(uiElementInfo.text == 'testMessage').assertTrue();
          expect(uiElementInfo.type == 'Toast').assertTrue();
        } catch (e) {
          console.log(`testMonitor_toast, error, ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      }
      observer.onceToastShow(callback);
      let btn: Component | null = await driver.findComponent(ON.text('showToast'));
      await btn!.click();
      await driver.delayMs(waitUiReadyMs * 2);
    })

    /**
     * @tc.number:testMonitor_002
     * @tc.name: testMonitor_dialog
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: dialog监听测试
     */
    it('testMonitor_dialog', TestType.FUNCTION, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let observer: UIEventObserver = await driver.createUIEventObserver();
      let callback = (uiElementInfo: UIElementInfo): void => {
        try {
          expect(uiElementInfo.bundleName == 'com.samples.test.uitest.static').assertTrue();
          expect(uiElementInfo.text == 'testDialogtestMessage').assertTrue();
          expect(uiElementInfo.type == 'AlertDialog').assertTrue();
        } catch (e) {
          console.log(`testMonitor_dialog, error, ${JSON.stringify(e)}`);
          expect().assertFail();
        }
      }
      observer.onceDialogShow(callback);
      let btn: Component | null = await driver.findComponent(ON.text('showDialog'));
      await btn!.click();
      await driver.delayMs(waitUiReadyMs * 5);
    })
  })
}
