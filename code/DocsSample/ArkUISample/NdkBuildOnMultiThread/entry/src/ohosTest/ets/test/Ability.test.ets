/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, MatchPattern, ON } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkBuildOnMultiThread]';
const DELAY_TIME: number = 1000;
const MULTI_THREAD_DELAY_TIME: number = 3000;
let driver: Driver;
let want: Want;

export default function abilityTest() {
  describe('NdkBuildOnMultiThreadTest', () => {
    beforeAll(async () => {
      want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility'
      };
      await delegator.startAbility(want);
      driver = Driver.create();
      await driver.delayMs(DELAY_TIME);
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
    });

    /**
     * @tc.number: HomePageTest_001
     * @tc.name: HomePageTest
     * @tc.desc: Verify that the UI-thread and multi-thread entry buttons are displayed.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('HomePageTest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, 'HomePageTest_001 begin');
      const multiThreadButton =
        await driver.findComponent(ON.text('CreatePageOnMultiThread', MatchPattern.CONTAINS));
      const uiThreadButton = await driver.findComponent(ON.text('CreatePageOnUIThread', MatchPattern.CONTAINS));
      expect(multiThreadButton === null).assertFalse();
      expect(uiThreadButton === null).assertFalse();
      hilog.info(DOMAIN, TAG, 'HomePageTest_001 end');
      done();
    });

    /**
     * @tc.number: CreatePageOnMultiThreadTest_001
     * @tc.name: CreatePageOnMultiThreadTest
     * @tc.desc: Verify that the Native component tree is created on multiple threads.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('CreatePageOnMultiThreadTest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, 'CreatePageOnMultiThreadTest_001 begin');
        const button = await driver.findComponent(ON.text('CreatePageOnMultiThread', MatchPattern.CONTAINS));
        expect(button === null).assertFalse();
        await button.click();
        await driver.delayMs(MULTI_THREAD_DELAY_TIME);

        const title = await driver.findComponent(ON.text('CreateNodeTreeOnMultiThread', MatchPattern.CONTAINS));
        expect(title === null).assertFalse();
        const textNodes = await driver.findComponents(ON.type('Text'));
        expect(textNodes.length).assertLarger(1);

        await driver.pressBack();
        await driver.delayMs(DELAY_TIME);
        hilog.info(DOMAIN, TAG, 'CreatePageOnMultiThreadTest_001 end');
        done();
      });

    /**
     * @tc.number: CreatePageOnUIThreadTest_001
     * @tc.name: CreatePageOnUIThreadTest
     * @tc.desc: Verify that the Native component tree is created on the UI thread.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('CreatePageOnUIThreadTest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        hilog.info(DOMAIN, TAG, 'CreatePageOnUIThreadTest_001 begin');
        const button = await driver.findComponent(ON.text('CreatePageOnUIThread', MatchPattern.CONTAINS));
        expect(button === null).assertFalse();
        await button.click();
        await driver.delayMs(DELAY_TIME);

        const title = await driver.findComponent(ON.text('CreateNodeTreeOnUIThread', MatchPattern.CONTAINS));
        expect(title === null).assertFalse();
        const textNodes = await driver.findComponents(ON.type('Text'));
        expect(textNodes.length).assertLarger(1);

        await driver.pressBack();
        await driver.delayMs(DELAY_TIME);
        hilog.info(DOMAIN, TAG, 'CreatePageOnUIThreadTest_001 end');
        done();
      });
  });
}
