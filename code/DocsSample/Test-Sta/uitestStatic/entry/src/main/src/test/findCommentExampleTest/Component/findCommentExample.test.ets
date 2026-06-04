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


/*

* >查找控件属性
* | No. | API                                | 功能描述                       |
* |-----|------------------------------------|----------------------------|
* | 1   | id(i:string):On                    | 指定控件id。                    |
* | 2   | text(t:string, p?:MatchPattern):On | 指定控件文本，可指定匹配模式。            |
* | 3   | type(t:string):On                 | 指定控件类型。                    |
* | 4   | enabled(e:bool):On                 | 指定控件使能状态。                  |
* | 5   | clickable(c:bool):On               | 指定控件可单击状态。                 |
* | 6   | longClickable(l:bool):On           | 指定控件可长按状态。                 |
* | 7   | focused(f:bool):On                 | 指定控件获焦状态。                  |
* | 8   | scrollable(s:bool):On              | 指定控件可滑动状态。                 |
* | 9   | selected(s:bool):On                | 指定控件选中状态。                  |
* | 10  | checked(c:bool):On                 | 指定控件选择状态。                  |
* | 11  | checkable(c:bool):On               | 指定控件可选择状态。                 |
* | 12  | isBefore(b:On):On                  | **相对定位**，限定目标控件位于指定特征控件之前。 |
* | 13  | isAfter(b:On):On                   | **相对定位**，限定目标控件位于指定特征控件之后。 |
>匹配模式
EQUALS = 0,
CONTAINS = 1,
STARTS_WITH = 2,
ENDS_WITH = 3

*/

