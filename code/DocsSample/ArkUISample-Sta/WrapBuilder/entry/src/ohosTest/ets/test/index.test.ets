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
const TAG = '[Sample_WrapBuilder]'
const DOMAIN = 0xF811
const BUNDLE = 'WrapBuilder'

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
     * @tc.name WrapBuilderVariable
     * @tc.desc @Builder方法赋值给变量
     * @tc.level: Level 1
     */

    it('WrapBuilderVariable', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: WrapBuilderVariable begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/WrapBuilderVariable' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Hello World', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name WrapBuilderForEach
     * @tc.desc @Builder方法赋值给变量在UI语法中使用
     * @tc.level: Level 1
     */

    it('WrapBuilderForEach', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: WrapBuilderForEach begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/WrapBuilderForEach' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Hello World', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name WrapBuilderReference
     * @tc.desc 引用传递
     * @tc.level: Level 1
     */

    it('WrapBuilderReference', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: WrapBuilderReference begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/WrapBuilderReference' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Click me', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name WrapBuilderDynamicSwitch
     * @tc.desc 动态切换
     * @tc.level: Level 1
     */

    it('WrapBuilderDynamicSwitch', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: WrapBuilderDynamicSwitch begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/WrapBuilderDynamicSwitch' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Click to change', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      await btn.click();
      await driver.delayMs(1000);
      done();
    });
  })
}
