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

import { describe, beforeAll, it, expect, Level, Size, TestType } from '@ohos/hypium'
// 导入测试依赖kit
import { abilityDelegatorRegistry, Driver, ON, MouseButton, Component, MatchPattern } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';


const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let want: Want;

const TAG = '[Sample_MediaQuerySample]';
const DOMAIN = 0xF811;
const BUNDLE = 'MediaQuerySample_';

function sleep(time: number) {
  return new Promise<void>((resolve: Function) => setTimeout(resolve, time));
}

export default function IndexTest() {

  describe('IndexTest', () => {

    beforeAll(async () => {
      want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility'
      };
      await delegator.startAbility(want);
      await sleep(1000);
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
    })

    /**
     * @tc.number: MediaQueryExampleTest_001
     * @tc.name: MediaQueryExample test
     * @tc.desc: Test MediaQueryExample landscape test
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('MediaQueryExampleTest_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'MediaQueryExampleTest_001, begin');
      let driver = Driver.create();
      let button_list = await driver.findComponent(ON.text('MediaQueryExample'));
      expect(button_list === null).assertFalse();
      await button_list.click();
      await driver.delayMs(1000);
      let button_landscape = await driver.findComponent(ON.text('Landscape', MatchPattern.CONTAINS));
      expect(button_landscape === null).assertFalse();
      await button_landscape.click();
      await driver.delayMs(1000);
      let button_portrait = await driver.findComponent(ON.text('Portrait', MatchPattern.CONTAINS));
      expect(button_portrait === null).assertFalse();
      await button_portrait.click();
      await driver.delayMs(1000);
      await driver.pressBack();
      await driver.delayMs(1000);
      hilog.info(DOMAIN, TAG, BUNDLE + 'MediaQueryExampleTest_001, end');
      done();
    })

    /**
     * @tc.number: MediaQueryFlexTest_002
     * @tc.name: MediaQueryFlex test
     * @tc.desc: Test MediaQueryFlex landscape test
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('MediaQueryFlexTest_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'MediaQueryFlexTest_002, begin');
      let driver = Driver.create();
      let button_list = await driver.findComponent(ON.text('MediaQueryFlex'));
      expect(button_list === null).assertFalse();
      await button_list.click();
      await driver.delayMs(1000);
      let button_landscape = await driver.findComponent(ON.text('Landscape', MatchPattern.CONTAINS));
      expect(button_landscape === null).assertFalse();
      await button_landscape.click();
      await driver.delayMs(1000);
      let button_portrait = await driver.findComponent(ON.text('Portrait', MatchPattern.CONTAINS));
      expect(button_portrait === null).assertFalse();
      await button_portrait.click();
      await driver.delayMs(1000);
      await driver.pressBack();
      await driver.delayMs(1000);
      hilog.info(DOMAIN, TAG, BUNDLE + 'MediaQueryFlexTest_002, end');
      done();
    })

  })
}