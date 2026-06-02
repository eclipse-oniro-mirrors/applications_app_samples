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
const TAG = '[Sample_ComponentFreezeV2]'
const DOMAIN = 0xF811
const BUNDLE = 'ComponentFreezeV2'

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
     * @tc.name FreezePageRouter1
     * @tc.desc 页面路由冻结-Page1
     * @tc.level: Level 1
     */

    it('FreezePageRouter1', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: FreezePageRouter1 begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/FreezePage1' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('changeBookName', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name FreezePageRouter2
     * @tc.desc 页面路由冻结-Page2
     * @tc.level: Level 1
     */

    it('FreezePageRouter2', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: FreezePageRouter2 begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/FreezePage2' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Back', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name FreezeTabContent
     * @tc.desc TabContent冻结
     * @tc.level: Level 1
     */

    it('FreezeTabContent', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: FreezeTabContent begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/FreezeTabContent' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change message', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name FreezeNavigation
     * @tc.desc Navigation冻结
     * @tc.level: Level 1
     */

    it('FreezeNavigation', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: FreezeNavigation begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/FreezeNavigation' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change message', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_005
     * @tc.name FreezeMixNavigationTab
     * @tc.desc Navigation和TabContent混用冻结
     * @tc.level: Level 1
     */

    it('FreezeMixNavigationTab', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: FreezeMixNavigationTab begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/FreezeMixNavigationTab' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Next Page', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });
  })
}
