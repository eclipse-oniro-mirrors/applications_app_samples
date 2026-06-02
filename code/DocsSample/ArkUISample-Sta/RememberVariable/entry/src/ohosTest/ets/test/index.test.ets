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
const TAG = '[Sample_RememberVariable]'
const DOMAIN = 0xF811
const BUNDLE = 'RememberVariable'

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
     * @tc.name RememberBasicType
     * @tc.desc @Builder内声明基础类型的状态变量
     * @tc.level: Level 1
     */
    it('RememberBasicType', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: RememberBasicType begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/RememberBasicType' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Change message in builder', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name RememberBuiltinType
     * @tc.desc @Builder内声明内置类型的状态变量
     * @tc.level: Level 1
     */
    it('RememberBuiltinType', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: RememberBuiltinType begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/RememberBuiltinType' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Change messages in builder', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name RememberInterfaceType
     * @tc.desc @Builder内声明interface字面量的状态变量
     * @tc.level: Level 1
     */
    it('RememberInterfaceType', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: RememberInterfaceType begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/RememberInterfaceType' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Change name in builder', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name RememberClassType
     * @tc.desc @Builder内声明class类型的状态变量
     * @tc.level: Level 1
     */
    it('RememberClassType', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: RememberClassType begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/RememberClassType' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Change name in builder', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_005
     * @tc.name RememberPassVariable
     * @tc.desc @Builder内声明状态变量并传递
     * @tc.level: Level 1
     */
    it('RememberPassVariable', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: RememberPassVariable begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/RememberPassVariable' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Change message in child builder', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_006
     * @tc.name RememberFunctionType
     * @tc.desc 修改函数地址触发UI刷新
     * @tc.level: Level 1
     */
    it('RememberFunctionType', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: RememberFunctionType begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/RememberFunctionType' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Change function in builder', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_007
     * @tc.name RememberInitFromState
     * @tc.desc rememberVariable声明的状态变量不能同步数据
     * @tc.level: Level 1
     */
    it('RememberInitFromState', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: RememberInitFromState begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/RememberInitFromState' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Change source', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('Change message', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });
  })
}
