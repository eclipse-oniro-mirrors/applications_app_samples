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
const TAG = '[Sample_V1V2MixUsage]'
const DOMAIN = 0xF811
const BUNDLE = 'V1V2MixUsage'

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
     * @tc.name MixCommonV1ToV2
     * @tc.desc 普通JS Object V1->V2
     * @tc.level: Level 1
     */
    it('MixCommonV1ToV2', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: MixCommonV1ToV2 begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/MixCommonV1ToV2' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Change object in V1', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name MixCommonV2ToV1
     * @tc.desc 普通JS Object V2->V1
     * @tc.level: Level 1
     */
    it('MixCommonV2ToV1', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: MixCommonV2ToV1 begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/MixCommonV2ToV1' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Change object in V2', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name MixObservedV1ToV2
     * @tc.desc @Observed装饰的class V1->V2
     * @tc.level: Level 1
     */
    it('MixObservedV1ToV2', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: MixObservedV1ToV2 begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/MixObservedV1ToV2' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('name:', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name MixObservedV2ToV1
     * @tc.desc @Observed装饰的class V2->V1
     * @tc.level: Level 1
     */
    it('MixObservedV2ToV1', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: MixObservedV2ToV1 begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/MixObservedV2ToV1' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('name V2:', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_005
     * @tc.name MixArrayV1ToV2
     * @tc.desc 内置类型Array V1->V2
     * @tc.level: Level 1
     */
    it('MixArrayV1ToV2', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: MixArrayV1ToV2 begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/MixArrayV1ToV2' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Change object in V1', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_006
     * @tc.name MixArrayV2ToV1
     * @tc.desc 内置类型Array V2->V1
     * @tc.level: Level 1
     */
    it('MixArrayV2ToV1', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: MixArrayV2ToV1 begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/MixArrayV2ToV1' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Change object in V2', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_007
     * @tc.name MixTwoDimV1ToV2
     * @tc.desc 二维数组 V1->V2
     * @tc.level: Level 1
     */
    it('MixTwoDimV1ToV2', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: MixTwoDimV1ToV2 begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/MixTwoDimV1ToV2' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('push two-dimensional array item', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_008
     * @tc.name MixTwoDimV2ToV1
     * @tc.desc 二维数组 V2->V1
     * @tc.level: Level 1
     */
    it('MixTwoDimV2ToV1', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: MixTwoDimV2ToV1 begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/MixTwoDimV2ToV1' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('push two-dimensional array item', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_009
     * @tc.name MixNestedV1ToV2
     * @tc.desc 嵌套类型 V1->V2
     * @tc.level: Level 1
     */
    it('MixNestedV1ToV2', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: MixNestedV1ToV2 begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/MixNestedV1ToV2' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('outer.outerValue', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_010
     * @tc.name MixNestedV2ToV1
     * @tc.desc 嵌套类型 V2->V1
     * @tc.level: Level 1
     */
    it('MixNestedV2ToV1', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: MixNestedV2ToV1 begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/MixNestedV2ToV1' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('outer.outerValue', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });
  })
}
