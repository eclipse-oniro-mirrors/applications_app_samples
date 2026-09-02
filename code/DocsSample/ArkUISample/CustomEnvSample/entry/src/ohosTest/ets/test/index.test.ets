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
const TAG = '[Sample_CustomEnvSample]'
const DOMAIN = 0xF811
const BUNDLE = 'CustomEnvSample'

async function getResourceString(resource: Resource): Promise<string> {
  let manage = abilityDelegator.getAppContext().resourceManager;
  let textString: string = await manage.getStringValue(resource);
  return textString;
}

export default function IndexTest() {

  describe('IndexTest', () => {
    beforeAll(async () => {
      want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility'
      };
      await delegator.startAbility(want);
      let driver = Driver.create();
      await driver.delayMs(1000);
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      hilog.info(DOMAIN, TAG, BUNDLE + 'get top ability');
      expect(ability.context.abilityInfo.name).assertEqual('EntryAbility');
    })

    /**
     * @tc.number UiTest_001
     * @tc.name customValuePageTest
     * @tc.desc @CustomEnv支持自定义key和value
     * @tc.level: Level 1
     */

    it('customValuePageTest', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: customValuePageTest begin');
      let driver = Driver.create();
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/CustomValuePage' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name customEnvValueClassPageTest
     * @tc.desc @CustomEnv支持多种数据类型（string、number、boolean、class）
     * @tc.level: Level 1
     */

    it('customEnvValueClassPageTest', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: customEnvValueClassPageTest begin');
      let driver = Driver.create();
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/CustomEnvValueClassPage' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name customEnvDefaultValPageTest
     * @tc.desc @CustomEnv支持默认初始值
     * @tc.level: Level 1
     */

    it('customEnvDefaultValPageTest', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: customEnvDefaultValPageTest begin');
      let driver = Driver.create();
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/CustomEnvDefaultValPage' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name customEnvNearPageTest
     * @tc.desc 环境变量查找遵循就近原则
     * @tc.level: Level 1
     */

    it('customEnvNearPageTest', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: customEnvNearPageTest begin');
      let driver = Driver.create();
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/CustomEnvNearPage' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_005
     * @tc.name customEnvValUpdatePageTest
     * @tc.desc 响应式更新能力
     * @tc.level: Level 1
     */

    it('customEnvValUpdatePageTest', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: customEnvValUpdatePageTest begin');
      let driver = Driver.create();
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/CustomEnvValUpdatePage' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('update'));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_006
     * @tc.name customEnvSupportWatchPageTest
     * @tc.desc @CustomEnv支持与@Watch连用
     * @tc.level: Level 1
     */

    it('customEnvSupportWatchPageTest', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: customEnvSupportWatchPageTest begin');
      let driver = Driver.create();
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/CustomEnvSupportWatchPage' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('update'));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_007
     * @tc.name customEnvSupportMonitorPageTest
     * @tc.desc @CustomEnv支持与@Monitor连用
     * @tc.level: Level 1
     */

    it('customEnvSupportMonitorPageTest', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: customEnvSupportMonitorPageTest begin');
      let driver = Driver.create();
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/CustomEnvSupportMonitorPage' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change message'));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_008
     * @tc.name customEnvSupportArrayPageTest
     * @tc.desc 装饰Array类型变量
     * @tc.level: Level 1
     */

    it('customEnvSupportArrayPageTest', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: customEnvSupportArrayPageTest begin');
      let driver = Driver.create();
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/CustomEnvSupportArrayPage' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Push element'));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_009
     * @tc.name customEnvSupportDatePageTest
     * @tc.desc 装饰Date类型变量
     * @tc.level: Level 1
     */

    it('customEnvSupportDatePageTest', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: customEnvSupportDatePageTest begin');
      let driver = Driver.create();
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/CustomEnvSupportDatePage' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('increase the year by 1'));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_010
     * @tc.name customEnvSupportMapPageTest
     * @tc.desc 装饰Map类型变量
     * @tc.level: Level 1
     */

    it('customEnvSupportMapPageTest', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: customEnvSupportMapPageTest begin');
      let driver = Driver.create();
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/CustomEnvSupportMapPage' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Set entry cherry'));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_011
     * @tc.name customEnvSupportSetPageTest
     * @tc.desc 装饰Set类型变量
     * @tc.level: Level 1
     */

    it('customEnvSupportSetPageTest', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: customEnvSupportSetPageTest begin');
      let driver = Driver.create();
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/CustomEnvSupportSetPage' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Add element'));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_012
     * @tc.name customEnvMixParamV1ToV2PageTest
     * @tc.desc @CustomEnv装饰的变量传递给V2只有@Param可以接收外部变量
     * @tc.level: Level 1
     */

    it('customEnvMixParamV1ToV2PageTest', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: customEnvMixParamV1ToV2PageTest begin');
      let driver = Driver.create();
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/CustomEnvMixParamV1ToV2Page' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('update'));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_013
     * @tc.name customEnvSupportComponentFreezePageTest
     * @tc.desc @CustomEnv支持组件冻结
     * @tc.level: Level 1
     */

    it('customEnvSupportComponentFreezePageTest', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: customEnvSupportComponentFreezePageTest begin');
      let driver = Driver.create();
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/CustomEnvSupportComponentFreezePage' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change message'));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_014
     * @tc.name customEnvObservedMixV2ToV1PageTest
     * @tc.desc @CustomEnv装饰的变量传递给V1时不能接收@ObservedV2装饰的class，需调用enableV2Compatibility
     * @tc.level: Level 1
     */

    it('customEnvObservedMixV2ToV1PageTest', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: customEnvObservedMixV2ToV1PageTest begin');
      let driver = Driver.create();
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/CustomEnvObservedMixV2ToV1WithenableV2CompatibilityPage' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('update'));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_015
     * @tc.name customEnvObservedV2MixV2ToV1PageTest
     * @tc.desc 当@CustomEnv装饰的变量类型被@Observed装饰时需要调用enableV2Compatibility
     * @tc.level: Level 1
     */

    it('customEnvObservedV2MixV2ToV1PageTest', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: customEnvObservedV2MixV2ToV1PageTest begin');
      let driver = Driver.create();
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/CustomEnvObservedV2MixV2ToV1Page' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_016
     * @tc.name customEnvSupportDeepWatchPageTest
     * @tc.desc @CustomEnv支持@Watch监听二维数组内部变化
     * @tc.level: Level 1
     */

    it('customEnvSupportDeepWatchPageTest', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: customEnvSupportDeepWatchPageTest begin');
      let driver = Driver.create();
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/CustomEnvSupportDeepWatchPage' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('ss'));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });
  })
}
