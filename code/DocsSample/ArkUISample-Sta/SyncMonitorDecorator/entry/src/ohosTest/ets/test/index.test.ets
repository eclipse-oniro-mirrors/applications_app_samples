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
const TAG = '[Sample_SyncMonitorDecorator]'
const DOMAIN = 0xF811
const BUNDLE = 'SyncMonitorDecorator'

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
     * @tc.name SyncMonitorArraySum
     * @tc.desc 测试@SyncMonitor数组求和功能
     * @tc.level: Level 1
     */

    it('SyncMonitorArraySum', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: SyncMonitorArraySum begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/SyncMonitorArraySum' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Calculate a sum', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name SyncMonitorMultiVars
     * @tc.desc 测试@SyncMonitor监听多个状态变量
     * @tc.level: Level 1
     */

    it('SyncMonitorMultiVars', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: SyncMonitorMultiVars begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/SyncMonitorMultiVars' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change string', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name SyncMonitorClassObject
     * @tc.desc 测试@SyncMonitor监听类对象
     * @tc.level: Level 1
     */

    it('SyncMonitorClassObject', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: SyncMonitorClassObject begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/SyncMonitorClassObject' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change info', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name SyncMonitorObservedClass
     * @tc.desc 测试@ObservedV2装饰类中使用@SyncMonitor
     * @tc.level: Level 1
     */

    it('SyncMonitorObservedClass', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: SyncMonitorObservedClass begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/SyncMonitorObservedClass' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change name', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_005
     * @tc.name SyncMonitorDeepProperty
     * @tc.desc 测试@SyncMonitor监听深层属性
     * @tc.level: Level 1
     */

    it('SyncMonitorDeepProperty', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: SyncMonitorDeepProperty begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/SyncMonitorDeepProperty' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change num', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_006
     * @tc.name SyncMonitorInheritance
     * @tc.desc 测试@SyncMonitor继承类监听
     * @tc.level: Level 1
     */

    it('SyncMonitorInheritance', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: SyncMonitorInheritance begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/SyncMonitorInheritance' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change name', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_007
     * @tc.name SyncMonitorArray
     * @tc.desc 测试@SyncMonitor监听数组元素变化
     * @tc.level: Level 1
     */

    it('SyncMonitorArray', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: SyncMonitorArray begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/SyncMonitorArray' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Change dimensionTwo', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('Change info property', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_008
     * @tc.name SyncMonitorObjectAssign
     * @tc.desc 测试@SyncMonitor监听对象赋值
     * @tc.level: Level 1
     */

    it('SyncMonitorObjectAssign', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: SyncMonitorObjectAssign begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/SyncMonitorObjectAssign' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Step1', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('Step2', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_009
     * @tc.name SyncMonitorFrequency
     * @tc.desc 测试@SyncMonitor高频更新
     * @tc.level: Level 1
     */

    it('SyncMonitorFrequency', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: SyncMonitorFrequency begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/SyncMonitorFrequency' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change count', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_010
     * @tc.name SyncMonitorArrayMultiPath
     * @tc.desc 测试@SyncMonitor数组多路径监听
     * @tc.level: Level 1
     */

    it('SyncMonitorArrayMultiPath', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: SyncMonitorArrayMultiPath begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/SyncMonitorArrayMultiPath' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Change array', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_011
     * @tc.name SyncMonitorWildcardClass
     * @tc.desc 测试@SyncMonitor类通配符监听
     * @tc.level: Level 1
     */

    it('SyncMonitorWildcardClass', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: SyncMonitorWildcardClass begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/SyncMonitorWildcardClass' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Change propA', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('Assign class', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_012
     * @tc.name SyncMonitorWildcardArray
     * @tc.desc 测试@SyncMonitor数组通配符监听
     * @tc.level: Level 1
     */

    it('SyncMonitorWildcardArray', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: SyncMonitorWildcardArray begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/SyncMonitorWildcardArray' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('arrayOfPerson.push', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('arrayOfPerson.splice', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_013
     * @tc.name SyncMonitorArrayOfArrays
     * @tc.desc 测试@SyncMonitor二维数组监听
     * @tc.level: Level 1
     */

    it('SyncMonitorArrayOfArrays', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: SyncMonitorArrayOfArrays begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/SyncMonitorArrayOfArrays' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('topArray = new', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('topArray[1][0]', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_014
     * @tc.name SyncMonitorParamType
     * @tc.desc 测试@SyncMonitor参数类型
     * @tc.level: Level 1
     */

    it('SyncMonitorParamType', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: SyncMonitorParamType begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/SyncMonitorParamType' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Change propA', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_015
     * @tc.name SyncMonitorDeepValue
     * @tc.desc 测试@SyncMonitor深层值监听
     * @tc.level: Level 1
     */

    it('SyncMonitorDeepValue', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: SyncMonitorDeepValue begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/SyncMonitorDeepValue' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change!', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_016
     * @tc.name SyncMonitorAccessibility
     * @tc.desc 测试@SyncMonitor可访问性监听
     * @tc.level: Level 1
     */

    it('SyncMonitorAccessibility', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: SyncMonitorAccessibility begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/SyncMonitorAccessibility' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('set user to undefined', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('set user to User', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });
  })
}