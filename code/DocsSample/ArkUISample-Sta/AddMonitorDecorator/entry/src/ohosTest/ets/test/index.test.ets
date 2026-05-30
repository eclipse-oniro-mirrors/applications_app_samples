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
const TAG = '[Sample_AddMonitorDecorator]'
const DOMAIN = 0xF811
const BUNDLE = 'AddMonitorDecorator'

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
     * @tc.name AddMonitorBasic
     * @tc.desc 监听单个和多个状态变量
     * @tc.level: Level 1
     */

    it('AddMonitorBasic', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: AddMonitorBasic begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/AddMonitorBasic' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Current number', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name AddMonitorDuplicated
     * @tc.desc 重复监听示例
     * @tc.level: Level 1
     */

    it('AddMonitorDuplicated', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: AddMonitorDuplicated begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/AddMonitorDuplicated' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Current number', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('Clear the duplicated monitor', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name AddMonitorSyncMode
     * @tc.desc 同步监听模式
     * @tc.level: Level 1
     */

    it('AddMonitorSyncMode', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: AddMonitorSyncMode begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/AddMonitorSyncMode' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Current number', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name AddMonitorOwner
     * @tc.desc 组件作为owner
     * @tc.level: Level 1
     */

    it('AddMonitorOwner', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: AddMonitorOwner begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/AddMonitorOwner' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Increase the value', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_005
     * @tc.name AddMonitorPath
     * @tc.desc 配置path参数
     * @tc.level: Level 1
     */

    it('AddMonitorPath', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: AddMonitorPath begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/AddMonitorPath' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Increase the single value', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('Increase the pair value', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('Increase the multiple value', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_006
     * @tc.name AddMonitorFreeze
     * @tc.desc 组件冻结功能
     * @tc.level: Level 1
     */

    it('AddMonitorFreeze', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: AddMonitorFreeze begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/AddMonitorFreeze' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change message', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_007
     * @tc.name AddMonitorObservedV2Local
     * @tc.desc 监听@ObservedV2/@Trace与@ComponentV2/@Local
     * @tc.level: Level 1
     */

    it('AddMonitorObservedV2Local', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: AddMonitorObservedV2Local begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/AddMonitorObservedV2Local' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Add value in ObservedV2', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('Add value in ComponentV2', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_008
     * @tc.name AddMonitorArray
     * @tc.desc 监听数组元素和长度
     * @tc.level: Level 1
     */

    it('AddMonitorArray', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: AddMonitorArray begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/AddMonitorArray' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Add new value into array', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('Increase registered value', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_009
     * @tc.name AddMonitorSyncCallback
     * @tc.desc 配置同步监听回调
     * @tc.level: Level 1
     */

    it('AddMonitorSyncCallback', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: AddMonitorSyncCallback begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/AddMonitorSyncCallback' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Increase value', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_010
     * @tc.name AddMonitorConstructor
     * @tc.desc 监听构造函数中同步修改
     * @tc.level: Level 1
     */

    it('AddMonitorConstructor', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: AddMonitorConstructor begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/AddMonitorConstructor' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change message', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_011
     * @tc.name AddMonitorDynamicCancel
     * @tc.desc 动态取消监听
     * @tc.level: Level 1
     */

    it('AddMonitorDynamicCancel', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: AddMonitorDynamicCancel begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/AddMonitorDynamicCancel' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('user1 age', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('remove user1 monitor', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('change count', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_012
     * @tc.name AddMonitorObjectProperty
     * @tc.desc 观察对象属性
     * @tc.level: Level 1
     */

    it('AddMonitorObjectProperty', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: AddMonitorObjectProperty begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/AddMonitorObjectProperty' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Change propA', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('Change propB', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('Assign new object', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      let btn4 = await driver.findComponent(ON.text('clear', MatchPattern.CONTAINS));
      await btn4.click();
      await driver.delayMs(1000);
      done();
    });
  })
}