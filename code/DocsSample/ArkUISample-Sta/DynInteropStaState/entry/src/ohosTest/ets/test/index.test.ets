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
const TAG = '[Sample_DynInteropStaUI]'
const DOMAIN = 0xF811
const BUNDLE = 'DynInteropStaUI'

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
     * @tc.name InteropBasicTypes
     * @tc.desc Interop装饰基本类型
     * @tc.level: Level 1
     */

    it('InteropBasicTypes', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: InteropBasicTypes begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/InteropBasicTypes' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change Interop', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name InteropClassObject
     * @tc.desc Interop装饰类对象
     * @tc.level: Level 1
     */

    it('InteropClassObject', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: InteropClassObject begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/InteropClassObject' });
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
     * @tc.name InteropArray
     * @tc.desc Interop装饰数组
     * @tc.level: Level 1
     */

    it('InteropArray', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: InteropArray begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/InteropArray' });
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
     * @tc.name InteropInterface
     * @tc.desc Interop装饰interface字面量
     * @tc.level: Level 1
     */

    it('InteropInterface', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: InteropInterface begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/InteropInterface' });
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
     * @tc.name InteropComponentV2
     * @tc.desc Interop在@ComponentV2中使用
     * @tc.level: Level 1
     */

    it('InteropComponentV2', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: InteropComponentV2 begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/InteropComponentV2' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_006
     * @tc.name InteropNoParentInit
     * @tc.desc Interop不支持从父组件传入初始化
     * @tc.level: Level 1
     */

    it('InteropNoParentInit', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: InteropNoParentInit begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/InteropNoParentInit' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_007
     * @tc.name InteropObservedObject
     * @tc.desc 观察对象整体变化
     * @tc.level: Level 1
     */

    it('InteropObservedObject', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: InteropObservedObject begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/InteropObservedObject' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change info&localInfo', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_008
     * @tc.name InteropArrayVariable
     * @tc.desc 装饰Array类型变量
     * @tc.level: Level 1
     */

    it('InteropArrayVariable', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: InteropArrayVariable begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/InteropArrayVariable' });
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
     * @tc.name InteropDateVariable
     * @tc.desc 装饰Date类型变量
     * @tc.level: Level 1
     */

    it('InteropDateVariable', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: InteropDateVariable begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/InteropDateVariable' });
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
     * @tc.name InteropMapVariable
     * @tc.desc 装饰Map类型变量
     * @tc.level: Level 1
     */

    it('InteropMapVariable', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: InteropMapVariable begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/InteropMapVariable' });
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
     * @tc.name InteropSetVariable
     * @tc.desc 装饰Set类型变量
     * @tc.level: Level 1
     */

    it('InteropSetVariable', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: InteropSetVariable begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/InteropSetVariable' });
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
     * @tc.name InteropUnionType
     * @tc.desc 联合类型
     * @tc.level: Level 1
     */

    it('InteropUnionType', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: InteropUnionType begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/InteropUnionType' });
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