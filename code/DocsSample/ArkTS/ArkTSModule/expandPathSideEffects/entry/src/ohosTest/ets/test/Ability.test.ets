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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, it, expect } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
const TAG = '[Sample_ExpandPathSideEffects]';
const DOMAIN = 0xF811;
const BUNDLE = 'ExpandPathSideEffects_';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    /**
     * 拉起应用，验证主界面（EntryAbility）加载成功。
     * 主页面 Index.ets 按路径导入HAR包内指定文件
     * （import { serviceManager } from 'servicemanagerhar/src/main/ets/OpServiceManager'），
     * 应用正常拉起即说明按路径导入解析成功、被导入文件内部初始化逻辑执行未出现异常。
     */
    it(BUNDLE + 'StartAbility_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001, begin');
      const want: Want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility'
      };
      const driver = Driver.create();
      await delegator.startAbility(want);
      await driver.delayMs(2000);
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001, abilityName: ' + ability.context.abilityInfo.name);
      expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001, end');
      done();
    });

    /**
     * 验证页面初始文本"Hello World"显示
     */
    it(BUNDLE + 'PageText_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'PageText_001, begin');
      const driver = Driver.create();
      await driver.delayMs(1000);
      await driver.assertComponentExist(ON.text('Hello World'));
      hilog.info(DOMAIN, TAG, BUNDLE + 'PageText_001, end');
      done();
    });

    /**
     * 点击页面文本，验证文本由"Hello World"切换为"Welcome"
     */
    it(BUNDLE + 'ClickText_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'ClickText_001, begin');
      const driver = Driver.create();
      await driver.delayMs(1000);
      const text = await driver.findComponent(ON.text('Hello World'));
      hilog.info(DOMAIN, TAG, BUNDLE + 'ClickText_001, text found: ' + (text !== null));
      expect(text !== null).assertTrue();
      if (text !== null) {
        await text.click();
        await driver.delayMs(1000);
        await driver.assertComponentExist(ON.text('Welcome'));
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'ClickText_001, end');
      done();
    });
  });
}
