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
const TAG = '[Sample_EnvDecorator]'
const DOMAIN = 0xF811
const BUNDLE = 'EnvDecorator'

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
     * @tc.name EnvInitialization
     * @tc.desc @Env初始化流程
     * @tc.level: Level 1
     */

    it('EnvInitialization', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: EnvInitialization begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/EnvInitialization' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name EnvComponentV2
     * @tc.desc 在@ComponentV2中使用@Env
     * @tc.level: Level 1
     */

    it('EnvComponentV2', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: EnvComponentV2 begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/EnvComponentV2' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Landscape', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('Portrait', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name EnvComponent
     * @tc.desc 在@Component中使用@Env
     * @tc.level: Level 1
     */

    it('EnvComponent', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: EnvComponent begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/EnvComponent' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Landscape', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('Portrait', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name EnvBuilderNode
     * @tc.desc 通过BuilderNode切换窗口
     * @tc.level: Level 1
     */

    it('EnvBuilderNode', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: EnvBuilderNode begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/EnvBuilderNode' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('add node to tree', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('remove node from tree', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_005
     * @tc.name EnvLambdaClosure
     * @tc.desc 使用lambda闭包传递@Env
     * @tc.level: Level 1
     */

    it('EnvLambdaClosure', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: EnvLambdaClosure begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/EnvLambdaClosure' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('add node to tree', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('remove node from tree', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });
  })
}