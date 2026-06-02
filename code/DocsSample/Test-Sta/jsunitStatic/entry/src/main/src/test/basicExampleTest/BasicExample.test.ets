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
// [Start basic_sta_sample]
import { describe, expect, it, TestType, Level, Size } from '../../../../hypium/index';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import { sleep } from '../Util.test'
const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function abilityTest(): void {
  describe('ActsAbilityTest', (): void => {
    // 测试套名称为ActsAbilityTest
    // 可根据此处设置的用例类型、用例规模、用例级别进行用例筛选
    it('testExample', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // 测试用例名称为testExample
      const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
      // 启动被测试Ability
      const want: Want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility'
      }
      await delegator.startAbility(want);
      await sleep(1000);
      // 获取设备上前台显示的页面并断言检查
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');

    })
  })
}

// [End basic_sta_sample]