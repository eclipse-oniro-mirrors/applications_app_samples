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
const TAG = '[Sample_ObservedBuiltInTypes]'
const DOMAIN = 0xF811
const BUNDLE = 'ObservedBuiltInTypes'

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
     * @tc.name ObservedArrayUsage
     * @tc.desc 使用ObservedArray
     * @tc.level: Level 1
     */

    it('ObservedArrayUsage', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ObservedArrayUsage begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ObservedArrayUsage' });
      await driver.delayMs(1000);
      let btn1 = await driver.findComponent(ON.text('push', MatchPattern.CONTAINS));
      await btn1.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('reverse', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name ObservedMapUsage
     * @tc.desc 使用ObservedMap
     * @tc.level: Level 1
     */

    it('ObservedMapUsage', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ObservedMapUsage begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ObservedMapUsage' });
      await driver.delayMs(1000);
      let btn1 = await driver.findComponent(ON.text('set', MatchPattern.CONTAINS));
      await btn1.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('delete', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name ObservedSetUsage
     * @tc.desc 使用ObservedSet
     * @tc.level: Level 1
     */

    it('ObservedSetUsage', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ObservedSetUsage begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ObservedSetUsage' });
      await driver.delayMs(1000);
      let btn1 = await driver.findComponent(ON.text('add', MatchPattern.CONTAINS));
      await btn1.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('delete', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name ObservedDateUsage
     * @tc.desc 使用ObservedDate
     * @tc.level: Level 1
     */

    it('ObservedDateUsage', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ObservedDateUsage begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ObservedDateUsage' });
      await driver.delayMs(1000);
      let btn1 = await driver.findComponent(ON.text('increase year', MatchPattern.CONTAINS));
      await btn1.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('increase month', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_005
     * @tc.name ObservedBuiltInTypesMakeObserved
     * @tc.desc 与UIUtils.makeObserved的关系
     * @tc.level: Level 1
     */

    it('ObservedBuiltInTypesMakeObserved', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ObservedBuiltInTypesMakeObserved begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ObservedBuiltInTypesMakeObserved' });
      await driver.delayMs(1000);
      let btn1 = await driver.findComponent(ON.text('change arr[0] name', MatchPattern.CONTAINS));
      await btn1.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('change arr2[0] name', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('change arr3[0] name', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_006
     * @tc.name ObservedBuiltInTypesFAQ1
     * @tc.desc 常见问题1
     * @tc.level: Level 1
     */

    it('ObservedBuiltInTypesFAQ1', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ObservedBuiltInTypesFAQ1 begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ObservedBuiltInTypesFAQ1' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change arr[0] name', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_007
     * @tc.name ObservedBuiltInTypesFAQ2
     * @tc.desc 常见问题2
     * @tc.level: Level 1
     */

    it('ObservedBuiltInTypesFAQ2', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ObservedBuiltInTypesFAQ2 begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ObservedBuiltInTypesFAQ2' });
      await driver.delayMs(1000);
      let btn1 = await driver.findComponent(ON.text('change arr1 userName', MatchPattern.CONTAINS));
      await btn1.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('change arr2 userName', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('change arr3 userName', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      done();
    });
  })
}