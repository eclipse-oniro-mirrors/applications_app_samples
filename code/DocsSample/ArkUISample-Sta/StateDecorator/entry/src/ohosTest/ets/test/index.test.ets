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
const TAG = '[Sample_StateDecorator]'
const DOMAIN = 0xF811
const BUNDLE = 'StateDecorator'

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
     * @tc.name StateObservedClass
     * @tc.desc @State装饰@Observed类
     * @tc.level: Level 1
     */

    it('StateObservedClass', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: StateObservedClass begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/StateObservedClass' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Change observed value', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('Change not Observed value', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('Change not Observed class', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name StateSimpleTypes
     * @tc.desc @State装饰简单类型
     * @tc.level: Level 1
     */

    it('StateSimpleTypes', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: StateSimpleTypes begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/StateSimpleTypes' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('click times', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name StateMapVariable
     * @tc.desc @State装饰Map类型变量
     * @tc.level: Level 1
     */

    it('StateMapVariable', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: StateMapVariable begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/StateMapVariable' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Set entry cherry', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('Update entry apple', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('Delete entry apple', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      let btn4 = await driver.findComponent(ON.text('Reset map', MatchPattern.CONTAINS));
      await btn4.click();
      await driver.delayMs(1000);
      let btn5 = await driver.findComponent(ON.text('Clear map', MatchPattern.CONTAINS));
      await btn5.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name StateSetVariable
     * @tc.desc @State装饰Set类型变量
     * @tc.level: Level 1
     */

    it('StateSetVariable', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: StateSetVariable begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/StateSetVariable' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Add element', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('Delete element apple', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('Reset set', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      let btn4 = await driver.findComponent(ON.text('Clear set', MatchPattern.CONTAINS));
      await btn4.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_005
     * @tc.name StateDateVariable
     * @tc.desc @State装饰Date类型变量
     * @tc.level: Level 1
     */

    it('StateDateVariable', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: StateDateVariable begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/StateDateVariable' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('set selectedDate to 2023-07-08', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('increase the year by 1', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('increase the month by 1', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      let btn4 = await driver.findComponent(ON.text('increase the day by 1', MatchPattern.CONTAINS));
      await btn4.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_006
     * @tc.name StateInterface
     * @tc.desc @State装饰interface字面量
     * @tc.level: Level 1
     */

    it('StateInterface', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: StateInterface begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/StateInterface' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('info.name', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_007
     * @tc.name StateUnionType
     * @tc.desc @State支持联合类型
     * @tc.level: Level 1
     */

    it('StateUnionType', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: StateUnionType begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/StateUnionType' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change to undefined', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('change to int', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });
  })
}