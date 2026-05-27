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
const TAG = '[Sample_ObservedObjectLink]'
const DOMAIN = 0xF811
const BUNDLE = 'ObservedObjectLink'

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
     * @tc.name ObjectLinkLiteralThis
     * @tc.desc @ObjectLink字面量this.xxx特例
     * @tc.level: Level 1
     */

    it('ObjectLinkLiteralThis', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ObjectLinkLiteralThis begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ObjectLinkLiteralThis' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name ObjectLinkReadOnly
     * @tc.desc @ObjectLink只读示例
     * @tc.level: Level 1
     */

    it('ObjectLinkReadOnly', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ObjectLinkReadOnly begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ObjectLinkReadOnly' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('num的值', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('click', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name ObjectLinkObjectType
     * @tc.desc @ObjectLink对象类型示例
     * @tc.level: Level 1
     */

    it('ObjectLinkObjectType', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ObjectLinkObjectType begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ObjectLinkObjectType' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change book.name', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name ObjectLinkInheritObject
     * @tc.desc @ObjectLink继承对象示例
     * @tc.level: Level 1
     */

    it('ObjectLinkInheritObject', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ObjectLinkInheritObject begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ObjectLinkInheritObject' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Molly', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_005
     * @tc.name ObjectLinkNestedObject
     * @tc.desc @ObjectLink嵌套对象示例
     * @tc.level: Level 1
     */

    it('ObjectLinkNestedObject', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ObjectLinkNestedObject begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ObjectLinkNestedObject' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change bag.book.name', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('change book.name', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_006
     * @tc.name ObjectLinkMakeObserved
     * @tc.desc @ObjectLink使用makeObserved示例
     * @tc.level: Level 1
     */

    it('ObjectLinkMakeObserved', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ObjectLinkMakeObserved begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ObjectLinkMakeObserved' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change bag.book.name', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_007
     * @tc.name ObjectLinkArray
     * @tc.desc @ObjectLink对象数组示例
     * @tc.level: Level 1
     */

    it('ObjectLinkArray', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ObjectLinkArray begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ObjectLinkArray' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('push', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('reset array', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_008
     * @tc.name ObjectLinkSerializeNoParam
     * @tc.desc @ObjectLink序列化无参构造
     * @tc.level: Level 1
     */

    it('ObjectLinkSerializeNoParam', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ObjectLinkSerializeNoParam begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ObjectLinkSerializeNoParam' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('+1', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('Serialize', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_009
     * @tc.name ObjectLinkSerializeWithParam
     * @tc.desc @ObjectLink序列化有参构造
     * @tc.level: Level 1
     */

    it('ObjectLinkSerializeWithParam', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ObjectLinkSerializeWithParam begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ObjectLinkSerializeWithParam' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('+1', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_010
     * @tc.name ObjectLinkUnionType
     * @tc.desc @ObjectLink支持联合类型
     * @tc.level: Level 1
     */

    it('ObjectLinkUnionType', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ObjectLinkUnionType begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ObjectLinkUnionType' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change count property', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('change count to Data', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('change count to undefined', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      done();
    });
  })
}