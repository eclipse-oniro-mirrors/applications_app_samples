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
const TAG = '[Sample_BuilderParam]'
const DOMAIN = 0xF811
const BUNDLE = 'BuilderParam'

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

    it('BuilderParamInitMethod', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuilderParamInitMethod begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuilderParamInitMethod' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Parent builder', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    it('BuilderParamThis', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuilderParamThis begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuilderParamThis' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Parent', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    it('BuilderParamSceneInit', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuilderParamSceneInit begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuilderParamSceneInit' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Parent', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    it('BuilderParamTrailingClosure01', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuilderParamTrailingClosure01 begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuilderParamTrailingClosure01' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('testA', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    it('BuilderParamTrailingClosure02', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuilderParamTrailingClosure02 begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuilderParamTrailingClosure02' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Parent Page', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    it('BuilderParamJumpLogic', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuilderParamJumpLogic begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuilderParamJumpLogic' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('ParentPage', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    it('BuilderParamGlobalLocalInit', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuilderParamGlobalLocalInit begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuilderParamGlobalLocalInit' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Parent Page', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    it('BuilderParamInComponentV2', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuilderParamInComponentV2 begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuilderParamInComponentV2' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Parent Page', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    it('BuilderParamRequirePositive', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuilderParamRequirePositive begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuilderParamRequirePositive' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Hello World', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    it('BuilderParamMustBuilderPositive', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuilderParamMustBuilderPositive begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuilderParamMustBuilderPositive' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Hello World', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });
  })
}
