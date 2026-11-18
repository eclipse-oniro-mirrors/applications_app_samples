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
const TAG = '[Sample_EnvSample]';
const DOMAIN = 0xF811;
const BUNDLE = 'envsample_';

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
     * @tc.number envInitFlowTest
     * @tc.name envInitFlowTest
     * @tc.desc 测试envInitFlow页面是否显示正常
     */
    it('envInitFlowTest', 0, async (done: Function) => {
      let targetElement = await driver.findComponent(ON.text('envInitFlow', MatchPattern.CONTAINS));
      expect(targetElement === null).assertFalse();
      await targetElement!.click();
      await driver.delayMs(2000);
      await driver.pressBack();
      done();
    });

    /**
     * @tc.number envInComponentV2Test
     * @tc.name envInComponentV2Test
     * @tc.desc 测试envInComponentV2页面是否显示正常
     */
    it('envInComponentV2Test', 0, async (done: Function) => {
      let targetElement = await driver.findComponent(ON.text('envInComponentV2', MatchPattern.CONTAINS));
      expect(targetElement === null).assertFalse();
      await targetElement!.click();
      await driver.delayMs(2000);
      await driver.pressBack();
      done();
    });

    /**
     * @tc.number envInComponentTest
     * @tc.name envInComponentTest
     * @tc.desc 测试envInComponent页面是否显示正常
     */
    it('envInComponentTest', 0, async (done: Function) => {
      let targetElement = await driver.findComponent(ON.text('envInComponent', MatchPattern.CONTAINS));
      expect(targetElement === null).assertFalse();
      await targetElement!.click();
      await driver.delayMs(2000);
      await driver.pressBack();
      done();
    });

    /**
     * @tc.number envBuilderNodeTest
     * @tc.name envBuilderNodeTest
     * @tc.desc 测试envBuilderNode页面是否显示正常
     */
    it('envBuilderNodeTest', 0, async (done: Function) => {
      let targetElement = await driver.findComponent(ON.text('envBuilderNode', MatchPattern.CONTAINS));
      expect(targetElement === null).assertFalse();
      await targetElement!.click();
      await driver.delayMs(2000);
      await driver.pressBack();
      done();
    });

    /**
     * @tc.number envBuilderLambdaTest
     * @tc.name envBuilderLambdaTest
     * @tc.desc 测试envBuilderNodeLambda页面是否显示正常
     */
    it('envBuilderLambdaTest', 0, async (done: Function) => {
      let targetElement = await driver.findComponent(ON.text('envBuilderLambda', MatchPattern.CONTAINS));
      expect(targetElement === null).assertFalse();
      await targetElement!.click();
      await driver.delayMs(2000);
      await driver.pressBack();
      done();
    });

    /**
     * @tc.number envWatchTest
     * @tc.name envWatchTest
     * @tc.desc 测试envWatch页面是否显示正常
     */
    it('envWatchTest', 0, async (done: Function) => {
      let targetElement = await driver.findComponent(ON.text('envWatch', MatchPattern.CONTAINS));
      expect(targetElement === null).assertFalse();
      await targetElement!.click();
      await driver.delayMs(2000);
      await driver.pressBack();
      done();
    });

    /**
     * @tc.number envMonitorTest
     * @tc.name envMonitorTest
     * @tc.desc 测试envMonitor页面是否显示正常
     */
    it('envMonitorTest', 0, async (done: Function) => {
      let targetElement = await driver.findComponent(ON.text('envMonitor', MatchPattern.CONTAINS));
      expect(targetElement === null).assertFalse();
      await targetElement!.click();
      await driver.delayMs(2000);
      await driver.pressBack();
      done();
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
    })
    it('assertEqual', 0, () => {
      let a = 'test'
      expect(a).assertEqual('test')
    })
  })
}
