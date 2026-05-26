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
import { display } from '@kit.ArkUI';
import { Utils, startAbility, stopApplication } from '../../Util.test';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
let test: string = '中文测试';
const waitUiReadyMs: int = 1000;
const TestTag: string = 'InputEventTest';

async function exitInputMethod(): Promise<void> {
  let driver: Driver = Driver.create();
  let softKeyBoard: Component | null = await driver.findComponent(ON.type('Canvas'));
  if (softKeyBoard) {
    if (softKeyBoard != null) {
      await driver.pressBack();
  }
  }
}

export default function InputEventTest(): void {
  describe('InputEventTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await startAbility(bundleName, 'EntryAbility');
      await Utils.msSleep(2000);
      await Utils.pushUrl('pages/Input', 'Input');
      await Utils.msSleep(2000);
    })

    /**
     * @tc.number:InputEventTest_001
     * @tc.name: clickEventTest_Input
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测uitest inputText 功能
     */
    it('clickEventTest_Input', TestType.FUNCTION, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let input: Component | null = await driver.findComponent(ON.type('TextInput'));
      await input!.inputText('123');
      await driver.delayMs(waitUiReadyMs);
      let input_new: Component | null = await driver.findComponent(ON.type('TextInput'));
      let text: string = await input_new!.getText();
      expect(text === '123').assertTrue();
    })

    /**
     * @tc.number:InputEventTest_002
     * @tc.name: clickEventTest_Input_zh
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测uitest inputText 输入中文功能测试
     */
    it('clickEventTest_Input_zh', TestType.FUNCTION, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let input: Component | null = await driver.findComponent(ON.type('TextInput'));
      await input!.inputText(test);
      await driver.delayMs(waitUiReadyMs);
      let input_new: Component | null = await driver.findComponent(ON.type('TextInput'));
      let text: string = await input_new!.getText();
      expect(text == test).assertTrue();
    })

    /**
     * @tc.number:InputEventTest_002
     * @tc.name: clickEventTest_Input_zh
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测uitest 指定坐标位置inputText输入功能测试
     */
    it('clickEventTest_Input_center', TestType.FUNCTION, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let input: Component | null = await driver.findComponent(ON.type('TextInput'));
      let center: Point = await input!.getBoundsCenter();
      await input!.clearText();
      await driver.inputText(center, '1234556');
      await driver.delayMs(waitUiReadyMs);
      let input_new: Component | null = await driver.findComponent(ON.type('TextInput'));
      let text: string = await input_new!.getText();
      expect(text == '1234556').assertTrue();
    })

    /**
     * @tc.name: InputEventTest_ClearText
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 检测uitest clear text
     */
    it('InputEventTest_ClearText', TestType.FUNCTION, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let input1: Component | null = await driver.findComponent(ON.type('TextInput'));
      await input1!.inputText('abc');
      await driver.delayMs(waitUiReadyMs);
      let input2: Component | null = await driver.findComponent(ON.type('TextInput'));
      await input2!.clearText();
      await driver.delayMs(waitUiReadyMs);
      let input_new: Component | null = await driver.findComponent(ON.type('TextInput'));
      let text: string = await input_new!.getText();
      expect(text).assertEqual('');
    })

    /*
     * @tc.name: InputEventTest_InputText
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: enter '123',the values of both paste and addition are false
     */
    it('InputEventTest_InputText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'InputEventTest_InputText start');
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let text: Component | null = await driver.findComponent(ON.type('TextInput'));
      let center: Point = await text!.getBoundsCenter();
      await text!.clearText();
      await driver.delayMs(2000);
      await driver.inputText(center, '123', { paste: false, addition: false });
      await driver.delayMs(2000);
      let text1: Component | null = await driver.findComponent(ON.type('TextInput'));
      let message1 = await text1!.getText();
      expect(message1 === '123').assertTrue();
    })

    /*
     * @tc.name: InputEventTest_InputText2
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: enter '123',the values of paste is true,the values of addition is false
     */
    it('InputEventTest_InputText2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'InputEventTest_InputText2 start');
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let text: Component | null = await driver.findComponent(ON.type('TextInput'));
      await text!.clearText();
      await driver.delayMs(2000);
      await exitInputMethod();
      let center: Point = await text!.getBoundsCenter();
      await driver.inputText(center, '123', { paste: true, addition: false });
      await driver.delayMs(2000);
      await exitInputMethod();
      await driver.delayMs(2000);
      let text1: Component | null = await driver.findComponent(ON.type('TextInput'));
      let message1 = await text1!.getText();
      expect(message1 === '123').assertTrue();
    })

    /*
     * @tc.name: InputEventTest_TriggerCombineKeysWithId
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 多屏下，triggerCombineKeys test
     */
    it('InputEventTest_TriggerCombineKeysWithId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(TestTag, 'InputEventTest_TriggerCombineKeysWithId start');
      await Utils.msSleep(1000);
      let driver: Driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let disPlay = display.getDefaultDisplaySync();
      console.log(`${TestTag}, InputEventTest_TriggerCombineKeysWithId disPlay is: ${JSON.stringify(disPlay)}`);
      await driver.delayMs(1000);
      let text: Component | null = await driver.findComponent(ON.belongingDisplay(disPlay.id.toInt()).type('TextInput'));
      let center: Point = await text!.getBoundsCenter();
      await text!.inputText('123');
      await driver.delayMs(1000);
      await driver.click(center.x, center.y);
      await driver.delayMs(waitUiReadyMs);
      await driver.triggerCombineKeys(2072, 2017, 0, disPlay.id.toInt());
      await driver.delayMs(waitUiReadyMs);
      await driver.triggerCombineKeys(2072, 2019, 0, disPlay.id.toInt());
      await driver.delayMs(waitUiReadyMs);
      let text2: Component | null = await driver.findComponent(ON.belongingDisplay(disPlay.id.toInt()).type('TextInput'));
      await text2!.clearText();
      await driver.delayMs(waitUiReadyMs);
      await driver.triggerCombineKeys(2072, 2038, 0, disPlay.id.toInt());
      await driver.delayMs(1000);
      let text3: Component | null = await driver.findComponent(ON.belongingDisplay(disPlay.id.toInt()).type('TextInput'));
      let message3 = await text3!.getText();
      expect(message3 === '123').assertTrue();
    })
  })
}
