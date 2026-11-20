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
import { abilityDelegatorRegistry, Driver, ON, MatchPattern } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN = 0xF811;
const TAG = '[Sample_AddPrinterInApp]';
const BUNDLE = 'AddPrinterInApp_';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
let want: Want;

export default function AddPrinterTest() {
  describe('AddPrinterTest', () => {
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
     * @tc.number AddPrinterInApp_LaunchApp_001
     * @tc.name testLaunchApp
     * @tc.desc 测试应用成功拉起并展示添加打印机主界面
     */
    it(BUNDLE + 'LaunchApp_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', `${BUNDLE}LaunchApp_001 begin`);
      let driver = Driver.create();
      let title = await driver.findComponent(ON.text('添加打印机', MatchPattern.CONTAINS));
      hilog.info(DOMAIN, TAG, '%{public}s', `${BUNDLE}LaunchApp_001 find title: ${title !== undefined}`);
      expect(title).assertNotNull();
      let button = await driver.findComponent(ON.id('addPrinterButton'));
      hilog.info(DOMAIN, TAG, '%{public}s', `${BUNDLE}LaunchApp_001 find button: ${button !== undefined}`);
      expect(button).assertNotNull();
      await driver.delayMs(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', `${BUNDLE}LaunchApp_001 end`);
      done();
    })

    /**
     * @tc.number AddPrinterInApp_RequiredFieldValidation_001
     * @tc.name testRequiredFieldValidation
     * @tc.desc 测试打印机URI为空时的必填信息校验
     */
    it(BUNDLE + 'RequiredFieldValidation_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, '%{public}s', `${BUNDLE}RequiredFieldValidation_001 begin`);
      let driver = Driver.create();
      // 默认打印机URI为空，点击"添加打印机"按钮触发必填校验
      let button = await driver.findComponent(ON.id('addPrinterButton'));
      hilog.info(DOMAIN, TAG, '%{public}s',
        `${BUNDLE}RequiredFieldValidation_001 find button: ${button !== undefined}`);
      expect(button).assertNotNull();
      await button.click();
      await driver.delayMs(1000);
      let tip = await driver.findComponent(ON.text('请补全必填信息'));
      hilog.info(DOMAIN, TAG, '%{public}s', `${BUNDLE}RequiredFieldValidation_001 find tip: ${tip !== undefined}`);
      expect(tip).assertNotNull();
      await driver.delayMs(500);
      await driver.pressBack();
      hilog.info(DOMAIN, TAG, '%{public}s', `${BUNDLE}RequiredFieldValidation_001 end`);
      done();
    })
  })
}