import { beforeAll, describe, expect, it, Level, Size, TestType } from '../../../../../hypium/index';
import { abilityDelegatorRegistry, Component, DisplayRotation, Driver, MatchPattern, ON, Rect, Point } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import { BusinessError } from '@ohos.base';
import { display } from '@kit.ArkUI';
import { Utils, startAbility, stopApplication } from '../../Util.test';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
const arr: int[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
const waitUiReadyMs: int = 1000;
const TestTag: string = 'findExampleTest';

export default function findExampleTest(): void {
  describe('findExampleTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await startAbility(bundleName, 'EntryAbility');
      await Utils.msSleep(2000);
    })

    /**
     * @tc.name: findComponent_On_ID
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 使用ON.id 获取单个组件
     */
    it('findComponent_On_ID', TestType.FUNCTION, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      await Utils.pushUrl('pages/BaseUiTest', 'BaseUiTest');
      await driver.delayMs(waitUiReadyMs);
      let text: Component | null = await driver.findComponent(ON.id('idTest'));
      let idMsg = await text!.getId();
      expect(idMsg).assertEqual('idTest');
    })

    /**
     * @tc.name: findComponents_On_ID
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 使用ON.id 获取多个组件
     */
    it('findComponents_On_ID', TestType.FUNCTION, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      await Utils.pushUrl('pages/BaseUiTest', 'BaseUiTest');
      await driver.delayMs(waitUiReadyMs);
      let textArr: Array<Component> | null = await driver.findComponents(ON.id('scroll_item'));
      if (textArr) {
        for (let index: int = 0; index < textArr.length; index++) {
          const element: Component | null = textArr[index];
          if (element) {
            expect(await element.getText() === arr[index].toString()).assertTrue();
          }
        }
      }
    })

    /**
     * @tc.name: findComponents_On_isBefore
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 使用ON.isBefore 获取单个组件
     */
    it('findComponents_On_isBefore', TestType.FUNCTION, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      await Utils.pushUrl('pages/BaseUiTest', 'BaseUiTest');
      await driver.delayMs(waitUiReadyMs);
      let radio: Component | null = await driver.findComponent(ON.type('Radio').isBefore(ON.id('radio_test1')));
      let btnType = await radio!.getType();
      expect(btnType).assertEqual('Radio');
      let btnId = await radio!.getId();
      expect(btnId).assertEqual('radio_test');
    })

    /**
     * @tc.name: findComponents_On_isBefore_1
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 使用ON.isAfter 获取单个组件
     */
    it('findComponents_On_isBefore_1', TestType.FUNCTION, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      await Utils.pushUrl('pages/BaseUiTest', 'BaseUiTest');
      await driver.delayMs(waitUiReadyMs);
      let radio: Component | null = await driver.findComponent(ON.type('Radio').isAfter(ON.id('radio_test')));
      let comType = await radio!.getType();
      expect(comType).assertEqual('Radio');
      let comId = await radio!.getId();
      expect(comId).assertEqual('radio_test1');
    })


    /**
     * @tc.name: testMatchPattern
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 使用不同的匹配模式获取控件对象
     */
    it('testMatchPattern', TestType.FUNCTION, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      await Utils.pushUrl('pages/BaseUiTest', 'BaseUiTest');
      await driver.delayMs(waitUiReadyMs);
      let button1: Component | null = await driver.findComponent(ON.text('unit_jsunit', MatchPattern.EQUALS));
      let bt1Text = await button1!.getText();
      expect(bt1Text).assertEqual('unit_jsunit');
      let button2: Component | null = await driver.findComponent(ON.text('unit', MatchPattern.STARTS_WITH));
      let btn2Text = await button2!.getText();
      expect(btn2Text).assertEqual('unit_jsunit');
    })

    /**
     * @tc.name: findComponents_scrollSearch
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 使用ScrollSearch 获取单个组件
     */
    it('findComponents_scrollSearch', TestType.FUNCTION, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      await Utils.pushUrl('pages/BaseUiTest', 'BaseUiTest');
      await driver.delayMs(waitUiReadyMs);
      let scrollBar: Component | null = await driver.findComponent(ON.type('Scroll'));
      await driver.delayMs(waitUiReadyMs);
      let button: Component | null = await scrollBar!.scrollSearch(ON.text('1'));
      await driver.delayMs(waitUiReadyMs);
      let btnMsg = await button!.getText();
      expect(btnMsg).assertEqual('1');
    })

    /**
     * @tc.name: testDescription
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 验证组件的description属性
     */
    it('testDescription', TestType.FUNCTION, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      await Utils.pushUrl('pages/BaseUiTest', 'BaseUiTest');
      await driver.delayMs(waitUiReadyMs);
      let text: Component | null = await driver.findComponent(ON.type('Text').description(''));
      let description: string = await text!.getDescription();
      expect(description).assertEqual('');
    })

    /**
     * @tc.name: testWithIn
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 验证组件的description属性
     */
    it('testWithIn', TestType.FUNCTION, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      await Utils.pushUrl('pages/BaseUiTest', 'BaseUiTest');
      await driver.delayMs(waitUiReadyMs);
      let scroll: Component | null = await driver.findComponent(ON.type('Scroll'));
      let btn: Component | null = await driver.findComponent(ON.within(ON.type('Scroll')).text('0'));
      let bounds1: Rect = await scroll!.getBounds();
      let bounds2: Rect = await btn!.getBounds();
      let btnMsg = await btn!.getText();
      expect(btnMsg).assertEqual('0');
      expect(bounds1.top < bounds2.top).assertTrue();
      expect(bounds1.bottom > bounds2.bottom).assertTrue();
      expect(bounds1.left < bounds2.right).assertTrue();
      expect(bounds1.right > bounds2.right).assertTrue();
    })

    /**
     * @tc.name: testBelongingDisplay
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 多屏获取组件对象，该接口从api20开始支持使用。
     */
    it('testBelongingDisplay', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      await Utils.pushUrl('pages/BaseUiTest', 'BaseUiTest');
      await driver.delayMs(waitUiReadyMs);
      let disPlay = display.getDefaultDisplaySync();
      let mainPage: Component | null = await driver.findComponent(ON.belongingDisplay(disPlay.id.toInt()).text('Next'));
      let msg: string = await mainPage!.getText();
      expect(msg).assertEqual('Next');
    })

    /*
     * @tc.name: testGetDisplayId
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 组件获取displayId，该接口从api20开始支持使用。
     */
    it('testGetDisplayId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      await Utils.pushUrl('pages/BaseUiTest', 'BaseUiTest');
      await driver.delayMs(waitUiReadyMs);
      let disPlay = display.getDefaultDisplaySync();
      let mainPage: Component | null = await driver.findComponent(ON.belongingDisplay(disPlay.id.toInt()).text('Next'));
      let disId: int = await mainPage!.getDisplayId();
      expect(disId).assertEqual(disPlay.id);
    })

    /*
     * @tc.name: testGetDisplaySizeWithId
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 组件获取屏幕大小，该接口从api20开始支持使用。
     */
    it('testGetDisplaySizeWithId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      await Utils.pushUrl('pages/BaseUiTest', 'BaseUiTest');
      await driver.delayMs(waitUiReadyMs);
      let disPlay = display.getDefaultDisplaySync();
      let s: Point = await driver.getDisplaySize(disPlay.id.toInt());
      expect(s.x != 0).assertTrue();
      expect(s.y != 0).assertTrue();
    })


    /*
     * @tc.name: testGetDisplayDensityWithId
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 组件获取屏幕密度，该接口从api20开始支持使用。
     */
    it('testGetDisplayDensityWithId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      await Utils.pushUrl('pages/BaseUiTest', 'BaseUiTest');
      await driver.delayMs(waitUiReadyMs);
      let disPlay = display.getDefaultDisplaySync();
      let s: Point = await driver.getDisplayDensity(disPlay.id.toInt());
      expect(s.x != 0).assertTrue();
      expect(s.y != 0).assertTrue();
    })

    /*
     * @tc.name: testGetDisplayRotationWithId
     * @tc.type: 0 || TestType.FUNCTION || Size.SMALLTEST || Level.LEVEL0
     * @tc.desc: 组件获取屏幕方向，该接口从api20开始支持使用。
     */
    it('testGetDisplayRotationWithId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let driver: Driver = Driver.create();
      await Utils.pushUrl('pages/BaseUiTest', 'BaseUiTest');
      await driver.delayMs(waitUiReadyMs);
      let disPlay = display.getDefaultDisplaySync();
      await driver.setDisplayRotation(DisplayRotation.ROTATION_0);
      await driver.delayMs(waitUiReadyMs);
      let rotation: DisplayRotation = await driver.getDisplayRotation(disPlay.id.toInt());
      expect(rotation == DisplayRotation.ROTATION_0
        || rotation == DisplayRotation.ROTATION_90
        || rotation == DisplayRotation.ROTATION_180
        || rotation == DisplayRotation.ROTATION_270).assertTrue();
    })
  })
}
