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
const TAG = '[Sample_MakeObserved]'
const DOMAIN = 0xF811
const BUNDLE = 'MakeObserved'

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
     * @tc.name MakeObservedBasic
     * @tc.desc @MakeObserved基本用法
     * @tc.level: Level 1
     */

    it('MakeObservedBasic', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: MakeObservedBasic begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/MakeObservedBasic' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('info.name', MatchPattern.CONTAINS));
      await text.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name MakeObservedNested
     * @tc.desc 嵌套类对象观察
     * @tc.level: Level 1
     */

    it('MakeObservedNested', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: MakeObservedNested begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/MakeObservedNested' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('info.name', MatchPattern.CONTAINS));
      await text.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name MakeObservedOneLevel
     * @tc.desc 单层嵌套观察
     * @tc.level: Level 1
     */

    it('MakeObservedOneLevel', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: MakeObservedOneLevel begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/MakeObservedOneLevel' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change name', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('replace info', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name MakeObservedWithDecorator
     * @tc.desc 结合@State装饰器使用
     * @tc.level: Level 1
     */

    it('MakeObservedWithDecorator', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: MakeObservedWithDecorator begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/MakeObservedWithDecorator' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('info.name', MatchPattern.CONTAINS));
      await text.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_005
     * @tc.name MakeObservedArray
     * @tc.desc 装饰Array类型
     * @tc.level: Level 1
     */

    it('MakeObservedArray', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: MakeObservedArray begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/MakeObservedArray' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change arr', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('push item', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('pop item', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      let btn4 = await driver.findComponent(ON.text('reverse', MatchPattern.CONTAINS));
      await btn4.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_006
     * @tc.name MakeObservedMap
     * @tc.desc 装饰Map类型
     * @tc.level: Level 1
     */

    it('MakeObservedMap', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: MakeObservedMap begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/MakeObservedMap' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('set new one', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('clear', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('replace the first one', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      let btn4 = await driver.findComponent(ON.text('delete the first one', MatchPattern.CONTAINS));
      await btn4.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_007
     * @tc.name MakeObservedSet
     * @tc.desc 装饰Set类型
     * @tc.level: Level 1
     */

    it('MakeObservedSet', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: MakeObservedSet begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/MakeObservedSet' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('set new one', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('clear', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('delete the first one', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_008
     * @tc.name MakeObservedDate
     * @tc.desc 装饰Date类型
     * @tc.level: Level 1
     */

    it('MakeObservedDate', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: MakeObservedDate begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/MakeObservedDate' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('increase the year', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('increase the month', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('increase the day', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_009
     * @tc.name MakeObservedInterface
     * @tc.desc 装饰interface
     * @tc.level: Level 1
     */

    it('MakeObservedInterface', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: MakeObservedInterface begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/MakeObservedInterface' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('info.name', MatchPattern.CONTAINS));
      await text.click();
      await driver.delayMs(1000);
      done();
    });
  })
}