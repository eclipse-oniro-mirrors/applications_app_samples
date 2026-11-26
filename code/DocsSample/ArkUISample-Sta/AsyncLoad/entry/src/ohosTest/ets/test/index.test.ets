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
const TAG = '[Sample_AsyncLoad]'
const DOMAIN = 0xF811
const BUNDLE = 'AsyncLoad'

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
     * @tc.name asyncLoadBasic
     * @tc.desc 自定义组件嵌套使用
     * @tc.level: Level 1
     */
    it('asyncLoadBasic', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: asyncLoadBasic begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/AsyncLoadBasic' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('delete Parent', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name asyncLoadPlaceholder
     * @tc.desc 自定义组件回收复用
     * @tc.level: Level 1
     */
    it('asyncLoadPlaceholder', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: asyncLoadPlaceholder begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/AsyncLoadPlaceholder' });
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
     * @tc.name asyncLoadTimeout
     * @tc.desc 自定义组件生命周期注册监听
     * @tc.level: Level 1
     */
    it('asyncLoadTimeout', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: asyncLoadTimeout begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/AsyncLoadTimeout' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Hello', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      await btn.click();
      await driver.delayMs(1000);
      done();
    });


  })
}
