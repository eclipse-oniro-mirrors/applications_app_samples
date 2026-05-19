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
import { abilityDelegatorRegistry, Component, Driver, ON, Rect } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import { Utils, startAbility, stopApplication } from '../../Util.test';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
const waitUiReadyMs: int = 1000;
export default function PinchEventTest(): void {
  describe('PinchEventTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await startAbility(bundleName, 'EntryAbility');
      await Utils.msSleep(2000);
    })

    /**
     * @tc.number:PinchEventTest_001
     * @tc.name: PinchEventTest_In
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测uitest pinchIn  功能
     */
    it('PinchEventTest_In', TestType.FUNCTION, async (): Promise<void> => {
      await Utils.pushUrl('pages/Pinch', 'Pinch');
      await Utils.msSleep(2000);
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let image1: Component | null = await driver.findComponent(ON.id('pinch_ima'));
      let bounds1: Rect = await image1!.getBounds();
      await driver.delayMs(waitUiReadyMs);
      // 缩小0.3倍
      await image1!.pinchIn(0.3);
      await driver.delayMs(waitUiReadyMs);
      let image2: Component | null = await driver.findComponent(ON.id('pinch_ima'));
      let bounds2: Rect = await image2!.getBounds();
      expect(bounds1).not().assertDeepEquals(bounds2);
    })


    /**
     * @tc.number:PinchEventTest_002
     * @tc.name: PinchEventTest_Out
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测uitest pinchOut  功能
     */
    it('PinchEventTest_Out', TestType.FUNCTION, async (): Promise<void> => {
      await Utils.pushUrl('pages/Pinch', 'Pinch');
      await Utils.msSleep(2000);
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let image1: Component | null = await driver.findComponent(ON.id('pinch_ima_out'));
      let bounds1: Rect = await image1!.getBounds();
      // 放大1.2倍
      await image1!.pinchOut(1.2);
      await driver.delayMs(waitUiReadyMs);
      let image2: Component | null = await driver.findComponent(ON.id('pinch_ima_out'));
      let bounds2: Rect = await image2!.getBounds();
      expect(bounds1).not().assertDeepEquals(bounds2);
    })

    /**
      * @tc.number:PinchEventTest_003
      * @tc.name: PinchEventTest_Out
      * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
      * @tc.desc: 检测uitest 先缩小,然后放大测试。
      */
    it('testPinch_In_Out', 0, async (): Promise<void> => {
      await Utils.pushUrl('pages/Pinch', 'Pinch');
      await Utils.msSleep(2000);
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let image1: Component | null = await driver.findComponent(ON.id('pinch_ima_out'));
      let bounds1: Rect = await image1!.getBounds();
      await image1!.pinchIn(0.5);
      await driver.delayMs(waitUiReadyMs * 2);
      let image2: Component | null = await driver.findComponent(ON.id('pinch_ima_out'));
      let bounds2: Rect = await image2!.getBounds();
      expect(bounds2 != bounds1).assertTrue();
      await image2!.pinchOut(1.5);
      await driver.delayMs(waitUiReadyMs * 2);
      let image3: Component | null = await driver.findComponent(ON.id('pinch_ima_out'));
      let bounds3: Rect = await image3!.getBounds();
      expect(bounds3 != bounds2).assertTrue();
    })
  })
}
