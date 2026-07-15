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

import { describe, it, expect, beforeAll, Level } from '@ohos/hypium';
// 导入测试依赖kit
import { abilityDelegatorRegistry, Driver, ON, MatchPattern, On, Component } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import hilog from '@ohos.hilog';
import router from '@ohos.router';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let want: Want;
const TAG = '[Sample_CustomLifecycleNew]'
const DOMAIN = 0xF811
const BUNDLE = 'CustomLifecycleNew'

async function getResourceString(resource: Resource): Promise<string> {
  let manage = abilityDelegator.getAppContext().resourceManager;
  let textString: string = await manage.getStringValue(resource);
  return textString;
}

export default function abilityTest() {

  describe('CustomLifecycleNewTest', () => {
    beforeAll(async () => {
      want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility'
      };
      await delegator.startAbility(want);
      let driver = Driver.create();
      await driver.delayMs(1000);
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      hilog.info(DOMAIN, TAG, BUNDLE + 'get top ability');
      expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
    })

    /**
     * @tc.number UiTest_001
     * @tc.name componentActiveRecycle
     * @tc.desc 测试回收复用场景监听激活状态变化
     * @tc.level: Level 1
     */
    it('componentActiveRecycle', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: componentActiveRecycle begin');
      let driver = Driver.create();
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ComponentActiveRecycle' });
      await driver.delayMs(1000);
      // 查找并点击change按钮
      let btn = await driver.findComponent(ON.text('change'));
      await btn.click();
      await driver.delayMs(500);
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name componentActiveLazyCreate
     * @tc.desc 测试懒创建场景监听激活状态变化
     * @tc.level: Level 1
     */
    it('componentActiveLazyCreate', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: componentActiveLazyCreate begin');
      let driver = Driver.create();
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ComponentActiveLazyCreate' });
      await driver.delayMs(1000);
      // 点击PageTwo按钮跳转
      let pageTwoBtn = await driver.findComponent(ON.text('PageTwo'));
      await pageTwoBtn.click();
      await driver.delayMs(1000);
      // 点击back按钮返回
      let backBtn = await driver.findComponent(ON.text('back'));
      await backBtn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name componentActivePreRender
     * @tc.desc 测试预加载场景监听激活状态变化
     * @tc.level: Level 1
     */
    it('componentActivePreRender', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: componentActivePreRender begin');
      let driver = Driver.create();
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ComponentActivePreRender' });
      await driver.delayMs(1000);
      // 点击change按钮创建List
      let changeBtn = await driver.findComponent(ON.text('change'));
      await changeBtn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name componentActivePageVisible
     * @tc.desc 测试页面可见性变化场景监听激活状态变化
     * @tc.level: Level 1
     */
    it('componentActivePageVisible', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: componentActivePageVisible begin');
      let driver = Driver.create();
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ComponentActivePageVisible' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_005
     * @tc.name componentNesting
     * @tc.desc 测试自定义组件嵌套使用
     * @tc.level: Level 1
     */
    it('componentNesting', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: componentNesting begin');
      let driver = Driver.create();
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ComponentNesting' });
      await driver.delayMs(1000);
      // 点击delete Parent And Child按钮
      let btn = await driver.findComponent(ON.text('delete Parent And Child'));
      await btn.click();
      await driver.delayMs(500);
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_006
     * @tc.name componentRecycleReuse
     * @tc.desc 测试自定义组件回收复用
     * @tc.level: Level 1
     */
    it('componentRecycleReuse', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: componentRecycleReuse begin');
      let driver = Driver.create();
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ComponentRecycleReuse' });
      await driver.delayMs(1000);
      // 点击recycle child按钮
      let btn = await driver.findComponent(ON.text('recycle child'));
      await btn.click();
      await driver.delayMs(500);
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_007
     * @tc.name componentLifecycleObserver
     * @tc.desc 测试自定义组件生命周期的注册监听
     * @tc.level: Level 1
     */
    it('componentLifecycleObserver', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: componentLifecycleObserver begin');
      let driver = Driver.create();
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ComponentLifecycleObserver' });
      await driver.delayMs(1000);
      // 点击recycle child按钮
      let btn = await driver.findComponent(ON.text('recycle child'));
      await btn.click();
      await driver.delayMs(500);
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_008
     * @tc.name lifecycleDifference
     * @tc.desc 测试ComponentAppear/Disappear与aboutToAppear/Disappear区别
     * @tc.level: Level 1
     */
    it('lifecycleDifference', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: lifecycleDifference begin');
      let driver = Driver.create();
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LifecycleDifference' });
      await driver.delayMs(1000);
      // 点击start文本
      let btn = await driver.findComponent(ON.text('start'));
      await btn.click();
      await driver.delayMs(500);
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_009
     * @tc.name componentReuseDifference
     * @tc.desc 测试ComponentReuse/Recycle与aboutToReuse/Recycle区别
     * @tc.level: Level 1
     */
    it('componentReuseDifference', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: componentReuseDifference begin');
      let driver = Driver.create();
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ComponentReuseDifference' });
      await driver.delayMs(1000);
      // 点击change flag 1按钮
      let btn1 = await driver.findComponent(ON.text('change flag 1'));
      await btn1.click();
      await driver.delayMs(500);
      // 点击change flag 2按钮
      let btn2 = await driver.findComponent(ON.text('change flag 2'));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });
  })
}
