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
import { abilityDelegatorRegistry, Component, Driver, ON } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import { Utils, startAbility, stopApplication } from '../../Util.test';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
const waitUiReadyMs: int = 1000;
export default function ScrollerEventTest(): void {
  describe('ScrollerEvent', (): void => {
    beforeAll(async (): Promise<void> => {
      await startAbility(bundleName, 'EntryAbility');
      await Utils.msSleep(2000);
    })

    /**
     * @tc.number:ScrollerEventTest_001
     * @tc.name: ScrollerEvent_bottom
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测 uitest scrollToBottom 滑到底部功能
     */
    it('ScrollerEvent_bottom', TestType.FUNCTION, async (): Promise<void> => {
      await Utils.pushUrl('pages/Scroller', 'Scroller');
      await Utils.msSleep(2000);
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let scroll: Component | null = await driver.findComponent(ON.type('Scroll'));
      await scroll!.scrollToBottom();
      await driver.delayMs(waitUiReadyMs);
      let text: Component | null = await driver.findComponent(ON.id('scroller_item_text'));
      let messageText = await text!.getText();
      expect(messageText).not().assertEqual('0');
    })

    /**
      * @tc.number:ScrollerEventTest_002
      * @tc.name: ScrollerEvent_top
      * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
      * @tc.desc: 检测 uitest scrollToTop 滑到顶部功能
      */
    it('ScrollerEvent_top', TestType.FUNCTION, async (): Promise<void> => {
      await Utils.pushUrl('pages/Scroller', 'Scroller');
      await Utils.msSleep(2000);
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let scroll: Component | null = await driver.findComponent(ON.type('Scroll'));
      await scroll!.scrollToBottom();
      await driver.delayMs(waitUiReadyMs);
      await scroll!.scrollToTop();
      let text: Component | null = await driver.findComponent(ON.id('scroller_item_text'));
      let messageText = await text!.getText();
      expect(messageText).assertEqual('0');
    })
  })
}
