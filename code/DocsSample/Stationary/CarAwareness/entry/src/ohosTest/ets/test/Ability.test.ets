/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;

function sleep(time: number) {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, time));
}

export default function abilityTest() {
  describe('AppTest', () => {
    /*
     * 测试隔空手势订阅功能
     */
    it('SubscribeSpatialMotionTest', 0, async (done: Function) => {
      console.info('uitest: SubscribeSpatialMotionTest begin');
      const want: Want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility'
      };
      await delegator.startAbility(want);
      await sleep(1000);
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
      const driver = Driver.create();
      await driver.delayMs(1000);

      // 点击订阅隔空手势按钮
      const subscribeButton = await driver.findComponent(ON.text('订阅').enabled(true));
      await subscribeButton.click();
      await driver.delayMs(500);

      // 点击取消订阅隔空手势按钮
      const unsubscribeButton = await driver.findComponent(ON.text('取消订阅').enabled(true));
      await unsubscribeButton.click();
      await driver.delayMs(500);

      done();
      console.info('uitest: SubscribeSpatialMotionTest end');
    });

    /*
     * 测试实时天气订阅功能
     */
    it('SubscribeWeatherTest', 0, async (done: Function) => {
      console.info('uitest: SubscribeWeatherTest begin');
      const want: Want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility'
      };
      await delegator.startAbility(want);
      await sleep(1000);
      const driver = Driver.create();
      await driver.delayMs(1000);

      // 点击订阅实时天气按钮
      const subscribeButton = await driver.findComponent(ON.text('订阅').enabled(true));
      await subscribeButton.click();
      await driver.delayMs(500);

      // 点击取消订阅实时天气按钮
      const unsubscribeButton = await driver.findComponent(ON.text('取消订阅').enabled(true));
      await unsubscribeButton.click();
      await driver.delayMs(500);

      done();
      console.info('uitest: SubscribeWeatherTest end');
    });

    /*
     * 测试补能状态订阅功能
     */
    it('SubscribeRefuelingTest', 0, async (done: Function) => {
      console.info('uitest: SubscribeRefuelingTest begin');
      const want: Want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility'
      };
      await delegator.startAbility(want);
      await sleep(1000);
      const driver = Driver.create();
      await driver.delayMs(1000);

      // 点击订阅补能状态按钮
      const subscribeButton = await driver.findComponent(ON.text('订阅').enabled(true));
      await subscribeButton.click();
      await driver.delayMs(500);

      // 点击取消订阅补能状态按钮
      const unsubscribeButton = await driver.findComponent(ON.text('取消订阅').enabled(true));
      await unsubscribeButton.click();
      await driver.delayMs(500);

      done();
      console.info('uitest: SubscribeRefuelingTest end');
    });

    /*
     * 测试能力查询功能
     */
    it('QueryCapabilityTest', 0, async (done: Function) => {
      console.info('uitest: QueryCapabilityTest begin');
      const want: Want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility'
      };
      await delegator.startAbility(want);
      await sleep(1000);
      const driver = Driver.create();
      await driver.delayMs(500);

      // 查找查询能力列表按钮
      const queryButton = await driver.findComponent(ON.text('查询能力列表'));
      await queryButton.click();
      await driver.delayMs(500);

      done();
      console.info('uitest: QueryCapabilityTest end');
    });
  });
}
