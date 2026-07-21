/*
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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
// 导入测试依赖kit
import { abilityDelegatorRegistry, Driver, ON, MatchPattern } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
let want: Want;

export default function PrintTest() {
  describe('PrintTest', () => {
    beforeAll(async () => {
      want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility'
      };
      await delegator.startAbility(want);
      let driver = Driver.create();
      await driver.delayMs(1000);
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
    })

    /**
     * @tc.number PrintTest_001
     * @tc.name testStartPrintByNative
     * @tc.desc 测试点击按钮拉起系统打印预览界面
     */
    it('PrintTest_001', 0, async (done: Function) => {
      let driver = Driver.create();
      let button = await driver.findComponent(ON.text('OH_Print_StartPrintByNative', MatchPattern.CONTAINS));
      await button.click();
      await driver.delayMs(2000);
      await driver.pressBack();
      done();
    })

    /**
     * @tc.number PrintTest_002
     * @tc.name testStartPrintJob
     * @tc.desc 测试点击按钮直接下发打印任务
     */
    it('PrintTest_002', 0, async (done: Function) => {
      let driver = Driver.create();
      let button = await driver.findComponent(ON.text('OH_Print_StartPrintJob', MatchPattern.CONTAINS));
      await button.click();
      await driver.delayMs(2000);
      await driver.pressBack();
      done();
    })
  })
}
