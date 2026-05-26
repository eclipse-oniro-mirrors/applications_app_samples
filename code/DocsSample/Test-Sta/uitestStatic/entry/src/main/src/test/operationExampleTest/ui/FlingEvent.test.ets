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

import { beforeAll, describe, expect, it, Level, Size, TestType } from '../../../../../hypium/index';
import { abilityDelegatorRegistry, Component, Driver, ON, UiDirection, UiWindow, Rect } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import { BusinessError } from '@ohos.base';
import { display } from '@kit.ArkUI';
import { Utils, startAbility, stopApplication } from '../../Util.test';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
const waitUiReadyMs: int = 1000;

export default function FlingEventTest(): void {
  describe('FlingEvent', (): void => {
    beforeAll(async (): Promise<void> => {
      await startAbility(bundleName, 'EntryAbility');
      await Utils.msSleep(2000);
    })

    /**
     * @tc.number:FlingEventTest_001
     * @tc.name: FlingEvent_h
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测uitest fling水平抛滑功能坐标点仅支持RK3568
     */
    it('FlingEvent_h', TestType.FUNCTION, async (): Promise<void> => {
      await Utils.pushUrl('pages/Fling', 'Fling');
      await Utils.msSleep(2000);
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let swiper: Component | null = await driver.findComponent(ON.id('swiper'));
      let point: Rect = await swiper!.getBounds();
      await driver.fling({ x: point.left, y: 300 }, { x: point.right, y: 300 }, 20, 600);
      await driver.delayMs(waitUiReadyMs);
      await driver.fling({ x: point.left, y: 300 }, { x: point.right, y: 300 }, 20, 600);
      await driver.delayMs(waitUiReadyMs);
      let textCom: Component | null = await driver.findComponent(ON.id('swiper_text'));
      let text: string = await textCom!.getText();
      expect(text === 'arkUI').assertTrue();
    })

    /**
     * @tc.number:FlingEventTest_002
     * @tc.name: FlingEvent_v
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测uitest fling 竖直抛滑功能坐标点仅支持RK3568
     */
    it('FlingEvent_v', TestType.FUNCTION, async (): Promise<void> => {
      await Utils.pushUrl('pages/Fling', 'Fling');
      await Utils.msSleep(2000);
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      await driver.fling({ x: 400, y: 700 }, { x: 400, y: 200 }, 20, 600);
      await driver.delayMs(waitUiReadyMs);
      let textCom: Component | null = await driver.findComponent(ON.id('scroll_item'));
      let text: string = await textCom!.getText();
      expect(text != '0').assertTrue();
    })

    /**
     * @tc.number:FlingEventTest_003
     * @tc.name: FlingEvent_d
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测uitest fling 垂直滑动功能 坐标点仅支持RK3568
     */
    it('FlingEvent_d', TestType.FUNCTION, async (): Promise<void> => {
      await Utils.pushUrl('pages/wearList', 'wearList');
      await Utils.msSleep(2000);
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      await driver.fling(UiDirection.DOWN, 2000);
      await driver.delayMs(waitUiReadyMs);
      let text: Component | null = await driver.findComponent(ON.text('wearList1'));
      expect(text === null).assertTrue();
      await driver.fling(UiDirection.UP, 2000);
      await driver.delayMs(waitUiReadyMs);
      let text1: Component | null = await driver.findComponent(ON.text('wearList1'));
      expect(text1 !== null).assertTrue();
    })

    /**
     * @tc.name: FlingEvent_WithId
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测uitest fling 垂直滑动功能 坐标点仅支持RK3568
     */
    it('FlingEvent_WithId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await Utils.pushUrl('pages/wearList', 'wearList');
      await Utils.msSleep(2000);
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let disPlay = display.getDefaultDisplaySync();
      if (disPlay.id == 999) {
        return;
      }
      let window: UiWindow | null = await driver.findWindow({ bundleName: bundleName })
      if (window) {
        try {
          await window.maximize();
          await driver.delayMs(500);
        } catch (error) {
        }
      }
      await driver.delayMs(waitUiReadyMs);
      await driver.fling(UiDirection.DOWN, 2000, disPlay.id.toInt());
      await driver.delayMs(waitUiReadyMs);
      let text: Component | null = await driver.findComponent(ON.text('wearList1'));
      await driver.delayMs(waitUiReadyMs);
      console.error(`ljl text: ${text}`);
      expect(text === null).assertTrue();
      await driver.fling(UiDirection.UP, 2000, disPlay.id.toInt());
      await driver.delayMs(waitUiReadyMs);
      let text1: Component | null = await driver.findComponent(ON.text('wearList1'));
      await driver.delayMs(waitUiReadyMs);
      console.error(`ljl text1: ${text1}`);
      expect(text1 !== null).assertTrue();
    })
  })
}
