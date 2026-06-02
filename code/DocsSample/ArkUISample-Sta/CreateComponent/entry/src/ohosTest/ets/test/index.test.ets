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
const TAG = '[Sample_CreateComponent]'
const DOMAIN = 0xF811
const BUNDLE = 'CreateComponent'

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
     * @tc.name ComponentBasicUsage
     * @tc.desc 自定义组件基本用法
     * @tc.level: Level 1
     */
    it('ComponentBasicUsage', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ComponentBasicUsage begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ComponentBasicUsage' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Hello', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name EntryDecorator
     * @tc.desc @Entry装饰器
     * @tc.level: Level 1
     */
    it('EntryDecorator', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: EntryDecorator begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/EntryDecorator' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name ComponentParams
     * @tc.desc 自定义组件参数规定
     * @tc.level: Level 1
     */
    it('ComponentParams', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ComponentParams begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ComponentParams' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name BuildFunction
     * @tc.desc build()函数规则
     * @tc.level: Level 1
     */
    it('BuildFunction', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuildFunction begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuildFunction' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_005
     * @tc.name BuildVariableDeclaration
     * @tc.desc build()中变量声明
     * @tc.level: Level 1
     */
    it('BuildVariableDeclaration', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuildVariableDeclaration begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuildVariableDeclaration' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_006
     * @tc.name BuildLogPrint
     * @tc.desc build()中日志打印
     * @tc.level: Level 1
     */
    it('BuildLogPrint', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuildLogPrint begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuildLogPrint' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change stateVar', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_007
     * @tc.name BuildSwitchCase
     * @tc.desc switch/case结构
     * @tc.level: Level 1
     */
    it('BuildSwitchCase', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuildSwitchCase begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuildSwitchCase' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change stateVar', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_008
     * @tc.name BuildLocalScope
     * @tc.desc 本地作用域
     * @tc.level: Level 1
     */
    it('BuildLocalScope', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuildLocalScope begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuildLocalScope' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_009
     * @tc.name BuildExpression
     * @tc.desc 表达式
     * @tc.level: Level 1
     */
    it('BuildExpression', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuildExpression begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuildExpression' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('hello world', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_010
     * @tc.name BuildNotRecommended
     * @tc.desc 不建议用法
     * @tc.level: Level 1
     */
    it('BuildNotRecommended', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuildNotRecommended begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuildNotRecommended' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_011
     * @tc.name ComponentStyle
     * @tc.desc 自定义组件通用样式
     * @tc.level: Level 1
     */
    it('ComponentStyle', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ComponentStyle begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ComponentStyle' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_012
     * @tc.name ComponentExtend
     * @tc.desc 支持自定义组件扩展
     * @tc.level: Level 1
     */
    it('ComponentExtend', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: ComponentExtend begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/ComponentExtend' });
      await driver.delayMs(1000);
      done();
    });
  })
}
