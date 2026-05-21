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
import { abilityDelegatorRegistry, Component, Driver, MouseButton, ON, Point } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import { BusinessError } from '@ohos.base';
import { Utils, startAbility, stopApplication } from '../../Util.test';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
const waitUiReadyMs: int = 1000;
const TestTag: string = 'UiTest_API16';

export default function MouseEventTest(): void {
  describe('MouseEventTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await startAbility(bundleName, 'EntryAbility');
      await Utils.msSleep(2000);

    })

    /**
     * @tc.number:MouseEventTest_001
     * @tc.name: testMouseClick1
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测uitest 模拟鼠标左键点击 功能
     */
    it('testMouseClick1', TestType.FUNCTION, async (): Promise<void> => {
      await Utils.pushUrl('pages/Mouse', 'Mouse');
      await Utils.msSleep(2000);
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let button: Component | null = await driver.findComponent(ON.id('mouse_test'));
      if (button) {
        let point: Point = await button.getBoundsCenter();
        await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_LEFT, 2017);
        let text: Component | null = await driver.findComponent(ON.id('mouse_test_result'));
        let message = await text!.getText();
        expect(message === 'left').assertTrue();
      }
    })

    /**
     * @tc.number:testMouseDoubleClick1
     * @tc.name: testMouseDoubleClick1
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测uitest 模拟鼠标左键双击 功能 只支持鼠标左键双击事件
     */
    it('testMouseDoubleClick_left', TestType.FUNCTION, async (): Promise<void> => {
      await Utils.pushUrl('pages/Mouse', 'Mouse');
      await Utils.msSleep(2000);
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let button: Component | null = await driver.findComponent(ON.text('Click twice'));
      let center: Point = await button!.getBoundsCenter();
      await driver.mouseDoubleClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0, 0);
      await driver.delayMs(waitUiReadyMs);
      let newButton: Component | null = await driver.findComponent(ON.text('doubleClick'));
      let text: string = await newButton!.getText();
      expect(text === 'doubleClick').assertTrue();
      await newButton!.click();
    })

    /**
     * @tc.number:testMouseLongClick
     * @tc.name: testMouseLongClick
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测uitest 模拟鼠标左键长按 功能, 只支持鼠标左键长按事件
     */
    it('testMouseLongClick', TestType.FUNCTION, async (): Promise<void> => {
      await Utils.pushUrl('pages/Mouse', 'Mouse');
      await Utils.msSleep(2000);
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let button: Component | null = await driver.findComponent(ON.id('mouse_test'));
      let point: Point = await button!.getBoundsCenter();
      await driver.mouseLongClick(point, MouseButton.MOUSE_BUTTON_LEFT, 0, 0);
      await driver.delayMs(waitUiReadyMs);
      let newButton: Component | null = await driver.findComponent(ON.text('longClick'));
      await driver.delayMs(waitUiReadyMs);
      let text: string = await newButton!.getText();
      expect(text === 'longClick').assertTrue();
      await newButton!.click();
    })


    /**
     * @tc.name: testMouseClick2
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测uitest 模拟鼠标右键点击 功能
     */
    it('testMouseClick2', TestType.FUNCTION, async (): Promise<void> => {
      await Utils.pushUrl('pages/Mouse', 'Mouse');
      await Utils.msSleep(2000);
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let button: Component | null = await driver.findComponent(ON.id('mouse_test'));
      let point: Point = await button!.getBoundsCenter();
      await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_RIGHT, 2017);
      let text: Component | null = await driver.findComponent(ON.id('mouse_test_result'));
      let textMsg: string = await text!.getText();
      expect(textMsg === 'right').assertTrue();
      await text!.click();
    })

    /**
      * @tc.name: testMouseClick3
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测uitest 模拟鼠标中间点击 功能
     */
    it('testMouseClick3', TestType.FUNCTION, async (): Promise<void> => {
      await Utils.pushUrl('pages/Mouse', 'Mouse');
      await Utils.msSleep(2000);
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let button: Component | null = await driver.findComponent(ON.id('mouse_test'));
      let point: Point = await button!.getBoundsCenter();
      await driver.delayMs(waitUiReadyMs);
      await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_MIDDLE, 2017);
      await driver.delayMs(waitUiReadyMs);
      let text: Component | null = await driver.findComponent(ON.id('mouse_test_result'));
      let textMsg: string = await text!.getText();
      expect(textMsg === 'middle').assertTrue();
      await text!.click();
    })

    /**
     * @tc.name: testMouseMoveTo
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测uitest 模拟鼠标滚轮向下滑动功能
     */
    it('testMouseMoveTo', TestType.FUNCTION, async (): Promise<void> => {
      await Utils.pushUrl('pages/Mouse', 'Mouse');
      await Utils.msSleep(2000);
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let button: Component | null = await driver.findComponent(ON.id('hover_bt'));
      let center: Point = await button!.getBoundsCenter();
      await driver.mouseMoveTo(center);
      await driver.delayMs(waitUiReadyMs);
      let newButton: Component | null = await driver.findComponent(ON.id('hoverText'));
      let textMsg: string = await newButton!.getText();
      expect(textMsg === 'hover').assertTrue();
    })


    /**
     * @tc.name: testMouseScroll
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测uitest 模拟鼠标滚轮向下滑动功能
     */
    it('testMouseScroll', TestType.FUNCTION, async (): Promise<void> => {
      await Utils.pushUrl('pages/Mouse', 'Mouse');
      await Utils.msSleep(2000);
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let scroll: Component | null = await driver.findComponent(ON.id('scroll_test'));
      let center: Point = await scroll!.getBoundsCenter();
      await driver.mouseScroll(center, true, 30);
      let button1: Component | null = await driver.findComponent(ON.id('scroll_item'));
      await driver.delayMs(waitUiReadyMs);
      let message1 = await button1!.getText();
      expect(message1 !== '0').assertTrue();
    })

    /**
      * @tc.name: testMouseScroll_with
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测uitest 模拟鼠标滚轮向下滑动与Ctrl + 删除键组合使用。
     */
    it('testMouseScroll_with', TestType.FUNCTION, async (): Promise<void> => {
      await Utils.pushUrl('pages/Mouse', 'Mouse');
      await Utils.msSleep(2000);
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let scroll: Component | null = await driver.findComponent(ON.id('scroll_test'));
      let center: Point = await scroll!.getBoundsCenter();
      await driver.mouseScroll(center, true, 10, 2072, 2071, 20);
      await driver.delayMs(waitUiReadyMs);
      let button1: Component | null = await driver.findComponent(ON.id('scroll_item'));
      let message1 = await button1!.getText();
      expect(message1 !== '0').assertTrue();
    })

    /**
     * @tc.name: testMouseScroll
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测uitest 模拟移动鼠标光标 坐标点仅支持RK3568
     */
    it('testMouseMoveWithTrack', TestType.FUNCTION, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      await driver.mouseMoveWithTrack({ x: 360, y: 300 }, { x: 360, y: 600 }, 15000);
      expect(true).assertTrue();
    })

    /*
    * @tc.name: testNewMouseLongClick
    * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
    * @tc.desc: 检测uitest 鼠标长按操作, 该接口从20开始支持使用.
    */
    it('testNewMouseLongClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'testNewMouseLongClick start');
      await Utils.pushUrl('pages/Click', 'Click');
      await Utils.msSleep(2000);
      let driver: Driver = Driver.create();
      let button: Component | null = await driver!.findComponent(ON.text('LongClick'));
      let center: Point = await button!.getBoundsCenter();
      await driver!.delayMs(waitUiReadyMs);
      await driver.mouseLongClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0, 0, 3000);
      await driver.delayMs(waitUiReadyMs);
      let newButton: Component | null = await driver!.findComponent(ON.text('longClick'));
      let text: string = await newButton!.getText();
      expect(text === 'longClick').assertTrue();
      await newButton!.click();
    })
  })
}
