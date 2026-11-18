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

import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { describe, it, expect } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';

const TAG = '[Sample_Native_XComponent]';

export default function abilityTest6() {

  describe('ActsAbilityTest6', () => {
    /**
     * 打开应用并进入InspectorTreeGetter示例页面
     */
    it('StartAbility_001', 0, async (done: Function) => {
      console.info(TAG, 'StartAbility_001 begin');
      let driver = Driver.create();
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      try {
        await abilityDelegator.startAbility({
          bundleName: 'com.example.nativexcomponent',
          abilityName: 'EntryAbility'
        });
      } catch (exception) {
        console.info(TAG, `StartAbility_001 exception = ${JSON.stringify(exception)}`);
        expect().assertFail();
      }
      await driver.delayMs(1000);
      // 进入InspectorTreeGetter示例
      await driver.assertComponentExist(ON.text('InspectorTreeGetter'));
      let entryBtn = await driver.findComponent(ON.text('InspectorTreeGetter'));
      await entryBtn.click();
      await driver.assertComponentExist(ON.text('点击此处进入'));
      entryBtn = await driver.findComponent(ON.text('点击此处进入'));
      await entryBtn.click();
      done();
      console.info(TAG, 'StartAbility_001 end');
    })

    /**
     * 注册InspectorTreeGetter回调后获取组件树，组件树中包含第三方框架组件子树；
     * 注销回调后再次获取组件树，组件树中不再包含第三方框架组件子树
     */
    it('InspectorTreeGetter_001', 2, async (done: Function) => {
      console.info(TAG, 'InspectorTreeGetter_001 begin');
      let driver = Driver.create();
      await driver.assertComponentExist(ON.text('InspectorTreeGetter Sample'));
      // 判断是否有Register按钮
      await driver.assertComponentExist(ON.text('Register'));
      let registerBtn = await driver.findComponent(ON.text('Register'));
      // 点击'Register'按钮注册InspectorTreeGetter回调
      await registerBtn.click();
      await driver.delayMs(1000);
      // 判断注册成功
      await driver.assertComponentExist(ON.text('register success'));

      // 点击'Get Inspector Tree'按钮获取组件树
      await driver.assertComponentExist(ON.text('Get Inspector Tree'));
      let getTreeBtn = await driver.findComponent(ON.text('Get Inspector Tree'));
      await getTreeBtn.click();
      await driver.delayMs(1000);
      // 判断组件树中包含第三方框架组件子树
      await driver.assertComponentExist(ON.text('tree contains external framework subtree'));

      // 点击'Unregister'按钮注销InspectorTreeGetter回调
      await driver.assertComponentExist(ON.text('Unregister'));
      let unregisterBtn = await driver.findComponent(ON.text('Unregister'));
      await unregisterBtn.click();
      await driver.delayMs(1000);
      // 判断注销成功
      await driver.assertComponentExist(ON.text('unregister success'));

      // 再次点击'Get Inspector Tree'按钮获取组件树
      await getTreeBtn.click();
      await driver.delayMs(1000);
      // 判断组件树中不再包含第三方框架组件子树
      await driver.assertComponentExist(ON.text('tree does not contain external framework subtree'));
      done();
      console.info(TAG, 'InspectorTreeGetter_001 end');
      await driver.pressBack();
      await driver.delayMs(1000);
    })
  })
}
