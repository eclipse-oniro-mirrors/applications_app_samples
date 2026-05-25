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
import { abilityDelegatorRegistry, Component, Driver, ON, Point } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import { Utils, startAbility, stopApplication } from '../../Util.test';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'uitestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
const waitUiReadyMs: int = 1000;

export default function clickEventTest(): void {
  describe('clickEventTest', (): void => {
    let driver: Driver | undefined;
    beforeAll(async (): Promise<void> => {
      driver = await Driver.create();
      await startAbility(bundleName, 'EntryAbility');
      await Utils.msSleep(2000);
    })

    /**
     * @tc.number:clickEventTest_001
     * @tc.name: clickEventTest_click
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测uitest Component click 功能
     */
    it('clickEventTest_click', TestType.FUNCTION, async (): Promise<void> => {
      await Utils.pushUrl('pages/Click', 'Click');
      await Utils.msSleep(2000);
      let nextBtn: Component | null = await driver!.findComponent(ON.text('singleClick'));
      let center: Point = await nextBtn!.getBoundsCenter();
      await nextBtn!.click();
      await driver!.delayMs(waitUiReadyMs);
      let newButton: Component | null = await driver!.findComponent(ON.text('back to index'));
      let text: string = await newButton!.getText();
      expect(text == 'back to index').assertTrue();
      await newButton!.click();
    })

    /**
     * @tc.number:clickEventTest_002
     * @tc.name: clickEventTest_double_click
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测uitest double click 功能
     */
    it('clickEventTest_double_click', TestType.FUNCTION, async (): Promise<void> => {
      await Utils.pushUrl('pages/Click', 'Click');
      await Utils.msSleep(2000);
      let button: Component | null = await driver!.findComponent(ON.text('Click twice'));
      await button!.doubleClick();
      let newButton: Component | null = await driver!.findComponent(ON.text('doubleClick'));
      await driver!.delayMs(waitUiReadyMs);
      let text: string = await newButton!.getText();
      expect(text === 'doubleClick').assertTrue();
      await newButton!.click();
    })

    /**
     * @tc.number:clickEventTest_003
     * @tc.name: clickEventTest_double_click
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测uitest long click 功能
     */
    it('clickEventTest_Long_click', TestType.FUNCTION, async (): Promise<void> => {
      await Utils.pushUrl('pages/Click', 'Click');
      await Utils.msSleep(2000);
      let button: Component | null = await driver!.findComponent(ON.text('LongClick'));
      await button!.longClick();
      await driver!.delayMs(waitUiReadyMs);
      let newButton: Component | null = await driver!.findComponent(ON.text('longClick'));
      let text: string = await newButton!.getText();
      expect(text === 'longClick').assertTrue();
      await newButton!.click();
    })

    /**
     * @tc.name: clickEventTest_LongClickAt
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测uitest long click 功能 该接口从API 20开始支持。
     */
    it('clickEventTest_LongClickAt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await Utils.pushUrl('pages/Click', 'Click');
      await Utils.msSleep(2000);
      let button: Component | null = await driver!.findComponent(ON.text('LongClick'));
      let center: Point = await button!.getBoundsCenter();
      await driver!.longClickAt(center, 3000);
      await driver!.delayMs(waitUiReadyMs);
      let newButton: Component | null = await driver!.findComponent(ON.text('longClick'));
      let text: string = await newButton!.getText();
      expect(text == 'longClick').assertTrue();
      await newButton!.click();
    })

    /**
     * @tc.name: clickEventTest_double_click
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测uitest PressBack 功能
     */
    it('clickEventTest_PressBack', TestType.FUNCTION, async (): Promise<void> => {
      await Utils.pushUrl('pages/Click', 'Click');
      await Utils.msSleep(2000);
      let button: Component | null = await driver!.findComponent(ON.text('LongClick'));
      await button!.longClick();
      await driver!.delayMs(waitUiReadyMs);
      await driver!.pressBack();
      await driver!.delayMs(waitUiReadyMs);
      let button_ori: Component | null = await driver!.findComponent(ON.text('Click twice'));
      await driver!.delayMs(waitUiReadyMs);
      let text: string = await button_ori!.getText();
      expect(text == 'Click twice').assertTrue();
    })


    /**
     * @tc.number:clickEventTest_005
     * @tc.name: clickEventTest_double_click
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测uitest triggerKey 功能
     */
    it('clickEventTest_TriggerKey', TestType.FUNCTION, async (): Promise<void> => {
      await Utils.pushUrl('pages/Click', 'Click');
      await Utils.msSleep(2000);
      let button: Component | null = await driver!.findComponent(ON.text('LongClick'));
      await button!.longClick();
      await driver!.delayMs(waitUiReadyMs);
      let keyBack = 2; // back
      await driver!.triggerKey(keyBack);
      await driver!.delayMs(waitUiReadyMs);
      let button_ori: Component | null = await driver!.findComponent(ON.text('Click twice'));
      await driver!.delayMs(waitUiReadyMs);
      let text: string = await button_ori!.getText();
      expect(text == 'Click twice').assertTrue();
    })

    /**
     * @tc.name: clickEventTest_ClickAt
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测uitest 点击功能，该接口从api20开始支持使用。
     */
    it('clickEventTest_ClickAt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await Utils.pushUrl('pages/Click', 'Click');
      await Utils.msSleep(2000);
      let nextBtn: Component | null = await driver!.findComponent(ON.text('singleClick'));
      let center: Point = await nextBtn!.getBoundsCenter();
      await driver!.clickAt(center);
      await driver!.delayMs(waitUiReadyMs);
      let newButton: Component | null = await driver!.findComponent(ON.text('back to index'));
      let text: string = await newButton!.getText();
      expect(text == 'back to index').assertTrue();
      await newButton!.click();
    })

    /**
     * @tc.name: clickEventTest_DoubleClickAt
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测uitest 双击功能，该接口从api20开始支持使用。
     */
    it('clickEventTest_DoubleClickAt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      await Utils.pushUrl('pages/Click', 'Click');
      await Utils.msSleep(2000);
      let clickBtn: Component | null = await driver!.findComponent(ON.text('Click twice'));
      if (clickBtn == null) {
        let scroll: Component | null = await driver!.findComponent(ON.type('Scroll'));
        clickBtn = await scroll!.scrollSearch(ON.text('Click twice'));
      }
      let center: Point = await clickBtn!.getBoundsCenter();
      await driver!.doubleClickAt(center);
      await driver!.delayMs(waitUiReadyMs);
      let button: Component | null = await driver!.findComponent(ON.text('doubleClick'));
      let text: string = await button!.getText();
      expect(text == 'doubleClick').assertTrue();
  })
})
}