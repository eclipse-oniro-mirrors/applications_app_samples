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
const TAG = '[Sample_LocalDecorator]'
const DOMAIN = 0xF811
const BUNDLE = 'LocalDecorator'

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
     * @tc.name LocalBasicTypes
     * @tc.desc @Local装饰基本类型
     * @tc.level: Level 1
     */

    it('LocalBasicTypes', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LocalBasicTypes begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LocalBasicTypes' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change Local', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name LocalClassObject
     * @tc.desc @Local装饰类对象
     * @tc.level: Level 1
     */

    it('LocalClassObject', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LocalClassObject begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LocalClassObject' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change object', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('change name', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name LocalArray
     * @tc.desc @Local装饰数组
     * @tc.level: Level 1
     */

    it('LocalArray', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LocalArray begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LocalArray' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change array item', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('change whole array', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name LocalInterface
     * @tc.desc @Local装饰interface字面量
     * @tc.level: Level 1
     */

    it('LocalInterface', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LocalInterface begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LocalInterface' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change info', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('change info.name', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_005
     * @tc.name LocalComponentV2
     * @tc.desc @Local在@ComponentV2中使用
     * @tc.level: Level 1
     */

    it('LocalComponentV2', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LocalComponentV2 begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LocalComponentV2' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_006
     * @tc.name LocalNoParentInit
     * @tc.desc @Local不支持从父组件传入初始化
     * @tc.level: Level 1
     */

    it('LocalNoParentInit', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LocalNoParentInit begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LocalNoParentInit' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_007
     * @tc.name LocalObservedObject
     * @tc.desc 观察对象整体变化
     * @tc.level: Level 1
     */

    it('LocalObservedObject', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LocalObservedObject begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LocalObservedObject' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change info&localInfo', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_008
     * @tc.name LocalArrayVariable
     * @tc.desc 装饰Array类型变量
     * @tc.level: Level 1
     */

    it('LocalArrayVariable', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LocalArrayVariable begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LocalArrayVariable' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change arr[0]', MatchPattern.CONTAINS));
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
      let btn5 = await driver.findComponent(ON.text('reset', MatchPattern.CONTAINS));
      await btn5.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_009
     * @tc.name LocalDateVariable
     * @tc.desc 装饰Date类型变量
     * @tc.level: Level 1
     */

    it('LocalDateVariable', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LocalDateVariable begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LocalDateVariable' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('set selectedDate to 2023-07-08', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('increase the year', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('increase the month', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      let btn4 = await driver.findComponent(ON.text('increase the day', MatchPattern.CONTAINS));
      await btn4.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_010
     * @tc.name LocalMapVariable
     * @tc.desc 装饰Map类型变量
     * @tc.level: Level 1
     */

    it('LocalMapVariable', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LocalMapVariable begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LocalMapVariable' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('init map', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('set new one', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('clear', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      let btn4 = await driver.findComponent(ON.text('replace the first one', MatchPattern.CONTAINS));
      await btn4.click();
      await driver.delayMs(1000);
      let btn5 = await driver.findComponent(ON.text('delete the first one', MatchPattern.CONTAINS));
      await btn5.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_011
     * @tc.name LocalSetVariable
     * @tc.desc 装饰Set类型变量
     * @tc.level: Level 1
     */

    it('LocalSetVariable', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LocalSetVariable begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LocalSetVariable' });
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
     * @tc.number UiTest_012
     * @tc.name LocalUnionType
     * @tc.desc 联合类型
     * @tc.level: Level 1
     */

    it('LocalUnionType', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LocalUnionType begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LocalUnionType' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change to undefined', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('change to number', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });
  })
}