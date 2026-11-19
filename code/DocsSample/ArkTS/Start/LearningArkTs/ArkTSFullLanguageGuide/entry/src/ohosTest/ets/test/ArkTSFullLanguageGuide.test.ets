/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, beforeEach } from '@ohos/hypium';
import { Driver, ON, Component, MatchPattern } from '@kit.TestKit';
import { startApp } from './ArkTSGuideUiSupport';

async function findText(driver: Driver, text: string): Promise<Component | null> {
  return await driver.findComponent(ON.text(text));
}

async function clickAndCheck(driver: Driver, label: string, finish: string): Promise<void> {
  const button: Component | null = await findText(driver, label);
  expect(button === null).assertFalse();
  await (button as Component).click();
  await driver.delayMs(500);
  const status: Component | null = await findText(driver, finish);
  expect(status === null).assertFalse();
  expect(await (status as Component).getText()).assertEqual(finish);
}

export default function ArkTSFullLanguageGuideTest() {
  describe('ArkTSFullLanguageGuideTest', () => {

    beforeEach(async () => {
      const started: boolean = await startApp();
      expect(started).assertTrue();
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_testIndexNav0010001
     * @tc.name      testIndexNav0010001
     * @tc.desc      Verify the Index screen shows the title and the four guide tabs
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testIndexNav0010001', 0, async () => {
      console.info('uitest: testIndexNav0010001 begin');
      const driver: Driver = Driver.create();
      await driver.delayMs(1000);
      const title: Component | null = await findText(driver, 'Index');
      expect(title === null).assertFalse();
      expect(await (title as Component).getText()).assertEqual('Index');
      expect(await findText(driver, '基本知识') === null).assertFalse();
      expect(await findText(driver, '函数') === null).assertFalse();
      expect(await findText(driver, '类') === null).assertFalse();
      expect(await findText(driver, '泛型类型和函数') === null).assertFalse();
      expect(await findText(driver, 'Run Smoke')).assertNull();
      console.info('uitest: testIndexNav0010001 end');
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_testBasicKnowledge0010002
     * @tc.name      testBasicKnowledge0010002
     * @tc.desc      Verify the Basics page runs all four sample buttons and prints the documented body
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testBasicKnowledge0010002', 0, async () => {
      console.info('uitest: testBasicKnowledge0010002 begin');
      const driver: Driver = Driver.create();
      const entry: Component | null = await findText(driver, '基本知识');
      expect(entry === null).assertFalse();
      await (entry as Component).click();
      await driver.delayMs(1000);

      await clickAndCheck(driver, '测试变量声明', '测试变量声明完成');
      const body: Component | null = await driver.findComponent(
        ON.text('count: 10\nname: ArkTS\nisActive: true\nmessage: Hello, ArkTS', MatchPattern.CONTAINS));
      expect(body === null).assertFalse();
      await clickAndCheck(driver, '测试类型标注', '测试类型标注完成');
      await clickAndCheck(driver, '测试BigInt', '测试BigInt完成');
      await clickAndCheck(driver, '测试空安全', '测试空安全完成');

      console.info('uitest: testBasicKnowledge0010002 end');
      await driver.pressBack();
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_testFunction0020003
     * @tc.name      testFunction0020003
     * @tc.desc      Verify the Functions page runs all four sample buttons and prints the closure counter
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testFunction0020003', 0, async () => {
      console.info('uitest: testFunction0020003 begin');
      const driver: Driver = Driver.create();
      await driver.delayMs(1000);
      const entry: Component | null = await findText(driver, '函数');
      expect(entry === null).assertFalse();
      await (entry as Component).click();
      await driver.delayMs(1000);

      await clickAndCheck(driver, '测试函数声明', '测试函数声明完成');
      const body: Component | null = await driver.findComponent(
        ON.text('add(1, 2): 3\nmultiply(5, 3): 15', MatchPattern.CONTAINS));
      expect(body === null).assertFalse();
      await clickAndCheck(driver, '测试可选参数', '测试可选参数完成');
      await clickAndCheck(driver, '测试默认参数', '测试默认参数完成');
      await clickAndCheck(driver, '测试闭包', '测试闭包完成');
      const closure: Component | null = await driver.findComponent(
        ON.text('counter(): 1\ncounter(): 2', MatchPattern.CONTAINS));
      expect(closure === null).assertFalse();

      console.info('uitest: testFunction0020003 end');
      await driver.pressBack();
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_testClass0030004
     * @tc.name      testClass0030004
     * @tc.desc      Verify the Classes page runs all four sample buttons and prints the radius body
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testClass0030004', 0, async () => {
      console.info('uitest: testClass0030004 begin');
      const driver: Driver = Driver.create();
      await driver.delayMs(1000);
      const entry: Component | null = await findText(driver, '类');
      expect(entry === null).assertFalse();
      await (entry as Component).click();
      await driver.delayMs(1000);

      await clickAndCheck(driver, '测试类定义', '测试类定义完成');
      const beforeRadius: Component | null = await driver.findComponent(
        ON.text('radius: 5', MatchPattern.CONTAINS));
      expect(beforeRadius).assertNull();
      await clickAndCheck(driver, '测试静态属性', '测试静态属性完成');
      await clickAndCheck(driver, '测试GetterSetter', '测试GetterSetter完成');
      const radius: Component | null = await driver.findComponent(
        ON.text('radius: 5', MatchPattern.CONTAINS));
      expect(radius === null).assertFalse();
      await clickAndCheck(driver, '测试继承', '测试继承完成');

      console.info('uitest: testClass0030004 end');
      await driver.pressBack();
    })

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_testGenericTypesAndFunctions0040005
     * @tc.name      testGenericTypesAndFunctions0040005
     * @tc.desc      Verify the Generics page runs all four sample buttons and prints the constraint body
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testGenericTypesAndFunctions0040005', 0, async () => {
      console.info('uitest: testGenericTypesAndFunctions0040005 begin');
      const driver: Driver = Driver.create();
      await driver.delayMs(1000);
      const entry: Component | null = await findText(driver, '泛型类型和函数');
      expect(entry === null).assertFalse();
      await (entry as Component).click();
      await driver.delayMs(1000);

      await clickAndCheck(driver, '测试泛型介绍', '测试泛型介绍完成');
      await clickAndCheck(driver, '测试泛型类', '测试泛型类完成');
      await clickAndCheck(driver, '测试泛型函数', '测试泛型函数完成');
      await clickAndCheck(driver, '测试泛型约束', '测试泛型约束完成');
      const body: Component | null = await driver.findComponent(
        ON.text('findById(1).name: Alice', MatchPattern.CONTAINS));
      expect(body === null).assertFalse();

      console.info('uitest: testGenericTypesAndFunctions0040005 end');
      await driver.pressBack();
    })
  })
}
