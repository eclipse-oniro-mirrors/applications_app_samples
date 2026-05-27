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
const TAG = '[Sample_PropRefDecorator]'
const DOMAIN = 0xF811
const BUNDLE = 'PropRefDecorator'

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
     * @tc.name PropRefBasicTypes
     * @tc.desc @PropRef简单类型变化观察
     * @tc.level: Level 1
     */

    it('PropRefBasicTypes', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: PropRefBasicTypes begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/PropRefBasicTypes' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change State', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('change PropRef', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name PropRefParentChild
     * @tc.desc @PropRef父子组件单向同步
     * @tc.level: Level 1
     */

    it('PropRefParentChild', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: PropRefParentChild begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/PropRefParentChild' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change State', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('change PropRef', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name PropRefDataSourceRef
     * @tc.desc @PropRef获得父组件数据源引用
     * @tc.level: Level 1
     */

    it('PropRefDataSourceRef', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: PropRefDataSourceRef begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/PropRefDataSourceRef' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('modify childData property code', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('replace childData', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name PropRefArray
     * @tc.desc @PropRef装饰Array类型
     * @tc.level: Level 1
     */

    it('PropRefArray', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: PropRefArray begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/PropRefArray' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change arr[0]', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('push item', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_005
     * @tc.name PropRefMap
     * @tc.desc @PropRef装饰Map类型
     * @tc.level: Level 1
     */

    it('PropRefMap', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: PropRefMap begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/PropRefMap' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change map[0]', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('add item', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_006
     * @tc.name PropRefSet
     * @tc.desc @PropRef装饰Set类型
     * @tc.level: Level 1
     */

    it('PropRefSet', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: PropRefSet begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/PropRefSet' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('init set', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('set new one', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('clear', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      let btn4 = await driver.findComponent(ON.text('delete the first one', MatchPattern.CONTAINS));
      await btn4.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_007
     * @tc.name PropRefDate
     * @tc.desc @PropRef装饰Date类型
     * @tc.level: Level 1
     */

    it('PropRefDate', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: PropRefDate begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/PropRefDate' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change update', MatchPattern.CONTAINS));
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
  })
}