'use static'

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
import { abilityDelegatorRegistry, Driver, ON, MatchPattern, On, Component } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import hilog from '@ohos.hilog';
import router from '@ohos.router';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let want: Want;
let driver: Driver;
const TAG = '[Sample_NewLifecycleSample]'
const DOMAIN = 0xF811
const BUNDLE = 'NewLifecycleSample'

export default function IndexTest() {

  describe('IndexTest', () => {
    beforeAll(async () => {
      want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility'
      };
      await delegator.startAbility(want);
      driver = Driver.create();
      await driver.delayMs(2000);
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      hilog.info(DOMAIN, TAG, BUNDLE + 'get top ability');
      expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
    })

    /**
     * @tc.number UiTest_001
     * @tc.name LifecycleNest
     * @tc.desc 自定义组件嵌套使用
     * @tc.level: Level 1
     */
    it('LifecycleNest', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LifecycleNest begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LifecycleNest' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('delete Parent', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name LifecycleReuse
     * @tc.desc 自定义组件回收复用
     * @tc.level: Level 1
     */
    it('LifecycleReuse', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LifecycleReuse begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LifecycleReuse' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Hello', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name LifecycleObserver
     * @tc.desc 自定义组件生命周期注册监听
     * @tc.level: Level 1
     */
    it('LifecycleObserver', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LifecycleObserver begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LifecycleObserver' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Hello', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name LifecycleActiveInactive
     * @tc.desc 监听自定义组件激活与非激活状态
     * @tc.level: Level 1
     */
    it('LifecycleActiveInactive', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LifecycleActiveInactive begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LifecycleActiveInactive' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_005
     * @tc.name LifecycleSwiper
     * @tc.desc ComponentAppear与aboutToAppear区别
     * @tc.level: Level 1
     */
    it('LifecycleSwiper', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LifecycleSwiper begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LifecycleSwiper' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('start', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_006
     * @tc.name LifecycleReuseDiff
     * @tc.desc ComponentReuse与aboutToReuse区别
     * @tc.level: Level 1
     */
    it('LifecycleReuseDiff', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LifecycleReuseDiff begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LifecycleReuseDiff' });
      await driver.delayMs(1000);
      let btnA = await driver.findComponent(ON.text('a'));
      await btnA.click();
      await driver.delayMs(1000);
      let btnB = await driver.findComponent(ON.text('b'));
      await btnB.click();
      await driver.delayMs(1000);
      done();
    });
  })
}
