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
const TAG = '[Sample_CanBeObserved]'
const DOMAIN = 0xF811
const BUNDLE = 'CanBeObserved'

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
     * @tc.name CanBeObservedObserved
     * @tc.desc 被@Observed装饰的类
     * @tc.level: Level 1
     */

    it('CanBeObservedObserved', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: CanBeObservedObserved begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/CanBeObservedObserved' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('show observed result', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name CanBeObservedTrack
     * @tc.desc 被@Trace装饰的属性
     * @tc.level: Level 1
     */

    it('CanBeObservedTrack', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: CanBeObservedTrack begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/CanBeObservedTrack' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('show observed result', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name CanBeObservedObservedV2
     * @tc.desc 被@ObservedV2装饰的类
     * @tc.level: Level 1
     */

    it('CanBeObservedObservedV2', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: CanBeObservedObservedV2 begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/CanBeObservedObservedV2' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('show observed result', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name CanBeObservedObjectLiteral
     * @tc.desc 对象字面量
     * @tc.level: Level 1
     */

    it('CanBeObservedObjectLiteral', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: CanBeObservedObjectLiteral begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/CanBeObservedObjectLiteral' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('show observed result', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_005
     * @tc.name CanBeObservedBuiltIn
     * @tc.desc 内置类型
     * @tc.level: Level 1
     */

    it('CanBeObservedBuiltIn', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: CanBeObservedBuiltIn begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/CanBeObservedBuiltIn' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('show observed result', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_006
     * @tc.name CanBeObservedNotRefresh
     * @tc.desc 不能触发UI刷新的情况
     * @tc.level: Level 1
     */

    it('CanBeObservedNotRefresh', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: CanBeObservedNotRefresh begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/CanBeObservedNotRefresh' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('age', MatchPattern.CONTAINS));
      await text.click();
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('show observe result', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_007
     * @tc.name CanBeObservedAfterObserved
     * @tc.desc 被@Observed装饰后的嵌套属性
     * @tc.level: Level 1
     */

    it('CanBeObservedAfterObserved', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: CanBeObservedAfterObserved begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/CanBeObservedAfterObserved' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('age', MatchPattern.CONTAINS));
      await text.click();
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('show observe result', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });
  })
}