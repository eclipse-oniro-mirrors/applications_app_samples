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
const TAG = '[Sample_ComputedDecorator]'
const DOMAIN = 0xF811
const BUNDLE = 'ComputedDecorator'

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
     * @tc.name ComputedComponent
     * @tc.desc 在自定义组件中使用计算属性
     * @tc.level: Level 1
     */

    it('ComputedComponent', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ComputedComponent begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ComputedComponent' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('changed lastName', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('changed age', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name ComputedObservedV2
     * @tc.desc 在@ObservedV2类中使用计算属性
     * @tc.level: Level 1
     */

    it('ComputedObservedV2', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ComputedObservedV2 begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ComputedObservedV2' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('changed lastName', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name ComputedMonitor
     * @tc.desc @Computed属性被@Monitor监听
     * @tc.level: Level 1
     */

    it('ComputedMonitor', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ComputedMonitor begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ComputedMonitor' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('-', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('+', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name ComputedInitParam
     * @tc.desc @Computed属性初始化@Param
     * @tc.level: Level 1
     */

    it('ComputedInitParam', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ComputedInitParam begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ComputedInitParam' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('-', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('+', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });
  })
}