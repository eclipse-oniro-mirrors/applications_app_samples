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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON, MatchPattern } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
let want: Want;
let driver: Driver;
const TAG = '[Sample_AddMonitorClearMonitor]';
const DOMAIN = 0xF811;
const BUNDLE = 'addmonitorclearmonitor_';

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
      hilog.info(DOMAIN, TAG, BUNDLE + 'get top ability')
      expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
    })
    /**
     * @tc.number addMonitorArrayTest
     * @tc.name addMonitorArrayTest
     * @tc.desc 测试addMonitorArray页面是否显示正常
     */
    it('addMonitorArrayTest', 0, async (done: Function) => {
      let targetElement = await driver.findComponent(ON.text('addMonitorArray', MatchPattern.CONTAINS));
      expect(targetElement === null).assertFalse();
      await targetElement!.click();
      await driver.delayMs(2000);
      await driver.pressBack();
      done();
    });

    /**
     * @tc.number addMonitorDuplicateFuncTest
     * @tc.name addMonitorDuplicateFuncTest
     * @tc.desc 测试addMonitorDuplicateFunc页面是否显示正常
     */
    it('addMonitorDuplicateFuncTest', 0, async (done: Function) => {
      let targetElement = await driver.findComponent(ON.text('addMonitorDuplicateFunc', MatchPattern.CONTAINS));
      expect(targetElement === null).assertFalse();
      await targetElement!.click();
      await driver.delayMs(2000);
      await driver.pressBack();
      done();
    });

    /**
     * @tc.number addMonitorIsSynchronousTest
     * @tc.name addMonitorIsSynchronousTest
     * @tc.desc 测试addMonitorIsSynchronous页面是否显示正常
     */
    it('addMonitorIsSynchronousTest', 0, async (done: Function) => {
      let targetElement = await driver.findComponent(ON.text('addMonitorIsSynchronous', MatchPattern.CONTAINS));
      expect(targetElement === null).assertFalse();
      await targetElement!.click();
      await driver.delayMs(2000);
      await driver.pressBack();
      done();
    });

    /**
     * @tc.number clearMonitorUsageTest
     * @tc.name clearMonitorUsageTest
     * @tc.desc 测试clearMonitorUsage页面是否显示正常
     */
    it('clearMonitorUsageTest', 0, async (done: Function) => {
      let targetElement = await driver.findComponent(ON.text('clearMonitorUsage', MatchPattern.CONTAINS));
      expect(targetElement === null).assertFalse();
      await targetElement!.click();
      await driver.delayMs(2000);
      await driver.pressBack();
      done();
    });

    /**
     * @tc.number monitorObservedV2ComponentV2Test
     * @tc.name monitorObservedV2ComponentV2Test
     * @tc.desc 测试monitorObservedV2ComponentV2页面是否显示正常
     */
    it('monitorObservedV2ComponentV2Test', 0, async (done: Function) => {
      let targetElement = await driver.findComponent(ON.text('monitorObservedV2ComponentV2', MatchPattern.CONTAINS));
      expect(targetElement === null).assertFalse();
      await targetElement!.click();
      await driver.delayMs(2000);
      await driver.pressBack();
      done();
    });

    /**
     * @tc.number monitorArrayIndexLengthTest
     * @tc.name monitorArrayIndexLengthTest
     * @tc.desc 测试monitorArrayIndexLength页面是否显示正常
     */
    it('monitorArrayIndexLengthTest', 0, async (done: Function) => {
      let targetElement = await driver.findComponent(ON.text('monitorArrayIndexLength', MatchPattern.CONTAINS));
      expect(targetElement === null).assertFalse();
      await targetElement!.click();
      await driver.delayMs(2000);
      await driver.pressBack();
      done();
    });

    /**
     * @tc.number monitorIndependentPathTest
     * @tc.name monitorIndependentPathTest
     * @tc.desc 测试monitorIndependentPath页面是否显示正常
     */
    it('monitorIndependentPathTest', 0, async (done: Function) => {
      let targetElement = await driver.findComponent(ON.text('monitorIndependentPath', MatchPattern.CONTAINS));
      expect(targetElement === null).assertFalse();
      await targetElement!.click();
      await driver.delayMs(2000);
      await driver.pressBack();
      done();
    });

    /**
     * @tc.number monitorAccessibleChangeTest
     * @tc.name monitorAccessibleChangeTest
     * @tc.desc 测试monitorAccessibleChange页面是否显示正常
     */
    it('monitorAccessibleChangeTest', 0, async (done: Function) => {
      let targetElement = await driver.findComponent(ON.text('monitorAccessibleChange', MatchPattern.CONTAINS));
      expect(targetElement === null).assertFalse();
      await targetElement!.click();
      await driver.delayMs(2000);
      await driver.pressBack();
      done();
    });

    /**
     * @tc.number addMonitorSynchronousTest
     * @tc.name addMonitorSynchronousTest
     * @tc.desc 测试addMonitorSynchronous页面是否显示正常
     */
    it('addMonitorSynchronousTest', 0, async (done: Function) => {
      let targetElement = await driver.findComponent(ON.text('addMonitorSynchronous', MatchPattern.CONTAINS));
      expect(targetElement === null).assertFalse();
      await targetElement!.click();
      await driver.delayMs(2000);
      await driver.pressBack();
      done();
    });

    /**
     * @tc.number monitorAsyncOnlyTest
     * @tc.name monitorAsyncOnlyTest
     * @tc.desc 测试monitorAsyncOnly页面是否显示正常
     */
    it('monitorAsyncOnlyTest', 0, async (done: Function) => {
      let targetElement = await driver.findComponent(ON.text('monitorAsyncOnly', MatchPattern.CONTAINS));
      expect(targetElement === null).assertFalse();
      await targetElement!.click();
      await driver.delayMs(2000);
      await driver.pressBack();
      done();
    });

    /**
     * @tc.number monitorConstructorSyncTest
     * @tc.name monitorConstructorSyncTest
     * @tc.desc 测试monitorConstructorSync页面是否显示正常
     */
    it('monitorConstructorSyncTest', 0, async (done: Function) => {
      let targetElement = await driver.findComponent(ON.text('monitorConstructorSync', MatchPattern.CONTAINS));
      expect(targetElement === null).assertFalse();
      await targetElement!.click();
      await driver.delayMs(2000);
      await driver.pressBack();
      done();
    });

    /**
     * @tc.number dynamicCancelMonitorTest
     * @tc.name dynamicCancelMonitorTest
     * @tc.desc 测试dynamicCancelMonitor页面是否显示正常
     */
    it('dynamicCancelMonitorTest', 0, async (done: Function) => {
      let targetElement = await driver.findComponent(ON.text('dynamicCancelMonitor', MatchPattern.CONTAINS));
      expect(targetElement === null).assertFalse();
      await targetElement!.click();
      await driver.delayMs(2000);
      await driver.pressBack();
      done();
    });

    /**
     * @tc.number monitorWildcardObjectTest
     * @tc.name monitorWildcardObjectTest
     * @tc.desc 测试monitorWildcardObject页面是否显示正常
     */
    it('monitorWildcardObjectTest', 0, async (done: Function) => {
      let targetElement = await driver.findComponent(ON.text('monitorWildcardObject', MatchPattern.CONTAINS));
      expect(targetElement === null).assertFalse();
      await targetElement!.click();
      await driver.delayMs(2000);
      await driver.pressBack();
      done();
    });

    /**
     * @tc.number monitorWildcardArrayTest
     * @tc.name monitorWildcardArrayTest
     * @tc.desc 测试monitorWildcardArray页面是否显示正常
     */
    it('monitorWildcardArrayTest', 0, async (done: Function) => {
      let targetElement = await driver.findComponent(ON.text('monitorWildcardArray', MatchPattern.CONTAINS));
      expect(targetElement === null).assertFalse();
      await targetElement!.click();
      await driver.delayMs(2000);
      await driver.pressBack();
      done();
    });

    /**
     * @tc.number monitorWildcardDateTest
     * @tc.name monitorWildcardDateTest
     * @tc.desc 测试monitorWildcardDate页面是否显示正常
     */
    it('monitorWildcardDateTest', 0, async (done: Function) => {
      let targetElement = await driver.findComponent(ON.text('monitorWildcardDate', MatchPattern.CONTAINS));
      expect(targetElement === null).assertFalse();
      await targetElement!.click();
      await driver.delayMs(2000);
      await driver.pressBack();
      done();
    });

    /**
     * @tc.number monitorWildcardMapTest
     * @tc.name monitorWildcardMapTest
     * @tc.desc 测试monitorWildcardMap页面是否显示正常
     */
    it('monitorWildcardMapTest', 0, async (done: Function) => {
      let targetElement = await driver.findComponent(ON.text('monitorWildcardMap', MatchPattern.CONTAINS));
      expect(targetElement === null).assertFalse();
      await targetElement!.click();
      await driver.delayMs(2000);
      await driver.pressBack();
      done();
    });

    /**
     * @tc.number monitorWildcardSetTest
     * @tc.name monitorWildcardSetTest
     * @tc.desc 测试monitorWildcardSet页面是否显示正常
     */
    it('monitorWildcardSetTest', 0, async (done: Function) => {
      let targetElement = await driver.findComponent(ON.text('monitorWildcardSet', MatchPattern.CONTAINS));
      expect(targetElement === null).assertFalse();
      await targetElement!.click();
      await driver.delayMs(2000);
      await driver.pressBack();
      done();
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    it('assertEqual', 0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      let a = 'test'
      // Defines a variety of assertion methods, which are used to declare expected boolean conditions.
      expect(a).assertEqual('test')
    })
  })
}
