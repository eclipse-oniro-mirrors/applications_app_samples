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
const TAG = '[Sample_ReusableV2Decorator]'
const DOMAIN = 0xF811
const BUNDLE = 'ReusableV2Decorator'

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
     * @tc.name ReusableV2BasicUsage
     * @tc.desc @ReusableV2装饰基本用法
     * @tc.level: Level 1
     */

    it('ReusableV2BasicUsage', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ReusableV2BasicUsage begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ReusableV2BasicUsage' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name ReusableV2Lifecycle
     * @tc.desc @ReusableV2生命周期
     * @tc.level: Level 1
     */

    it('ReusableV2Lifecycle', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ReusableV2Lifecycle begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ReusableV2Lifecycle' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('step1. appear', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('step2. recycle', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('step3. reuse', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      let btn4 = await driver.findComponent(ON.text('step4. disappear', MatchPattern.CONTAINS));
      await btn4.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name ReusableV2Freeze
     * @tc.desc @ReusableV2冻结状态
     * @tc.level: Level 1
     */

    it('ReusableV2Freeze', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ReusableV2Freeze begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ReusableV2Freeze' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('复用/回收', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('改值', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name ReusableV2Reset
     * @tc.desc @ReusableV2重置功能
     * @tc.level: Level 1
     */

    it('ReusableV2Reset', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ReusableV2Reset begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ReusableV2Reset' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('回收/复用', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_005
     * @tc.name ReusableV2ResetMonitor
     * @tc.desc @ReusableV2重置监听
     * @tc.level: Level 1
     */

    it('ReusableV2ResetMonitor', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ReusableV2ResetMonitor begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ReusableV2ResetMonitor' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('回收/复用', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_006
     * @tc.name ReusableV2IfUsage
     * @tc.desc @ReusableV2在if中使用
     * @tc.level: Level 1
     */

    it('ReusableV2IfUsage', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ReusableV2IfUsage begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ReusableV2IfUsage' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('切换if分支', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_007
     * @tc.name ReusableV2RepeatUsage
     * @tc.desc @ReusableV2在Repeat中使用
     * @tc.level: Level 1
     */

    it('ReusableV2RepeatUsage', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ReusableV2RepeatUsage begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ReusableV2RepeatUsage' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('改变condition', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_008
     * @tc.name ReusableV2RepeatTemplate
     * @tc.desc @ReusableV2在Repeat template中使用
     * @tc.level: Level 1
     */

    it('ReusableV2RepeatTemplate', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ReusableV2RepeatTemplate begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ReusableV2RepeatTemplate' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('改变condition', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_009
     * @tc.name ReusableV2RepeatNoLazy
     * @tc.desc @ReusableV2在Repeat非懒加载中使用
     * @tc.level: Level 1
     */

    it('ReusableV2RepeatNoLazy', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ReusableV2RepeatNoLazy begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ReusableV2RepeatNoLazy' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('删除/创建Repeat', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('增加元素', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('删除元素', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      let btn4 = await driver.findComponent(ON.text('更改元素', MatchPattern.CONTAINS));
      await btn4.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_010
     * @tc.name ReusableV2ForEachUsage
     * @tc.desc @ReusableV2在ForEach中使用
     * @tc.level: Level 1
     */

    it('ReusableV2ForEachUsage', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ReusableV2ForEachUsage begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ReusableV2ForEachUsage' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('点击修改', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_011
     * @tc.name ReusableV2LazyForEachUsage
     * @tc.desc @ReusableV2在LazyForEach中使用
     * @tc.level: Level 1
     */

    it('ReusableV2LazyForEachUsage', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ReusableV2LazyForEachUsage begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ReusableV2LazyForEachUsage' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change message', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });
  })
}