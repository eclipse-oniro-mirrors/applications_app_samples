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

// [Start click_sta_sample]
import { describe, expect, it, Level } from '../../../../hypium/index';
// 导入测试依赖kit
import { abilityDelegatorRegistry, Component, Driver, ON } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function abilityTest(): void {
  describe('ActsAbilityTest', (): void => {
    it('testUiExample', Level.LEVEL3, async (): Promise<void> => {
      // 初始化Driver对象
      const driver: Driver = Driver.create();
      const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
      // 指定被测应用包名、ability名，请开发者替换为被测应用包名和ability名
      const want: Want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility'
      }
      // 拉起被测应用
      await delegator.startAbility(want);
      // 等待应用拉起完成
      await driver.waitForIdle(4000, 5000);
      // 确认当前应用顶部Ability为指定的ability
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');

      // 依据指定文本”toClickToAfterIndex”查找目标控件
      const toClick: Component | null = await driver.findComponent(ON.text('toClickToAfterIndex'));
      // 点击目标控件
      await toClick!.click();
      // 依据指定文本”toClickToAfterIndex”查找目标控件
      const next: Component | null = await driver.findComponent(ON.text('Next'));
      // 点击目标控件
      await next!.click();
      // 通过断言文本为”after click”的控件存在，确认操作后页面变化符合预期
      await driver.assertComponentExist(ON.text('after click'));
      await driver.pressBack();
    })
  })
}

// [End click_sta_sample]