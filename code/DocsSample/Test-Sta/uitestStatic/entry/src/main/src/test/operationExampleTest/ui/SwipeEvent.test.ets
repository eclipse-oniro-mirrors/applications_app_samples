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

import { beforeAll, describe, expect, it, Level, Size, TestType } from "../../../../../hypium/index";
import { abilityDelegatorRegistry, Component, Driver, ON, Rect, Point } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import { BusinessError } from '@ohos.base';
import { display } from '@kit.ArkUI';
import { Utils, startAbility, stopApplication } from '../../Util.test';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
const waitUiReadyMs: int = 1000;

export default function SwipeEventTest(): void {
  describe('SwipeEvent', (): void => {
    beforeAll(async (): Promise<void> => {
      await startAbility(bundleName, 'EntryAbility');
      await Utils.msSleep(2000);
    })

    /**
     * @tc.number:SwipeEventTest_001
     * @tc.name: testSwipe_h
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测 uitest swipe 水平滑到功能 坐标点仅支持RK3568
     */
    it('testSwipe_h', TestType.FUNCTION, async (): Promise<void> => {
      await Utils.pushUrl('pages/Swipe', 'Swipe');
      await Utils.msSleep(2000);
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let swiper: Component | null = await driver.findComponent(ON.id('swiper'));
      let point: Rect = await swiper!.getBounds();
      await driver.delayMs(waitUiReadyMs);
      await driver.swipe(point.left, 300, point.right, 300);
      await driver.delayMs(waitUiReadyMs);
      await driver.swipe(point.left, 300, point.right, 300);
      await driver.delayMs(waitUiReadyMs);
      let text: Component | null = await driver.findComponent(ON.id('swiper_text'));
      await driver.delayMs(waitUiReadyMs);
      let message = await text!.getText();
      expect(message).assertEqual('arkUI');
    })

    /**
     * @tc.number:SwipeEventTest_002
     * @tc.name: testSwipe_h
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测 uitest swipe 竖着滑到功能 坐标点仅支持RK3568
     */
    it('testSwipe_v', TestType.FUNCTION, async (): Promise<void> => {
      await Utils.pushUrl('pages/Swipe', 'Swipe');
      await Utils.msSleep(2000);
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let textZero: Component | null = await driver.findComponent(ON.id('scroll_item_0'));
      let zeroMessage = await textZero!.getText();
      expect(zeroMessage).assertEqual('0');
      await driver.swipe(400, 700, 400, 300);
      await driver.delayMs(waitUiReadyMs * 2);
      let textZeroNot: Component | null = await driver.findComponent(ON.id('scroll_item_0')); // 滑动导致组件不可见,查找失败。
      expect(textZeroNot).assertNull();
    })

    /*
     * @tc.name: test_swipeBetween
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测 uitest swipe 竖着滑到功能 坐标点仅支持RK3568
     */
    it('test_swipeBetween', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await Utils.pushUrl('pages/Scroller', 'Scroller');
      await Utils.msSleep(2000);
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let disPlay = display.getDefaultDisplaySync();
      let scroll: Component | null = await driver.findComponent(ON.type('Scroll').id('scroll_test'));
      let rect: Rect = await scroll!.getBounds();
      let center: Point = await scroll!.getBoundsCenter();
      let startY: int = Math.floor(center.y + (rect.bottom - rect.top) / 4).toInt();
      let endY: int = Math.floor(center.y - (rect.bottom - rect.top) / 4).toInt();
      await driver.swipeBetween(
        { x: center.x, y: startY, displayId: disPlay.id.toInt() },
        { x: center.x, y: endY, displayId: disPlay.id.toInt() });
      await driver.delayMs(waitUiReadyMs);
      let text: Component | null = await driver.findComponent(ON.id('scroller_item_text'));
      let messageText = await text!.getText();
      expect(messageText).not().assertEqual('0');
    })
  })
}
