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
const TAG = '[Sample_AppStorageDecorator]'
const DOMAIN = 0xF811
const BUNDLE = 'AppStorageDecorator'

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
     * @tc.name AppStorageUI
     * @tc.desc 从UI内部使用AppStorage和LocalStorage
     * @tc.level: Level 1
     */

    it('AppStorageUI', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: AppStorageUI begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/AppStorageUI' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('From AppStorage', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('From LocalStorage', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('From AppStorage', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      let btn4 = await driver.findComponent(ON.text('From LocalStorage', MatchPattern.CONTAINS));
      await btn4.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name AppStoragePropRefDataRef
     * @tc.desc @StoragePropRef获得AppStorage中数据源的引用
     * @tc.level: Level 1
     */

    it('AppStoragePropRefDataRef', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: AppStoragePropRefDataRef begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/AppStoragePropRefDataRef' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('modify data property code', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('replace data', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name AppStorageUnionType
     * @tc.desc AppStorage支持联合类型
     * @tc.level: Level 1
     */

    it('AppStorageUnionType', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: AppStorageUnionType begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/AppStorageUnionType' });
      await driver.delayMs(1000);
      let text1 = await driver.findComponent(ON.text('null', MatchPattern.CONTAINS));
      await text1.click();
      await driver.delayMs(1000);
      let text2 = await driver.findComponent(ON.text('undefined', MatchPattern.CONTAINS));
      await text2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_004
     * @tc.name AppStorageDate
     * @tc.desc 装饰Date类型变量
     * @tc.level: Level 1
     */

    it('AppStorageDate', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: AppStorageDate begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/AppStorageDate' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('set selectedDate to 2023-07-08', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('increase the year by 1', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('increase the month by 1', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      let btn4 = await driver.findComponent(ON.text('increase the day by 1', MatchPattern.CONTAINS));
      await btn4.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_005
     * @tc.name AppStorageMap
     * @tc.desc 装饰Map类型变量
     * @tc.level: Level 1
     */

    it('AppStorageMap', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: AppStorageMap begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/AppStorageMap' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('init map', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('set new one', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('clear', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      let btn4 = await driver.findComponent(ON.text('replace the existing one', MatchPattern.CONTAINS));
      await btn4.click();
      await driver.delayMs(1000);
      let btn5 = await driver.findComponent(ON.text('delete the existing one', MatchPattern.CONTAINS));
      await btn5.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_006
     * @tc.name AppStorageSet
     * @tc.desc 装饰Set类型变量
     * @tc.level: Level 1
     */

    it('AppStorageSet', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: AppStorageSet begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/AppStorageSet' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('init set', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('set new one', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('clear', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      let btn4 = await driver.findComponent(ON.text('delete the first one', MatchPattern.CONTAINS));
      await btn4.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_007
     * @tc.name EnvironmentUI
     * @tc.desc 从UI中访问Environment参数
     * @tc.level: Level 1
     */

    it('EnvironmentUI', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: EnvironmentUI begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/EnvironmentUI' });
      await driver.delayMs(1000);
      let text = await driver.findComponent(ON.text('Device languageCode', MatchPattern.CONTAINS));
      await driver.delayMs(1000);
      done();
    });
  })
}