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
const TAG = '[Sample_StaCompare]'
const DOMAIN = 0xF811
const BUNDLE = 'StaCompare'

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
     * @tc.name StaticNoMutableBuilder
     * @tc.desc 静态无需mutableBuilder
     * @tc.level: Level 1
     */

    it('StaticNoMutableBuilder', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: StaticNoMutableBuilder begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/StaticNoMutableBuilder' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Switch Builder', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name MonitorTriggerSta
     * @tc.desc Monitor触发机制(Sta)
     * @tc.level: Level 1
     */

    it('MonitorTriggerSta', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: MonitorTriggerSta begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/MonitorTriggerSta' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name GlobalConnectSta
     * @tc.desc globalConnect接口(Sta)
     * @tc.level: Level 1
     */

    it('GlobalConnectSta', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: GlobalConnectSta begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/GlobalConnectSta' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('push', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });
  })
}
