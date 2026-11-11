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

import hilog from '@ohos.hilog';
import { beforeAll, describe, it } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON, Component } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';

const DOMAIN: number = 0xFF00;
const TAG: string = 'ComponentReuse_Test';
const BUNDLE: string = 'com.example.componentreuse';
const ABILITY: string = 'EntryAbility';

const PAGE_TITLES: string[] = [
  '减少组件复用的嵌套层级',
  '减少组件复用的嵌套层级 - 反例',
  '使用AttributeUpdater精准控制组件属性的刷新',
  '使用AttributeUpdater精准控制组件属性的刷新 - 反例',
  '使用@Link/@ObjectLink替代@Prop减少深拷贝 - 反例',
  '避免状态变量在aboutToReuse方法中再进行更新 - 反例',
  '使用reuseId标记不同结构的组件',
  '使用reuseId标记不同结构的组件 - 反例',
  '避免使用函数/方法作为复用组件创建时的入参',
  '避免使用函数/方法作为复用组件创建时的入参 - 反例'
];

const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const driver: Driver = Driver.create();

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(async (done: Function) => {
      const want: Want = {
        bundleName: BUNDLE,
        abilityName: ABILITY
      };
      abilityDelegator.startAbility(want, (err) => {
        if (err) {
          hilog.error(DOMAIN, TAG, '%{public}s', `error: ${JSON.stringify(err)}`);
        } else {
          hilog.info(DOMAIN, TAG, '%{public}s', 'success start ability');
        }
      });
      await driver.delayMs(1000);
      done();
    });

    for (let i: number = 0; i < PAGE_TITLES.length; i++) {
      const pageTitle: string = PAGE_TITLES[i];
      const caseName: string = 'testComponentReusePage' + (i + 1).toString().padStart(4, '0');
      it(caseName, 0, async (done: Function) => {
        hilog.info(DOMAIN, TAG, '%{public}s', `${caseName} begin: ${pageTitle}`);
        await runPageTest(driver, pageTitle);
        hilog.info(DOMAIN, TAG, '%{public}s', `${caseName} end`);
        done();
      });
    }
  });
}

async function runPageTest(driver: Driver, pageTitle: string): Promise<void> {
  const button: Component = await driver.findComponent(ON.text(pageTitle));
  await button.click();
  await driver.delayMs(500);
  await driver.swipe(100, 1000, 100, 100);
  await driver.delayMs(700);
  await driver.pressBack();
  await driver.delayMs(500);
}
