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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
let want: Want;

export default function ArkTSFullLanguageGuideTest() {
  describe('ArkTSFullLanguageGuideTest', () => {

    beforeAll(async () => {
      want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility'
      };
      await delegator.startAbility(want);
      const driver = Driver.create();
      await driver.delayMs(1000);
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      console.info('get top ability');
      await driver.delayMs(1000);
      expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
    })

    it('testRunSmoke001', 0, async () => {
      console.info('uitest: testRunSmoke001 begin');
      const driver = Driver.create();
      await driver.delayMs(1000);
      const button1 = await driver.findComponent(ON.text('Run Smoke'));
      await driver.delayMs(1000);
      await button1.click();
      await driver.delayMs(2000);
      console.info('uitest: testRunSmoke001 end');
    })

    it('testBasicKnowledge001', 0, async () => {
      console.info('uitest: testBasicKnowledge001 begin');
      const driver = Driver.create();
      const button1 = await driver.findComponent(ON.text('基本知识'));
      await driver.delayMs(1000);
      await button1.click();
      await driver.delayMs(1000);

      const button2 = await driver.findComponent(ON.text('测试变量声明'));
      const button3 = await driver.findComponent(ON.text('测试类型标注'));
      const button4 = await driver.findComponent(ON.text('测试BigInt'));
      const button5 = await driver.findComponent(ON.text('测试空安全'));
      await driver.delayMs(1000);

      await button2.click();
      await driver.delayMs(500);
      await button3.click();
      await driver.delayMs(500);
      await button4.click();
      await driver.delayMs(500);
      await button5.click();
      await driver.delayMs(1000);

      console.info('uitest: testBasicKnowledge001 end');
      await driver.pressBack();
    })

    it('testFunction002', 0, async () => {
      console.info('uitest: testFunction002 begin');
      const driver = Driver.create();
      const button1 = await driver.findComponent(ON.text('函数'));
      await driver.delayMs(1000);
      await button1.click();
      await driver.delayMs(1000);

      const button2 = await driver.findComponent(ON.text('测试函数声明'));
      const button3 = await driver.findComponent(ON.text('测试可选参数'));
      const button4 = await driver.findComponent(ON.text('测试默认参数'));
      const button5 = await driver.findComponent(ON.text('测试闭包'));
      await driver.delayMs(1000);

      await button2.click();
      await driver.delayMs(500);
      await button3.click();
      await driver.delayMs(500);
      await button4.click();
      await driver.delayMs(500);
      await button5.click();
      await driver.delayMs(1000);

      console.info('uitest: testFunction002 end');
      await driver.pressBack();
    })

    it('testClass003', 0, async () => {
      console.info('uitest: testClass003 begin');
      const driver = Driver.create();
      await driver.delayMs(1000);
      const button1 = await driver.findComponent(ON.text('类'));
      await driver.delayMs(1000);
      await button1.click();
      await driver.delayMs(1000);

      const button2 = await driver.findComponent(ON.text('测试类定义'));
      const button3 = await driver.findComponent(ON.text('测试静态属性'));
      const button4 = await driver.findComponent(ON.text('测试GetterSetter'));
      const button5 = await driver.findComponent(ON.text('测试继承'));
      await driver.delayMs(1000);

      await button2.click();
      await driver.delayMs(500);
      await button3.click();
      await driver.delayMs(500);
      await button4.click();
      await driver.delayMs(500);
      await button5.click();
      await driver.delayMs(1000);

      console.info('uitest: testClass003 end');
      await driver.pressBack();
    })

    it('testGenericTypesAndFunctions004', 0, async () => {
      console.info('uitest: testGenericTypesAndFunctions004 begin');
      const driver = Driver.create();
      await driver.delayMs(1000);
      const button1 = await driver.findComponent(ON.text('泛型类型和函数'));
      await driver.delayMs(1000);
      await button1.click();
      await driver.delayMs(1000);

      const button2 = await driver.findComponent(ON.text('测试泛型介绍'));
      const button3 = await driver.findComponent(ON.text('测试泛型类'));
      const button4 = await driver.findComponent(ON.text('测试泛型函数'));
      const button5 = await driver.findComponent(ON.text('测试泛型约束'));
      await driver.delayMs(1000);

      await button2.click();
      await driver.delayMs(500);
      await button3.click();
      await driver.delayMs(500);
      await button4.click();
      await driver.delayMs(500);
      await button5.click();
      await driver.delayMs(1000);

      console.info('uitest: testGenericTypesAndFunctions004 end');
      await driver.pressBack();
    })
  })
}
