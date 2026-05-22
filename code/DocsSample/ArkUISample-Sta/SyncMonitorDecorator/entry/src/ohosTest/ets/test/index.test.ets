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
import { abilityDelegatorRegistry, Driver, ON, MatchPattern } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import hilog from '@ohos.hilog';
import router from '@ohos.router';

const TAG = '[Sample_SyncMonitorDecorator]'
const DOMAIN = 0xF811
const BUNDLE = 'SyncMonitorDecorator'

export default function IndexTest() {
  describe('IndexTest', () => {
    beforeAll(async () => {
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator =
        abilityDelegatorRegistry.getAbilityDelegator();
      let ability: UIAbility = await abilityDelegator.getCurrentTopAbility();
      let driver: Driver = Driver.create();
    })

    /**
     * @tc.number UiTest_001
     * @tc.name SyncMonitorArraySum示例测试
     * @tc.desc 测试@SyncMonitor数组求和功能
     * @tc.level: Level 1
     */
    it('SyncMonitorArraySumTest', Level.LEVEL1, async (done: Function) => {
      await router.pushUrl({ url: 'pages/SyncMonitorArraySum' });
      let btn = await driver.findComponent(ON.text('Calculate a sum', MatchPattern.CONTAINS));
      await btn.click();
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name SyncMonitorMultiVars示例测试
     * @tc.desc 测试@SyncMonitor监听多个状态变量
     * @tc.level: Level 1
     */
    it('SyncMonitorMultiVarsTest', Level.LEVEL1, async (done: Function) => {
      await router.pushUrl({ url: 'pages/SyncMonitorMultiVars' });
      let btn = await driver.findComponent(ON.text('change string', MatchPattern.CONTAINS));
      await btn.click();
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name SyncMonitorClassObject示例测试
     * @tc.desc 测试@SyncMonitor监听类对象
     * @tc.level: Level 1
     */
    it('SyncMonitorClassObjectTest', Level.LEVEL1, async (done: Function) => {
      await router.pushUrl({ url: 'pages/SyncMonitorClassObject' });
      let btn = await driver.findComponent(ON.text('change info', MatchPattern.CONTAINS));
      await btn.click();
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name SyncMonitorObservedClass示例测试
     * @tc.desc 测试@ObservedV2装饰类中使用@SyncMonitor
     * @tc.level: Level 1
     */
    it('SyncMonitorObservedClassTest', Level.LEVEL1, async (done: Function) => {
      await router.pushUrl({ url: 'pages/SyncMonitorObservedClass' });
      let btn = await driver.findComponent(ON.text('change name', MatchPattern.CONTAINS));
      await btn.click();
      done();
    });

    /**
     * @tc.number UiTest_005
     * @tc.name SyncMonitorDeepProperty示例测试
     * @tc.desc 测试@SyncMonitor监听深层属性
     * @tc.level: Level 1
     */
    it('SyncMonitorDeepPropertyTest', Level.LEVEL1, async (done: Function) => {
      await router.pushUrl({ url: 'pages/SyncMonitorDeepProperty' });
      let btn = await driver.findComponent(ON.text('change num', MatchPattern.CONTAINS));
      await btn.click();
      done();
    });
  })
}