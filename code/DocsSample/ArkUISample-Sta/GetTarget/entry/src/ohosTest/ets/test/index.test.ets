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
const TAG = '[Sample_GetTarget]'
const DOMAIN = 0xF811
const BUNDLE = 'GetTarget'

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
     * @tc.name GetTargetNonObject
     * @tc.desc 非对象类型入参
     * @tc.level: Level 1
     */

    it('GetTargetNonObject', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: GetTargetNonObject begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/GetTargetNonObject' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name GetTargetClassObject
     * @tc.desc 传入class对象
     * @tc.level: Level 1
     */

    it('GetTargetClassObject', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: GetTargetClassObject begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/GetTargetClassObject' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name GetTargetOriginalObject
     * @tc.desc 更改原始对象的属性
     * @tc.level: Level 1
     */

    it('GetTargetOriginalObject', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: GetTargetOriginalObject begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/GetTargetOriginalObject' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('更改包装后对象的属性', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('更改原始对象的属性', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name GetTargetUsageExample
     * @tc.desc 使用场景示例
     * @tc.level: Level 1
     */

    it('GetTargetUsageExample', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: GetTargetUsageExample begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/GetTargetUsageExample' });
      await driver.delayMs(1000);
      done();
    });
  })
}