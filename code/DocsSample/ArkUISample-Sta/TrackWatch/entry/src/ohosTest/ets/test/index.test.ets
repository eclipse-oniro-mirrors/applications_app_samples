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
const TAG = '[Sample_TrackWatch]'
const DOMAIN = 0xF811
const BUNDLE = 'TrackWatch'

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
     * @tc.name TrackWithoutPrecision
     * @tc.desc @Track无法精准观察类属性
     * @tc.level: Level 1
     */

    it('TrackWithoutPrecision', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: TrackWithoutPrecision begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/TrackWithoutPrecision' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change name', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('change age', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name TrackAvoidRedundant
     * @tc.desc @Track避免冗余刷新
     * @tc.level: Level 1
     */

    it('TrackAvoidRedundant', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: TrackAvoidRedundant begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/TrackAvoidRedundant' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change logTrack.str1', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('change logNotTrack.str1', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name TrackCustomComponent
     * @tc.desc @Track和自定义组件更新
     * @tc.level: Level 1
     */

    it('TrackCustomComponent', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: TrackCustomComponent begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/TrackCustomComponent' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('origin info.', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name WatchCustomComponent
     * @tc.desc @Watch和自定义组件更新
     * @tc.level: Level 1
     */

    it('WatchCustomComponent', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: WatchCustomComponent begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/WatchCustomComponent' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('add to basket', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_005
     * @tc.name WatchPropertyName
     * @tc.desc @Watch判断具体属性变化
     * @tc.level: Level 1
     */

    it('WatchPropertyName', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: WatchPropertyName begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/WatchPropertyName' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change info name', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('change info age', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });
  })
}