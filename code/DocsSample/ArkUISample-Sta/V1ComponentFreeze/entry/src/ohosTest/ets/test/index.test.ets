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
const TAG = '[Sample_V1ComponentFreeze]'
const DOMAIN = 0xF811
const BUNDLE = 'V1ComponentFreeze'

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
     * @tc.name FreezePageRouter
     * @tc.desc 页面路由冻结
     * @tc.level: Level 1
     */
    it('FreezePageRouter', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: FreezePageRouter begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/FreezePageRouter' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('go to next page', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
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
     * @tc.number UiTest_003
     * @tc.name FreezeLazyForEach
     * @tc.desc LazyForEach冻结
     * @tc.level: Level 1
     */
    it('FreezeLazyForEach', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: FreezeLazyForEach begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/FreezeLazyForEach' });
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
     * @tc.name FreezeReuse
     * @tc.desc 组件复用冻结
     * @tc.level: Level 1
     */
    it('FreezeReuse', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: FreezeReuse begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/FreezeReuse' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change desc', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_006
     * @tc.name FreezeMixNavTab
     * @tc.desc Navigation+TabContent混用
     * @tc.level: Level 1
     */
    it('FreezeMixNavTab', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: FreezeMixNavTab begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/FreezeMixNavTab' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Next Page', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });
  })
}
