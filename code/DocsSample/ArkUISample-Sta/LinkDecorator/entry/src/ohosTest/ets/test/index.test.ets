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
const TAG = '[Sample_LinkDecorator]'
const DOMAIN = 0xF811
const BUNDLE = 'LinkDecorator'

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
     * @tc.name LinkInterface
     * @tc.desc @Link装饰interface字面量
     * @tc.level: Level 1
     */

    it('LinkInterface', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LinkInterface begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LinkInterface' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('info.name', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name LinkBasicTypes
     * @tc.desc @Link装饰简单类型和类对象
     * @tc.level: Level 1
     */

    it('LinkBasicTypes', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LinkBasicTypes begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LinkBasicTypes' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Parent View: Set yellowButton', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('Green Button', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name LinkTypeConsistent
     * @tc.desc @Link数据源类型一致
     * @tc.level: Level 1
     */

    it('LinkTypeConsistent', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LinkTypeConsistent begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LinkTypeConsistent' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name LinkStateVarInit
     * @tc.desc @Link使用状态变量初始化
     * @tc.level: Level 1
     */

    it('LinkStateVarInit', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LinkStateVarInit begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LinkStateVarInit' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_005
     * @tc.name LinkArray
     * @tc.desc @Link装饰数组类型
     * @tc.level: Level 1
     */

    it('LinkArray', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LinkArray begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LinkArray' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('push', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('replace whole item', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_006
     * @tc.name LinkMap
     * @tc.desc @Link装饰Map类型
     * @tc.level: Level 1
     */

    it('LinkMap', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LinkMap begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LinkMap' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('child replace', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('parent set new one', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('parent clear', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_007
     * @tc.name LinkSet
     * @tc.desc @Link装饰Set类型
     * @tc.level: Level 1
     */

    it('LinkSet', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LinkSet begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LinkSet' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('child init set', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('parent clear', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_008
     * @tc.name LinkDate
     * @tc.desc @Link装饰Date类型
     * @tc.level: Level 1
     */

    it('LinkDate', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LinkDate begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LinkDate' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('increase the year', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('increase the month', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_009
     * @tc.name LinkWatch
     * @tc.desc @Link使用@Watch
     * @tc.level: Level 1
     */

    it('LinkWatch', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LinkWatch begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LinkWatch' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('父组件更改sourceNumber', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('子组件更改memberMessage', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_010
     * @tc.name LinkUnionType
     * @tc.desc @Link支持联合类型
     * @tc.level: Level 1
     */

    it('LinkUnionType', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LinkUnionType begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LinkUnionType' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Child change name to Bob', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('Parents change name to undefined', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });
  })
}