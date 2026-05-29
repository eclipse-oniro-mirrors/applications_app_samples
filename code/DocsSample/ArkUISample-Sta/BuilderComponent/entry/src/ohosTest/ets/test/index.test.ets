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
const TAG = '[Sample_BuilderComponent]'
const DOMAIN = 0xF811
const BUNDLE = 'BuilderComponent'

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

    it('BuilderPrivate', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuilderPrivate begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuilderPrivate' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Hello World', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    it('BuilderGlobal', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuilderGlobal begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuilderGlobal' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Hello World', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    it('BuilderMakeBinding', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuilderMakeBinding begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuilderMakeBinding' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('number1', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    it('BuilderByReference', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuilderByReference begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuilderByReference' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Hello', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    it('BuilderByValue', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuilderByValue begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuilderByValue' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Hello', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    it('BuilderInCustomComponent', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuilderInCustomComponent begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuilderInCustomComponent' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Hello', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    it('BuilderGlobalScene', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuilderGlobalScene begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuilderGlobalScene' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Hello', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    it('BuilderDecoratorRefresh', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuilderDecoratorRefresh begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuilderDecoratorRefresh' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Hello', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    it('BuilderAsCustomBuilder', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuilderAsCustomBuilder begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuilderAsCustomBuilder' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('0', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    it('BuilderNested', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuilderNested begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuilderNested' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Hello', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    it('BuilderCombinedV2', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuilderCombinedV2 begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuilderCombinedV2' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Tom', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    it('BuilderCombinedLocal', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuilderCombinedLocal begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuilderCombinedLocal' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Tom', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    it('BuilderAcrossComponents', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuilderAcrossComponents begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuilderAcrossComponents' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Child', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    it('BuilderVariable', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuilderVariable begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuilderVariable' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Hello world', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    it('BuilderGeneric', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuilderGeneric begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuilderGeneric' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Hello', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    it('BuilderStateRefresh', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuilderStateRefresh begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuilderStateRefresh' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('number1', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    it('BuilderOneParam', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuilderOneParam begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuilderOneParam' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Hello', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    it('BuilderComponentV2Refresh', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuilderComponentV2Refresh begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuilderComponentV2Refresh' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('builderParams', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    it('BuilderModifyParamPositive', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuilderModifyParamPositive begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuilderModifyParamPositive' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Hello', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });

    it('BuilderComponentParam', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: BuilderComponentParam begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/BuilderComponentParam' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('张三', MatchPattern.CONTAINS));
      expect(text).not.toBeNull();
      await driver.delayMs(1000);
      done();
    });
  })
}
