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
const TAG = '[Sample_ParamDecorator]'
const DOMAIN = 0xF811
const BUNDLE = 'ParamDecorator'

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
     * @tc.name ParamBasicTypes
     * @tc.desc @Param装饰基本类型
     * @tc.level: Level 1
     */

    it('ParamBasicTypes', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ParamBasicTypes begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ParamBasicTypes' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change Local', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name ParamClassObject
     * @tc.desc @Param装饰类对象
     * @tc.level: Level 1
     */

    it('ParamClassObject', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ParamClassObject begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ParamClassObject' });
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
     * @tc.name ParamArray
     * @tc.desc @Param装饰数组
     * @tc.level: Level 1
     */

    it('ParamArray', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ParamArray begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ParamArray' });
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
     * @tc.name ParamInterface
     * @tc.desc @Param装饰interface字面量
     * @tc.level: Level 1
     */

    it('ParamInterface', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ParamInterface begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ParamInterface' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Local change info', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('Local change info.name', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('Param change info.name', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_005
     * @tc.name ParamFromParentToChild
     * @tc.desc 从父组件到子组件变量传递与同步
     * @tc.level: Level 1
     */

    it('ParamFromParentToChild', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ParamFromParentToChild begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ParamFromParentToChild' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_006
     * @tc.name ParamArrayVariable
     * @tc.desc 装饰Array类型变量
     * @tc.level: Level 1
     */

    it('ParamArrayVariable', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ParamArrayVariable begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ParamArrayVariable' });
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
     * @tc.number UiTest_007
     * @tc.name ParamDateVariable
     * @tc.desc 装饰Date类型变量
     * @tc.level: Level 1
     */

    it('ParamDateVariable', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ParamDateVariable begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ParamDateVariable' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('parent update the new date', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('increase the year', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('increase the month', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      let btn4 = await driver.findComponent(ON.text('parent increase the day', MatchPattern.CONTAINS));
      await btn4.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_008
     * @tc.name ParamMapVariable
     * @tc.desc 装饰Map类型变量
     * @tc.level: Level 1
     */

    it('ParamMapVariable', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ParamMapVariable begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ParamMapVariable' });
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
     * @tc.number UiTest_009
     * @tc.name ParamSetVariable
     * @tc.desc 装饰Set类型变量
     * @tc.level: Level 1
     */

    it('ParamSetVariable', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ParamSetVariable begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ParamSetVariable' });
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
     * @tc.number UiTest_010
     * @tc.name ParamUnionType
     * @tc.desc 联合类型
     * @tc.level: Level 1
     */

    it('ParamUnionType', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ParamUnionType begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ParamUnionType' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });
  })
}