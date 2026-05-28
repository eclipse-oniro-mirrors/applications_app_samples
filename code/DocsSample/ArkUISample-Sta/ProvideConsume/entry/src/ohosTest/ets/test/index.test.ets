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
const TAG = '[Sample_ProvideConsume]'
const DOMAIN = 0xF811
const BUNDLE = 'ProvideConsume'

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
     * @tc.name ProvideConsumeInterface
     * @tc.desc @Provide和@Consume装饰interface字面量
     * @tc.level: Level 1
     */

    it('ProvideConsumeInterface', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ProvideConsumeInterface begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ProvideConsumeInterface' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('info.name', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name ProvideConsumeBasic
     * @tc.desc @Provide和@Consume基本使用
     * @tc.level: Level 1
     */

    it('ProvideConsumeBasic', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ProvideConsumeBasic begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ProvideConsumeBasic' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('count', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name ConsumeNoExternalInit
     * @tc.desc @Consume禁止外部传入初始化
     * @tc.level: Level 1
     */

    it('ConsumeNoExternalInit', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ConsumeNoExternalInit begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ConsumeNoExternalInit' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name ConsumeDefaultValueExample
     * @tc.desc @Consume设置默认值示例
     * @tc.level: Level 1
     */

    it('ConsumeDefaultValueExample', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ConsumeDefaultValueExample begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ConsumeDefaultValueExample' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_006
     * @tc.name ProvideConsumeMap
     * @tc.desc @Provide和@Consume装饰Map类型
     * @tc.level: Level 1
     */

    it('ProvideConsumeMap', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ProvideConsumeMap begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ProvideConsumeMap' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Consume init Map', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('Consume set new one', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('Consume clear', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      let btn4 = await driver.findComponent(ON.text('Consume replace', MatchPattern.CONTAINS));
      await btn4.click();
      await driver.delayMs(1000);
      let btn5 = await driver.findComponent(ON.text('Consume delete', MatchPattern.CONTAINS));
      await btn5.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_007
     * @tc.name ProvideConsumeSet
     * @tc.desc @Provide和@Consume装饰Set类型
     * @tc.level: Level 1
     */

    it('ProvideConsumeSet', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ProvideConsumeSet begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ProvideConsumeSet' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Consume init set', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('Consume set new one', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('Consume clear', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      let btn4 = await driver.findComponent(ON.text('Consume delete', MatchPattern.CONTAINS));
      await btn4.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_008
     * @tc.name ProvideConsumeDate
     * @tc.desc @Provide和@Consume装饰Date类型
     * @tc.level: Level 1
     */

    it('ProvideConsumeDate', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ProvideConsumeDate begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ProvideConsumeDate' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('increase the day', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('update the new date', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_009
     * @tc.name ProvideConsumeUnion
     * @tc.desc @Provide和@Consume支持联合类型
     * @tc.level: Level 1
     */

    it('ProvideConsumeUnion', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ProvideConsumeUnion begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ProvideConsumeUnion' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Child', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_010
     * @tc.name ProvideAllowOverride
     * @tc.desc @Provide支持allowOverride参数
     * @tc.level: Level 1
     */

    it('ProvideAllowOverride', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ProvideAllowOverride begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ProvideAllowOverride' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('reviewVotes', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_011
     * @tc.name ConsumeDefaultValue
     * @tc.desc @Consume使用本地默认值初始化
     * @tc.level: Level 1
     */

    it('ConsumeDefaultValue', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ConsumeDefaultValue begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ConsumeDefaultValue' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Child change count', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('Child change v.num', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('Child change p.info', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      let btn4 = await driver.findComponent(ON.text('Child change message', MatchPattern.CONTAINS));
      await btn4.click();
      await driver.delayMs(1000);
      done();
    });
  })
}