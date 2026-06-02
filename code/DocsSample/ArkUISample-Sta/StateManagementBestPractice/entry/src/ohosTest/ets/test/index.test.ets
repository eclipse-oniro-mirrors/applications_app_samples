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
const TAG = '[Sample_StateManagementBestPractice]'
const DOMAIN = 0xF811
const BUNDLE = 'StateManagementBestPractice'

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
     * @tc.name ForceUpdateCounterexample
     * @tc.desc 不使用状态变量强行更新(反例)
     * @tc.level: Level 1
     */
    it('ForceUpdateCounterexample', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ForceUpdateCounterexample begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ForceUpdateCounterexample' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('add item'));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name ForceUpdatePositiveCase
     * @tc.desc 使用@Local装饰状态变量(正例)
     * @tc.level: Level 1
     */
    it('ForceUpdatePositiveCase', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ForceUpdatePositiveCase begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ForceUpdatePositiveCase' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('add item'));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name PreciseControlCounterexamples
     * @tc.desc 精准控制状态变量关联组件数(反例)
     * @tc.level: Level 1
     */
    it('PreciseControlCounterexamples', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: PreciseControlCounterexamples begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/PreciseControlCounterexamples' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('move'));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name PreciseControlPositiveCases
     * @tc.desc 精准控制状态变量关联组件数(正例)
     * @tc.level: Level 1
     */
    it('PreciseControlPositiveCases', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: PreciseControlPositiveCases begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/PreciseControlPositiveCases' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('move'));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_005
     * @tc.name ObjectControlCounterexample
     * @tc.desc 对象类型状态变量冗余刷新(反例)
     * @tc.level: Level 1
     */
    it('ObjectControlCounterexample', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ObjectControlCounterexample begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ObjectControlCounterexample' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Change prop1'));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_006
     * @tc.name ObjectControlPositiveCase
     * @tc.desc 使用@ObservedV2/@Trace精准刷新(正例)
     * @tc.level: Level 1
     */
    it('ObjectControlPositiveCase', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ObjectControlPositiveCase begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ObjectControlPositiveCase' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Change prop1'));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_007
     * @tc.name LoopStateInefficient
     * @tc.desc 循环中频繁读取状态变量(反例)
     * @tc.level: Level 1
     */
    it('LoopStateInefficient', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LoopStateInefficient begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LoopStateInefficient' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('print logmessage'));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_008
     * @tc.name LoopStateOptimized
     * @tc.desc 预先读取状态变量到局部变量(正例)
     * @tc.level: Level 1
     */
    it('LoopStateOptimized', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LoopStateOptimized begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LoopStateOptimized' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('print logmessage'));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_009
     * @tc.name CalculationDirectState
     * @tc.desc 直接操作状态变量(反例)
     * @tc.level: Level 1
     */
    it('CalculationDirectState', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: CalculationDirectState begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/CalculationDirectState' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change'));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_010
     * @tc.name CalculationTempVariable
     * @tc.desc 使用临时变量替换状态变量(正例)
     * @tc.level: Level 1
     */
    it('CalculationTempVariable', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: CalculationTempVariable begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/CalculationTempVariable' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change'));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });
  })
}
