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
const TAG = '[Sample_ProviderConsumer]'
const DOMAIN = 0xF811
const BUNDLE = 'ProviderConsumer'

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
     * @tc.name ProviderConsumerSync
     * @tc.desc @Provider和@Consumer双向同步
     * @tc.level: Level 1
     */

    it('ProviderConsumerSync', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ProviderConsumerSync begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ProviderConsumerSync' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('hello', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('hello0', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name ProviderConsumerNoSync
     * @tc.desc @Provider和@Consumer未建立双向绑定
     * @tc.level: Level 1
     */

    it('ProviderConsumerNoSync', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ProviderConsumerNoSync begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ProviderConsumerNoSync' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('hello', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('world', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name ProviderConsumerInterface
     * @tc.desc 装饰字面量类型变量
     * @tc.level: Level 1
     */

    it('ProviderConsumerInterface', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ProviderConsumerInterface begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ProviderConsumerInterface' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('parent change whole interface', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('child change whole interface', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name ProviderConsumerArray
     * @tc.desc 装饰数组类型变量
     * @tc.level: Level 1
     */

    it('ProviderConsumerArray', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ProviderConsumerArray begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ProviderConsumerArray' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('parent change whole arr', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('parent push new item', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('child change arr item', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      let btn4 = await driver.findComponent(ON.text('child reverse arr', MatchPattern.CONTAINS));
      await btn4.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_005
     * @tc.name ProviderConsumerDate
     * @tc.desc 装饰Date类型变量
     * @tc.level: Level 1
     */

    it('ProviderConsumerDate', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ProviderConsumerDate begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ProviderConsumerDate' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('parent update the new date', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('parent increase the year by 1', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('child update the new date', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      let btn4 = await driver.findComponent(ON.text('child increase the month by 1', MatchPattern.CONTAINS));
      await btn4.click();
      await driver.delayMs(1000);
      let btn5 = await driver.findComponent(ON.text('child increase the day by 1', MatchPattern.CONTAINS));
      await btn5.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_006
     * @tc.name ProviderConsumerMap
     * @tc.desc 装饰Map类型变量
     * @tc.level: Level 1
     */

    it('ProviderConsumerMap', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ProviderConsumerMap begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ProviderConsumerMap' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('parent init map', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('parent set new one', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('child init map', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      let btn4 = await driver.findComponent(ON.text('child replace the first one', MatchPattern.CONTAINS));
      await btn4.click();
      await driver.delayMs(1000);
      let btn5 = await driver.findComponent(ON.text('child delete the first one', MatchPattern.CONTAINS));
      await btn5.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_007
     * @tc.name ProviderConsumerSet
     * @tc.desc 装饰Set类型变量
     * @tc.level: Level 1
     */

    it('ProviderConsumerSet', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ProviderConsumerSet begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ProviderConsumerSet' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('parent init set', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('parent set new one', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('child init set', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      let btn4 = await driver.findComponent(ON.text('child clear', MatchPattern.CONTAINS));
      await btn4.click();
      await driver.delayMs(1000);
      let btn5 = await driver.findComponent(ON.text('child delete the first one', MatchPattern.CONTAINS));
      await btn5.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_008
     * @tc.name ProviderConsumerArrowFunction
     * @tc.desc @Provider和@Consumer装饰箭头函数
     * @tc.level: Level 1
     */

    it('ProviderConsumerArrowFunction', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ProviderConsumerArrowFunction begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ProviderConsumerArrowFunction' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('changed', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_009
     * @tc.name ProviderConsumerComplexType
     * @tc.desc @Provider和@Consumer装饰复杂类型
     * @tc.level: Level 1
     */

    it('ProviderConsumerComplexType', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ProviderConsumerComplexType begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ProviderConsumerComplexType' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('add new user', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('age++', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('change name', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      let btn4 = await driver.findComponent(ON.text('reset users', MatchPattern.CONTAINS));
      await btn4.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_010
     * @tc.name ProviderConsumerFindNearest
     * @tc.desc @Consumer向上查找最近的@Provider
     * @tc.level: Level 1
     */

    it('ProviderConsumerFindNearest', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ProviderConsumerFindNearest begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ProviderConsumerFindNearest' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_011
     * @tc.name ProviderConsumerInitParam
     * @tc.desc @Provider和@Consumer初始化@Param
     * @tc.level: Level 1
     */

    it('ProviderConsumerInitParam', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ProviderConsumerInitParam begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ProviderConsumerInitParam' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Parent @Consumer val', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });
  })
}