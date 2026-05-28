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
import { abilityDelegatorRegistry, Driver, ON, MatchPattern } from '@kit.TestKit';
import { UIAbility, Want } from '@kit.AbilityKit';
import hilog from '@ohos.hilog';
import router from '@ohos.router';

const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
let want: Want;
let driver: Driver;
const TAG = '[Sample_LocalStorageDecorator]'
const DOMAIN = 0xF811
const BUNDLE = 'LocalStorageDecorator'

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
     * @tc.name LocalStorageUI
     * @tc.desc 从UI内部使用LocalStorage
     * @tc.level: Level 1
     */

    it('LocalStorageUI', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LocalStorageUI begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LocalStorageUI' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Parent from LocalStorage', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_002
     * @tc.name LocalStoragePropRef
     * @tc.desc @LocalStoragePropRef单向同步
     * @tc.level: Level 1
     */

    it('LocalStoragePropRef', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LocalStoragePropRef begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LocalStoragePropRef' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('Parent from LocalStorage', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_003
     * @tc.name LocalStoragePropRefDataRef
     * @tc.desc @LocalStoragePropRef获得数据源引用
     * @tc.level: Level 1
     */

    it('LocalStoragePropRefDataRef', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LocalStoragePropRefDataRef begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LocalStoragePropRefDataRef' });
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
     * @tc.number UiTest_004
     * @tc.name LocalStorageLinkSync
     * @tc.desc @LocalStorageLink双向同步
     * @tc.level: Level 1
     */

    it('LocalStorageLinkSync', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LocalStorageLinkSync begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LocalStorageLinkSync' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('incr @LocalStorageLink variable', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_005
     * @tc.name LocalStorageLinkBrother
     * @tc.desc 兄弟组件同步状态
     * @tc.level: Level 1
     */

    it('LocalStorageLinkBrother', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LocalStorageLinkBrother begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LocalStorageLinkBrother' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('playCount', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('countStorage', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      let btn3 = await driver.findComponent(ON.text('playCountLink', MatchPattern.CONTAINS));
      await btn3.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_006
     * @tc.name LocalStorageSharedUIAbility
     * @tc.desc 从UIAbility共享LocalStorage
     * @tc.level: Level 1
     */

    it('LocalStorageSharedUIAbility', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LocalStorageSharedUIAbility begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LocalStorageSharedUIAbility' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_007
     * @tc.name LocalStorageComponent
     * @tc.desc 自定义组件接收LocalStorage实例
     * @tc.level: Level 1
     */

    it('LocalStorageComponent', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LocalStorageComponent begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LocalStorageComponent' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_008
     * @tc.name LocalStorageComponentNoProp
     * @tc.desc 自定义组件接收LocalStorage实例（无属性）
     * @tc.level: Level 1
     */

    it('LocalStorageComponentNoProp', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LocalStorageComponentNoProp begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LocalStorageComponentNoProp' });
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_009
     * @tc.name LocalStorageUnionType
     * @tc.desc LocalStorage支持联合类型
     * @tc.level: Level 1
     */

    it('LocalStorageUnionType', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LocalStorageUnionType begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LocalStorageUnionType' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('null', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_010
     * @tc.name LocalStorageDate
     * @tc.desc 装饰Date类型变量
     * @tc.level: Level 1
     */

    it('LocalStorageDate', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LocalStorageDate begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LocalStorageDate' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('set selectedDate to 2023-07-08', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('increase the year by 1', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_011
     * @tc.name LocalStorageMap
     * @tc.desc 装饰Map类型变量
     * @tc.level: Level 1
     */

    it('LocalStorageMap', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LocalStorageMap begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LocalStorageMap' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('set new one', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('clear', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_012
     * @tc.name LocalStorageSet
     * @tc.desc 装饰Set类型变量
     * @tc.level: Level 1
     */

    it('LocalStorageSet', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LocalStorageSet begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LocalStorageSet' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('set new one', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      let btn2 = await driver.findComponent(ON.text('clear', MatchPattern.CONTAINS));
      await btn2.click();
      await driver.delayMs(1000);
      done();
    });

    /**
     * @tc.number UiTest_013
     * @tc.name LocalStorageOutside
     * @tc.desc 组件外改变状态变量
     * @tc.level: Level 1
     */

    it('LocalStorageOutside', Level.LEVEL1, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'uitest: LocalStorageOutside begin');
      await driver.delayMs(1000);
      await router.pushUrl({ url: 'pages/LocalStorageOutside' });
      await driver.delayMs(1000);
      let btn = await driver.findComponent(ON.text('change', MatchPattern.CONTAINS));
      await btn.click();
      await driver.delayMs(1000);
      done();
    });
  })
}